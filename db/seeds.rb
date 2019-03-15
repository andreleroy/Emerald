puts 'Cleaning database...'
Message.destroy_all
Listing.destroy_all

puts 'Creating 10 fake listings with pictures...'
10.times do
  listing = Listing.new(
    name:    Faker::GreekPhilosophers.name,
    location: Faker::Address.city
  )
  listing.save!
  3.times do
    photo = Photo.new(listing_id: listing.id)
    url = Faker::LoremPixel.image("500x500")
    photo.remote_content_url = url
    photo.save!
  end
  4.times do
    message = Message.new(
      listing_id: listing.id,
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      doc_type: ['contract', 'invoice', 'other'].sample,
      attachment: 'pdf-file.png'
      )
    message.save!
  end
end

puts 'Finished!'

