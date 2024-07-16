import 'init_export.dart';
final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBuzz();
  final firebase = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final firestorage = FirebaseStorage.instance;
  final googleSignIn = GoogleSignIn();
  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator
    ..registerLazySingleton(() => firebase)
    ..registerLazySingleton(() => firestore)
    ..registerLazySingleton(() => firestorage)
    ..registerLazySingleton(() => googleSignIn)
    ..registerLazySingleton(() => sharedPreferences)

    // core
    ..registerLazySingleton(
      () => AppUserCubit(
        firebaseAuth: serviceLocator<FirebaseAuth>(),
        googleSignIn: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ThemeCubit(serviceLocator()),
    );
}

void _initAuth() {
  // Databases
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        firebaseAuth: serviceLocator<FirebaseAuth>(),
        firestore: serviceLocator<FirebaseFirestore>(),
        googleSignIn: serviceLocator<GoogleSignIn>(),
      ),
    )

    // Repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    );

// Usecases
  serviceLocator
    ..registerFactory(
      () => UserSignUp(serviceLocator()),
    )
    ..registerFactory(
      () => UserSignIn(serviceLocator()),
    )
    ..registerFactory(
      () => CurrentUser(serviceLocator()),
    )
    ..registerFactory(
      () => UserGoogleSignin(serviceLocator()),
    )
    ..

// Bloc
        registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator<UserSignUp>(),
        userSignIn: serviceLocator<UserSignIn>(),
        currentUser: serviceLocator<CurrentUser>(),
        appUserCubit: serviceLocator<AppUserCubit>(),
        googleSignin: serviceLocator<UserGoogleSignin>(),
      ),
    );
}

void _initBuzz() {
  // Databases
  serviceLocator
    ..registerFactory<BuzzRemoteDataSource>(
      () => BuzzRemoteDataSourceImpl(
        firebaseFirestore: serviceLocator<FirebaseFirestore>(),
        firebaseStorage: serviceLocator<FirebaseStorage>(),
      ),
    )

    // Repositories
    ..registerFactory<BuzzRepository>(
      () => BuzzRepositoryImpl(serviceLocator()),
    )

    // Usecase
    ..registerFactory(
      () => UploadBuzzUsecase(serviceLocator()),
    )

    // Bloc
    ..registerLazySingleton(
      () => BuzzBloc(uploadBuzz: serviceLocator<UploadBuzzUsecase>()),
    );
}
