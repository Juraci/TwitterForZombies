class Zombie < ActiveRecord::Base
  after_save :decomp_change_notification, if: :decomp_changed?

  has_one :brain, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :tweets, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }

  private

  def decomp_change_notification
    ZombieMailer.decomp_change(self).deliver
  end
end
