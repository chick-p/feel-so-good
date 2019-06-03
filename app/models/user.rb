# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :scores, dependent: :nullify

  def initialize(*)
    super
    self.token ||= SecureRandom.alphanumeric(20)
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth[:uid], provider: auth[:provider]).first
    user ||= User.create(
      provider: auth[:provider],
      uid: auth[:uid],
      name: auth[:info][:name],
      t_username: auth[:info][:nickname],
      email: User.dummy_email(auth),
      admin: false,
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth[:uid]}@#{auth[:provider]}.com"
  end

end
