class SearchController < ApplicationController
	
	def search
	  if params[:q].nil?
	    @homes = []
	  else
	    @homes = Home.search params[:q]
	  end
	end	
	
	
end
