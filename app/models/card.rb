class Card < ActiveRecord::Base
	attr_accessor :remove_image
	attr_accessor :remove_secondaryimage
	before_save :delete_secondaryimage, if: ->{remove_secondaryimage == '1' && !secondaryimage_updated_at_changed? }
	before_save :delete_image, if: ->{remove_image == '1' && !image_updated_at_changed? }
	has_attached_file :image,
		:styles => {
			:index_thumb => "225x323"},
		:convert_options => {
			:index_thumb => "-quality 75 -strip"}
	has_attached_file :secondaryimage
	validates :name, presence: true
	validates :cardtype, presence: true
	validates :explanation, presence: true
	validates :blood, presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]}
	validates_attachment :secondaryimage, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]}
	TYPES = ['Wu Hero','Shu Hero','Wei Hero','Qun Hero','God Hero','Other Hero','Basic Card','Tool Card','Time-Delay Tool Card','Weapon','Armour','Horse','Treasure']
	BLOOD = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0]
	WIDTH = 4 #4 cards wide per row

	private
	def delete_secondaryimage
		self.secondaryimage.destroy
	end
	def delete_image
		self.image.destroy
	end
end
