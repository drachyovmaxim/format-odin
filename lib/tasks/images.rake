namespace :images do
  task :recreate => [:environment] do
  	Artwork.all.each do |artwork|
  		artwork.image.recreate_versions!
  	end
  end
 end