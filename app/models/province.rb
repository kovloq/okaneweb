class Province < ActiveRecord::Base
has_many :cities
validates_presence_of :name
end
