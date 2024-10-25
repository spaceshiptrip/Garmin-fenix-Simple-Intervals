import Toybox.Lang;
import Toybox.WatchUi;

class HelloWorldDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new HelloWorldView(), null, WatchUi.SLIDE_UP);
        // while (true) {
        //     System.print("requestUpdate");
                    

        //     WatchUi.requestUpdate();
        // }
        // return true;
    }

}