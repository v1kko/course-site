class AdminController < ApplicationController

	before_filter CASClient::Frameworks::Rails::Filter
	before_filter :require_admin
	
	def index
		
	end
	
	def api
		@apikey = Settings.apikey
	end
	
	def api_save
		Settings.apikey = params[:apikey]
		redirect_to :back
	end
	
	# show admins and assistants
	def admins
		@admins = Settings.admins.join("\n")
		@assistants = (Settings.assistants || []).join("\n")
	end
	
	# store new admins list
	def admins_save
		Settings.admins = params[:admins].split(/\r?\n/)
		redirect_to :back
	end
	
	# store new assistants list
	def assistants_save
		Settings.assistants = params[:assistants].split(/\r?\n/)
		redirect_to :back
	end
	
	def dump_grades
		@grades = Grade.joins(:submit).includes(:submit => [:pset,:user]).where("grades.submit_id is not null").order("psets.name")
		render layout:nil
	end
	
	def stats
		# needs tracksssss
		@terms = Registration.select("distinct term")
		render layout: nil
	end
		
end
