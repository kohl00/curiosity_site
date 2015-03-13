# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string
#  image_id     :string
#  category     :string
#  instructions :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	attr_accessor :tag_list

	validates :name, presence: true
	validates :category, presence: true
	validates :instructions, presence: true

    attachment :image

	def self.tagged_with(name)
		 tag = Tag.find_by(name: name)
		 if !tag.nil?
    	 	recipes = tag.recipes 
    	 	
    	 else
    	 	return false
    	 end
    	 
	end

	def self.tag_counts
    	recipe = Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    	
    end
  
    def tag_list
    	tags.map(&:name).join(", ")
    end
  
  	def tag_list=(names)
    	self.tags = names.split(",").map do |n|
      		Tag.where(name: n.strip).first_or_create!
    	end
  	end

    def send_notification_email
        @users = User.all.each do |user|
            GreetingMailer.send_notification(self,user).deliver_now
       end
  end

end
