class ApplicationController < Sinatra::Base
  # helpers ApplicationHelper


  set :views, Proc.new { File.join(root, "../views/") }
  set :method_override, true
  register Sinatra::Twitter::Bootstrap::Assets
end
