package com.example.staapp;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.util.Log;
import android.widget.RemoteViews;

public class MyAppWidgetProvider extends AppWidgetProvider {

    private static final String TAG = "WidgetProvider";

    public static void updateAppWidget(Context context) {
        RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.widget_layout);
        views.setImageViewResource(R.id.widget_image, R.drawable.day_2);

        AppWidgetManager manager = AppWidgetManager.getInstance(context);
        ComponentName widget = new ComponentName(context, MyAppWidgetProvider.class);
        manager.updateAppWidget(widget, views);

        Log.d(TAG, "Widget updated with image: day_1");
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        updateAppWidget(context);
    }
}
