require "test_helper"
require "fixtures/sample_mail"

class MailFormTest < ActiveSupport::TestCase
    test "sample mail has name and email as attrivutes" do
        sample = SampleMail.new
        sample.name = 'User'
        assert_equal 'User', sample.name
        sample.email = 'some@email.com'
        assert_equal 'some@email.com', sample.email
    end

    test "sample email can clear attributes using clear_ prefix" do
        sample = SampleMail.new
        sample.name = 'User'
        sample.email = 'some@email.com'
        
        sample.clear_name
        sample.clear_email

        assert_nil sample.name
        assert_nil sample.email
    end

    test "sample mail can ask if attribute present or not" do
        sample = SampleMail.new
        assert !sample.name?

        sample.name = 'user'
        assert sample.name?

        sample.email = ""
        assert !sample.email?
    end

    setup do 
        ActionMailer::Base.deliveries.clear
    end

    test "delivers en email with attributes" do
        email = "a@b.c"
        sample = SampleMail.new
        sample.email = email
        sample.deliver

        assert_equal 1, ActionMailer::Base.deliveries.size
        mail = ActionMailer::Base.deliveries.last

        assert_equal [email], mail.from
        assert_match "Email: #{email}", mail.body.encoded
    end
end