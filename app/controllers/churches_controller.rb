class ChurchesController < ApplicationController

  def index
    churches = Church.all

    churches.map! do |church|
      slot_count = church.slots.count
      church = church.as_json
      church[:slots] = slot_count
      church
    end

    render json: churches
  end

end
