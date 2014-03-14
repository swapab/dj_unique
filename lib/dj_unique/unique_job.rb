module Delayed
  class UniqueJob < Job
    def self.enqueue(*args)
      super unless active_jobs(args.first)
    end

    def self.active_jobs(object)
      working_OR_successful_OR_pending.find_by_handler(object.to_yaml)
    end

    def self.working_OR_successful_OR_pending
      where('locked_at IS NOT NULL OR last_error IS NULL OR attempts = 0')
    end
  end
end
