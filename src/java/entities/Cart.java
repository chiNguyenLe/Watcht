/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class Cart {
    private HashMap<Integer, Item> cartItem;

    public Cart() { 
        cartItem = new HashMap<>();
    }

    public Cart(HashMap<Integer, Item> cartItem) {
        this.cartItem = cartItem;
    }

    public HashMap<Integer, Item> getCartItem() {
        return cartItem;
    }

    public void setCartItem(HashMap<Integer, Item> cartItem) {
        this.cartItem = cartItem;
    }
    
    public void addToCart(Integer key, Item item) {
        if(cartItem.containsKey(key)) {
            int oldQuantity = item.getQuantity();
            item.setQuantity(oldQuantity + 1);
            cartItem.put(key, item);
        } else {
            cartItem.put(key, item);
        }
    }
    
    public void subToCart(Integer key, Item item) {
        if (cartItem.containsKey(key)) {
            int oldQuantity = cartItem.get(key).getQuantity();
            if (oldQuantity == 1) cartItem.remove(key);
            else {
                item.setQuantity(oldQuantity - 1);
                cartItem.put(key, item);
            }           
        }
    }
    
    public void removeItem(Integer key) {
        if (cartItem.containsKey(key)) {
            cartItem.remove(key);
        }
    }
    public int countItem() {
        return cartItem.size();
    }
    
    public double sumPrice() {
        double money = 0;
        for (Map.Entry<Integer, Item> entrySet : cartItem.entrySet()) {
            Item item = entrySet.getValue();
            money += item.getQuantity() * item.getWatch().getPrice();           
        }
        return money;
    }
}
