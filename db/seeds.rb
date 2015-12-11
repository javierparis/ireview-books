# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reviewer.destroy_all
Book.destroy_all

Book.create! [
    {name:"Title 1", author:"Author 1"},
    {name:"Title 2", author:"Author 2"},
    {name:"Title 3", author:"Author 3"},
    {name:"Title 4", author:"Author 4"},
]

100.times { |index| Book.create! name: "Book#{index}", author: "Author#{index}"}

title1 = Book.find_by name: "Title 1"
title1.notes.create! [
    { title: "Wow", note: "Amazin book to learn titles"},
    { title: "Funny", note: "Doesn't put you to sleep"}
]

reviewers = Reviewer.create! [
    { name: "Joe", password: "abc123"},
    { name: "Jim", password: "123abc"}
]

Book.all.each do |book|
  book.reviewer = reviewers.sample
  book.save!
end