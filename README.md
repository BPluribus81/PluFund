# PluribusFund

The best crowdsourcing platform for Washington D.C.

![](https://www.codeship.io/projects/0f01fc60-3eaf-0131-59eb-66aa51309ecf/status)

## Setup Development Environment

1. Clone the project to your machine:

		$ git clone git@github.com:BPluribus81/PluFund.git

1. Create the config/database.yml

    ```yaml
    development:
      adapter: postgresql
      encoding: unicode
      database: pluribusfund_dev
      pool: 5
      username: postgres
      password:
      host: localhost

    test:
      adapter: postgresql
      encoding: unicode
      database: pluribusfund_test
      pool: 5
      username: postgres
      password:
      host: localhost
    ```

1. Setup the database

    Create the database:

		$ rake db:create

    Load the structure.sql into the new database:

		$ psql -U postgres pluribusfund_dev < db/structure.sql

1. Install [Librarian-Chef](https://github.com/applicationsonline/librarian-chef)

		$ gem install librarian-chef

1. Install cookbooks:

		$ librarian-chef install

1. Run Vagrant

		$ vagrant up



