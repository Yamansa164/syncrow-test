import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/colors.dart';
import 'core/dependency_injection/injection_container.dart';
import 'core/handle_controller/handle_cubit.dart';
import 'core/router/app_router.dart';
import 'core/widgets/app_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final botToastBuilder = BotToastInit();
  runApp(MainApp(botToastBuilder: botToastBuilder));
}

class MainApp extends StatelessWidget {
  final TransitionBuilder? botToastBuilder;
  const MainApp({super.key, this.botToastBuilder});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HandleCubit>(create: (context) => HandleCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 933),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return SafeArea(
            top: false,
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                fontFamily: 'Cairo',
                scaffoldBackgroundColor: AppColors.background,
                primaryColor: AppColors.mainColor,
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(
                      secondary: AppColors.secondColor,
                      primary: AppColors.mainColor,
                    )
                    .copyWith(surface: Colors.white)
                    .copyWith(surfaceTint: Colors.white),
              ),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: botToastBuilder!(
                    context,
                    GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: BlocListener<HandleCubit, HandleState>(
                        listenWhen: (previous, current) => previous != current,
                        listener: (context, state) {
                          if (state is ErrorState) {
                            const toastDuration = Duration(seconds: 3);
                            BotToast.showCustomNotification(
                              align: Alignment.bottomCenter,
                              duration: toastDuration,
                              animationDuration: const Duration(
                                milliseconds: 300,
                              ),
                              toastBuilder: (cancelFunc) {
                                return AppNotification(
                                  message: state.message,
                                  onClose: cancelFunc,
                                  duration: toastDuration,
                                );
                              },
                            );
                          }
                        },
                        child: child ?? const SizedBox.shrink(),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
