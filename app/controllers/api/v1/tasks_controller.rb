class Api::V1::TasksController < Api::V1::ApplicationController
  respond_to :json

  def index
    tasks = Task.
      ransack(ransack_params).
      result.
      includes(:author, :assignee).
      page(page).
      per(per_page)

    respond_with(tasks, each_serializer: TaskSerializer, root: 'items', meta: build_meta(tasks))
  end

  def show
    task = Task.find(params[:id])

    respond_with(task, serializer: TaskSerializer)
  end

  def create
    task = current_user.my_tasks.new(task_params)

    if task.save
      SendTaskCreateNotificationJob.perform_async(task.id)
    end

    respond_with(task, serializer: TaskSerializer, location: nil)
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      SendTaskUpdateNotificationJob.perform_async(task.id)
    end

    respond_with(task, serializer: TaskSerializer)
  end

  def destroy
    task = Task.find(params[:id])
    task_id = task.id
    author_id = task.author_id

    if task.destroy
      SendTaskDestroyNotificationJob.perform_async(task_id, author_id)
    end

    respond_with(task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :assignee_id, :state_event)
  end
end
