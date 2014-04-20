# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{webapp@marcierge_webapp}
set :deploy_to, '/home/webapp/project/marcierge.com/'


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'marcierge_webapp', user: 'webapp', roles: %w{web app}, roles: %w(app db)

set :branch, 'master'

set :ssh_options, {
  keys: %w(~/.ssh/marcierge/marcierge_webapp.pem)
}