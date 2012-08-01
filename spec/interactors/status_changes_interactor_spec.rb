require 'require_relative'
require_relative '../../interactors/status_changes_interactor'
require_relative '../../lib/todo_list'
require_relative '../../lib/todo'

describe StatusChangesInteractor do
  let(:list){ TodoList.new }
  let(:store) { stub(:todos => list) }
  let(:interactor) { StatusChangesInteractor.new store }

  context 'with conflicting ids' do
    let(:list) do
      list = TodoList.new
      list.add Todo.new "todo3"
      list.add Todo.new "todo311013"
      list
    end

    it 'throws an ConlictingIdsError' do
      list.add Todo.new "todo3"
      list.add Todo.new "todo311013"

      lambda { interactor.change_status('18', :finished) }.should raise_error StatusChangesInteractor::ConflictingIdsError
    end

    it 'includes the conflicting todos in the error' do
      begin
        interactor.change_status('18', :finished)
      rescue StatusChangesInteractor::ConflictingIdsError => e
        e.conflicting_todos.length.should == 2
      end
    end
  end
end
