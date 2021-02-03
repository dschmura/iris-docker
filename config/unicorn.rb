# Use at least one worker per core if you're on a dedicated server,
# more will usually help for _short_ waits on databases/caches.
worker_processes 8

# Since Unicorn is never exposed to outside clients, it does not need to
# run on the standard HTTP port (80), there is no reason to start Unicorn
# as root unless it's from system init scripts.
# If running the master process as root and the workers as an unprivileged
# user, do this to switch euid/egid in the workers (also chowns logs):
# user "unprivileged_user", "unprivileged_group"
user "unicorn", "unicorn"

base_dir = "/var/www/html/iris/current"
shared_path = "/var/www/html/iris/shared"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory base_dir

listen "127.0.0.1:8080", :tcp_nopush => true

# feel free to point this anywhere accessible on the filesystem
pid "#{shared_path}/pids/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{base_dir}/Gemfile"
end