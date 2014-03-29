# DjUnique

An armour for delayed_job_active_record to ensure no duplicate jobs are enqueued.

## Installation

Add this line to your application's Gemfile:

    gem 'dj_unique'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dj_unique

## Usage

Create a [custom job class](https://github.com/collectiveidea/delayed_job#custom-jobs)

```ruby
class NewsletterJob < Struct.new(:text, :emails)
  def perform
    emails.each { |e| NewsletterMailer.deliver_text_to_email(text, e) }
  end
end
```

and enque it as a `Delayed::UniqueJob`

```ruby
  @performable = NewsletterJob.new('lorem ipsum...', Customers.find(:all).collect(&:email))
  Delayed::UniqueJob(@performable) # Ensuring no duplicate jobs are added.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Todo

1. Add some more tests
2. Documentation
3. Support for `Delayed::UniqueJob#delay`
