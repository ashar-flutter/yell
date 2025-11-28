import 'package:flutter/material.dart';
import 'toast_message.dart';

class AuthValidation {
  static bool validateSignUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) {
    if (name.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please enter your full name',
        isError: true,
      );
      return false;
    }

    // Email validation
    if (email.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please enter your email',
        isError: true,
      );
      return false;
    }

    if (!email.contains('@') || !email.endsWith('.com')) {
      ToastMessage.show(
        context: context,
        message: 'Please enter a valid email address',
        isError: true,
      );
      return false;
    }

    if (password.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please enter your password',
        isError: true,
      );
      return false;
    }

    if (password.length < 8) {
      ToastMessage.show(
        context: context,
        message: 'Password must be at least 8 characters',
        isError: true,
      );
      return false;
    }

    return true;
  }

  static bool validateSignIn({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    if (email.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please enter your email',
        isError: true,
      );
      return false;
    }

    if (!email.contains('@') || !email.endsWith('.com')) {
      ToastMessage.show(
        context: context,
        message: 'Please enter a valid email address',
        isError: true,
      );
      return false;
    }

    if (password.isEmpty) {
      ToastMessage.show(
        context: context,
        message: 'Please enter your password',
        isError: true,
      );
      return false;
    }

    if (password.length < 8) {
      ToastMessage.show(
        context: context,
        message: 'Password must be at least 8 characters',
        isError: true,
      );
      return false;
    }

    return true;
  }
}
