class DashboardController < ApplicationController

  def show
    @departments = Department.all
    #TODO replace with real data once google api call is working
    @revenue_chart_data = [
      ['Month', 'Distribution', 'Production', 'Education'],
      ['May', 1030, 540, 350],
      ['June', 660, 1120, 300],
      ['July', 1170, 460, 250],
      ['August', 1000, 400, 200]
    ]
  end

end