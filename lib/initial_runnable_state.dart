library initial_runnable_state;

import 'package:flutter/material.dart';

/// This mixin is for running procedure on first build() time of State<T>.
/// Usage:
///
/// 1. If you have below widget, named `TopPage` and `TopState`.
///
/// ```top_page.dart
/// class TopPage extends StatefulWidget {
///   @override
///   State<StatefulWidget> createState() => TopPageState();
/// }
///
/// class TopPageState extends State<TopPage> {
///
///   @override
///   Widget build() {
///     ...
///   }
/// }
///
/// ```
///
/// 2. Add override method `runOnInitialBuild()` to the `TopPageState`.
///    Then, you have to write some code to this method.
///
/// ```top_page.dart
///
/// class TopPageState extends State<TopPage> {
///
///   @override
///   void runOnInitialBuild() {
///     bloc.blabla(); // Example
///   }
///
///   @override
///   Widget build() {
///     ...
///   }
/// }
///
mixin InitialRunnableState<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runOnInitialBuild();
    });
  }

  /// This method run procedure on timing when State's first build time.
  void runOnInitialBuild();
}
