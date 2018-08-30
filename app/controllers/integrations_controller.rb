class IntegrationsController < ApplicationController

	def index
	    @integrations = Integration.all

	end

	def show
		get_integration_data
	end

	def new
		get_tags
		@integration = Integration.new
	end

	def create
		get_tags
		@integration = Integration.new(integration_params)
		if @integration.save
			redirect_to @integration
		else
			render 'new'
		end
	end

	def edit
		get_integration_data
		get_tags
	end

	def update
		get_integration_data
		get_tags

		if integration_params[:tag_ids].nil?
			Tagging.where(:integration_id => params[:id]).delete_all
		end
  		if @integration.update(integration_params)
			redirect_to @integration
		else
			render 'edit'
		end
	end

	def delete
	end

	def destroy
		get_integration_data
		@integration.destroy
  		redirect_to integrations_path
	end


	private def get_integration_data
	  @integration = Integration.find(params[:id])
	end
	private def get_tags
	  @tags = Tag.all
	end
	
	private def integration_params
		params.require(:integration).permit(:name, :description, :tag_ids => [])
  	end	
end
