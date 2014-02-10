class Group < ActiveRecord::Base
	validates :title, :presence => true
	


	belongs_to :owner , :class_name => "User" , :foreign_key => :user_id


	has_many :posts

	def editable_by?(user)
		user && user == owner


		#if(user && user==owner)
		#	return true
		#end
	end

end
