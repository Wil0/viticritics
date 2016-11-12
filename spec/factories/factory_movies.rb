FactoryGirl.define do
  factory :movie do

    factory :example_movie do
      avatar File.new("spec/ruby.png")
      title 'Superman'
      rating 5
      review 'A superhero from another planet'
    end

    factory :another_movie do
      avatar File.new("spec/ruby.png")
      title 'Robocop'
      rating 6
      review 'Could have been better'
    end
  end
end
