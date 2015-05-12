class Home < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "600x400>", :thumb => "150x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	
end
