


arr = %w[a b c d e f]

puts 'Start creating user accounts'

arr.each do |x|

puts "Account with '#{x}' created"

  user_data = {
    first_name: "#{x}",
    last_name: "#{x}",
    email: "#{x}@#{x}.com",
    password: "#{x}"
  }

  user = User.new(user_data)
  user.save!

end

puts 'Finished creating user accounts'







