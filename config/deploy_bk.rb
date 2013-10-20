
deploy.application = "imoveis"
deploy.repository = 'ssh://git@softsimples.repositoryhosting.com/softsimples/imoveis.git'
deploy.hosts = ['ss']

# OPTIONALS

#before_restarting_server do
#  rake "important:task"
#  run "important_command"
#end

deploy.path = '/var/www/apps/'                                # default /var/local/apps
deploy.user = 'softsimples'                              # default deploy
deploy.ssh_opts = ''                              # default empty
deploy.branch = 'master'                       # default master
deploy.environment = 'production'                      # default production
deploy.sudo = false                                  # default false
deploy.cache_dirs = ['public/cache', 'tmp/cache']   # default ['public/cache']
deploy.skip_steps = ['install_gems','clear_cache'] # default []
deploy.app_folder = ''                # default empty
deploy.login_shell = false                           # default false
deploy.bundler_path = '/home/softsimples/.rvm/gems/ruby-1.9.2-p290/gems/bundler-1.0.21'                # default ~/.bundle
