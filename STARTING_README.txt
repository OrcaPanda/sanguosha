postgres -D ~/data
apachectl restart
unicorn -c /config/unicorn.rb
