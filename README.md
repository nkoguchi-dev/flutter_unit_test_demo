# flutter_unit_test_demo

FlutterのUnitTestを作る時に、テストの方法が分からずあれこれ調べたやり方を自分なりにメモしておくProjectです。

## Navigator.pop()の値をテストする方法

Widgetから遷移元に返している値をテストしたい時に利用しました。


[test/presentation/screen_return_value_test.dart](https://github.com/nkoguchi-dev/flutter_unit_test_demo/blob/main/test/presentation/screen_return_value/screen_return_value_screen_test.dart)

MaterialApp作成時にMockしたNavigatorObserverを設定して、テスト対象のWidgetがpopした際に呼ばれるrouteObserver.didPopの第一引数のrouteをcaptureしてテストを行います。
理屈は分かるのですが、そこをMockしようとか考えつかないよなぁ。