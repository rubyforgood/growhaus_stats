class DashboardController < ApplicationController

  def show
    @departments = Department.all

    revenue_forms = @departments.map do |dept|
      [dept.name, Form.where(department: dept).with_revenue]
    end

    revenue_forms = Hash[revenue_forms]
    revenue       = revenue_forms.map { |i, j| j.first.revenue }
    columns       = ['Date', @departments.map(&:name)].flatten
    num_dates     = revenue.first.count
    
    @revenue_chart_data = []
    @revenue_chart_data << columns

    num_dates.times do |index|
      date = revenue.find do |dept|
        dept[index].length > 0
      end

      date = date[index].first

      amounts = revenue.map do |dept|
        dept[index].last.to_i
      end

      @revenue_chart_data << [date, amounts].flatten
    end

    #@revenue_chart_data = [
    #  ['Month', 'Distribution', 'Production', 'Education'],
    #  ['May', 1030, 540, 350],
    #  ['June', 660, 1120, 300],
    #  ['July', 1170, 460, 250],
    #  ['August', 1000, 400, 200]
    #]
  end

end
