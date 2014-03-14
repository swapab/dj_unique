source 'https://rubygems.org'

group :test do
  platforms :jruby do
    gem 'activerecord-jdbcmysql-adapter'
    gem 'jdbc-mysql'

    gem 'activerecord-jdbcpostgresql-adapter'
    gem 'jdbc-postgres'

    gem 'activerecord-jdbcsqlite3-adapter'
    gem 'jdbc-sqlite3'
  end

  platforms :ruby, :mswin, :mingw do
    gem 'mysql', '~> 2.8.1'
    gem 'pg'
    gem 'sqlite3'
  end
end

# Specify your gem's dependencies in dj_unique.gemspec
gemspec
