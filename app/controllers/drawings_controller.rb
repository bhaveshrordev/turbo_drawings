class DrawingsController < ApplicationController
  def index
  end

  def change_color
    color = params[:color]

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('drawing_canvas', 
                                                 partial: "drawings/canvas", 
                                                 locals: {color: color})
      end
    end

    # # Use Turbo Streams to update the drawing canvas
    # turbo_stream.replace 'drawing_canvas' do
    #   render partial: 'canvas', locals: { color: color }
    # end

  end
end
