import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class garmin_fenix_simple_intervalsMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
            // Switch to the HelloWorldView when item_1 is selected
            WatchUi.pushView(new HelloWorldView(), new HelloWorldDelegate(), WatchUi.SLIDE_IMMEDIATE);

        } else if (item == :item_2) {
            System.println("item 2");
        }
    }

}
