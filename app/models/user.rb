class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email andress" }
    validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:password_digest] }
    validates :is_admin, inclusion: { in: [true, false] }

    before_save :downcase_email

    private

    def downcase_email
        self.email = email.downcase.strip if email.present?
    end

end
