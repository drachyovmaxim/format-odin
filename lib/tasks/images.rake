namespace :images do
  task :recreate => [:environment] do
  	Print.all.each do |print|
  		print.image.recreate_versions!
  	end
  end
 end