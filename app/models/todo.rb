class Todo < ApplicationRecord
  # Saves +count+ random Todos to the database,
  # including one with a blank due_at
  # @param count [Integer] number of Todos to create
  # @return [nil]
  def self.create_random(count:)
    todos = []

    (count - 1).times do
      todos << build_random
    end
    todos << build_random(include_due_date: false)
    todos.map(&:save)
    todos
  end

  # Builds a randomized Todo
  # @param include_due_date [Boolean] whether or not to set a due date
  # @return [Todo]
  def self.build_random(include_due_date: true)
    verb = %w[create remove fix discover research].sample
    noun = %w[taco burrito banana smoothie fries salad].sample

    new(
      due_at: include_due_date ? rand(-10..10).days.from_now : nil,
      title: "#{verb} #{noun}",
    )
  end
end
