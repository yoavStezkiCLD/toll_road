5.times do
  Account.create(Faker::Vehicle.license_plate)
end

sensor = {
  name: Faker::Address.street_address,
  lat: Faker::Address.latitude,
  long: Faker::Address.longitude,
}

Sensor.create(sensor)
