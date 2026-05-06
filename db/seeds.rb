# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample users
users = []
5.times do |i|
  user = User.find_or_create_by!(email: "user#{i+1}@example.com") do |u|
    u.first_name = ["Alice", "Bob", "Charlie", "Diana", "Eve"][i]
    u.last_name = ["Smith", "Johnson", "Williams", "Brown", "Jones"][i]
    u.display_name = "#{u.first_name} #{u.last_name}"
  end
  users << user
end

# Create sample posts
post_titles = [
  "Getting Started with Rails",
  "Why I Love Stimulus JS",
  "Building Better Web Apps",
  "PaperTrail: Tracking Changes",
  "A Journey with Hotwire"
]

post_bodies = [
  "Rails is an amazing framework that makes web development a breeze. With its convention over configuration approach, you can build applications quickly and efficiently.",
  "Stimulus JS is the perfect choice for adding interactivity to your web applications. It's lightweight, easy to learn, and integrates seamlessly with Hotwire.",
  "Building web applications in 2026 is easier than ever. With modern tools like Rails, Stimulus, and Hotwire, we can create fast, responsive applications that users love.",
  "PaperTrail is an essential gem for tracking changes to your models. It maintains a complete history of all changes, which is invaluable for auditing and debugging.",
  "My journey with Hotwire has been transformative. Combining Turbo and Stimulus gives us the power of SPAs with the simplicity of server-rendered HTML."
]

users.each do |user|
  3.times do |i|
    Post.find_or_create_by!(
      user_id: user.id,
      title: "#{user.first_name}'s Post: #{post_titles[i]}"
    ) do |p|
      p.body = post_bodies[i]
    end
  end
end

puts "✅ Seed data created successfully!"
puts "  - #{User.count} users"
puts "  - #{Post.count} posts"
