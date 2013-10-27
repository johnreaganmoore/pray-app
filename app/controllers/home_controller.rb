class HomeController < ApplicationController
  def index
    @date = DateTime.now

    featureMonth = @date.strftime("%-m")
    weeks = (0.5 + (@date.at_end_of_month.day + @date.at_beginning_of_month.wday).to_f / 7.0).round

    daysToStart = @date.beginning_of_month.days_to_week_start(:sunday)

    startDateTime = @date.beginning_of_month.advance(:days => -daysToStart)
    endDateTime = startDateTime.advance(:days => ((7 * weeks)-1))

    @calendar = []
    week = []

    (startDateTime..endDateTime).each_with_index do |date, index|
      if (index % 7) == 0
        week = []
      end
      month = date.strftime("%-m")
      day = {
        month: date.strftime("%b"),
        featureMonth: featureMonth == month,
        day: date.strftime("%-d"),
        slots: 0
      }
      church = Church.find_by_date(date.strftime("%-d"))
      if church
        day[:church] = church.name
        day[:slots] = church.slots.map { |slot| slot.hour }.uniq.size
      end

      week << day
      if (index % 7) == 6
        @calendar << week
      end
    end

    @posts = Post.all
    @users = User.all
    @slots = Slot.all
    @churches = Church.all

    @users_praying = 0
    unless @slots.empty?
      @users_praying = @slots.map { |slot| slot.user.id }.uniq.size
    end

    @slot = Slot.new

    render :layout => false

  end
end
