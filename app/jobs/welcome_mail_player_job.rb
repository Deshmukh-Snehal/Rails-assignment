class WelcomeMailPlayerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Hello Everyone"
  end
end