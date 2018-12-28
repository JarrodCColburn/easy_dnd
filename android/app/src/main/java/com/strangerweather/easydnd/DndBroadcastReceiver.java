package com.strangerweather.easydnd;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

public class DndBroadcastReceiver extends BroadcastReceiver {


    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        assert action != null;
        if (action.equals(NotificationManager.ACTION_INTERRUPTION_FILTER_CHANGED)) {
            NotificationManager systemService = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            assert systemService != null;
            int status = systemService.getCurrentInterruptionFilter();

            Bundle extras = new Bundle();
            extras.putString("USER_NAME","John Doe");
            intent = new Intent(context, MainActivity.class);
            intent.putExtras(extras);
            context.startActivity(intent);
        }
    }
}

