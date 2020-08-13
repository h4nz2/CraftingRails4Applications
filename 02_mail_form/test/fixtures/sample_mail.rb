class SampleMail < MailForm::Base
    attributes :name, :email

    def headers
        {to: 'recipient@domain.com', from: self.email}
    end
end