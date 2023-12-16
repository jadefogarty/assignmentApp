# frozen_string_literal: true

require 'faker'

4.times do
  Assignment.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    module: Faker::Educator.subject,
    lecturer: Faker::Name.name,
    due_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    weighting: Faker::Number.between(from: 1, to: 100).to_f,
    status: ['Not Started', 'Started', 'Completed'].sample,
    submitted: Faker::Boolean.boolean
  )
end
