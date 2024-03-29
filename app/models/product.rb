class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  default_scope :order => 'title'

  validates :title, :description, :image_url, :presence => true

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  validates_uniqueness_of :title, :message => "must be unique. Kmon son."

  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG, or PNG image.'
  }

    validates :title, :length => { :minimum => 10 }

end

