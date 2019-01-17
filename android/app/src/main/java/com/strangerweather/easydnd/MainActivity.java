package com.strangerweather.easydnd;

import android.app.NotificationManager;
import android.app.admin.DevicePolicyManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL1 = "strangerweather.com/easy_dnd/receiver";
    private static final String CHANNEL2 = "strangerweather.com/easy_dnd/stream";
    private int state;
    public static final String SHARED_PREFS = "sharedPrefs";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        final NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        assert mNotificationManager != null;
        if (mNotificationManager.isNotificationPolicyAccessGranted()) {
            streamStatus();
            optionsCycle();

        } else {
            Intent intent = new Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS);
            startActivity(intent);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
    }


    private void optionsCycle() {
        new MethodChannel(getFlutterView(), CHANNEL1).setMethodCallHandler(new MethodCallHandler() {
            final NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

            @Override
            public void onMethodCall(MethodCall methodCall, Result result) {
                switch (methodCall.method) {
                    case "DND ON":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_NONE);
                        break;
                    case "DND OFF":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_ALL);
                        break;
                    case "ALARMS ONLY ON":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_ALARMS);
                        break;
                    case "ALARMS ONLY OFF":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_ALARMS);
                        break;
                    case "PRIORITY ONLY ON":
                        assert mNotificationManager != null;
                        mNotificationManager.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_PRIORITY);

                        break;
                    default:
                        result.notImplemented();
                        break;
                }
            }
        });
    }

    private void checkStatus(final EventChannel.EventSink events) {
        NotificationManager systemService = (NotificationManager) getApplicationContext().getSystemService(Context.NOTIFICATION_SERVICE);
        assert systemService != null;
        state = systemService.getCurrentInterruptionFilter();
        String result;

        switch (state) {
            case 1:
                events.success(result = "DND OFF");
                break;
            case 2:
                events.success(result = "PRIORITY ON");
                break;
            case 3:
                events.success(result = "DND ON");
                break;
            case 4:
                events.success(result = "ALARMS ON");
                break;
            default:
                events.error(result = "UNAVAILABLE", "Status Unavailable", null);
                break;
        }
        events.success(result);
    }


    private void streamStatus() {
        new EventChannel(getFlutterView(), CHANNEL2).setStreamHandler(
                new EventChannel.StreamHandler() {

                    private BroadcastReceiver changeReceiver;

                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {
                        checkStatus(events);
                        changeReceiver = newBroadcastReceiver(events);
                        registerReceiver(changeReceiver, new IntentFilter(NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED));
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        unregisterReceiver(changeReceiver);
                        changeReceiver = null;
                    }
                }
        );
    }

    private BroadcastReceiver newBroadcastReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                String result = null;
                String action = intent.getAction();
                assert action != null;
                if (action.equals(NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED)) {
                    NotificationManager systemService = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
                    assert systemService != null;
                    state = systemService.getCurrentInterruptionFilter();

                    switch (state) {
                        case 1:
                            events.success(result = "DND OFF");
                            break;
                        case 2:
                            events.success(result = "PRIORITY ON");
                            break;
                        case 3:
                            events.success(result = "DND ON");
                            break;
                        case 4:
                            events.success(result = "ALARMS ON");
                            break;
                        default:
                            events.error(result = "UNAVAILABLE", "Status Unavailable", null);
                            break;
                    }
                    events.success(result);

                } else if (action.equals(NotificationManager.Policy.PRIORITY_SENDERS_ANY)) {
                    events.success(result = "ALL PHONE CALLS");

                }
                events.success(result);
            }
        };
    }


//
//
//    private void saveData() {
//        SharedPreferences sharedPreferences = getSharedPreferences(SHARED_PREFS, MODE_PRIVATE);
//        SharedPreferences.Editor editor = sharedPreferences.edit();
//        editor.putInt("State", state);
//        editor.apply();
//    }
//
//    private void loadData() {
//        SharedPreferences sharedPreferences = getSharedPreferences(SHARED_PREFS, MODE_PRIVATE);
//        int newState = sharedPreferences.getInt("State", state);
//    }

}




