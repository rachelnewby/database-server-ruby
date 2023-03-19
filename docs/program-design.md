# Database server design recipe

## The Problem 
Write a program that runs a server that is accessible on http://localhost:4000/. When your server receives a request on http://localhost:4000/set?somekey=somevalue it should store the passed key and value in memory. When it receives a request on http://localhost:4000/get?key=somekey it should return the value stored at somekey. Store the data in memory, not in a database, but bear in mind that you will later need to add a database to this code.

### User Stories
As a user, 
When I enter a key and a value to the url, 
The data is saved locally.

As a user, 
When I enter a key to the url, 
The value is returned.

As a product owner, 
I would like the program to be extendable to add a database. 

### Edge cases
* Check if the key entered exists (for set method), if it does, a 500 error is returned
* Check if the key entered exists (for get method), if it doesn't, a 500 error is returned

## The Design
   ┌───────────────────┐             ┌────────────────────┐
   │      APP          │             │       DataRepo     │
   │                   ├────────────►│ data = {}          │
   │Routes             │             │                    │
   │                   │             │                    │
   │  get '/get'       │             │ find()             │
   │  post '/set'      │             │                    │
   │                   │◄────────────┤ set()              │
   └───────────────────┘             └────────────────────┘

### DataRepo Class

#### The Interface

```ruby
class DataRepo
  def initialize
    @data = {}
  end

  def find(key) # Key is a string value
    # Returns value of key
  end

  def set(key, value) # Both arguments are strings
    # Returns true if OK and false if a problem
  end
end
```
#### Examples as Tests

```ruby
# 1. Finds data
data = DataRepo.new 
data.find('try') => nil 

# 2. Sets key value to data
data = DataRepo.new 
data.set("first", "hello")
data.find("first") => "hello"

```
### Routes Design

#### Route Signatures
* HTTP: GET
* path: /get

* HTTP: POST
* path: /set
