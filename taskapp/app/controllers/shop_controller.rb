class ShopController < ApplicationController


		def index
			@sellbooks = Shop.all
		end
    def edit
		end
		
		def update
		  if @project.update(project_params)
				redirect_to projects_path
			else
				render 'edit'
			end
		end
		def destroy
		  @project.destroy
			redirect_to projects_path
		end
		private
      
      def project_params
        cookies[:user_name] = "david"  
	params[:project].permit(:title)
      end

      def set_project
        @sellbooks = Shop.find(params[:id])
        #@project = Project.find(params[:id])
      end
end
