import 'package:flutter/material.dart';

class LoginMessages with ChangeNotifier {
  LoginMessages({
    this.userHint,
    this.passwordHint = defaultPasswordHint,
    this.confirmPasswordHint = defaultConfirmPasswordHint,
    this.forgotPasswordButton = defaultForgotPasswordButton,
    this.loginButton = defaultLoginButton,
    this.signupButton = defaultSignupButton,
    this.recoverPasswordButton = defaultRecoverPasswordButton,
    this.recoverPasswordIntro = defaultRecoverPasswordIntro,
    this.recoverPasswordDescription = defaultRecoverPasswordDescription,
    this.goBackButton = defaultGoBackButton,
    this.confirmPasswordError = defaultConfirmPasswordError,
    this.recoverPasswordSuccess = defaultRecoverPasswordSuccess,
    this.flushbarTitleError = defaultflushbarTitleError,
    this.flushbarTitleSuccess = defaultflushbarTitleSuccess,
    this.signUpSuccess = defaultSignUpSuccess,
    this.providersTitleFirst = defaultProvidersTitleFirst,
    this.providersTitleSecond = defaultProvidersTitleSecond,
    this.additionalSignUpSubmitButton = defaultAdditionalSignUpSubmitButton,
    this.additionalSignUpFormDescription =
        defaultAdditionalSignUpFormDescription,
    this.confirmSignupIntro = defaultConfirmSignupIntro,
    this.confirmationCodeHint = defaultConfirmationCodeHint,
    this.confirmationCodeValidationError =
        defaultConfirmationCodeValidationError,
    this.resendCodeButton = defaultResendCodeButton,
    this.resendCodeSuccess = defaultResendCodeSuccess,
    this.confirmSignupButton = defaultConfirmSignupButton,
    this.confirmSignupSuccess = defaultConfirmSignupSuccess,
    this.confirmRecoverIntro = defaultConfirmRecoverIntro,
    this.recoveryCodeHint = defaultRecoveryCodeHint,
    this.recoveryCodeValidationError = defaultRecoveryCodeValidationError,
    this.setPasswordButton = defaultSetPasswordButton,
    this.confirmRecoverSuccess = defaultConfirmRecoverSuccess,
    this.recoverCodePasswordDescription = defaultRecoverCodePasswordDescription,
  });
  static const defaultPasswordHint = 'Parola';
  static const defaultConfirmPasswordHint = 'Parola (Tekrar)';
  static const defaultForgotPasswordButton = 'Şifremi Unuttum?';
  static const defaultLoginButton = 'Giriş Yap';
  static const defaultSignupButton = 'Kayıt Ol';
  static const defaultRecoverPasswordButton = 'Gönder';
  static const defaultRecoverPasswordIntro = 'Parolanızı buradan sıfırlayın';
  static const defaultRecoverPasswordDescription =
      'Geçici şifrenizi bu telefon numarasına göndereceğiz.';
  static const defaultRecoverCodePasswordDescription =
      'Telefonunuza bir şifre kurtarma kodu göndereceğiz.';
  static const defaultGoBackButton = 'Geri';
  static const defaultConfirmPasswordError = 'Parola eşleşmiyor!';
  static const defaultRecoverPasswordSuccess = 'Bir mesaj gönderildi';
  static const defaultflushbarTitleSuccess = 'Başarılı';
  static const defaultflushbarTitleError = 'Hata';
  static const defaultSignUpSuccess = 'Bir aktivasyon mesajı gönderildi';
  static const defaultProvidersTitleFirst = 'ile giriş yapabilir veya';
  static const defaultProvidersTitleSecond = 'veya';
  static const defaultAdditionalSignUpSubmitButton = 'Gönder';
  static const defaultAdditionalSignUpFormDescription =
      'Kaydı tamamlamak için lütfen bu formu doldurun';

  static const defaultConfirmRecoverIntro =
      'Yeni bir parola belirlemek için kurtarma kodu mesaj olarak gönderildi.';
  static const defaultRecoveryCodeHint = 'Kurtarma Kodu';
  static const defaultRecoveryCodeValidationError = 'Kurtarma kodu boş';
  static const defaultSetPasswordButton = 'Parola Belirle';
  static const defaultConfirmRecoverSuccess = 'Parola kurtarıldı.';
  static const defaultConfirmSignupIntro =
      'Telefonunuza bir onay kodu gönderildi. '
      'Hesabınızı onaylamak için lütfen kodu girin.';
  static const defaultConfirmationCodeHint = 'Onay Kodu';
  static const defaultConfirmationCodeValidationError = 'Onay kodu boş';
  static const defaultResendCodeButton = 'Kodu Tekrar Gönder';
  static const defaultResendCodeSuccess = 'Yeni bir mesaj gönderildi.';
  static const defaultConfirmSignupButton = 'ONAYLA';
  static const defaultConfirmSignupSuccess = 'Hesap doğrulandı.';

  /// Hint text of the userHint [TextField]
  /// Default will be selected based on userType
  final String? userHint;

  /// Additional signup form button's label
  final String additionalSignUpSubmitButton;

  /// Description in the additional signup form
  final String additionalSignUpFormDescription;

  /// Hint text of the password [TextField]
  final String passwordHint;

  /// Hint text of the confirm password [TextField]
  final String confirmPasswordHint;

  /// Forgot password button's label
  final String forgotPasswordButton;

  /// Login button's label
  final String loginButton;

  /// Signup button's label
  final String signupButton;

  /// Recover password button's label
  final String recoverPasswordButton;

  /// Intro in password recovery form
  final String recoverPasswordIntro;

  /// Description in password recovery form, shown when the onConfirmRecover
  /// callback is not provided
  final String recoverPasswordDescription;

  /// Go back button's label. Go back button is used to go back to to
  /// login/signup form from the recover password form
  final String goBackButton;

  /// The error message to show when the confirm password not match with the
  /// original password
  final String confirmPasswordError;

  /// The success message to show after submitting recover password
  final String recoverPasswordSuccess;

  /// Title on top of Flushbar on errors
  final String flushbarTitleError;

  /// Title on top of Flushbar on successes
  final String flushbarTitleSuccess;

  /// The success message to show after signing up
  final String signUpSuccess;

  /// The string shown above the Providers buttons
  final String providersTitleFirst;

  /// The string shown above the Providers icons
  final String providersTitleSecond;

  /// The intro text for the confirm recover password card
  final String confirmRecoverIntro;

  /// Hint text of the password recovery code [TextField]
  final String recoveryCodeHint;

  /// The validation error message  to show for an empty recovery code
  final String recoveryCodeValidationError;

  /// Set password button's label for password recovery confirmation
  final String setPasswordButton;

  /// The success message to show after confirming recovered password
  final String confirmRecoverSuccess;

  /// The intro text for the confirm signup card
  final String confirmSignupIntro;

  /// Hint text of the confirmation code for confirming signup
  final String confirmationCodeHint;

  /// The validation error message to show for an empty confirmation code
  final String confirmationCodeValidationError;

  /// Resend code button's label
  final String resendCodeButton;

  /// The success message to show after resending confirmation code
  final String resendCodeSuccess;

  /// Confirm signup button's label
  final String confirmSignupButton;

  /// The success message to show after confirming signup
  final String confirmSignupSuccess;

  /// Description in password recovery form, shown when the onConfirmRecover
  /// callback is provided
  final String recoverCodePasswordDescription;
}
