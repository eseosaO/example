class TasksController < ApplicationController
  def index
    # @page = params[:page].to_i
    #@apps = ['Switch food app', 'Finding the devices', 'Autowash', 'dividing tasks app' ]

    @tasks = Task.order(:position) #Retrieve data (sorted by position with 'order' function
                                  # or we could 'all' function for retrieving all data)
                                  # from the database instead
  end

  def show
    @task = Task.find(params[:id])
  end

  #Presents the new form for a certain task
  def new
    @count = Task.count #Take count of available tasks
    @task = Task.new(position: @count + 1) #Set-up new task's position with the next position value
  end

  #Process the creation of a certain task
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render('new') #This only render the new template again to us
    end
  end

  #Presents the form for a certain task
  def edit
    @task = Task.find(params[:id])  #Finding the certain task
  end

  #Process the edit form for a certain task
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  # def cancel
  #   @task = Task.find(params[:id])
  #   check_for_cancel
  # end

  def task_params
    params.require(:task).permit(
      :name,
      :position,
      :category_id,
      :completed,
      :description
    )
  end

  # def check_for_cancel
  #   unless params[:cancel].blank?
  #     redirect_back_or_to tasks_path
  #   end
  # end
end
