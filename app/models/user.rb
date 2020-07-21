class User < ApplicationRecord
  # Relationship
  has_one :user_contact, dependent: :destroy
  has_many :blogs,  dependent: :destroy
  has_many :tours,  dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Call Back
  before_save :email_downcase

  # Validate Name
  validates :name, presence: true,
             length: {minimum: Settings.user.name.min_length,
                      maximum: Settings.user.name.max_length}

  # Validate Email
  VALIDATES_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALIDATES_EMAIL_REGEX}

  # Validate Password
  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length,
                     maximum: Settings.user.password.max_length},
            allow_nil: true
  has_secure_password

  class << self
    # return the hash digest of the given string
    def digest string
      cost = BCrypt::Engine::MIN_COST if ActiveModel::SecurePassword.min_cost
      cost = BCrypt::Engine.cost unless ActiveModel::SecurePassword.min_cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  private

  def email_downcase
    email.downcase!
  end
end
