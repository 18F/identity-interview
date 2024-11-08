class Todo < ApplicationRecord
  # @return [nil]
  def self.create_random(count:)
    count.times do
      build_random.save
    end
    nil
  end

  # @return [Todo]
  def self.build_random
    verb = %w[create remove fix discover research].sample
    noun = %w[taco burrito banana smoothie fries salad].sample

    new(
      due_at: rand(-10..10).days.from_now,
      title: "#{verb} #{noun}",
    )
  end
end
