//
//  AppStrings.swift
//  BodyFit360
//

import Foundation

enum BFAlertMessages {
    static let pleaseEnterEmail = "Please enter email address"
    static let pleaseEnterPassword = "Please enter password"
    static let pleaseEnterValidEmail = "Please enter valid email address"
    static let passwordComplexity =
        "Please enter minimum 8 characters at least 1 Uppercase, 1 Lowercase, 1 Number and 1 Special Character"
}

enum BFAlertUI {
    static let appTitle = "BodyFit360"
    static let ok = "Okay"
}

// MARK: - Email confirmation (reset password flow)

enum BFEmailConfirmationStrings {
    static let emailVisitMessageFormat = "Please go to your %@ email to reset your password."
    static let emailVisitMessageWarning =
        "It could take a few minutes to appear, and be sure to check your spam and prmotional folders - just in case!"
}

enum BFStoryboardIDs {
    static let resetPasswordVC = "ResetPasswordVC"
    static let homeVC = "HomeVC"
    static let emailConfirmationVC = "EmailConfirmationVC"
    static let confirmPasswordVC = "ConfirmPasswordVC"
    static let chooseBodyMapVC = "ChooseBodyMapVC"
    static let settingsVC = "SettingsVC"
    static let signUpVC = "SignUpVC"
    static let loginVC = "LoginVC"
    static let continueWithEmailVC = "ContinueWithEmailVC"
    static let popupViewController = "PopupViewController"
    static let privacyVC = "PrivacyVC"
    static let feedbackVC = "FeedbackVC"
    static let emailEditingVC = "EmailEditingVC"
    static let passwordChangeVC = "PasswordChangeVC"
    static let otpVerificationVC = "OtpVerificationVC"
}

enum BFStoryboardNames {
    static let main = "Main"
    static let popup = "PopupViewStoryboard"
}

enum BFReuseIdentifiers {
    static let settingTableCell = "SettingTableCell"
}

// MARK: - Settings (General list & navigation)

enum BFSettingsStrings {
    static let aboutUs = "About Us"
    static let privacyPolicy = "Privacy policy"
    static let feedback = "Feedback"
    static let logOut = "Log out"
    static let deleteAccount = "Delete account"
}

// MARK: - Logout / delete confirmation popup

enum BFPopupStrings {
    static let logoutTitle = "Log out"
    static let deleteAccountTitle = "Delete account"
    static let logoutMessage = "Are you sure you want to logout?"
    static let deleteAccountMessage =
        "Are you sure you want to delete your account? The action cannot be undone and will remove all your data from our system."
    static let fatalErrorMissingPopupType = "Please add PopupType"
}

// MARK: - Privacy & About Us content

enum BFPrivacyStrings {
    static let privacyBoldPrefix = "Last updated XX, XXX, 2024"
    static let privacyFullText =
        "Last updated XX, XXX, 2024 \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"

    static let aboutUsBoldPrefix = "Hey there,"
    static let aboutUsFullText =
        "Hey there, \n\nI’m Ramanjeet, the founder of BodyFit360. I created this app after struggling with recurring muscle pain at night and realizing the need for an intuitive and easy way to address it. BodyFit360 helps you locate muscle pain and provides targeted stretching exercises. \n\nAll exercises in this app have been reviewed by licensed physical therapists, ensuring they’re safe and effective. While we prioritize your well-being, we always recommend consulting a medical professional if you experience persistent pain to avoid further injuries. \n\nThank you for choosing BodyFit360! \n\nYour support motivates me to keep improving the app, so don’t hesitate to reach out with your honest feedback if you have time. \n\nCheers, \n\n:-)"
}

// MARK: - Feedback form

enum BFFeedbackStrings {
    static let placeholder = "Type here..."
    static let chooseHelpPrompt = "Choose how we can help"
    static let bugReport = "Bug Report"
    static let featureRequest = "Feature Request"
    static let designUX = "Design & UX"
    static let other = "Other"
    static let menuTitle = ""
}
