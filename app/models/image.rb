class Image < ActiveRecord::Base
belongs_to :user, dependent: :destroy
belongs_to :imagable, :polymorphic => true
has_attached_file :image, :styles => {:original => "900x900>",:default => "226x287!",:thumb => "140x140>"}
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
end
