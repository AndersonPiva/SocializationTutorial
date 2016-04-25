class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { :medium => "300x300>", :tiny => "30x30" }, default_url: ("/img/default_url.png")
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :posts, :dependent => :destroy

  acts_as_follower
  acts_as_followable

  def to_param
    "#{id}-#{username.parameterize}"
  end
end
