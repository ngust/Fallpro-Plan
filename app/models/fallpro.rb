class Fallpro < ApplicationRecord
  belongs_to :user, optional: true
  has_many :fallpro_hazards
  has_many :fallpro_steps
  has_many :fallpro_reverse_steps

  has_many :fallpro_emails, dependent: :destroy
  accepts_nested_attributes_for :fallpro_emails, allow_destroy: true, :reject_if => :all_blank


  serialize :how_rescue

  # mount_uploader :sketch, ImageUploader

  # accepts_nested_attributes_for :fallpro_steps, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :fallpro_steps, allow_destroy: true, :reject_if => lambda { |attributes|
  		empty = attributes[:body].blank?
	}
  accepts_nested_attributes_for :fallpro_reverse_steps, allow_destroy: true, :reject_if => lambda { |attributes|
  		empty = attributes[:body].blank?
  	}

  validates_presence_of :company
  validates_presence_of :supervisor

end
