class SlotsController < ApplicationController
  def create
    slot = Slot.new(slot_permitted)
    slot.user = current_user
    slot.save

    redirect_to home_path
  end

  private
    def slot_permitted
      params.require(:slot).permit(:hour, :church_id)
    end
end
