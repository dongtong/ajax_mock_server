#encoding: utf-8
class StateCode < ActiveRecord::Base
	belongs_to :namespace

	validates :code_num, 
						:code_des,
						:presence => true
end
