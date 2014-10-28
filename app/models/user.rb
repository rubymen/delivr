class User < ActiveRecord::Base
  devise  :database_authenticatable,
          :recoverable,
          :registerable,
          :rememberable,
          :trackable,
          :validatable

  def to_s
    email
  end
end
