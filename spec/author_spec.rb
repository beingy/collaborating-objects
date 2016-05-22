describe Author do
    let(:author){Author.new.tap {|a| a.name = "Ernest Hemingway"}}
    let(:story){Story.new.tap {|s| s.name = "The Old Man and the Sea"}}

    it 'has a name' do
        # # Setup
        # author = Author.new
        # author.name = "Ernest Hemingway"  # writer

        # Expectation
        expect(author.name).to eq("Ernest Hemingway") # reader
    end

    context 'has many stories' do   # describing authors with stories
        describe '#stories' do  # describe the instance method stories
            it 'has an empty array of stories when initialized' do
                # author = Author.new 

                expect(author.stories).to match_array([])   # brand new authors should have no stories
            end

            it 'returns a frozen copy of the stories array' do
                # author = Author.new
                expect(author.stories).to be_frozen
            end
        end

        describe '#add_story' do 
            it 'can add a story instance onto it' do
                # author = Author.new
                # story = Story.new

                author.add_story(story)

                expect(author.stories).to include(story)
            end

            it "reciprocates assigning this author as the story's author" do
                author.add_story(story)

                expect(story.author).to eq(author)
            end

            it 'only allows stories to be added onto it' do
                author.add_story(story)

                expect(story.author).to eq(author)
            end

            # it 'only allows stories to be added onto it' do
            #     # author = Author.new
            #     story = "The Old Man and the Sea"

            #     expect{author.add_story(story)}.to raise_error(AssociationTypeMismatchError) 
            #     # Error when associating anything other than a Story instance.
            # end

        end

        describe '#bibliography' do
            it 'returns an array of all the stories names of an author' do
                author = Author.new

                story_1 = Story.new.tap{|s| s.name = "The Old Man and the Sea"}
                story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"}
                story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

                author.add_story(story_1)
                author.add_story(story_2)
                author.add_story(story_3)

                expect(author.bibliography).to match_array(["The Old Man and the Sea", "The Sun Also Rises", "For Whom the Bell Tolls"])
            end
        end
    end

    context 'has many categories through stories' do
        it 'returns the collection of unqiue category instances based on the stories' do
            fiction = Category.new{|c| c.name = "Fiction"}
            non_fiction = Category.new{|c| c.name = "Non Fiction"}

            story_1 = Story.new.tap{|s| s.name = "The Old Man and the Sea"; s.category = fiction}
            story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"; s.category = fiction}
            story_3 = Story.new.tap{|s| s.name = "A Moveable Feast"; s.category = non_fiction}

            author.add_story(story_1)
            author.add_story(story_2)
            author.add_story(story_3)

            expect(author.categories).to match_array([fiction, non_fiction])
        end
    end
end 

# interface is calling an object through a method - interested in the interfaces experience
# not interested how stories are stored but how the interfaces work and behaves.
# when I press the on button I expect it to work.
# the details are abtracted away in external interfaces of the object.