class Category
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
        story.category = self unless story.category = self # reciprocates
    end

    def authors # has_many authors through stories
        self.stories.collect {|s| s.author}.uniq
    end

end