describe Category do
    it 'has a name' do
        # Setup
        category = Category.new
        category.name = "Fiction"  # writer

        # Expectation
        expect(category.name).to eq("Fiction") # reader
    end
end 