### generate Admin
admin = User.new(
  {
    email: 'admin@admin.com',
    password: 'asdasd123123',
    password_confirmation: 'asdasd123123'
  }
)
admin.account = Account.new account_type: Account.account_types[:admin]
admin.skip_confirmation!
admin.save
### end generate Admin

### generate Underwriters
first_underwriter = User.new(
  {
    email: 'first_underwriter@underwriter.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
first_underwriter.account = Account.new account_type: Account.account_types[:underwriter]
first_underwriter.skip_confirmation!
first_underwriter.save

second_underwriter = User.new(
  {
    email: 'second_underwriter@underwriter.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
second_underwriter.account = Account.new account_type: Account.account_types[:underwriter]
second_underwriter.skip_confirmation!
second_underwriter.save
### end generate Underwriters


### generate Supports
first_support = User.new(
  {
    email: 'first_support@support.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
first_support.account = Account.new account_type: Account.account_types[:support]
first_support.skip_confirmation!
first_support.save

second_support = User.new(
  {
    email: 'second_support@support.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
second_support.account = Account.new account_type: Account.account_types[:support]
second_support.skip_confirmation!
second_support.save
### end generate Supports


### generate Borrowers
first_borrower = User.new(
  {
    email: 'first_borrower@borrower.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
first_borrower.account = Account.new account_type: Account.account_types[:borrower]
first_borrower.credit_score = CreditScore.new score: Random.rand, status: CreditScore.statuses[:approved]
first_borrower.skip_confirmation!
first_borrower.save

second_borrower = User.new(
  {
    email: 'second_borrower@borrower.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
second_borrower.account = Account.new account_type: Account.account_types[:borrower]
second_borrower.credit_score = CreditScore.new score: Random.rand, status: CreditScore.statuses[:approved]
second_borrower.skip_confirmation!
second_borrower.save
### end generate Borrowers


### generate Investors
first_investor = User.new(
  {
    email: 'first_investor@investor.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
first_investor.account = Account.new account_type: Account.account_types[:investor]
first_investor.skip_confirmation!
first_investor.save

second_investor = User.new(
  {
    email: 'second_investor@investor.com',
    password: 'asdasd123123',
    password: 'asdasd123123'
  }
)
second_investor.account = Account.new account_type: Account.account_types[:investor]
second_investor.skip_confirmation!
second_investor.save
### end generate Investors
