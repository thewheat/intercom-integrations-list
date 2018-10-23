class ApplicationController < ActionController::Base
	def is_admin?
		return false
	end
	helper_method :is_admin?
end
