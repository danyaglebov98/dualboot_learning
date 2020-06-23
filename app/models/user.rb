# frozen_string_literal: true

class User < ApplicationRecord
  ALL_DAY_TIME = 24.hours
  has_secure_password
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id

  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  validates :email, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/, message: '%{value} is not valid!' }, presence: true

  def generate_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!
  end

  def password_reset_token_is_dead?
    password_reset_sent_at < ALL_DAY_TIME.ago
  end
end
