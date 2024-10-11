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
            // var helloWorldView = new HelloWorldView();
            // WatchUi.pushView(new Rez.Menus.MainMenu(), new garmin_fenix_simple_intervalsMenuDelegate(), WatchUi.SLIDE_UP);

            // WatchUi.pushView(new Rez.Menus.MainMenu(), [ helloWorldView, new garmin_fenix_simple_intervalsDelegate() ], WatchUi.SLIDE_IMMEDIATE);
            WatchUi.pushView(new HelloWorldView(), new HelloWorldDelegate(), WatchUi.SLIDE_IMMEDIATE);

        } else if (item == :item_2) {
            System.println("item 2");
        }
    }

}
