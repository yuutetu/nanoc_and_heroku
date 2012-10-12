require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic,
    :root => "output",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

# otherwise 404 NotFound
run lambda {|env| [403, {'Content-Type' => 'text/html'}, ['Not Found']]}
