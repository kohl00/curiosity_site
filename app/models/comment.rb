# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe

	validates :body, presence: true, length: { minimum: 5, too_short: "comment must be longer", too_long: "comment is too long"}
end
