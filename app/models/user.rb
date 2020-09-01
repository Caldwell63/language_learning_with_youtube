class User < ApplicationRecord
  # after_create :notify_slack

  has_many :cards, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def notify_slack
  #   SlackNotifier::CLIENT.ping "🎉 New user: #{email} 🎉"
  # end
end
