describe Author do
    it 'has a name' do
        # Setup
        author = Author.new
        author.name = "Hemingway"  # writer

        # Expectation
        expect(author.name).to eq("Hemingway") # reader
    end

    context 'has many stories' do   # describing authors with stories
        describe '#stories' do  # describe the instance method stories
            it 'has an empty array of stories when initialized' do
                author = Author.new

                expect(author.stories).to match_array([])   # brand new authors should have no stories
            end
        end

        describe '#add_story' do 
            it 'can add a story instance onto it' do
                author = Author.new
                story = Story.new

                author.add_story(story)

                expect(author.stories).to include(story)
            end

            it 'only allows stories to be added onto it' do
                author = Author.new
                story = "Old Man and the Sea"

                expect{author.add_story(story)}.to raise_error(AssociationTypeMismatchError) 
                # Error when associating anything other than a Story instance.
            end
        end

        describe '#bibliography' do
            it 'returns an array of all the stories names of an author' do
                author = Author.new

                story_1 = Story.new.tap{|s| s.name = "Old Man and the Sea"}
                story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"}
                story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

                author.add_story(story_1)
                author.add_story(story_2)
                author.add_story(story_3)

                expect(author.bibliography).to match_array(["Old Man and the Sea", "The Sun Also Rises", "For Whom the Bell Tolls"])
            end
        end
    end
end 

# interface is calling an object through a method - interested in the interfaces experience
# not interested how stories are stored but how the interfaces work and behaves.
# when I press the on button I expect it to work.
# the details are abtracted away in external interfaces of the object.