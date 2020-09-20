class FallproSite < ApplicationRecord
	validates_presence_of :project
	validates_presence_of :address
	validates_presence_of :cso_name
	validates_presence_of :cso_phone
end
