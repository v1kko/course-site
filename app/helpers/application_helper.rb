module ApplicationHelper

	def page_done_icon(user, page)
		logger.debug user.inspect
		logger.debug page.inspect
		if user && page && Done.where(:user_id => user.id, :page_id => page.id).count > 0
			" <i class='icon-thumbs-up'></i>".html_safe
        # debugging (can't log in)
		elsif page && Done.where(:user_id => 1, :page_id => page.id).count > 0
			" <i class='icon-thumbs-up'></i>".html_safe
        else
			""
		end
	end

	def markdown(text, page_context)
		# pass public parl URL to the image converter
		# :image_prefix is defined in config/application.rb
		Kramdown::Document.new(text, 
		                      :asset_prefix => page_context.public_url,
		                      :coderay_css => :class,
		                      :coderay_tab_width => 4,
		                      :enable_coderay => true,
		                      :coderay_line_numbers => nil).to_custom_html.html_safe
	end
	
	def title()
		(@page && @page.title) || @title
	end

end
