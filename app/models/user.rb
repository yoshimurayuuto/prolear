class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :feeds
  mount_uploader :image, ImageUploader
  validates :name, presence: true, on: :update
  validates :birth_date, presence: true, on: :update
  validates :sex, presence: true, on: :update
  validates :image, presence: true, on: :update

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def update_without_current_password(params, *options)
         params.delete(:current_password)
     
         if params[:password].blank? && params[:password_confirmation].blank?
           params.delete(:password)
           params.delete(:password_confirmation)
         end
     
         result = update_attributes(params, *options)
         clean_up_passwords
         result
  end

  enum sex: { 男性: 0, 女性: 1 }


  def matchers
    User.where(id: passive_relationships.select(:follower_id)).where(id: active_relationships.select(:followed_id))
  end

  



  
end
