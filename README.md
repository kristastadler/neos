# Mod 3 Refactoring Workshop

## Background

Near Earth Objects is an educational command line tool that strives to interrupt the monotony of day to day living by allowing users to understand how close to extinction life on earth is at any given point in time. Every day thousands of NEOs (Near Earth Objects) i.e. comets, astroids, meteors pass by the earth at alarmingly close distances. One slight shift in the cosmos would cause these NEOs to crash into the earth, setting off a series of catastrophic events that would lead to the end of life as we know it (much like the fate of the dinosaurs). Now that we've discussed this, please take a moment to appreciate 3 small things in your life that you take for granted and assume will always be there...

## Instructions

Please follow these instructions for further enlightenment.

- Clone this repo
- Run `bundle install` to download and install all of the necessary dependencies
- This project uses NASA's Astroids - NeoWs API. Please signup for an API key [here](https://api.nasa.gov/)
- Once you have your api key, run `bundle exec figaro install`. This should create a file called `application.yml` located in the `config` folder. **Note:** This file is automatically gitignored and many IDEs do not show gitignored files by default. You may have to change your IDE's settings to show gitignored files.
- Append your api_key to `application.yml` in the following format `nasa_api_key: <Your API KEY Goes Here>`
- This project uses minitest. You can run the tests with the following command `ruby near_earth_objects_test.rb`
- To use the command line tool run `ruby start.rb`. You will be prompted to enter a date. Enter the date in the following format `YYYY-MM-DD` i.e. `2019-03-30`. Once you hit enter you will see information about the objects that came near to the earth on that day.

## Workshop

### Explore the code (15 min)

With your partner look through `start.rb` and `near_earth_objects.rb`

- Discuss is this 'good' or 'bad' code? Why?

Bad code -- Files are poorly organized, there are typos, there are hard to understand variable names, overall it is very unreadable

---

### Identify the responsibilities (10 min)

With your Partner, identify the different responsibilities that exist in each file.

- Does this adhere to SRP?

No, not at all.

- How would you utilize encapsulation and abstraction to refactor this code?

start.rb should strictly be a runner file. There shouldn't be so much happening there.
near_earth_objects.rb is one giant method inside the class. It should be broken out into a def initialize with helper methods.

- What tools/strategies could you utilize to make this code adhere to SRP?
Make more objects! Use TDD to make sure functionality isn't lost. Encapsulate small chunks of code so they can be reused.

---

### Refactor (1 hour)

Declarative Programming:
- Write the code you wish existed above the existing code
- Keep the code that is currently working. Don't delete it until the new code is working. This way you will always have a passing solution

---

Red, Green, Refactor:
- Utilize tests to keep you moving in the right direction
- Follow the errors in the test to guide you each step of the way
