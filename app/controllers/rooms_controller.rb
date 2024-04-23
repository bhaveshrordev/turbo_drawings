# app/controllers/rooms_controller.rb
require 'vips'

class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      analyze_room_color
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :image)
  end

  def analyze_room_color
    image = Vips::Image.new_from_file(@room.image.path)
    histogram = image.histogram
    dominant_color = histogram.max_value { |_k, v| v }
    complementary_color = dominant_color.rgb_complementary

    @room.update(
      dominant_color: dominant_color.hex.upcase,
      complementary_color: complementary_color.hex.upcase
    )
  end
end