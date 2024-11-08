class Todo < ApplicationRecord
  # Saves +count+ random Todos to the database,
  # including one with a blank due_at
  # @param count [Integer] number of Todos to create
  # @return [nil]
  def self.create_random(count:)
    (count - 1).times do
      build_random.save
    end
    build_random(due_at: nil).save
    nil
  end

  # Builds a randomized Todo
  # @param due_at [Boolean] whether or not to set a due date
  # @return [Todo]
  def self.build_random(due_at: true)
    verb = %w[create remove fix discover research].sample
    noun = %w[taco burrito banana smoothie fries salad].sample

    new(
      due_at: due_at ? rand(-10..10).days.from_now : nil,
      title: "#{verb} #{noun}",
    )
  end
end
