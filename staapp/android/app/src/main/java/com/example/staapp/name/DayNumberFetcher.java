package com.example.staapp;

import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.os.AsyncTask;
import android.widget.RemoteViews;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class DayNumberFetcher extends AsyncTask<Void, Void, String> {

    private Context context;
    private AppWidgetManager appWidgetManager;
    private int[] appWidgetIds;
    private int layoutId;

    public DayNumberFetcher(Context context, AppWidgetManager manager, int[] ids, int layoutId) {
        this.context = context;
        this.appWidgetManager = manager;
        this.appWidgetIds = ids;
        this.layoutId = layoutId;
    }

    @Override
    protected String doInBackground(Void... voids) {
        try {
            URL url = new URL("https://us-central1-staugustinechsapp.cloudfunctions.net/getDayNumber");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject json = new JSONObject(response.toString());
            return json.optString("dayNumber", "1");

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    protected void onPostExecute(String rawJson) {
        int imageResId = R.drawable.image1; // Default

        try {
            JSONObject root = new JSONObject(rawJson);
            JSONObject data = root.optJSONObject("data");
            if (data != null && !data.isNull("dayNumber")) {
                int day = data.optInt("dayNumber", 1);

                switch (day) {
                    case 1:
                        imageResId = R.drawable.image1;
                        break;
                    case 2:
                        imageResId = R.drawable.image4;
                        break;
                    default:
                        imageResId = R.drawable.image1;
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (int appWidgetId : appWidgetIds) {
            RemoteViews views = new RemoteViews(context.getPackageName(), layoutId);
            views.setImageViewResource(R.id.dayImage, imageResId);
            appWidgetManager.updateAppWidget(appWidgetId, views);
        }
    }

}
