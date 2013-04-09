class Done < ActiveRecord::Base

	belongs_to :user
	attr_accessible :url, :user_id

	def self.do_url(user, url)
		Done.create(:user_id => user.id, :url => url)
	end

	def self.undo_url(user, url)
		to_undos = Done.where(:user_id => user.id, :url => url)
		if to_undos.empty?
			logger.warn("No done for user: '#{user.name}' and url: '#{url}'.")
		elsif to_undos.size > 1
			logger.warn("More than one done for user: '#{user.name}' and " +
						"url: '#{url}', destroying all.")
		else
			to_undos.each do |to_undo|
				Done.destroy(to_undo)
			end
		end
	end

	def self.toggle_url(user, url)
		if user && Done.where(:user_id => user.id, :url => url).count > 0
			self.undo_url(user, url)
		elsif user
			self.do_url(user, url)
		end
	end

end
