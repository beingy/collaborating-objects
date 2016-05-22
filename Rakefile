require_relative './config/environment'

puts 'Welcome to Authors, Stories, and Categories...'

def reload!
    load './lib/author'
    load './lib/category'
    load './lib/story'
end

desc "A console"
task :console do
    Pry.start
end

