Gem::Specification.new do |s|
  s.name        = 'todo-void'
  s.version     = '0.1.1pre'
  s.date        = '2011-08-02'
  s.summary     = 'Todo-Void!'
  s.description = 'A simple app to manage todos'
  s.authors     = ['Robert Curth']
  s.email       = 'robert@rocu.de'
  s.license     = 'MIT'

  s.executables = ["t"]
  s.files = Dir['lib/*.rb'] + Dir['bin/*'] + Dir['interactors/*.rb']
  s.homepage    = 'http://rubygems.org/gems/todo-void'

  s.add_runtime_dependency "rainbow"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "pry"
end
