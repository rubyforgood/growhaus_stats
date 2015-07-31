# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

distribution = Department.find_or_create_by(name:"Distribution")
production   = Department.find_or_create_by(name:"Production")
education    = Department.find_or_create_by(name:"Education")

Form.find_or_create_by(name:"Food Boxes", google_form_url:"https://docs.google.com/forms/d/1dwTmarh5u5ZzJlIZYfwAb6XQH_TJDkyebVA_br23Kkg/viewform?embedded=true", frequency:'weekly', department:distribution)