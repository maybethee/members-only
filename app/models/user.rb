class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_username

  has_many :posts

  private

  def set_username
    # auto generate username from first half of email
    self.username = self.email.split('@').first if self.username.blank?
  end
end
