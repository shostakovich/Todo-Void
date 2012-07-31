Gem::Specification.new do |s|
  s.name        = 'todo-void'
  s.version     = '0.0.1'
  s.date        = '2011-07-21'
  s.summary     = "Todo-Void!"
  s.description = "A simple app to manage todos"
  s.authors     = ["Robert Curth"]
  s.email       = 'robert@rocu.de'
  s.executables = ["t"]
  s.files = Dir['lib/*.rb'] + Dir['bin/*'] + Dir['interactors/*.rb']
  s.homepage    = 'http://rubygems.org/gems/todo-void'

  s.add_runtime_dependency "rainbow"
end
