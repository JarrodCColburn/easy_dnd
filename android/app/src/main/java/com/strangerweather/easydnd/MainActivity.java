package com.strangerweather.easydnd;

import android.app.AlarmManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.admin.DevicePolicyManager;
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
    private static final String CHANNEL2 = "strangerweather.com/easy_dnd/stream";
    private static String status;
    DndBroadcastReceiver dndBroadcastReceiver = new DndBroadcastReceiver();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        final NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        assert mNotificationManager != null;
        if (mNotificationManager.isNotificationPolicyAccessGranted()) {
            IntentFilter filter = new IntentFilter(NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED);
            registerReceiver(dndBroadcastReceiver, filter);

            checkStatus(getApplicationContext());
            updateStatus();
            dndOn();
        } else {
            Intent intent = new Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS);
            startActivity(intent);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        checkStatus(getApplicationContext());
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
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

    private void checkStatus(Context context) {
        NotificationManager mNotificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (mNotificationManager != null) {
            int notificationStatus = mNotificationManager.getCurrentInterruptionFilter();
            if (notificationStatus == 4) {
                status = "alarms";
            } else if (notificationStatus == 1) {
                status = "all";
            } else if (notificationStatus == 3) {
                status = "none";
            } else if (notificationStatus == 2) {
                status = "priority";
            } else if (notificationStatus == 0) {
                status = "unknown";
            }
        }
    }


    private void updateStatus() {
        new EventChannel(getFlutterView(), CHANNEL2).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {

                        events.success(status);
                    }

                    @Override
                    public void onCancel(Object arguments) {
                    }
                }
        );
    }
}




