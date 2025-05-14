package com.example.staapp;

import android.appwidget.AppWidgetProvider;
import android.appwidget.AppWidgetManager;
import android.content.Context;

public class WidgetSmallProvider extends AppWidgetProvider {
    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        new DayNumberFetcher(context, appWidgetManager, appWidgetIds, R.layout.widget_small).execute();
    }
}
