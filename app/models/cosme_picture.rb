class CosmePicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence:true
  validates :picture, presence:true
  belongs_to :user
  
   # タグ機能の実装
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

end
