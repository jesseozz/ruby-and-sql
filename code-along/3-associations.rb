# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

apple = Company.find_by({"name" => "Apple"})

# 1. insert new rows in the contacts table with relationship to a company
new_contact = Contact.new
    new_contact["first_name"] = "Tim"
    new_contact["last_name"] = "Cook"
    new_contact["e-mail"] = "timcook@apple.com"
    new_contact["company_id"] = apple["id"]
new_contact.save

steve_jobs = Contact.new
    steve_jobs["first_name"] = "Steve"
    steve_jobs["last_name"] = "Jobs"
    steve_jobs["e-mail"] = "steve@apple.com"
    steve_jobs["company_id"] = apple["id"]
steve_jobs.save

# 2. How many contacts work at Apple?

apple_contacts = Contact.where({"company_id" => apple["id"]})
puts "apple contacts: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

for person in apple_contacts
    puts "#{person["first_name"]} #{person["last_name"]}"
end