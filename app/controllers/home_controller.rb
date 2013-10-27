class HomeController < ApplicationController
  def index
    @date = Time.now
    @week_count = (0.5 + (@date.at_end_of_month.day + @date.at_beginning_of_month.wday).to_f / 7.0).round

    @calendar = [
      [
        { month: "June", day: 29, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "June", day: 30, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 1, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 2, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 3, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 4, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 5, church: "Temple Church", slots: Random.new.rand(1..24) }
      ],
      [
        { month: "July", day: 6, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 7, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 8, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 9, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 10, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 11, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 12, church: "Temple Church", slots: Random.new.rand(1..24) }
      ],
      [
        { month: "July", day: 13, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 14, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 15, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 16, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 17, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 18, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 19, church: "Temple Church", slots: Random.new.rand(1..24) }
      ],
      [
        { month: "July", day: 20, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 21, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 22, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 23, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 24, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 25, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 26, church: "Temple Church", slots: Random.new.rand(1..24) }
      ],
      [
        { month: "July", day: 27, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 28, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 29, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 30, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "July", day: 31, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "August", day: 1, church: "Temple Church", slots: Random.new.rand(1..24) },
        { month: "August", day: 2, church: "Temple Church", slots: Random.new.rand(1..24) }
      ]
    ]

    @users_praying = Slot.all.map { |slot| slot.user.id }.uniq!.size

    @slot = Slot.new

    render :layout => false
  end
end
