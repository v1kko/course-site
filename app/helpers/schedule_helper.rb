module ScheduleHelper

	def link_to_with_icon(user, link_title, destination)
		url = determine_url(destination)
		thumb = use_thumb(user, url)
		link = link_to (link_title + thumb).html_safe, url
		toggle = toggle_done_link(url,link)

		return link
	end

	def determine_url(destination)
		# Is destination a page title or an external url?
		pages = Page.where(:title => destination)
		if pages.empty?
			return destination
		else
			page = pages[0]
			if pages.size > 1
				logger.warn("Found more than 1 page that match the page " +
							"title '#{destination}'; using the first one: " +
							"'#{page.title}'.")
			end
			return url_for("/#{page.section.slug}/#{page.slug}")
		end
	end

	def use_thumb(user, url)
		thumb = ""
		if user && Done.where(:user_id => user.id, :url => url).count > 0
			thumb = " <i class='icon-thumbs-up'></i>".html_safe
		end

		return thumb
	end

	def toggle_done_link(url, link)
		form_tag('/homepage/toggle_page_done', :method => 'post') do
			hidden_field_tag(:url, "http://google.com")
			submit_tag('do-undo')
		end
	end

end
