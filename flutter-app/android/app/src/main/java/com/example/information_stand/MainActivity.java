package com.example.information_stand;

import androidx.annotation.NonNull;

import com.yandex.mapkit.MapKitFactory;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        MapKitFactory.setApiKey("c6d02bed-39a3-4df2-ae0a-ff304b435dd7");
        super.configureFlutterEngine(flutterEngine);
    }
}
