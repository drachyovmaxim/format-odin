PumaWorkerKiller.config do |config|
  config.ram           = 350 # mb
  config.frequency     = 10    # seconds
  config.percent_usage = 0.50
end

PumaWorkerKiller.start

