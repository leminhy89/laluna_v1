class User < ApplicationRecord
    attr_accessor :password
    belongs_to :role
    
    before_create :encrypted_password
    
    def has_password?(submitted_password)
        encrypt_password == encrypt(submitted_password)
    end
    
    def self.authenticate(name, submitted_password)
        user = User.find_by(name: name)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end
    
    private
        def encrypted_password
            #generate a unique salt if it is a new user
            self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?
            
            #encrypt the password and store that in the ecrypted_password field
            self.encrypt_password = encrypt(password)
        end
        
        def encrypt(pass)
            Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
        end
end
