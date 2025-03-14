//uygulamamızın içerisinde supported locals gibi şeyleri burdan yöneteceğiz
//manager yani

import 'package:flutter/material.dart';

//lazy kullanıyoruz çünkü çağırıldığı anda değer dolduruyor.
//bu bir singleton sınıfsa bundan yalnızca bir değer alınabilmeli.
//bu yüzden bir değer dağa üretememesi için init fonksiyonu yazılığ kapatılmalı
//normalde Eager da yapabilirdik value değeri burda dönerdi.
//fakat çağrıldığı anda değer set olsun istediğimizden bunu kullanıyoruz.

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  late final Locale
  _deviceLocale; // 'late' ile tanımlandıysa, hemen başlatılması lazım

  LanguageManager._init() {
    _deviceLocale = const Locale("en", "US"); // İlk değer ataması yapılıyor
  }

  final Locale enLocale = const Locale("en", "US");

  List<Locale> get supportedLocals => [enLocale];

  Locale get deviceLocale => _deviceLocale;
}
