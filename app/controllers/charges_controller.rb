class ChargesController < ApplicationController

before_action :price

def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user}",
     amount: @price
   }
 end




def create

  customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @price,
    description: "High Rollers Club - #{current_user.email}",
    currency: 'usd'
    )

  current_user.update_attribute(:role, 'premium')


  flash[:success] = "Thanks for joining, #{current_user.email}!"
  redirect_to wiki_path

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end


private
  def price
    @price = 1500
  end

end
