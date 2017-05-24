package com.grandcircus.spring.controller;

import com.uber.sdk.rides.client.ServerTokenSession;
import com.uber.sdk.rides.client.SessionConfiguration;
import com.uber.sdk.rides.client.UberRidesApi;
import com.uber.sdk.rides.client.model.*;
import com.uber.sdk.rides.client.services.RidesService;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import retrofit2.Response;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import java.io.IOException;
import java.util.List;

@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public String helloworld(Model model) {
        List<Product> results;
        List<PriceEstimate> prices;
        List<TimeEstimate> duration;
        String id = "";

        try {

            //GOOGLE'S GEOCODE
                HttpClient http = HttpClientBuilder.create().build();
                HttpHost host = new HttpHost("maps.googleapis.com", 443, "https");
                HttpGet getPage = new HttpGet("/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&" +
                        "key=AIzaSyDCxhWezLy106rEfJyq-R6iPIYY0tK6lLw");
                HttpResponse resp = http.execute(host, getPage);

                String jsonString = EntityUtils.toString(resp.getEntity());

                JSONObject json = new JSONObject(jsonString);
                String out1 = json.get("results").toString();
                JSONObject ar = json.getJSONArray("results").getJSONObject(0).getJSONObject("geometry").
                        getJSONObject("location");

                String lat = ar.get("lat").toString();
                Double latDouble = Double.valueOf(ar.get("lat").toString());

                String lng = ar.get("lng").toString();
                Double lngDouble = Double.valueOf(ar.get("lng").toString());
                //GOOGLE'S GEOCODE


                SessionConfiguration config = new SessionConfiguration.Builder()
                        .setClientId("8RzoguxuX2ewBwxPa-lWFTbBUpOdsskI")
                        .setServerToken("lmsYmf0NANVZcPTESB5mKYJsAy4nhdYgjgn7rtq1")
                        .build();

                ServerTokenSession session = new ServerTokenSession(config);

                UberRidesApi ride = UberRidesApi.with(session).build();
                RidesService service = ride.createService();
                //product
                Response<ProductsResponse> response = service.getProducts(42.335734f, -83.050031f).execute();
                ProductsResponse products = response.body();
                results = products.getProducts();

                //price
                Response<PriceEstimatesResponse> respond = service.getPriceEstimates(42.335734f, -83.050031f,
                        42.462633f, -82.891155f).execute();
                PriceEstimatesResponse priceTag = respond.body();
                prices = priceTag.getPrices();


                //time
                Response<TimeEstimatesResponse> responseTime = service.getPickupTimeEstimate(42.335734f, -83.050031f,
                        id).execute();

                TimeEstimatesResponse time = responseTime.body();

                duration = time.getTimes();

                String displayName = results.get(0).getDisplayName();
                String discript = results.get(0).getDescription();
                int cap = results.get(0).getCapacity();

                String priceEst = prices.get(0).getEstimate() + " " + prices.get(0).getCurrencyCode();
                Float distance = prices.get(0).getDistance();

                int seconds = duration.get(0).getEstimate();
                int eta = (seconds % 3600) / 60;

                model.addAttribute("product", displayName);
                model.addAttribute("descrip", discript);
                model.addAttribute("cap", cap);
                model.addAttribute("price", priceEst);
                model.addAttribute("mile", distance);
                model.addAttribute("time", eta);


            } catch (IOException e) {
                e.printStackTrace();
           } catch (JSONException e) {
               e.printStackTrace();
           }


            return "welcome";


    }
}
