package com.example.androidtraining.Application.UI.RecyclerView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.widget.Toast;

import com.example.androidtraining.R;
import com.example.myuserapplication.R;

import java.util.ArrayList;
import java.util.List;

public class RecyclerViewActivity extends AppCompatActivity implements IValueEntered {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recycler_view);

        RecyclerView itemsList = findViewById(R.id.items_list);
        ItemsAdapter itemsAdapter = new ItemsAdapter(this, getDummyItemsList());
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        itemsAdapter.setValueEnteredListner(this);
        itemsList.setLayoutManager(layoutManager);
        itemsList.setAdapter(itemsAdapter);

        itemsAdapter.notifyDataSetChanged();

    }

    private List<Item> getDummyItemsList() {
        List<Item> itemList = new ArrayList<>();
        Item item;

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Mahesh Sharma");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Shridhar Gaikwad");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Apurva Shepal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Hemakant G");
        item.setSubTitle("React Dev");
        item.setImage(R.drawable.eye);
        itemList.add(item);

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        item = new Item();
        item.setName("Akshay Toshniwal");
        item.setSubTitle("Android Dev");
        item.setImage(R.drawable.dummy);
        itemList.add(item);

        return itemList;

    }

    @Override
    public void onTitleClicked(String text) {
        Toast.makeText(this, "You have entered :" + text, Toast.LENGTH_SHORT).show();
    }
}
