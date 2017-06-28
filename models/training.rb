require 'active_record'

class Training < ActiveRecord::Base
  belongs_to :user
end
