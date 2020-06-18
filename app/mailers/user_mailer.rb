class UserMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com'

  def task_created
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'New Task Created')
  end

  def task_updated
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'Task Updated')
  end

  def task_destroy
    user = params[:user]
    @task = params[:task]

    mail(to: user.email, subject: 'Task Destroy')
  end

  def forgot_password(user)
    @user = user
    @greeting = "Cool!"

    mail(to: user.email, :subject => 'Reset password instructions')
end
