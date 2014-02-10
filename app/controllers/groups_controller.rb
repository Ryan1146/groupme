class GroupsController < ApplicationController

	before_action :set_group , :only => [:edit , :update , :destroy]
	before_filter :authenticate_user! , only: [:new , :create , :edit , :update , :destroy]

	def index
		@groups = Group.all
	end


	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
		
	end

	def new
		#@group = Group.new
		@group = current_user.groups.build(group_params)
		
	end

	def create
		@group = current_user.groups.build(group_params)
		#@group = Group.new(group_params)
		
		if(@group.save)
			redirect_to groups_path
		else
			render :new
		end

	end

	def edit
		
	end

	def update
		if(@group.update(group_params))
			redirect_to group_path(@group)

		else
			render :edit

		end
		
	end

	def destroy
		if(@group.destroy)
			redirect_to groups_path		
		else

		end
		
	end


	private
		def set_group
			#@group = Group.find(params[:id])
			@group = current_user.groups.find(params[:id])
		end

		def group_params
			params.require(:group).permit(:title , :description)
		end




end
