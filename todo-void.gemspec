Gem::Specification.new do |s|
  s.name        = 'todo-void'
  s.version     = '0.1.2.alpha'
  s.date        = '2011-08-10'
  s.summary     = 'Todo-Void!'
  s.description = 'A simple app to manage todos'
  s.author     = 'Robert Curth'
  s.email       = 'robert@rocu.de'
  s.license     = 'MIT'
  s.post_install_message = "Enter t 'Mowing the lawn' to create your first task!"

  s.required_ruby_version = '>= 1.9.2'

  s.executables = ["t"]
  s.files = Dir['lib/*.rb'] + Dir['bin/*'] + Dir['interactors/*.rb']
  s.homepage    = 'http://rubygems.org/gems/todo-void'

  s.add_runtime_dependency "rainbow"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "pry"
end
