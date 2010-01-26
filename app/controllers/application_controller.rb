# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :_create_account, :except => :create_account

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
protected
  def _create_account
    @account = Recurly::Account.create(
      :account_code => "#{Time.now.to_i}-#{params[:action]}",
      :first_name => 'Sal',
      :last_name => 'Paradise',
      :email => 'sal@test.com',
      :company_name => 'Union Pacific')
  end
end
