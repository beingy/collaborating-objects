# NOTES - collaborating-objects

##authors
    +has_many stories
    +has_many categories through stories

##stories
    +belongs_to an author
    +belongs_to a category

##categories
    +has_many stories
    +has_many authors, through stories

##modeling interfaces such as Ruby

```hemingway = Author.new
hemingway.stories 
# => [#<Story>, #<Story>, #<Story>]
# => an array of instances of Stories ```

##setup TDD
1. ```rspec --init```
2. setup ```*_spec.rb``` files in spec folder

+ make Console to play with files: Rakefile