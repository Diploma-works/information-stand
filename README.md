# Информационный стенд

Для обеспечения полноценной работы мобильного-приложения необходим запуск трех модулей системы:
1. [База данных](#база-данных)
2. [Back-end](#back-end)
3. [Mobile App](#mobile-app)

## База данных

В качестве базы данных следует использовать PostgreSQL локально.

## Back-end

Для запуска модуля back-end необходима запущенная база данных, содержащая все необходимые таблицы и функцию из приложенных скриптов. Кроме того, необходимо добавить файл `application.properties` по пути `/src/main/resources`, который содержит:

```properties
# Пример содержимого application.properties
api.weather=http://api.openweathermap.org/data/2.5/forecast?q={city}&appid={appname}&units=metric&lang=ru&cnt=80
api.currency=https://www.cbr-xml-daily.ru/daily_json.js

spring.datasource.url=jdbc:postgresql://localhost:5432/${database-name}
spring.datasource.username=${username}
spring.datasource.password=${postgres}
spring.jpa.hibernate.ddl-auto=none

```

Описание переменных:
- database-name - название базы данных
- username - имя пользователя СУБД
- password - пароль СУБД
- appname - идентификатор приложения, в котоом будет использоваться API

##Mobile-app

- Убедитесь, что у вас установлен Flutter SDK.
    - Настройте базовый URL для API в файле `lib/consts.dart`.
    - Установите зависимости Flutter, выполнив команду:
        ```
        flutter pub get
        ```
    - Сгенерируйте код с помощью `build_runner`, выполните команду:
        ```
        flutter pub run build_runner build --delete-conflicting-outputs
        ```
    - Запустите приложение Flutter, выполните команду:
        ```
        flutter run
        ```