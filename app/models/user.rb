class User < ActiveRecord::Base
  has_many :friends
   has_many :albums, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :images, :as => :imagable
    has_attached_file :avatar, :styles => { :original => "500x550>",:default => "226x287!",:medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/png)
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  
  def full_name
    if self.name.blank?
      self.email
    else
      self.name
    end
  end

def full_name
    name.blank? ? email : name
end
#has_many :friendships, :dependent => :destroy
#has_many :pending_friends,  -> {where(status: 'pending')}, through: :friendships
#has_many :requested_friends, -> {where(status: 'requested')},through: :friendships
#has_many :accepted_friends, -> { where(status: 'accepted') }, through: :friendships
#has_many :rejected_friends, -> { where(status: 'rejected') }, through: :friendships
has_many :friendships  
has_many :friends, :through => :friendships 
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
has_many :inverse_friends, :through => :inverse_friendships, :source => :user  

has_many :masseges

end