import 'package:yell/core/barrel/barrel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
    _emailController.dispose();
    _passwordController.dispose();
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
            message: 'Login successful!',
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
                  LoginHeader(),
                  LoginEmailField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onSubmitted: () {
                      AuthHelper.moveToNextField(context, _passwordFocusNode);
                    },
                  ),
                  LoginPasswordField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  if (state is AuthLoading)
                    CircularProgressIndicator()
                  else
                    AMAuthButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (AuthValidation.validateSignIn(
                          context: context,
                          email: _emailController.text,
                          password: _passwordController.text,
                        )) {
                          context.read<AuthBloc>().add(
                            SignInEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  LoginFooter(
                    onSignUpTap: () {
                      AuthNavigation.navigateToSignUp(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
