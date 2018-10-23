class Admin::TagsController < ApplicationController

	def index
	    @tags = Tag.all

	end

	def show
		get_tag_data
	end

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			redirect_to [:admin, @tag]
		else
			render 'new'
		end
	end

	def edit
		get_tag_data
	end

	def update
		get_tag_data
  		if @tag.update(tag_params)
			redirect_to [:admin, @tag]
		else
			render 'edit'
		end
	end

	def delete
	end

	def destroy
		get_tag_data
		@tag.destroy
  		redirect_to admin_tags_path
	end

	
	private def get_tag_data
	  @tag = Tag.find(params[:id])
	end
	
	
	private def get_tag_input_data
	
	end

	private

		def tag_params
	    params.require(:tag).permit(:name, :description)
	  end	
end
