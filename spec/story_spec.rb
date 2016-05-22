describe Story do
    let(:story){Story.new.tap {|s| s.name = "The Old Man and the Sea"}}
    let(:author){Author.new.tap {|a| a.name = "Ernest Hemingway"}}
    let(:category){Category.new.tap{|c| c.name = "Fiction"}}


    it 'has a name' do
        # Setup
        story = Story.new
        story.name = "Old Man and the Sea"  # writer

        # Expectation
        expect(story.name).to eq("Old Man and the Sea") # reader
    end

    context 'with an author' do
        describe '#author=' do
            it 'can set an author' do
                story.author = author
                expect(story.author).to eq(author)
            end

            it 'throws an error if you assign anything besides an instance of Author' do
                expect{story.author = "Ernest Hemingway"}.to raise_error(AssociationTypeMismatchError)
            end

            it 'reciprocates the story into the authors stories collection' do
                story.author = author

                expect(author.stories).to include(story)
            end
        end
    end

    context 'with an category' do
        describe '#category=' do
            it 'can set an category' do
                story.category = category
                expect(story.category).to eq(category)
            end

            it 'throws an error if you assign anything besides an instance of Category' do
                expect{story.category = "Fiction"}.to raise_error(AssociationTypeMismatchError)
            end

            it 'reciprocates the story into the categories stories collection' do
                story.category = category

                expect(category.stories).to include(story)
            end
        end
    end
end 