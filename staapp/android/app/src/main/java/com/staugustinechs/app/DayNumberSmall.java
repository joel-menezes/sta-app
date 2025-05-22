package com.staugustinechs.app;

import android.appwidget.AppWidgetManager;
import android.content.SharedPreferences;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.graphics.Color;
import android.widget.RemoteViews;

/**
 * Implementation of App Widget functionality.
 */
public class DayNumberSmall extends AppWidgetProvider {

    static void updateAppWidget(Context context, AppWidgetManager appWidgetManager,
            int appWidgetId) {

        SharedPreferences prefs = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE);
        String description = prefs.getString("day_number", "Default Description");
        RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.day_number_small);

        if (description.equals("1")) {
            views.setImageViewResource(R.id.widget_image, R.drawable.day1);
        } else if (description.equals("2")) {
            views.setImageViewResource(R.id.widget_image, R.drawable.day2);
        } else {
            views.setImageViewResource(R.id.widget_image, R.drawable.day3);
        }

        views.setInt(R.id.widget_container, "setBackgroundColor", Color.TRANSPARENT);

        appWidgetManager.updateAppWidget(appWidgetId, views);
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        for (int appWidgetId : appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId);
        }
    }

    @Override
    public void onEnabled(Context context) {
    }

    @Override
    public void onDisabled(Context context) {
    }
}
