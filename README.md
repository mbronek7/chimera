# Chimera Workshops
[![Ruby](https://img.shields.io/badge/ruby-2.7.2-brightgreen.svg)](https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/)
[![Rails](https://img.shields.io/badge/rails-6.0.3.4-brightgreen.svg)](https://rubygems.org/gems/rails/versions/6.0.3.4)

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Development](#development)
* [API Documentation](#api-documentation)


<!-- GETTING STARTED -->
## Getting Started
To get a local copy up and running follow these simple example steps.

<!-- PREREQUISITES -->
### Prerequisites

- **Docker & Docker Compose**
  - https://docs.docker.com/compose/install/

<!-- INSTALLATION -->
### Installation

1. Clone the repo
```sh
git clone https://github.com/mbronek7/chimera
```
2. From your project directory build docker iamge of app
```sh
docker-compose build
```
3. Create database and run migrations
```sh
docker-compose run app rails db:create db:migrate
```
4. Add a new rule to your hosts configuration to point `chimera.localhost` to your localhost IP
```sh
sudo -- sh -c 'echo "# For Chimera Workshops \n127.0.0.1  chimera.localhost" >> /etc/hosts'
```
  This step is optional, you still would be able to visti app at `http://localhost`,
  also you can add it manually via vim or similar editor in `/etc/hosts`

5. Run app
```sh
docker-compose up
```
<!-- DEVELOPMENT -->
## Development
List of usefull commands
1. Build new image
```sh
docker-compose build
```
2. Boot application
```sh
docker-compose up
```
3. Manually run standard
```sh
docker-compose run app rake standard
```
4. Run migrations
```sh
docker-compose run app rails db:migrate
```
5. Manually run annotate
```sh
docker-compose run app bundle exec annotate --models
```
<!-- API DOCUMENTATION -->
## API DOCUMENTATION
