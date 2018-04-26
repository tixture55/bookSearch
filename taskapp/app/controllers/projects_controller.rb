
class ProjectsController < AuthorizedController
  PER = 5
  before_action :set_project, only: [:show,:edit, :update, :destroy]

  def index
    
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
    @click = Click.find_by_project_id(params[:id])
    params[:project_id] = params[:id] 
    params[:user_id] = 1
    @clicked = Click.new(clicked_params)
    @clicked.save
    @user = current_user
    @r = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.project_id = ?" , params[:id]).select("projects.* , reviews.* , user_items.*")
    @cart = Project.where("id = ? ", params[:id])
    @descryption = ItemDesc.find(params[:id])   
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
      @project.save
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
 
  def clicked_params
    params.permit(:project_id,:user_id)
  end
  
  def set_project
    @project = Project.find(params[:id])
  end
end
