#Added for ElasticSearch
require 'elasticsearch/model'

class Home < ActiveRecord::Base
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "600x400>", :thumb => "150x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end

Home.import # for auto sync model with elastic search