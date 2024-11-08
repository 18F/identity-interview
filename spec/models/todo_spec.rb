require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '.create_random' do
    it 'creates random todos' do
      expect { Todo.create_random(count: 5) }.to(
        change { Todo.count }.from(0).to(5),
      )
    end

    it 'creates one Todo with a blank due date' do
      todos = Todo.create_random(count: 5)

      expect(todos).to be_any { |todo| todo.due_at.nil? }
    end
  end

  describe '.build_random' do
    let(:include_due_date) { true }

    subject(:todo) { Todo.build_random(include_due_date:) }

    it 'has a title' do
      expect(todo.title).to be_present
    end

    context 'with include_due_date: true' do
      let(:include_due_date) { true }

      it 'has a randomized due date' do
        expect(11.days.ago..11.days.from_now).to cover(todo.due_at)
      end
    end

    context 'with include_due_date: false' do
      let(:include_due_date) { false }

      it 'has a blank due date' do
        expect(todo.due_at).to be_nil
      end
    end
  end
end
