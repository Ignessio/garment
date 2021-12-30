namespace :import do
  desc "Import garments from txt"
  task from_txt: :environment do
    Dir[Rails.root.join('db', 'txt', '*.txt')].each do |filename|
      lines = File.readlines(filename, chomp: true)

      garment_type = GarmentType.find_or_create_by(name: lines[1])

      Garment.where(name: lines[1]).first_or_initialize.tap do |garment|
    end
  end
end
