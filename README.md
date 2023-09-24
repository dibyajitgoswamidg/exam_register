# README

This application consist of one endpoint to do registration for an exam at:
```
POST /api/v1/registrations

// Payload(raw json):
// {
//    "first_name": "John",
//    "last_name": "Doe",
//    "phone_number": "9221127774",
//    "college_id": 1,
//    "exam_id": 1,
//    "start_time": "2023-10-4 09:00:00"
//
//}
```

#### Prerequisites
* Ruby 3.1.2
* Postgresql 14.9
* Rails 7

#### To load the dependencies run:
```
bundle install
```

#### Database
```
// Create a user named codehall with password codehall on postgresql with createdb permission
// To create and initialise database run:
rake db:create db:migrate db:seed
```

#### Run the application
```
rails server
```

#### Specs
```
// Make sure test_db is migrated and just run:
rspec
```

##### Note: Added the ApiRequest Logs for the bonus

## That's All, Folks!
