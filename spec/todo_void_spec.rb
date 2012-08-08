require_relative '../lib/todo_void'

class TodoInteractor; end

describe TodoVoid do
  let(:interactor){ interactor = stub(:add_todo) }

  describe "creation of a todo" do
    it "call the todo-interactor for a new task" do
      interactor.should_receive(:add_todo).with("Task", []).once
      args = ["Task"]

      TodoVoid.new(args, interactor).execute
    end

    it "calls the todo-interactor with the tag" do
      interactor.should_receive(:add_todo)
                .with("Mow the lawn", ["household"]).once
      args = ["Mow the lawn", "--tags='household'"]

      app = TodoVoid.new(args, interactor)
      app.execute
    end

    it "can handle multiple tags" do
      interactor.should_receive(:add_todo)
                .with("Mow the lawn", ["household", "work"]).once
      args = ["Mow the lawn", "--tags='household, work'"]
      app = TodoVoid.new(args, interactor)
      app.execute
    end
  end
end
