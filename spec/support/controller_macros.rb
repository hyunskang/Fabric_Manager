# module ControllerMacros
  
#   # takes in a member_objects, authenticates it using a stub, and returns it
#   def sign_in(user = double('user'))
#     if user.nil?
#       allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
#       allow(controller).to receive(:current_user).and_return(nil)
#     else
#       allow(request.env['warden']).to receive(:authenticate!).and_return(user)
#       allow(controller).to receive(:current_user).and_return(user)
#     end
#     user
#   end

#   # current types are :user, and :admin
#   # member_attributes is a hash of specific attrs. ex. {:email => "hello@world.com"}
#   def make_a_member(type = :user, member_attributes = nil)
#     @request.env["devise.mapping"] = Devise.mappings[type]
#     FactoryGirl.create(type,member_attributes)
#   end

#   def make_many_members(type = :user, count = 5)
#     @request.env["devise.mapping"] = Devise.mappings[type]
#     user_list = []
#     member_attributes = Hash.new
#     (0..count-1).each do |i|
#       member_attributes[:email] = "user" + i.to_s + "@hostname.com"
#       user_list << FactoryGirl.create(type, member_attributes)
#     end
#     user_list
#   end

#   def make_a_form(form_name = "Form")
#     form = FactoryGirl.create(:form, {:form_name => form_name})
#   end

#   def make_many_forms(count = 3)
#     form_list = []
#     (0..count-1).each do |i|
#       form_list[i] = make_a_form
#     end
#     form_list
#   end

#   def make_forms_for_app_type(type)
#     type = FactoryGirl.create(:application_type,{:app_type => type})
#     type.forms << make_many_forms
#     type
#   end

#   def make_form_with_questions(q_number = 3)
#     form = make_a_form
#     (0..q_number-1).each do |i|
#       form.form_questions.create({:question => "General Question", :question_type => "textbox"})
#     end
#     form
#   end

#   def login(type = :user, attributes = nil)
#     before(:each) do
#       obj = sign_in make_a_member(type, attributes)
#       if type == :user
#         @user = obj
#       elsif type == :admin
#         @admin = obj
#       end
#     end
#   end

#   def make_question_answer_tree
#     before :each do
#       @q1 = Questionnaire.create(:question => "hello world")
#       @q2 = Questionnaire.create(:question => "how are you?")
#       @a1a = Answers.create(:ans => "hi", :questionnaire_id => @q1.id, :leads_to => @q2.id)
#       @a1b = Answers.create(:ans => "hello", :questionnaire_id => @q1.id)
#       @a2 = Answers.create(:ans => "I am world", :questionnaire_id => @q2.id)
#       @q2.parent_id = @a1a.id
#       @q2.save
#     end
#   end

#   def make_test_form_questions
#     before :each do
#       @test_form = make_a_form
#       @message = FormQuestion.create({:question => 'Describe potato.', 
#                                       :form_type => "test",
#                                       :question_type => :message, 
#                                       :order => 1})
#       @statement = FormQuestion.create({:question => 'Green Onion!', 
#                                       :form_type => "test",
#                                       :question_type => :statement, 
#                                       :order => 2})
#       @radio_button = FormQuestion.create({:question => 'Which fruit you like the most?', 
#                                       :form_type => "test",
#                                       :question_type => :radio_button, 
#                                       :order => 3})
#       @testbox = FormQuestion.create({:question => 'How much is the papaya?', 
#                                       :form_type => "test",
#                                       :question_type => :textbox, 
#                                       :order => 4})
#       @test_form.form_questions << @message
#       @test_form.form_questions << @statement
#       @test_form.form_questions << @radio_button
#       @test_form.form_questions << @testbox
#     end
#   end

# end