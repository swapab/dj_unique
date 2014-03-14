require 'helper'
require 'spec_helper'
require "test/heavy_duty"

describe Delayed::UniqueJob do
  before do
    @performable = HeavyDuty.new('Coding Machine')
    Delayed::UniqueJob.enqueue(@performable)
  end

  it 'get active_jobs for the performable object' do
    @active_jobs = Delayed::UniqueJob.active_jobs(@performable)
    @active_jobs.should_not be_blank
  end

  it 'reject active jobs with non matching handler' do
    @performable = HeavyDuty.new('werewolf')
    @active_jobs = Delayed::UniqueJob.active_jobs(@performable)
    @active_jobs.should be_blank
  end
end
