package com.strangerweather.easydnd;

import android.app.AlarmManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.provider.Settings;
import android.view.View;
import android.widget.EditText;

import java.util.Objects;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterView;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL1 = "strangerweather.com/easy_dnd/receiver";
    private static final String CHANNEL2 = "strangerweather.com/easy_dnd/dispatcher";
    public static final String CHANNEL3 = "strangerweather.com/easy_dnd/stream";
    public int status;
    public int dndStatus;

    DndBroadcastReceiver dndBroadcastReceiver = new DndBroadcastReceiver();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        final NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        assert mNotificationManager != null;
        if (mNotificationManager.isNotificationPolicyAccessGranted()) {

            dndOn();
        } else {
            Intent intent = new Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS);
            startActivity(intent);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter(NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED);
        registerReceiver(dndBroadcastReceiver, filter);
    }

    @Override
    protected void onStop() {
        super.onStop();
        unregisterReceiver(dndBroadcastReceiver);
    }

    private void dndOn() {
        new MethodChannel(getFlutterView(), CHANNEL1).setMethodCallHandler(new MethodCallHandler() {
            final NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

            @Override
            public void onMethodCall(MethodCall methodCall, Result result) {
                switch (methodCall.method) {
                    case "ON":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_NONE);
                        break;
                    case "OFF":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_ALL);
                        break;
                    default:
                        result.notImplemented();
                        break;
                }
            }
        });
    }

    public class DndBroadcastReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            if (NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED.equals(intent.getAction())) {
                NotificationManager mNotificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
                assert mNotificationManager != null;
                if(mNotificationManager.getCurrentInterruptionFilter() == NotificationManager.INTERRUPTION_FILTER_NONE) {
                    System.out.println("Status - On");
                } else {
                    System.out.println("Status - Off");
                }
            }
        }
    }
}



