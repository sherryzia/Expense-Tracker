/// All static UI strings live here; widgets never inline strings.
abstract final class AppStrings {
  static const String appName = 'FinWise';

  // Common
  static const String retry = 'Retry';
  static const String loading = 'Loading…';

  // Splash
  static const String splashTitle = 'FinWise';

  // Auth / Landing
  static const String authTitle = 'finWise';
  static const String authSubtitle =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.';
  static const String authLogin = 'Log In';
  static const String authSignUp = 'Sign Up';
  static const String authForgotPassword = 'Forgot Password?';
  static const String authPlaceholder = 'This action is coming soon.';

  // Login
  static const String loginWelcome = 'Welcome';
  static const String loginUsernameLabel = 'Username Or Email';
  static const String loginPasswordLabel = 'Password';
  static const String loginHintEmail = 'example@example.com';
  static const String loginUseFingerprint = 'Use Fingerprint To Access';
  static const String loginOrSignUpWith = 'or sign up with';
  static const String loginNoAccount = "Don't have an account? ";
  static const String loginSignUpLink = 'Sign Up';

  // Create account
  static const String createAccountTitle = 'Create Account';
  static const String createFullNameLabel = 'Full Name';
  static const String createEmailLabel = 'Email';
  static const String createMobileLabel = 'Mobile Number';
  static const String createDobLabel = 'Date Of Birth';
  static const String createPasswordLabel = 'Password';
  static const String createConfirmPasswordLabel = 'Confirm Password';
  static const String createHintFullName = 'e.g. John Doe';
  static const String createHintMobile = '+ 123 456 789';
  static const String createHintDob = 'DD / MM / YYYY';
  static const String createTermsPrefix = 'By continuing, you agree to ';
  static const String createTermsOfUse = 'Terms of Use';
  static const String createTermsAnd = ' and ';
  static const String createPrivacyPolicy = 'Privacy Policy.';
  static const String createAlreadyAccount = 'Already have an account? ';
  static const String createLoginLink = 'Log In';

  // Forgot password
  static const String forgotPasswordTitle = 'Forgot Password';
  static const String forgotHeading = 'Reset Password?';
  static const String forgotDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.';
  static const String forgotEmailLabel = 'Enter Email Address';
  static const String forgotNextStep = 'Next Step';

  // Security pin
  static const String securityPinTitle = 'Security Pin';
  static const String securityPinEnterPin = 'Enter Security Pin';
  static const String securityPinAccept = 'Accept';
  static const String securityPinSendAgain = 'Send Again';

  // New password
  static const String newPasswordTitle = 'New Password';
  static const String newPasswordLabel = 'New Password';
  static const String newPasswordConfirmLabel = 'Confirm New Password';
  static const String newPasswordChange = 'Change Password';

  // Password success
  static const String passwordChangedSuccess =
      'Password Has Been Changed Successfully';
  static const String passwordChangedContinue = 'Continue To Log In';

  // Security fingerprint
  static const String fingerprintTitle = 'Security Fingerprint';
  static const String fingerprintUseFingerprint = 'Use Fingerprint To Access';
  static const String fingerprintDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.';
  static const String fingerprintUseTouchId = 'Use Touch Id';
  static const String fingerprintStandardCodes =
      "I'd prefer standard codes.";

  // Dashboard
  static const String dashboardGreeting = 'Hi, Welcome Back';
  static const String dashboardGoodMorning = 'Good Morning';
  static const String dashboardTotalBalance = 'Total Balance';
  static const String dashboardTotalExpense = 'Total Expense';
  static const String dashboardBalanceAmount = '\$7,783.00';
  static const String dashboardExpenseAmount = '-\$1,187.40';
  static const String dashboardBudgetPercent = '30%';
  static const String dashboardBudgetTarget = '\$20,000.00';
  static const String dashboardInsight = '30% Of Your Expenses, Looks Good.';
  static const String dashboardSavingsOnGoals = 'Savings On Goals';
  static const String dashboardRevenueLastWeek = 'Revenue Last Week';
  static const String dashboardRevenueValue = '\$4,000.00';
  static const String dashboardFoodLastWeek = 'Food Last Week';
  static const String dashboardFoodValue = '-\$100.00';
  static const String dashboardDaily = 'Daily';
  static const String dashboardWeekly = 'Weekly';
  static const String dashboardMonthly = 'Monthly';
  static const String dashboardTransactionHistory = 'Transaction History';
  static const String dashboardTxSalary = 'Salary';
  static const String dashboardTxSalaryTime = '18:27 - April 30';
  static const String dashboardTxSalaryCategory = 'Monthly';
  static const String dashboardTxSalaryAmount = '+\$4,000.00';
  static const String dashboardTxGroceries = 'Groceries';
  static const String dashboardTxGroceriesTime = '17:00 - April 24';
  static const String dashboardTxGroceriesCategory = 'Pantry';
  static const String dashboardTxGroceriesAmount = '-\$100.00';
  static const String dashboardTxRent = 'Rent';
  static const String dashboardTxRentTime = '8:30 - April 15';
  static const String dashboardTxRentCategory = 'Rent';
  static const String dashboardTxRentAmount = '-\$674.40';
  static const String dashboardTxTransport = 'Transport';
  static const String dashboardTxTransportTime = '9:30 - April 08';
  static const String dashboardTxTransportCategory = 'Fuel';
  static const String dashboardTxTransportAmount = '-\$4.13';

  // Account balance details
  static const String accountBalanceTitle = 'Account Balance';
  static const String accountIncomeLabel = 'Income';
  static const String accountIncomeValue = '\$4,000.00';
  static const String accountExpenseLabel = 'Expense';
  static const String accountExpenseValue = '\$1,187.40';
  static const String transactionsTitle = 'Transactions';
  static const String transactionsSeeAll = 'See all';

  // Notifications
  static const String notificationTitle = 'Notification';
  static const String notificationToday = 'Today';
  static const String notificationYesterday = 'Yesterday';
  static const String notificationThisWeekend = 'This Weekend';
  static const String notificationReminderTitle = 'Reminder!';
  static const String notificationReminderDescription =
      'Set up your automatic savings to meet your savings goal...';
  static const String notificationNewUpdateTitle = 'New Update';
  static const String notificationTransactionsTitle = 'Transactions';
  static const String notificationTransactionsDescription =
      'A new transaction has been registered';
  static const String notificationTagsGroceries =
      'Groceries | Pantry | -\$100.00';
  static const String notificationTagsDinner = 'Food | Dinner | -\$70.40';
  static const String notificationExpenseRecordTitle = 'Expense Record';
  static const String notificationExpenseRecordDescription =
      'We recommend that you be more attentive to your finances.';
  static const String notificationTime = '17:00 - April 24';

  // Onboarding
  static const String onboardingSkip = 'Skip';
  static const String onboardingNext = 'Next';
  static const String onboardingGetStarted = 'Get Started';
  static const List<String> onboardingTitles = <String>[
    'Track Every Penny',
    'Smart Budgets',
    'Achieve Your Goals',
  ];
  static const List<String> onboardingSubtitles = <String>[
    'Turn everyday spending into clear insights with effortless expense tracking.',
    'Set budgets that fit your life and stay in control of your money.',
    'Visualize your progress and reach your financial goals even faster.',
  ];

  // Validation
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Enter a valid email address';

  // Home
  static const String homeTitle = 'Overview';
  static const String homeBalanceLabel = 'Current balance';
  static const String homeEmptyMessage = 'No expenses recorded yet.';
  static const String homeLoadError =
      'Something went wrong while loading your expenses.';
}