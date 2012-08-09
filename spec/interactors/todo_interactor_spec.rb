require_relative '../../interactors/todo_interactor'

describe TodoInteractor do
  describe 'adding new todos' do
    let(:store) { double('store') }
    let(:interactor) { TodoInteractor.new(store) }

    it 'can add a todo' do
      store.should_receive(:save) do |todo|
        todo.tags.should == ['foobar']
        todo.description == 'Foobar'
      end
      
      interactor.add_todo("Foobar", ["foobar"])
    end
  end
end
