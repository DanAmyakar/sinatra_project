# Seed data to populate tables, run 'rake db:seed' to load data.
kyle = Captain.create(captain_name: "Kyle", password: "elyk")
jack = Captain.create(captain_name: "Jack", password: "kcaj")

kyle.ships.create(ship_name: "The Swift", cargo_slots: "3")
kyle.ships.create(ship_name: "The Brease", cargo_slots: "4")

jack.ships.create(ship_name: "The Nomad", cargo_slots: "20")
