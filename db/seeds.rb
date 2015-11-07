# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoItem.destroy_all
TodoList.destroy_all
Profile.create!([{first_name: "Carly" ,last_name: "Fiorina", gender: "female" ,birth_year: 1954},
{first_name: "Donald" ,last_name: "Trump", gender: "male" ,birth_year: 1946},
{first_name: "Ben" ,last_name: "Carson", gender: "male" ,birth_year: 1951},
{first_name: "Hillary" ,last_name: "Clinton", gender: "female" ,birth_year: 1947}])

due_date = Date.today + 1.year
profiles = Profile.all
profiles.each do |profile|
	profile.create_user(username: profile.last_name,
						password_digest: profile.birth_year)
	user_details = profile.user.todo_lists.create(list_name: profile.first_name, list_due_date: due_date)
	5.times do |i|
		user_details.todo_items.create(due_date: due_date,title: "Coursera#{i}",
			description:"Deep Dive into Active Records#{i}",completed: false)
	end
end


