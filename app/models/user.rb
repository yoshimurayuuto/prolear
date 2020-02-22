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



  
end
