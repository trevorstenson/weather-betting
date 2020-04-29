class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  before_create :default_points

  def default_points
    self.points = 100
  end
end