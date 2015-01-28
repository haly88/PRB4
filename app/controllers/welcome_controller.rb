class WelcomeController < ApplicationController

	skip_before_filter :require_login

  def index
  	@groupinvs = Groupinv.all
  end
end
