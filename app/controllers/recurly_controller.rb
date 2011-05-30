class RecurlyController < ApplicationController 
  
  def index
  end
  
  def create_account 
    @result_object = _create_account
    render :action => 'index' 
  end
  
  def fetch_account 
    @result_object = Recurly::Account.find(@account.account_code)
    render :action => 'index'
  end
  
  def update_account
    @account.last_name = 'Update Test'
    @account.company_name = 'Recurly Rails Client -- Update'
    @account.save
  
    @result_object = Recurly::Account.find(@account.account_code)
    render :action => 'index'
  end
  
  def close_account
    @account.close_account
    
    @result_object = Recurly::Account.find(@account.account_code)
    render :action => 'index' 
  end
  
  def update_billing_info
    @result_object = Recurly::BillingInfo.create(
      :account_code => @account.account_code,
      :first_name => @account.first_name,
      :last_name => @account.last_name,
      :address1 => '123 Test St',
      :city => 'San Francisco',
      :state => 'CA',
      :zip => '94115',
      :credit_card => {
        :number => '1',
        :year => Time.now.year + 1,
        :month => Time.now.month,
        :verification_value => '123'
      }
    )
    render :action => 'index'
  end
  
  def charge_account    
    @result_object = Recurly::Charge.create(
      :account_code => @account.account_code,
      :amount => 9.23
    )
    render :action => 'index'
  end
  
  def list_charges
    Recurly::Charge.create(
      :account_code => @account.account_code,
      :amount => 9.23
    )
    Recurly::Charge.create(
      :account_code => @account.account_code,
      :amount => 3.45
    )
    
    @result_object = Recurly::Charge.list(@account.account_code)
    render :action => 'index'
  end
  
  def credit_account
    @result_object = Recurly::Credit.create(
      :account_code => @account.account_code,
      :amount => 9.50
    )
    render :action => 'index'
  end

  def list_credits
    credit = Recurly::Credit.create(
      :account_code => @account.account_code,
      :amount => 9.23
    )
    credit = Recurly::Credit.create(
      :account_code => @account.account_code,
      :amount => 3.45
    )
    
    @result_object = Recurly::Credit.list(@account.account_code)
    render :action => 'index'
  end
  
  def list_plans
    @result_object = Recurly::Plan.find(:all)
    render :action => 'index'
  end
  
  def create_subscription
    @result_object = _create_subscription(@account, TEST_PLAN_CODE)
    render :action => 'index'
  end
  
  def update_subscription
    subscription = _create_subscription(@account, TEST_PLAN_CODE)
    subscription.change('now', :quantity => 2)
    
    @result_object = Recurly::Subscription.find(@account.account_code)
    render :action => 'index'
  end
  
  def cancel_subscription
    subscription = _create_subscription(@account, TEST_PLAN_CODE)
    subscription.cancel(@account.account_code)
    
    @result_object = subscription
    render :action => 'index'
  end
  
  def refund_subscription
    subscription = _create_subscription(@account, TEST_PLAN_CODE)
    
    subscription.refund(:full)
    
    @result_object = subscription
    render :action => 'index'
  end

private  
  def _create_subscription (account, plan_code, quantity = 1)
    account.billing_info = Recurly::BillingInfo.new(
      :first_name => account.first_name,
      :last_name => account.last_name,
      :address1 => '123 Test St',
      :city => 'San Francisco',
      :state => 'CA',
      :country => 'US',
      :zip => '94103',
      :credit_card => {
        :number => '1',
        :year => Time.now.year + 1,
        :month => Time.now.month,
        :verification_value => '123'
      },
      :ip_address => '127.0.0.1'
    )
    
    sub = Recurly::Subscription.create(
      :account_code => account.account_code,
      :plan_code => plan_code, 
      :quantity => quantity,
      :account => account
    )
  end
end