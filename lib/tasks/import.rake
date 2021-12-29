namespace :import do
  desc "Import garments from txt"
  task from_txt: :environment do
    Dir[Rails.root.join('db', 'txt', '*.txt')].each do |filename|
      lines = File.readlines(filename, chomp: true)
    end
  end
end
