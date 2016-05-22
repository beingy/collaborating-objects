class Author
    attr_accessor :name

    def initialize
        @stories = []
    end

    def stories
        @stories
    end

    def add_story(story)  # interface on top of push to add story to @story array
        raise AssociationTypeMismatchError, "#{story.class} received, Story expected." if !story.is_a?(Story)
        @stories << story
    end

    def bibliography
        self.stories.collect {|s| s.name} #  You need all stories to be instances of Story because they must respond to #name to work.
        # @stories.collect(&.name) # => Symbol to Proc
    end



end