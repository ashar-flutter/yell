import 'package:yell/core/barrel/barrel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    AuthHelper.setupAutoScroll(
      focusNode: _nameFocusNode,
      scrollController: _scrollController,
      context: context,
    );
    AuthHelper.setupAutoScroll(
      focusNode: _emailFocusNode,
      scrollController: _scrollController,
      context: context,
    );
    AuthHelper.setupAutoScroll(
      focusNode: _passwordFocusNode,
      scrollController: _scrollController,
      context: context,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ToastMessage.show(
            context: context,
            message: state.message,
            isError: true,
          );
        }
        if (state is AuthSuccess) {
          ToastMessage.show(
            context: context,
            message: 'Account created successfully!',
            isError: false,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SignUpHeader(),
                  SignUpNameField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    onSubmitted: () {
                      AuthHelper.moveToNextField(context, _emailFocusNode);
                    },
                  ),
                  SignUpEmailField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onSubmitted: () {
                      AuthHelper.moveToNextField(context, _passwordFocusNode);
                    },
                  ),
                  SignUpPasswordField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  if (state is AuthLoading)
                    CircularProgressIndicator(
                    )
                  else
                    AMAuthButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (AuthValidation.validateSignUp(
                          context: context,
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        )) {
                          context.read<AuthBloc>().add(
                            SignUpEvent(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  SignUpFooter(
                    onSignInTap: () {
                      AuthNavigation.navigateToLogin(context);
                    },
                  ),
                  SignUpDivider(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
