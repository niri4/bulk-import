# Intro
This is a very basic app that holds a collection of companies data including its employee and leaves policy information. In this task, you will be required to develop new features according to the following user story.

## User story
As a user/admin, I want to be able to do bulk import by uploading a CSV file containing information of users and its policy so that I can save time onboarding users.

User can upload employee data by going to a new page. This new page will have a form that has 2 form input. The first one should be a drop down of the company. The second one should be the file form input in which user/admin can select the file. There is a sample csv data in the source code that you can refer to `spec/fixtures/valid_sample.csv`.

### Note
* User needs to select the company they are importing for from the web page
* Any new policy from the csv will be automatically created upon the import, eg. if Sick Leave policy does not exist in the company but it presents in the csv, then we should create the policy for Sick Leave
* The policy columns may contain multiple policies and separated by pipe (|)
* The column *Report To* is meant for the reporting line of employee. An employee can only report to another employee. The one who does not have reporting line is the BOSS

### Validation :

* Company should exist
* Should follow model validation (User and Policy)
* Only process csv file
* Reject if no csv file uploaded


### Definition of done :

* If valid file upload user should see success messages.
* If the user tries to upload a non-CSV file, it should say  that file is invalid
* If some of the information provided within CSV file not valid (violating model validation)
* It should be able to handle hundreds of thousands of records.
* Users should be able to find if any invalid data was entered.
---

## Objective :

* Develop the feature based on the requirement/user story
* Follow best practices (coding style, security etc)
* Ensure code readability and design for scalable, robust application.
* Write test RSpec for unit and integration. Both for existing and new features.
* You may install gems that you need
* You may change the current implementation if needed or make assumptions you want.
* Readme








# Solutions!

Hi! As per the problem above mention. I purpose the solution. solution have some assumptions which i discussed in the Assumption section. This problem is Dockerize app. so, you have to install [Docker](https://www.docker.com) on your system. To download follow the detail link  [install docker](https://www.docker.com/products/docker-desktop) .


# Install docker-compose

After install the docker you have to install [docker-compose](https://docs.docker.com/compose/install/)  follow the link and install docker-compose.

## Run the Dockerize App

After install docker-compose you have to build and up the dockerize app.
To build the dockerize app follow the command

    docker-compose build
This command build the dockerize app.  
**Note: if command gives error try by removing all gem history from Gemfile.lock.**

After build the app we have to up the app todo that we need to run command
`docker-compose up`

or

    docker-compose up -d
to run in deamonize enviournment.

next step is to create the database, migrations and the seed file to run

    docker-compose exec app rails db:create && db:migrate && db:seed
this will create database with migrations.

now to run test case run command

    docker-compose exec app rspec
in case it gives error run the create and migration command with specify RAILS_ENV as test and run it again the above command it will work.

To login as Admin credential email-  admin@niri.com and password- asdfasdf

after login you will see link [bulk employees](http://localhost:3000/admin/employees/new) click on it and perform the features.

## Gem used
for testing gem used are gem 'capybara',  'selenium-webdriver',  'factory_bot_rails', 'simplecov', 'faker', 'database_cleaner', 'rails-controller-testing'
for all enviournment gem 'sidekiq',  'pg',  'devise'.

## Database used
Used database are Postgresql and redis.

## Assumptions

Some assumptions are made by me to achieve the task are:-

 1. if reported_by employee is not user exist in the database than it should create that employee in the system.
 2. if policy field is empty than previous associated policy to that employee be deleed for that employee.
 3. to login as admin I have use single-table-inheritance.
 4. on succesfully imported message show like this for example successfully imported employees imported: 3 and not imported 2
 5. where not imported repersent the not imported employees for above case is 2  and imported employees as 3 and total records are 5.
 6. if employee already there in the company than it will not create the employee. Infact, it will update that employee record.
 7. csv file upload are store in csv_uploads name column which are in the company table.
 8. to save the file we use activestorage.   

## Any Query

Feel free to contact if have any query my email id is nirankarsingh247@gmail.com
