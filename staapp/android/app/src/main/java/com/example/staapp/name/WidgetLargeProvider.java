package com.example.staapp;

import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.appwidget.AppWidgetManager;
import android.widget.RemoteViews;
import com.example.staapp.R; // Import the R class to access resources

public class WidgetLargeProvider extends AppWidgetProvider {

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        // Loop through all the widget IDs
        for (int appWidgetId : appWidgetIds) {
            // Create a RemoteViews object to update the widget's UI
            RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.widget_large);

            // Update the widget with the new layout
            appWidgetManager.updateAppWidget(appWidgetId, views);
        }
    }
}
