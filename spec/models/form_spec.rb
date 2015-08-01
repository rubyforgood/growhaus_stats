# == Schema Information
#
# Table name: forms
#
#  id              :integer          not null, primary key
#  name            :string
#  google_form_url :string
#  frequency       :string
#  department_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'rails_helper'

RSpec.describe Form, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
