# 5.times do
#   Account.create(Faker::Vehicle.license_plate)
# end
#
sensor = {
  name: Faker::Address.street_address,
  lat: Faker::Address.latitude,
  long: Faker::Address.longitude,
}

Sensor.create(sensor)

# events = Event.all.filter do |event|
#   event.created_at.month == 2
# end
#
# events.each do |event|
#   Transaction.create({ status: 'OK', amount: [2.5, 5].sample, reception_url: Faker::Internet.url, event_id: event.id })
# end

# t = Transaction.new({ status: 'OK', amount: [2.5, 5].sample, reception_url: Faker::Internet.url, })
# puts t