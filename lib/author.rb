class Author
    attr_accessor :name

    def initialize # has_many stories interface
        @stories = [] 
    end

    def stories # has_many stories interface
        @stories.dup.freeze # all objects can be frozen - can not be modified
    end

    def add_story(story) # has_many stories interface
        raise AssociationTypeMismatchError, "#{story.class} received, Story expected." if !story.is_a?(Story)
        @stories << story
        story.author = self unless story.author = self # reciprocates
        self.stories
    end

    def categories # has_many categories through stories
        self.stories.collect {|s| s.category}.uniq
    end

    def bibliography
        self.stories.collect {|s| s.name} #  You need all stories to be instances of Story because they must respond to #name to work.
        # @stories.collect(&.name) # => Symbol to Proc
        # shouldn't reach into instance variable unless aboslutely neccessary
    end

end