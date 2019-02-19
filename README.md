# README

## Setup:
- [Ruby](https://www.ruby-lang.org/en/downloads/) version 2.6.1. Optional for Mac or Linux: [RVM](http://rvm.io/) [rbenv](https://github.com/rbenv/rbenv)
- SQlite or other relational database
- [git](https://git-scm.com/downloads)

1. Clone repo: `git clone git@github.com:wesleystam/uva.git`
2. cd uva
3. bundle install
4. bin/rake db:setup
5. bin/rails s
6. open http://localhost:3000

## Assignment
- Add a page were the questions can be answered.
- Save the given answer and explanation
- Update the progress on pia_questionnaire after an answer has been saved/updated
- Find the next question based upon the given answer

## Extra
- When opening the pia_questionnaire show the next question where the user let off
