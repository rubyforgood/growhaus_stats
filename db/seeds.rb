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

Form.find_or_create_by(name:"Food Boxes", google_form_url:"https://docs.google.com/forms/d/1-hxU-Qtb9dpLfMouo3glSM4F2nDOJP6eHPOdmnjHwt0/viewform?embedded=true", frequency:'weekly', department:distribution)
Form.find_or_create_by(name:"Cosechando Salud", google_form_url:"https://docs.google.com/forms/d/1A2PzEZtSYB6oYMDMozqYLGRbQec76kg9hMYyOdtt3Lc/viewform?embedded=true", frequency:'weekly', department:distribution)
Form.find_or_create_by(name:"Market Customers", google_form_url:"https://docs.google.com/forms/d/1BkAARsFv-p9WnkCaF7M8VaFoxNa8Qd6E0543Eb9KBfI/viewform?embedded=true", frequency:'weekly', department:distribution)
Form.find_or_create_by(name:"Food Distribution Revenue", google_form_url:"https://docs.google.com/forms/d/16rFCfJAtdCEN3CUtULJcSAbVdztQIr6fkZ5fhRFxIik/viewform?embedded=true", frequency:'monthly', department:distribution)
Form.find_or_create_by(name:"HidroHuerto", google_form_url:"https://docs.google.com/forms/d/1rY5d7zulFCMoEgQAN9_lH_51qUsRfX5I3AWq2kIrItU/viewform?embedded=true", frequency:'monthly', department:production)
Form.find_or_create_by(name:"HidroHuerto Revenue", google_form_url:"https://docs.google.com/forms/d/1ayK9BDmd4zZ5HpDz_JKsCoi2kcxnQsI2lkIoVTMVhdI/viewform?embedded=true", frequency:'monthly', department:production)
Form.find_or_create_by(name:"Volunteering Hours", google_form_url:"https://docs.google.com/forms/d/1QDkw5buhggsyIfFXnjKLRDkUEtxuJVIDkhZlLQZDjhE/viewform?embedded=true", frequency:'monthly', department:education)
Form.find_or_create_by(name:"Education", google_form_url:"https://docs.google.com/forms/d/1LOHZgEGC8XosnU-eTS-r485zdUWoHCr1vsvKJUHq71Y/viewform?embedded=true", frequency:'monthly', department:education)
Form.find_or_create_by(name:"Education Revenue", google_form_url:"https://docs.google.com/forms/d/1nD7XRJ0pK3iaQUBqOPptl2A0xmcKnUe86y4QDTKGIAw/viewform?embedded=true", frequency:'monthly', department:education)
