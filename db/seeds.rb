

#### User Creation ####

letters = %w[q w e r t y]
puts 'Start creating user accounts'


letters.each do |x|

puts "User account with '#{x}' created"

  user_data = {
    first_name: "#{x}",
    last_name: "#{x}",
    email: "#{x}@#{x}.com",
    password: "#{x}#{x}#{x}#{x}#{x}#{x}"
  }

  user = User.new(user_data)
  user.save!

end

puts 'Finished creating user accounts'


### Package Creation ####

puts 'Start creating packages data'

images = %w[https://thumbs.gfycat.com/CrispEnlightenedBarbet-size_restricted.gif https://thumbs.gfycat.com/BareHighAxisdeer-size_restricted.gif https://thumbs.gfycat.com/BareHighAxisdeer-size_restricted.gif https://thumbs.gfycat.com/UnhappyNaturalBudgie-size_restricted.gif https://thumbs.gfycat.com/QuickShimmeringBunny-size_restricted.gif https://thumbs.gfycat.com/DrearyNarrowBarnowl-size_restricted.gif]

20.times do

  puts "Package created"

  package_data = {
    title: %w[Basic Advanced Premium].sample,
    description: 'Experience Drone guy, for 1h of filming and editing',
    url_image: images.sample,
    price: %w[$100 $110 $120 $130 $140].sample,
    # review_id: (1..50).to_a.sample,
    user: User.all.sample
  }

    package = Package.new(package_data)
    package.save!

end

# puts 'Finshed creating packages data'

#### Booking Creation ####

puts 'Start creating bookings data'

30.times do

  puts "Booking created"

  location = %w[Barcelona Bali Paris Sydney Hyderabad Denpassar Moscow].sample
  start_time = DateTime.now
  end_time = start_time + 2

  puts start_time
  puts end_time

  booking_data = {
    title: "#{location} filming @ #{start_time}:00",
    status: %w[Accepted Rejected].to_a.sample,
    location: location,
    start_datetime: start_time,
    end_datetime: end_time,
    cost: %w[$100 $110 $120 $130 $140].to_a.sample,
    package: Package.find_by(id: (1..5).to_a.sample),
    user: User.find_by(id: (1..5).to_a.sample)
  }

    booking = Booking.new(booking_data)
    booking.save!

end

puts 'Finshed creating bookings data'







