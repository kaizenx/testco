[![Circle CI](https://circleci.com/gh/vltlabs/theco.png?circle-token=38cb6796676aa4704a2edbdb87f37f3ffb752b48)](https://circleci.com/gh/vltlabs/theco)
[![Code Climate](https://codeclimate.com/repos/53df02f669568027d901e804/badges/adb4e89a83997cc09146/gpa.svg)](https://codeclimate.com/repos/53df02f669568027d901e804/feed)
[![Test Coverage](https://codeclimate.com/repos/53df02f669568027d901e804/badges/adb4e89a83997cc09146/coverage.svg)](https://codeclimate.com/repos/53df02f669568027d901e804/feed)
### Quick Start

1. Clone the repo

  ```
  $ git clone https://github.com/vltlabs/theco.git
  ```

2. Copy necessary files

  ```
  $ cd supahands
  $ cp config/database.example.yml config/database.yml
  $ cp .env.sample .env
  ```

3. Create database and migration

  ```
  $ rake db:create
  $ rake db:migrate
  ```

4. Start the server

  ```
  $ rails s
  ```

5. Spring Application Preloader
  Spring is a Rails application preloader. It speeds up development by keeping your application running in the background so you don't need to boot it every time you run a test, rake task or migration.

  Running rake tasks:

  ```
  $ bin/rake test:models
  ```

  Running a Rails command:

  ```
  $ bin/rails console
  ```

  Spring introspection:

  ```
  $ bin/spring status
  ```

  Spring is running:

  ```
   1182 spring server | my_app | started 29 mins ago
   3656 spring app    | my_app | started 23 secs ago | test mode
   3746 spring app    | my_app | started 10 secs ago | development mode
  ```

6. Branching

  Master is the active development branch
  All local development should be done in the appropriately named branches:

  ```
  feature/<branch_name> for substantial new features or functions
  enhance/<branch_name> for minor feature or function enhancement
  bugfix/<branch_name> for bug fixes
  ```

  WARNING: Do not merge your changes directly into your local master branch and push to GitHub!!!

  If you are done developing the component you are working on, push your branch to GitHub by doing:

  ```
  $ git push -u origin <branch_name>
  ```

  After that, visit the GitHub repository page and open a pull request to the master branch.

  TIP: "head branch" is the branch you want to merge, "base branch" is the branch you want to merge your new commits into.

  Give your pull request a title and describe what you are trying to achieve with your code. The branch or release manager will review your code and take the next appropriate actions.

  Even if you are working alone, it is a must to follow this GitHub workflow

7. Deployment

  Deployment is done using heroku_san gem. Check it out at https://github.com/fastestforward/heroku_san.

  Staging:

  ```
  $ bin/rake staging heroku:deploy
  ```

  Production will only deploy based on staging latest tag:

  ```
  $ bin/rake production heroku:deploy
  ```
