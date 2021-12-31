namespace :import do
  desc "Import garments from txt"
  task from_txt: :environment do
    Dir[Rails.root.join('db', 'txt', '*.txt')].each do |filename|
      lines = File.readlines(filename, chomp: true)

      garment_type = GarmentType.find_or_create_by(name: lines[1])

      Garment.where(name: lines[0]).first_or_initialize.tap do |garment|
       min_temp, max_temp = lines[2].scan(/-?\d+/).map(&:to_i)

       garment.garment_type = garment_type
       garment.min_temp = min_temp
       garment.max_temp = max_temp

       garment.save!
      rescue ActiveRecord::RecordInvalid => error
        Rails.logger.error filename
        Rails.logger.error error.message
      end
    end
  end
end
