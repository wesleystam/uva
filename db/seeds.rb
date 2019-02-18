pia_questions = 10.times.map do |x|
  PiaQuestion.create(
    question: Faker::Lorem.sentence,
    no_to_end: x == 0,
    description: Faker::Lorem.paragraph,
    yes_explanation: Faker::Lorem.paragraph,
    no_explanation: Faker::Lorem.paragraph,
    yes_measure: Faker::Lorem.paragraph,
    no_measure: Faker::Lorem.paragraph,
    position: x + 1
  )
end

pia_questions.shuffle.take(3).each do |pia_question|
  pia_question.update_attribute(
    rand(2) == 0 ? :yes_next_question : :no_next_question,
    PiaQuestion.where(PiaQuestion.arel_table[:position].gt(pia_question.position)).sample,
  )
end
