
# Each room
# does it have an image?
# does image exist at target?
# if not, create a new file

#   facility_code_heprod
#   rmrecnbr

def has_image?(resource)
  resource.location.picture?
end

def copy_image(resource)
  FileUtils.cp "#{resource.location.picture.path(:original)}", "#{Rails.root.to_s}/export_images/classrooms/#{resource.rmrecnbr}.jpg"
end

backup_destination_base = "#{Rails.root.to_s}/export_images"
backup_destinations = ["buildings", "classrooms"]

# create the backup  directories
def create_destinations(backup_destinations)
  backup_destinations.each do |destination|
    FileUtils.mkdir_p "#{Rails.root.to_s}/export_images/#{destination}"
  end
end

## For Classrooms

$:  create_destinations(backup_destinations)
$: backup_dir = backup_destination_base + '/classrooms'
$: classrooms = Classroom.all

classrooms.each do |classroom|
  if has_image?(classroom)
    #URL FOR IMAGE
    copy_image(classroom)
  else
    puts "#{classroom.facility_code_heprod} : image missing"
  end
end


## FOR BUILDINGS

# def copy_image(resource)
#   FileUtils.cp "#{resource.location.picture.path(:original)}", "#{Rails.root.to_s}/export_images/buildings/#{resource.rmrecnbr}.jpg"
# end

$: backup_dir = backup_destination_base + '/buildings'
$: buildings = Building.all

def copy_image(resource)
  FileUtils.cp "#{resource.location.picture.path(:original)}", "#{Rails.root.to_s}/export_images/buildings/#{resource.name}.jpg"
end


buildings.each do |buidling|
  if has_image?(buidling)
    #URL FOR IMAGE
    copy_image(buidling)
  else
    puts "#{buidling.location.name} : image missing"
  end
end


## ZIP THE FILES FROM THE COMMAND LINE (NOT IN RAILS CONSOLE)
find /var/www/html/iris/current/export_images -path '*/.*' -prune -o -type f -print | zip /var/www/html/iris/current/exported.zip -@
