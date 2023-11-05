# Acme API

Backend for Acme API


RubyOnRails version **7.1.1**
Ruby version **3.1.1**

## Instructions:

1) After cloning the project, run the following lines to create and setup the database
```
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare
```

2) How to run the test suite
```
bundle exec rspec spec/requests/product_spec.rb
```


# About questions:
1) I added the Interactor gem; it is useful when there is business logic that might grow and get messy. The idea is to have the same input/output structure to have the same structure along the whole project.
   I also moved and changed the count_hits method to an interactor and added a column(current_count) to the Hit model. It is better to have a counter in the database that can be updated every time the user hits the API. The logs can be saved in a Redis document or use another log strategy so we do not overload the database with this large amount of records.
   The current count will work for a month, which means that at the beginning of the month, there should be a new Hit record with the current_count in zero.
   It makes it way easier to count and improve performance every time the user hits the API.
2) To be honest I'm not sure about the issue in Australia, I would need more information from the logs and code to know what is going on.
3) There is a need to use 'Time.zone' to get the time in the zone where the user hits the API. It can be configured in the ApplicationController so it gets applied in every request.
4) I added 4 gems that are very helpful when a team is growing. I also recommend working with GitHub resources like issues reporting to have a list of the technical debt. Add a 'definition of done' policy is ideal to understand when a task  is done and avoid adding unnecessary technical debt. 

## Style and Clean code
- Rubycritic: Used for covering code smells, code duplication, and ABC metrics. I've used RubyCritics in all of my projects, and it works really well in small and large teams by setting a score that every PR should meet before being merged.
```
bundle exec rubycritic
```

- Rubocop: Used for code styling. There are many configurations to cover whatever the team wants to cover. Also, there are ways to avoid applying some rules that can be too rigorous in big repositories.
 ```
bundle exec rubocop
```

- Bullet: Used to avoid n+1 queries and improve performance in queries like avoiding unnecessary eager loading or adding if needed. No command is needed; it will alert in case there are queries to improve by exceptions.

- Brakeman: Used for security vulnerabilities. 
```
bundle exec brakeman
```


