/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class Item {
    private Watch watch;
    private int quantity;

    public Item() {
    }

    public Item(Watch watch, int quantity) {
        this.watch = watch;
        this.quantity = quantity;
    }

    public Watch getWatch() {
        return watch;
    }

    public void setWatch(Watch watch) {
        this.watch = watch;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
