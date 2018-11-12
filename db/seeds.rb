puts "------------------------------"
puts "Clearing DB"
Package.destroy_all
User.destroy_all
Booking.destroy_all
#### User Creation  --------------------------------------------------------- ####
puts "------------------------------"
puts 'Start creating user accounts'


  # FIRST NAMES --------------------------------------------------------
  first_names = %w[James Sally Claire Hennery Stine Barry Sophia Ava Jackson Olivia Aiden Lucas Liam]
  last_names = %w[Smith Johnson Williams Brown Davis Miller Wilson Thomas Gonzalez Patterson Cox Simmons Bryant]
  locations = ["Batu Bolong Beach, Canggu, Bali, Indonesia",
                    "Old Man's Beach, Canggu, Bali, Indonesia",
                    "Batu Bolong Beach, Canggu, Bali, Indonesia",
                    "Double Six Beach, Canggu, Bali, Indonesia"]
avatars = ["https://avatars0.githubusercontent.com/u/43139321?v=4",
                  "https://avatars3.githubusercontent.com/u/28381425?v=4",
                  "https://avatars2.githubusercontent.com/u/19579480?v=4",
                  "https://avatars2.githubusercontent.com/u/43283863?v=4",
                  "https://avatars0.githubusercontent.com/u/23165579?v=4",
                  "https://avatars2.githubusercontent.com/u/41954899?v=4",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIuzb7Erj8RCCOyIW2spGGAdea8K3U70zWejcG4_Hd1z1JF0jQ",
                  "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&h=350",
                  "http://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9&s=2cbaca6f5dc24bb35aab13e97e390994",
                  "https://images.pexels.com/photos/573299/pexels-photo-573299.jpeg?auto=compress&cs=tinysrgb&h=350"]


25.times do |i|
  puts "------------------------------"
    first_name = first_names.sample
  puts "Adding User:'#{first_name}'"
    user_data = {
      first_name: first_name,
      email: "#{i}_#{first_name}@testing.com",
      password: "12345678#{i}",
      last_name: last_names.sample,
      location: locations.sample,
      url_image: avatars.sample

    }
  user = User.new(user_data)
  user.save!
end





  # LAST NAMES --------------------------------------------------------
  # user_last_names.each do |user_last_name|

  # puts "------------------------------"
  # puts "Adding Last Name: #{user_last_name}"

  #   user_data = {
  #     last_name: "#{user_last_name}",
  #   }

  # user = User.new(user_data)
  # user.save!
  # end

  # LOCATIONS -------------------------------------------------------------

  # user_locations.each do |user_location|

  # puts "------------------------------"
  # puts "Adding User Location: #{user_location}"

  #   user_data = {
  #     location: "#{user_location}",
  #   }
  # user = User.new(user_data)
  # user.save!
  # end



  # user_avatars.each do |avatar_photo|

  #   puts "------------------------------"
  #   puts 'Adding Profile Avatar'

  #   user_data = {
  #     image_url: "#{avatar_photo}",
  #   }

  # user = User.new(user_data)
  # user.save!
  # end




puts "---------------------------------------------------------------------"
puts 'Finished creating user accounts'






### PACKAGE CREATION  ------------------------------------------------------------------ ####
#
puts 'Start creating packages data'
images = %w[https://thumbs.gfycat.com/CrispEnlightenedBarbet-size_restricted.gif https://thumbs.gfycat.com/BareHighAxisdeer-size_restricted.gif https://thumbs.gfycat.com/BareHighAxisdeer-size_restricted.gif https://thumbs.gfycat.com/UnhappyNaturalBudgie-size_restricted.gif https://thumbs.gfycat.com/QuickShimmeringBunny-size_restricted.gif https://thumbs.gfycat.com/DrearyNarrowBarnowl-size_restricted.gif]

20.times do
  puts "Package created"
  package_data = {
    title: %w[Basic Advanced Premium].sample,
    description: 'Experience Drone guy, for 1h of filming and editing',
    url_image: images.sample,
    price: %w[$50 $100 $110 $120 $130 $140].sample,
    # review_id: (1..50).to_a.sample,
    location: %w[canggu kuta ubud munduk].sample,
    user: User.all.sample
  }
    package = Package.new(package_data)
    package.save!
end

puts "---------------------------------------------------------------------"
puts 'Finshed creating packages data'






#### BOOKING CREATION ------------------------------------------------------------------- ####
#
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
    package: Package.all.sample,
    user: User.all.sample
  }
    booking = Booking.new(booking_data)
    booking.save!
end
puts "---------------------------------------------------------------------"
puts 'Finshed creating bookings data'














