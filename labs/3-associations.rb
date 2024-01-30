# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

ben_sales = Salesperson.find_by({"first_name" => "Benjamin"})
tim_contact = Contact.find_by({"last_name" => "Cook"})
steve_contact = Contact.find_by({"last_name" => "Jobs"})

call1 = Activity.new
    call1["Type"] = "Phone"
    call1["salesperson_id"] = ben_sales["id"]
    call1["contact_id"] = tim_contact["id"]
call1.save

call2 = Activity.new
    call2["Type"] = "Phone"
    call2["salesperson_id"] = ben_sales["id"]
    call2["contact_id"] = steve_contact["id"]
call2.save

email1 = Activity.new
    email1["Type"] = "E-Mail"
    email1["salesperson_id"] = ben_sales["id"]
    email1["contact_id"] = steve_contact["id"]
email1.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
