# README
###### ApiRequest Logs are added for the bonus!
This application consist of one endpoint to do registration for an exam at:
```
POST /api/v1/registrations
```

 Payload(raw json):
```
{
    "first_name": "John",
    "last_name": "Doe",
    "phone_number": "9221127774",
    "college_id": 1,
    "exam_id": 1,
    "start_time": "2023-10-4 09:00:00"
}
```
#### Prerequisites
* Ruby 3.1.2
* Postgresql 14.9
* Rails 7

#### To load the dependencies run:
```
bundle install # in app root folder
```

#### Database
* Create a user on postgresql named `codehall` with password `codehall` with `createdb` permission
* Then to create and preload the database on app rune:
```
rake db:create db:migrate db:seed  # in app root folder
```

#### Run the application
```
rails server # in app root folder
```

#### Specs
* Make sure test_db is migrated and just run:
```
rspec  # in app root folder
```

## That's All, Folks!
