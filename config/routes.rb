CourseSite::Application.routes.draw do

	# homepage
	root :to => "page#homepage"

	# logged-in users only
	get  "homepage/logout"
	get  "homepage/profile"
	post "homepage/save_profile"
	get  "homepage/schedule"

	# administrative
	get  "admin/users"
	post "admin/import_do"
	post "admin/import_groups"
	get  "dropbox/link"

	resources :answers
	post "upload/submit"
	match ":section/:page" => "page#index"

end
