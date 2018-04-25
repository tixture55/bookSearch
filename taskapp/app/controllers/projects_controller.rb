
class ProjectsController < AuthorizedController
  PER = 5
  before_action :set_project, only: [:show,:edit, :update, :destroy]

  def index
    #@a = Project.find_by_title('scala入門') 
    
    @all_contacts_count ||= current_user

    if params[:title].present? && params[:star].present? || params[:title].present?
      @projects = Project.search(params[:title]).page(params[:page]).per(PER)
    elsif params[:star].present?
      @projects = Project.joins(:reviews).preload(:reviews).merge(Review.star(params[:star])).page(params[:page]).per(PER)
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
    @user = current_user
    @r = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.project_id = ?" , params[:id]).select("reviews.* , user_items.*")
    
  end
  
  def show_user_detail
    
    #render plain: params[:id].inspect
    
    @ra = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.user_id = ?" , 1).select("projects.*, reviews.* , user_items.*")
    #@r= Report.new
    #@r = Report.find_by(id: params[:format])
    #render plain: params[@r].inspect
    
    @r = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.project_id = ?" , params[:id]).select("reviews.* , user_items.*")

  end

  def new
      @project = Project.new
      #@project = Project.new(project_params)
  end
  def create
    #render plain: params[:post].inspect
    #@person = Person.create!({ name: "Isaac Newton", age: 35 })
    #@person = Project.create!(params[:post])
  rescue ActiveRecord::RecordInvalid => e
    #pp e.record.errors
    @project = Project.new(project_params)
    if @project.save
      redirect_to new_project_path
    else
      render :new
    end  
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
    params.require(:projects).permit(:title,:price,:pict_path)
  end
 
  def set_project
    @project = Project.find(params[:id])
  end
end
