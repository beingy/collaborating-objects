class Story
    attr_accessor :name
    attr_reader :author # Belongs_to an author interface

    def author=(author) # Belongs_to an author interface
        raise AssociationTypeMismatchError, "#{author.class} received, Author expected." if !author.is_a?(Author)
        @author = author
        author.add_story(self) unless author.stories.include?(self) # creates infinite loop - when shouldn't this happen
    end

    attr_reader :category # Belongs_to an category interface

    def category=(category) # Belongs_to an category interface
        raise AssociationTypeMismatchError, "#{category.class} received, Category expected." if !category.is_a?(Category)
        @category = category
        category.add_story(self) unless category.stories.include?(self)
    end

end