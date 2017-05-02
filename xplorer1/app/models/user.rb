class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

#good validations!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOOMOpjdy88srHLrEfMmZB_HohTpLa_dyb4OLy0IQ7Ej6QEBQrE_ElDxA"
         validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

         has_many :comments

end
