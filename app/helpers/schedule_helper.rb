module ScheduleHelper

	def link_to_with_icon(user, link_title, destination)
		# Determine if the page is a title of the website or an external url
		pages = Page.where(:title => destination)
		if pages.empty?
			url = destination
		else
			page = pages[0]
			if pages.size > 1
				logger.warn("Found more than 1 page that match the page " +
							"title '#{destination}'; using the first one: " +
							"'#{page.title}'.")
			end
			url = url_for("/#{page.section.slug}/#{page.slug}")
		end

		# Add thumb if the user-url combination exists
		thumb = ""
		if user && Done.where(:user_id => user.id, :url => url).count > 0
			thumb = " <i class='icon-thumbs-up'></i>".html_safe
		end
		link_to (link_title + thumb).html_safe, url
	end

end
