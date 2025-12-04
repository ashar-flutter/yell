export 'package:flutter/material.dart';

// reUse
export 'package:yell/feature/screens/auth/navigation/auth_navigation.dart';
export 'package:yell/core/validators/auth_validation.dart';

// services
export '../../../core/service/auth/auth_service.dart';

// sign in
export 'package:yell/feature/screens/auth/reusable_components/sign_in/login_email_field.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_in/login_footer.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_in/login_password_field.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_in/login_header.dart';

// signUp
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_email_field.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_name_field.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_password_field.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_header.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_footer.dart';
export 'package:yell/feature/screens/auth/reusable_components/sign_up/signup_divider.dart';

// locals
export 'package:go_router/go_router.dart';
export 'package:yell/yell_router.dart';
export 'package:yell/feature/helper/auth_helper.dart';
export 'package:fluttertoast/fluttertoast.dart';

// firebase..
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

// widgets
export 'package:yell/feature/screens/onboarding/pages/onboard_button.dart';

// core uses
export '../../../../core/widgets/profile_dialog_widget.dart';

export '../../../../core/validators/toast_message.dart';
export 'package:yell/core/gap/am_gap.dart';
export '../color/am_color.dart';
export '../../../core/image/am_images.dart';
export 'package:yell/core/theme/am_theme.dart';
export '../../../../core/text/am_text.dart';
export '../../../core/routes/am_routes.dart';
export '../../../../core/widgets/am_auth_button.dart';
export '../../../../core/widgets/am_text_field.dart';

// screens
export 'package:yell/feature/screens/splash/splash_screen.dart';
export 'package:yell/feature/screens/onboarding/pages/onboard_one.dart';
export 'package:yell/feature/screens/onboarding/pages/onboard_two.dart';
export 'package:yell/feature/screens/onboarding/pages/onboard_three.dart';
export 'package:yell/feature/screens/onboarding/main_page.dart';
export "package:yell/feature/screens/auth/pages/login_page.dart";
export 'package:yell/feature/screens/auth/pages/sign_up_page.dart';
export 'package:yell/feature/screens/dashboard/provider/service_provider_dashboard.dart';
export 'package:yell/feature/screens/dashboard/consumer//service_consumer_dashboard.dart';


// animations
export 'package:yell/feature/animation/splash_animation.dart';
export 'package:yell/feature/animation/onboarding_animation.dart';

//packages..
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:image_picker/image_picker.dart';
export 'dart:io';

export "package:yell/feature/controller/auth/bloc/auth_bloc.dart";
export "package:yell/feature/controller/auth/bloc/auth_event.dart";
export "package:yell/feature/controller/auth/bloc/auth_state.dart";

//repositories
export 'package:yell/feature/repository/auth_repo/auth_repository.dart';
