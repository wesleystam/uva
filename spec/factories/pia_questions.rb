FactoryBot.define do
  factory :pia_question do
    question { "MyText" }
    description { "MyText" }
    yes_explanation { "MyText" }
    no_explanation { "MyText" }
    yes_measure { "MyText" }
    no_measure { "MyText" }
    position { 1 }
    yes_to_end { false }
    no_to_end { false }
    yes_next_question { nil }
    no_next_question { nil }
  end
end
