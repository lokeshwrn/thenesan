class ApiController < ApplicationController

  def iot_create
    new_params=params.permit(:sensor_1, :sensor_2, :sensor_3, :sensor_4)
    sensor=Sensor.new(new_params)
    if sensor.save
      render :text => 'true'
    else
      render :text => 'false'
    end
  end

  def iot_show
    @sensor=Sensor.all
  end

end
