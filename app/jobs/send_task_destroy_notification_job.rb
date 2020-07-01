class SendTaskDestroyNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  sidekiq_options lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }

  def perform(task_id, author_id)
    user = User.find(author_id)

    UserMailer.with(user: user, id: task_id).task_destroy.deliver_now
  end
  end
