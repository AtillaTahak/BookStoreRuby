
<!-- Please update value in the {}  -->

<h1 align="center">{BookStore}</h1>

<div align="center">
  <h3>
    <a href="#">
      BookStore
    </a>
    <span> | </span>
    <a href="https://gitlab.com/atillataha/bookstore/">
      Solution
    </a>
    <span> | </span>
    <a href="#">
      Challenge
    </a>
  </h3>
</div>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Overview](#overview)
  - [Built With](#built-with)
- [How to use](#how-to-use)
- [Swagger](#swagger)
- [How To Use with Docker](#how-to-use-with-docker)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- OVERVIEW -->

## Overview

![screenshot](screenshot1.png)

This project focuses on the backend development of a Book Store application using Rails and PostgreSQL.

	- This application simulate book shopping
	- You can create User
	- You can create Books
	- You can create order with user
	- You can add cart

Database:

 	- The application utilizes PostgreSQL to efficiently store book

### Built With

<!-- This section should list any major frameworks that you built your project using. Here are a few examples.-->

- [Ruby](https://www.ruby-lang.org)
- [Ruby On Rails](https://rubyonrails.org)
- [Postgresql](https://www.postgresql.org)
- [Docker](https://www.docker.com)
- [Swagger](https://swagger.io)

## How To Use

<!-- Example: -->

To clone and run this application, you'll need [Git](https://git-scm.com) and [Ruby](https://www.ruby-lang.org) also you need [Ruby On Rails](https://rubyonrails.org) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://gitlab.com/atillataha/bookstore/

$ cd bookstore

$ bundle install

$ rails db:create

$ rails db:migrate

$ rails server

```

After start server with rails you can create user with [Swagger](http://127.0.0.1:3000/api-docs/index.html) and you got token example:

```json
	{
		"user": {
			"id": 4,
			"username": "example3"
		},
		"token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0fQ.UWmeJanF_bZekt-gYXhQRDAAv9XpRsQtKzLKnIN2ue4"
	}
```
You need to copy token value. This token is required for authorized transactions. When you need to request api for authorized example request:

```bash
curl -X 'GET' \
  'http://127.0.0.1:3000/v1/cart_items/list' \
  -H 'accept: application/json' \
  -H 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0fQ.UWmeJanF_bZekt-gYXhQRDAAv9XpRsQtKzLKnIN2ue4'
```

## Swagger

Access the API documentation using Swagger UI:

http://127.0.0.1:3000/api-docs/index.html



## How To Use with Docker

<!-- Example: -->

To clone and run this application, you'll need [Git](https://git-scm.com) and you'll need [Git](https://git-scm.com) and [Ruby](https://www.ruby-lang.org) also you need [Ruby On Rails](https://rubyonrails.org) installed on your computer. Also you need use for [Docker](https://www.docker.com/#build) From your command line:

```bash
# Clone this repository
$ git clone https://gitlab.com/atillataha/bookstore/

$ cd bookstore

$ cp .env.example .env

$ docker compose up --build
```
Access the API documentation using Swagger UI:

http://127.0.0.1:3000/api-docs/index.html

Access pgAdmin for managing PostgreSQL databases:

http://localhost:5050

## Acknowledgements

<!-- This section should list any articles or add-ons/plugins that helps you to complete the project. This is optional but it will help you in the future. For example -->



## Contact

- GitHub: [@AtillaTahak](https://github.com/AtillaTahak)
- Twitter: [@AtillaTahaa](https://twitter.com/AtillaTahaa)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/atillatahakordugum)
- Blog: [Blog](https://atillataha.blogspot.com)
- Youtube: [YouTube](https://www.youtube.com/channel/UCmoD0x4Z9vdG2PCsI5p8FYg)
- Portfolio: [Portfolio](atillataha.netlify.app)
