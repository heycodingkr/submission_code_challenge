# Submission for Test Omisego


## Prerequisites

- install the elixir[https://elixir-lang.org/install.html]
- install the erlang[http://erlang.org/doc/installation_guide/INSTALL.html]
- install the phoenix framework[https://hexdocs.pm/phoenix/installation.html#content]


## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

## To check the submission

  Run Phoenix server first, then you can check them with url below

  * Part 1 [`localhost:4000/api/test`](http://localhost:4000/api/test)
   To solve this problem, I used a recursive pattern. the core function located in json_controller [`/lib/hello_web/json_controller.ex`](/lib/hello_web/json_controller.ex)

  * Part 2 [`localhost:4000`](http://localhost:4000)

   I implemented this part by files below

   1. [`/lib/hello_web/controllers/page_controller.ex`](/../lib/hello_web/controllers/page_controller.ex) - Render an `index.html` and pass the parameters from request.

   2. [`/lib/hello.ex`](/lib/hello.ex) - Declared the function `repos({word, page, per_page})` to call the github api.

   3. [`/lib/hello_web/github_resultstream.ex`](/lib/hello_web/github_resultstream.ex) - Github api implemented part. Call a api with url and manipulate body and header from github api.

   4. [`/lib/hello_web/views/page_view.ex`](/lib/hello_web/views/page_view.ex) - implemented functions which are relative with template file
   5. [`/lib/hello_web/templates/page/index.html.eex](/lib/hello_web/templates/page/index.html.eex) - Index template for 10 by 10 table with pagination.

## Conclusion
 It was my first experience that i use the Elixir for application. As i think, Elixir is quite productive and fasnating programming langauge at all. Thank for your code challenge you made for me. It attracts me to Elixir world and also I could spent my time with fun of new knowledge in Elixir.
 BR Jason.
