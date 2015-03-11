class WelcomeController < ApplicationController

	skip_before_filter :require_login

  def index
  	@search = Groupinv.search(params[:q])
    @groupinvs = @search.result
  end
end
