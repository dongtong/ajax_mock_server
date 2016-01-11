#encoding: utf-8
class Namespace < ActiveRecord::Base
	has_many :state_codes, dependent: :destroy

	validates :ns,
						:url_key,
						:url_address,
						:presence => true
end
