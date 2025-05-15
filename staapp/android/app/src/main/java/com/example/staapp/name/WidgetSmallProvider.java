package com.example.staapp;

import android.appwidget.AppWidgetProvider;
import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.RemoteViews;

public class WidgetSmallProvider extends AppWidgetProvider {

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {

        SharedPreferences prefs = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE);
        String dayNumber = prefs.getString("my_key", "default"); // Example: "1", "2", etc.

        int imageResId = getImageForDay(dayNumber, context);

        for (int appWidgetId : appWidgetIds) {
            RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.widget_small);
            views.setImageViewResource(R.id.dayImage, imageResId);
            appWidgetManager.updateAppWidget(appWidgetId, views);
        }
    }

    private int getImageForDay(String dayNumber, Context context) {
        switch (dayNumber) {
            case "1":
                return R.drawable.day1;
            case "2":
                return R.drawable.day2;
            case "3":
                return R.drawable.day3;
            default:
                return R.drawable.day_default;
        }
    }
}
