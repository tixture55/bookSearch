
class ProjectsController < AuthorizedController
  PER = 5
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    
    if params[:title].present? && params[:star].present?
      	                
      @projects = Project.where("title like '%" + params[:title] + "%'").page(params[:page]).per(PER)
    elsif params[:title].present?
      @projects = Project.where("title like '%" + params[:title] + "%'").page(params[:page]).per(PER)
    elsif params[:star].present?
      @projects = Project.joins(:reviews).preload(:reviews).where("reviews.star >= ?" , params[:star]).page(params[:page]).per(PER)
    else
      @projects = Project.with_deleted.page(params[:page]).per(PER)
      #@projects = Project.page(params[:page]).per(PER)
      #@projects = Project.with_deleted
      
    end
		   
    if params[:title].frozen?
      @projects = Project.all
    end
		    
  end
  def show
    #render plain: params[:id].inspect
    #@projects = Project.all
    @useritem = UserItem.find(params[:id]);
    #@useritem = UserItem.where("user_items.id => ?", params[:id])
    #respond_to do |format|
      #format.html
      #format.json { render json: @projects }
    #end
    if session[:session_id]
      @notice = "#{session[:session_id]}でログインしています。"
    end

    @s = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id").where("reviews.project_id = ?" , params[:id]).select("reviews.*")
  end
    def new
      @project = Project.new
      #@project = Project.new(project_params)
    end
    def create
      #render plain: params[:post].inspect
      @person = Person.create!({ name: "Isaac Newton", age: 35 })
      rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors
      @project = Project.new(params.require(:post).permit(:title,:content))
      @project.save

      redirect_to projects_path
      #if @project.save
        #redirect_to projects_path
      #else
        #render 'new'
        #render 'index'
      #end
      
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
      reset_session
      redirect_to projects_path
    end
    private
      
    def project_params
      cookies[:user_name] = "david"  
      #params[:project].permit(:title)
      projects_params = params.require(:projects).permit(:title)
    end

      def set_project
        @project = Project.find(params[:id])
      end
end
