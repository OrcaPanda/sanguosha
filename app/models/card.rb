class Card < ActiveRecord::Base
	has_attached_file :image,
		:styles => {
			:index_thumb => "225x323"},
		:convert_options => {
			:index_thumb => "-quality 75 -strip"}
	validates :name, presence: true, uniqueness: {case_sensitive: false}
	validates :cardtype, presence: true
	validates :explanation, presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]}
	TYPES = ['Wu Hero','Shu Hero','Wei Hero','Gray Hero','God Hero','Other Hero','Basic Card','Scroll Card','Time-Delay Scroll Card','Weapon','Armour','Horse','Special Equipment']
	WIDTH = 4 #4 cards wide per row
end
