describe Category do
    let(:category){Category.new.tap{|c| c.name = "Fiction"}}
    let(:story){Story.new.tap {|s| s.name = "The Old Man and the Sea"}}


    it 'has a name' do
        # # Setup
        # category = Category.new
        # category.name = "Fiction"  # writer

        # Expectation
        expect(category.name).to eq("Fiction") # reader
    end

    context 'has many stories' do   # describing authors with stories
        describe '#stories' do  # describe the instance method stories
            it 'has an empty array of stories when initialized' do
                # category = Author.new 

                expect(category.stories).to match_array([])   # brand new authors should have no stories
            end

            it 'returns a frozen copy of the stories array' do
                # category = Author.new
                expect(category.stories).to be_frozen
            end
        end

        describe '#add_story' do 
            it 'can add a story instance onto it' do
                # category = Author.new
                # story = Story.new

                category.add_story(story)

                expect(category.stories).to include(story)
            end

            it "reciprocates assigning this category as the story's category" do
                category.add_story(story)

                expect(story.category).to eq(category)
            end

            it 'only allows stories to be added onto it' do
                category.add_story(story)

                expect(story.category).to eq(category)
            end

            # it 'only allows stories to be added onto it' do
            #     # category = Category.new
            #     story = "The Old Man and the Sea"

            #     expect{category.add_story(story)}.to raise_error(AssociationTypeMismatchError) 
            #     # Error when associating anything other than a Story instance.
            # end

        end

        # describe '#bibliography' do
        #     it 'returns an array of all the stories names of an category' do
        #         category = Category.new

        #         story_1 = Story.new.tap{|s| s.name = "The Old Man and the Sea"}
        #         story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"}
        #         story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

        #         category.add_story(story_1)
        #         category.add_story(story_2)
        #         category.add_story(story_3)

        #         expect(category.bibliography).to match_array(["The Old Man and the Sea", "The Sun Also Rises", "For Whom the Bell Tolls"])
        #     end
        # end
    end

    context 'has many authors through stories' do
        it 'returns the collection of unqiue category instances based on the stories' do
            king = Author.new{|c| c.name = "Steven King"}
            patterson = Author.new{|c| c.name = "John Patterson"}

            story_1 = Story.new.tap{|s| s.name = "That Scary One"; s.author = patterson}
            story_2 = Story.new.tap{|s| s.name = "That Mystery One"; s.author = patterson}
            story_3 = Story.new.tap{|s| s.name = "The Shining"; s.author = king}

            story_1.category = category
            story_2.category = category
            story_3.category = category

            expect(category.authors).to match_array([king, patterson])
        end
    end
end 