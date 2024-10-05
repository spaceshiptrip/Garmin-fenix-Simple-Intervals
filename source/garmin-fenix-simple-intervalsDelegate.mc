import Toybox.Lang;
import Toybox.WatchUi;

class garmin_fenix_simple_intervalsDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new garmin_fenix_simple_intervalsMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}