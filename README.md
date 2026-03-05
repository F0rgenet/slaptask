<div align="center">

# SLAPTASK

[![Build Status](https://img.shields.io/github/actions/workflow/status/f0rgenet/slaptask/dart.yml?style=for-the-badge&color=171717&labelColor=0F0F0F&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSIjZTg1NTJkIiBzdHJva2U9IiNlODU1MmQiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cGF0aCBkPSJtMTUgMTItOS4zNzMgOS4zNzNhMSAxIDAgMCAxLTMuMDAxLTNMMTIgOSIvPjxwYXRoIGQ9Im0xOCAxNSA0LTQiLz48cGF0aCBkPSJtMjEuNSAxMS41LTEuOTE0LTEuOTE0QTIgMiAwIDAgMSAxOSA4LjE3MnYtLjM0NGEyIDIgMCAwIDAtLjU4Ni0xLjQxNGwtMS42NTctMS42NTdBNiA2IDAgMCAwIDEyLjUxNiAzSDlsMS4yNDMgMS4yNDNBNiA2IDAgMCAxIDEyIDguNDg1VjEwbDIgMmgxLjE3MmEyIDIgMCAwIDEgMS40MTQuNTg2TDE4LjUgMTQuNSIvPjwvc3ZnPg%3D%3D)](https://github.com/f0rgenet/slaptask/actions)
[![Platform](https://img.shields.io/badge/Platform-Android-171717?style=for-the-badge&labelColor=0F0F0F&color=171717&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNlODU1MmQiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cmVjdCB3aWR0aD0iMTQiIGhlaWdodD0iMjAiIHg9IjUiIHk9IjIiIHJ4PSIyIiByeT0iMiIvPjxwYXRoIGQ9Ik0xMiAxOGguMDEiLz48L3N2Zz4%3D)](https://flutter.dev)
[![Flutter](https://img.shields.io/badge/Flutter-Dart_3.3+-171717?style=for-the-badge&labelColor=0F0F0F&logo=flutter&logoColor=E8552D)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-171717?style=for-the-badge&labelColor=0F0F0F&color=171717&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSIjZTg1NTJkIiBzdHJva2U9IiNlODU1MmQiIHN0cm9rZS13aWR0aD0iMi4zIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjxwYXRoIGQ9Ik0xMiAzdjE4Ii8%2BPHBhdGggZD0ibTE5IDggMyA4YTUgNSAwIDAgMS02IDB6VjciLz48cGF0aCBkPSJNMyA3aDFhMTcgMTcgMCAwIDAgOC0yIDE3IDE3IDAgMCAwIDggMmgxIi8%2BPHBhdGggZD0ibTUgOCAzIDhhNSA1IDAgMCAxLTYgMHpWNyIvPjxwYXRoIGQ9Ik03IDIxaDEwIi8%2BPC9zdmc%2B)](LICENSE)

**Агрессивный инструмент ежедневной отчетности на базе ИИ.**

Большинство таск-трекеров не работают, потому что заставляют планировать. SlapTask меняет парадигму. Вы задаете глобальные цели, система сама генерирует 5 жестких задач каждое утро.

Философия проста: **Execution over Planning.**

</div>

## <span style="color:#E8552D">Обзор</span>

SlapTask использует LLM (ProxyAPI) для анализа долгосрочных целей и истории выполнения задач. Генерация расписания происходит автоматически в фоновом режиме через определённые промежутки времени.

Если задачи провалены — сложность адаптируется, но давление сохраняется. Если выполнены — система повышает планку. Никаких оправданий.

<div align="center">
  <img src="assets/screenshots/onboarding.png" width="33%" alt="Onboarding" style="border-radius: 10px; margin: 5px;" />
  <img src="assets/screenshots/home.png" width="33%" alt="Main Screen" style="border-radius: 10px; margin: 5px;" />
  <img src="assets/screenshots/settings.png" width="33%" alt="Settings" style="border-radius: 10px; margin: 5px;" />
</div>

## <span style="color:#E8552D">Технический Стек</span>

Приложение построено на **Flutter** с использованием строгой архитектуры и разделения слоев.

| Компонент | Технология | Описание |
| :--- | :--- | :--- |
| **State Management** | `Bloc` + `Freezed` | Строго типизированное управление состоянием. |
| **Architecture** | Clean Architecture | Разделение на UI, BLOC и Data слои. |
| **Backend / AI** | ProxyAPI | Генерация задач и транскрибация голоса. |
| **Background** | `workmanager` | Гарантированное выполнение задач при убитом приложении. |
| **Local Storage** | `shared_preferences` | Local-first подход. Данные хранятся на устройстве. |
| **Audio** | `record` | Запись и кодирование аудио для голосового ввода целей. |

## <span style="color:#E8552D">Функциональность</span>

*   **ИИ генерация задач:** Превращение абстрактных целей ("хочу выучить английский") в конкретные действия ("прочитать 5 страниц книги на английском и записать новые слова").
*   **Строгая логика:** Нельзя перегенерировать задачи, если работа уже началась. Нельзя редактировать/удалять задачи.
*   **Фоновая работа:** Тихая генерация задач. Уведомление приходит только по готовности.
*   **Голосовой онбординг:** Запись целей голосом, транскрибация через API и автоматическое форматирование.
*   **Адаптивная история:** Промпт для LLM включает контекст успеха/неудач по целям.

## <span style="color:#E8552D">Архитектура</span>

```text
lib/
├── blocs/          # Бизнес-логика (BLoC) и Freezed классы событий/состояний
├── models/         # Сериализуемые модели данных
├── screens/        # Полноэкранные виджеты (страницы)
├── services/       # Работа с API, хранилищем и фоновыми задачами
├── widgets/        # Переиспользуемые UI компоненты
├── main.dart       # Точка входа и конфигурация Workmanager
└── theme.dart      # Константы дизайн-системы
```

## <span style="color:#E8552D">Установка и запуск</span>

Для запуска потребуется Flutter SDK и ключ ProxyAPI.

1.  **Клонирование репозитория:**
    ```bash
    git clone https://github.com/f0rgenet/slaptask.git
    cd slaptask
    ```

2.  **Установка зависимостей:**
    ```bash
    flutter pub get
    ```

3.  **Конфигурация окружения:**
    Создайте файл `.env` в корне проекта:
    ```env
    PROXYAPI_KEY=sk-your-api-key-here
    ```

4.  **Кодогенерация (Freezed):**
    Критически важный шаг для работы BLoC и моделей.
    ```bash
    dart run build_runner build -d
    ```

5.  **Запуск:**
    ```bash
    flutter run
    ```
