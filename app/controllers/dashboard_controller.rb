class DashboardController < ApplicationController


  #content_security_policy only: :index do |policy|
  #  policy.style_src :self, :unsafe_inline
  #end


  def index
    @sales_grouped_by_month = Sale.group_by_month(:date_time).order(date_time: :asc).sum(:amount)
    @sales_quantity_by_month = Sale.group_by_month(:date_time).order(date_time: :asc).count
    @sales_average_by_month = Sale.group_by_month(:date_time).order(date_time: :asc).average(:amount)

    @sales_by_coffee_origin_12 = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 12.months, Date.today.beginning_of_month).count
    @sales_by_coffee_origin_6 = Sale.group(:origin).where('date_time> ? and date_time < ?', Date.today.beginning_of_month - 6.months, Date.today.beginning_of_month).count
    @sales_by_coffee_origin_3 = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 3.months, Date.today.beginning_of_month).count
    @sales_by_coffee_origin_1 = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 1.months, Date.today.beginning_of_month).count

    @sales_by_coffee_blend_12 = Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 12.months, Date.today.beginning_of_month).count
    @sales_by_coffee_blend_6 = Sale.group(:blend).where('date_time> ? and date_time < ?', Date.today.beginning_of_month - 6.months, Date.today.beginning_of_month).count
    @sales_by_coffee_blend_3 = Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 3.months, Date.today.beginning_of_month).count
    @sales_by_coffee_blend_1 = Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 1.months, Date.today.beginning_of_month).count

  end
end