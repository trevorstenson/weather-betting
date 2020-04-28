class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
end