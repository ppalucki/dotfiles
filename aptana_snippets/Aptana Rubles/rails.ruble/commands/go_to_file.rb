require 'ruble'

#with_defaults :key_binding => "M1+M2+M3+ARROW_DOWN", :output => :show_as_tooltip do |bundle|
with_defaults :output => :show_as_tooltip do |bundle|

  command "Go to Controller" do |cmd|
    cmd.scope = "source.ruby, text.html.ruby, source.ruby.rails.embedded.html, meta.rails.helper, meta.rails.functional_test, source.js, source.css, source.yaml, meta.rails.model, meta.rails.unit_test, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:controller) }
  end

  command "Go to Alternate File" do |cmd|
    cmd.key_binding = 'CTRL+G'
    cmd.scope = "source.ruby.rails, text.html.ruby, source.ruby.rails.embedded.html, source.yaml, text.haml, source.css, source.js, source.sass"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(nil) }
  end

  command "Go to File on Current Line" do |cmd|
    cmd.scope = "source.ruby.rails, text.html.ruby, source.ruby.rails.embedded.html, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.on_current_line }
  end

  command "Go to Fixture" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, meta.rails.unit_test, meta.rails.functional_test"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:fixture) }
  end

  command "Go to Functional Test" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, source.yaml, meta.rails.unit_test"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:functional_test) }
  end

  command "Go to Helper" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.model, meta.rails.unit_test, meta.rails.functional_test, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:helper) }
  end

  command "Go to Javascript" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.helper, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:javascript) }
  end

  command "Go to Model" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.helper, meta.rails.unit_test, source.js, source.css, source.yaml, meta.rails.controller, meta.rails.functional_test, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:model) }
  end

  command "Go to Stylesheet" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.helper, text.haml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:stylesheet) }
  end

  command "Go to Unit Test" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, meta.rails.functional_test, source.yaml"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:unit_test) }
  end

  command "Go to View" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.mailer, source.js, source.css"
    cmd.invoke { require 'rails/command_go_to_file'; CommandGoToFile.alternate(:view) }
  end

end
