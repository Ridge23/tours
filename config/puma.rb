#!/usr/bin/env puma

#environment 'production'
daemonize false

pidfile 'tmp/pids/puma.pid'
state_path 'tmp/pids/puma.state'

stdout_redirect 'log/puma.log', 'log/puma_err.log'

# quiet
threads 0, 16
bind 'unix:///tmp/sockets/travel_app.sock'

# on_restart do
#   puts 'On restart...'
# end

# === Cluster mode ===

# workers 2

# on_worker_boot do
#   puts 'On worker boot...'
# end

# === Puma control rack application ===

activate_control_app