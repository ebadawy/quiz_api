# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new({user_name: "s", password: "s" ,  role: "student" })
u2 = User.new({user_name: "d", password: "d" ,  role: "doc"})
u3 = User.new({user_name: "u1", password: "u1", role: "student" })
u4 = User.new({user_name: "u2", password: "u2", role: "student" })
u5 = User.new({user_name: "u3", password: "u3", role: "student" })
u6 = User.new({user_name: "u4", password: "u4", role: "student" })

q1 = Quiz.new({name: "Quiz1", deadline:"1/1/2015", time_limit: "00:15", quiz_mark: 5 , published: true})
q2 = Quiz.new({name: "Quiz2", deadline:"1/2/2015", time_limit: "00:18", quiz_mark: 9 , published: true})
q3 = Quiz.new({name: "Quiz3", deadline:"1/3/2015", time_limit: "00:10", quiz_mark: 5 , published: true})
q4 = Quiz.new({name: "Quiz4", deadline:"1/4/2015", time_limit: "00:20", quiz_mark: 12, published: true})
q5 = Quiz.new({name: "Quiz5", deadline:"1/5/2015", time_limit: "00:07", quiz_mark: 9 , published: true})

u1.quizzes << q1
u1.quizzes << q2
u1.quizzes << q3
u1.quizzes << q4
u1.quizzes << q5

u2.quizzes << q1
u2.quizzes << q2
u2.quizzes << q3
u2.quizzes << q4
u2.quizzes << q5

u3.quizzes << q1
u3.quizzes << q2
u3.quizzes << q3
u3.quizzes << q4
u3.quizzes << q5

u4.quizzes << q1
u4.quizzes << q2
u4.quizzes << q3
u4.quizzes << q4
u4.quizzes << q5

u5.quizzes << q1
u5.quizzes << q2
u5.quizzes << q3
u5.quizzes << q4
u5.quizzes << q5

u6.quizzes << q1
u6.quizzes << q2
u6.quizzes << q3
u6.quizzes << q4
u6.quizzes << q5

question1 = Question.new({name: "question1", right_answer: "c1"})
question2 = Question.new({name: "question2", right_answer: "c2"})
question3 = Question.new({name: "question3", right_answer: "c3"})
question4 = Question.new({name: "question4", right_answer: "c4"})
question5 = Question.new({name: "question5", right_answer: "c5"})

c1 = Choice.new({text: "c1"})
c2 = Choice.new({text: "c2"})
c3 = Choice.new({text: "c3"})
c4 = Choice.new({text: "c4"})
c5 = Choice.new({text: "c5"})

question1.choices << c1
question2.choices << c2
question3.choices << c3
question4.choices << c4
question5.choices << c5

q1.questions << question1
q1.questions << question2
q1.questions << question3
q1.questions << question4
q1.questions << question5

q2.questions << question1
q2.questions << question2
q2.questions << question3
q2.questions << question4
q2.questions << question5

q3.questions << question1
q3.questions << question2
q3.questions << question3
q3.questions << question4
q3.questions << question5

q4.questions << question1
q4.questions << question2
q4.questions << question3
q4.questions << question4
q4.questions << question5

q5.questions << question1
q5.questions << question2
q5.questions << question3
q5.questions << question4
q5.questions << question5

c1.save
c2.save
c3.save
c4.save
c5.save

q1.save
q2.save
q3.save
q4.save
q5.save

r1  = Result.new({result: 5 , user_id: u1.id, quiz_id: q1.id, published: true})
r2  = Result.new({result: 9 , user_id: u1.id, quiz_id: q2.id, published: true})
r3  = Result.new({result: 5 , user_id: u1.id, quiz_id: q3.id, published: true})
r4  = Result.new({result: 12, user_id: u1.id, quiz_id: q4.id, published: true})
r5  = Result.new({result: 9 , user_id: u1.id, quiz_id: q5.id, published: true})

r11 = Result.new({result: 4, user_id: u3.id, quiz_id: q1.id, published: true})
r12 = Result.new({result: 3, user_id: u3.id, quiz_id: q2.id, published: true})
r13 = Result.new({result: 2, user_id: u3.id, quiz_id: q3.id, published: true})
r14 = Result.new({result: 3, user_id: u3.id, quiz_id: q4.id, published: true})
r15 = Result.new({result: 3, user_id: u3.id, quiz_id: q5.id, published: true})

r16 = Result.new({result: 5 , user_id: u4.id, quiz_id: q1.id, published: true})
r17 = Result.new({result: 6 , user_id: u4.id, quiz_id: q2.id, published: true})
r18 = Result.new({result: 5 , user_id: u4.id, quiz_id: q3.id, published: true})
r19 = Result.new({result: 10, user_id: u4.id, quiz_id: q4.id, published: true})
r20 = Result.new({result: 7 , user_id: u4.id, quiz_id: q5.id, published: true})

r21 = Result.new({result: 2, user_id: u5.id, quiz_id: q1.id, published: true})
r22 = Result.new({result: 5, user_id: u5.id, quiz_id: q2.id, published: true})
r23 = Result.new({result: 5, user_id: u5.id, quiz_id: q3.id, published: true})
r24 = Result.new({result: 6, user_id: u5.id, quiz_id: q4.id, published: true})
r25 = Result.new({result: 6, user_id: u5.id, quiz_id: q5.id, published: true})

r26 = Result.new({result: 2 , user_id: u6.id, quiz_id: q1.id, published: true})
r27 = Result.new({result: 6 , user_id: u6.id, quiz_id: q2.id, published: true})
r28 = Result.new({result: 4 , user_id: u6.id, quiz_id: q3.id, published: true})
r29 = Result.new({result: 10, user_id: u6.id, quiz_id: q4.id, published: true})
r30 = Result.new({result: 5 , user_id: u6.id, quiz_id: q5.id, published: true})

u1.save
u2.save
u3.save
u4.save
u5.save
u6.save

q1.save
q2.save
q3.save
q4.save
q5.save

r1.save
r2.save
r3.save
r4.save
r5.save

r11.save
r12.save
r13.save
r14.save
r15.save

r16.save
r17.save
r18.save
r19.save
r20.save

r21.save
r22.save
r23.save
r24.save
r25.save

r26.save
r27.save
r28.save
r29.save
r30.save