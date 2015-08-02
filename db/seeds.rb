# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

distribution = Department.find_or_create_by(name: 'Distribution')
production   = Department.find_or_create_by(name: 'Production')
education    = Department.find_or_create_by(name: 'Education')

food_boxes = Form.find_or_initialize_by(name: 'Food Boxes')

food_boxes.google_form_url  = 'https://docs.google.com/forms/d/1-hxU-Qtb9dpLfMouo3glSM4F2nDOJP6eHPOdmnjHwt0/viewform?embedded=true'
food_boxes.frequency        = 'weekly' 
food_boxes.department       = distribution
food_boxes.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=1050735829'

food_boxes.save! if food_boxes.changed?

salud = Form.find_or_initialize_by(name: 'Cosechando Salud') 

salud.google_form_url  = 'https://docs.google.com/forms/d/1A2PzEZtSYB6oYMDMozqYLGRbQec76kg9hMYyOdtt3Lc/viewform?embedded=true'
salud.frequency        = 'weekly'
salud.department       = distribution
salud.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=702447041'

salud.save! if salud.changed?

market = Form.find_or_initialize_by(name: 'Market Customers') 

market.google_form_url  = 'https://docs.google.com/forms/d/1BkAARsFv-p9WnkCaF7M8VaFoxNa8Qd6E0543Eb9KBfI/viewform?embedded=true'
market.frequency        = 'weekly'
market.department       = distribution
market.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=135063859' 

market.save! if market.changed?

distribution_revenue = Form.find_or_initialize_by(name: 'Food Distribution Revenue') 

distribution_revenue.google_form_url  = 'https://docs.google.com/forms/d/16rFCfJAtdCEN3CUtULJcSAbVdztQIr6fkZ5fhRFxIik/viewform?embedded=true'
distribution_revenue.frequency        = 'monthly'
distribution_revenue.department       = distribution
distribution_revenue.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=434996641'

distribution_revenue.save! if distribution_revenue.changed?

hidro = Form.find_or_initialize_by(name: 'HidroHuerto') 

hidro.google_form_url  = 'https://docs.google.com/forms/d/1rY5d7zulFCMoEgQAN9_lH_51qUsRfX5I3AWq2kIrItU/viewform?embedded=true'
hidro.frequency        = 'monthly'
hidro.department       = production
hidro.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=547284655'

hidro.save! if hidro.changed?

hidro_revenue = Form.find_or_initialize_by(name: 'HidroHuerto Revenue') 

hidro_revenue.google_form_url  = 'https://docs.google.com/forms/d/1ayK9BDmd4zZ5HpDz_JKsCoi2kcxnQsI2lkIoVTMVhdI/viewform?embedded=true'
hidro_revenue.frequency        = 'monthly'
hidro_revenue.department       = production
hidro_revenue.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=1146814882'

hidro_revenue.save! if hidro_revenue.changed?

volunteer = Form.find_or_initialize_by(name: 'Volunteering Hours') 

volunteer.google_form_url  = 'https://docs.google.com/forms/d/1QDkw5buhggsyIfFXnjKLRDkUEtxuJVIDkhZlLQZDjhE/viewform?embedded=true'
volunteer.frequency        = 'monthly'
volunteer.department       = education
volunteer.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=700855513'

volunteer.save! if volunteer.changed?

education_count = Form.find_or_initialize_by(name: 'Education') 

education_count.google_form_url  = 'https://docs.google.com/forms/d/1LOHZgEGC8XosnU-eTS-r485zdUWoHCr1vsvKJUHq71Y/viewform?embedded=true'
education_count.frequency        = 'monthly'
education_count.department       = education
education_count.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=1422640467'

education_count.save! if education.changed?

education_revenue = Form.find_or_initialize_by(name: 'Education Revenue') 

education_revenue.google_form_url  = 'https://docs.google.com/forms/d/1nD7XRJ0pK3iaQUBqOPptl2A0xmcKnUe86y4QDTKGIAw/viewform?embedded=true'
education_revenue.frequency        = 'monthly'
education_revenue.department       = education
education_revenue.google_sheet_url = 'https://docs.google.com/spreadsheets/d/1pvl6YjvQRNIqyrNLvU3mVywAvUWlU0pQiCWvILfkv0Y/edit#gid=1233378744'

education_revenue.save! if education_revenue.changed?
