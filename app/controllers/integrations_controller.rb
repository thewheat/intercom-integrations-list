class IntegrationsController < ApplicationController

	def index
		@integrations = Integration.all
		@integration = Integration.new
		@search = search_params

		puts @search.inspect

		get_tags
		@integrations = nil
		if @search[:text] then
			@integrations = Integration.where('integrations.name LIKE ? OR integrations.description LIKE ?', "%#{@search[:text]}%", "%#{@search[:text]}%")
		end
		if @search[:tag_ids] && @search[:tag_ids].count > 0 then
			if @integrations.nil? 
				@integrations = Integration.includes(:tags).where(:tags => {:id => @search[:tag_ids]})
			else
				@integrations = @integrations.includes(:tags).where(:tags => {:id => @search[:tag_ids]})
			end
		end
		@integrations = Integration.all if @integrations.nil?


	end

	private def get_tags
	  @tags = Tag.all
	end
	
	private def search_params
		params.require(:search).permit(:text, :tag_ids => [])
  	end	
end
