require 'require_relative'
require_relative '../interactors/todo_interactor.rb'
require_relative '../interactors/status_changes_interactor.rb'
require_relative './todo_list_view'

class TodoVoid
  def initialize(args=[])
    @args = args
    @output = ""
  end

  def execute
    if flag?('-d')
      change_status(:deleted)
    elsif flag?('-f')
      change_status(:finished)
    elsif flag?('-s')
      change_status(:started)
    elsif flag?('--help')
      @output = read_help
    elsif @args[0]
      TodoInteractor.new.add_todo(@args[0])
    else
      todos = TodoInteractor.new.list_all
      @output = TodoListView.render(todos)
    end
    @output
  end
  
  private
  def flag?(flag)
    @args[0] == flag
  end

  def hash
    @args[1]
  end

  def read_help
    help_template = File.join(File.dirname(__FILE__), '../templates/help')
    File.read(help_template)
  end

  def change_status(status)
    begin
      StatusChangesInteractor.new.change_status(hash, status)
    rescue StatusChangesInteractor::ConflictingIdsError => e
      @output += "Conflicting part of an id provided please be more specific:\n"
      @output += TodoListView.render(e.conflicting_todos)
    end
  end
end
