import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class garmin_fenix_simple_intervalsApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new garmin_fenix_simple_intervalsView(), new garmin_fenix_simple_intervalsDelegate() ];
    }

}

function getApp() as garmin_fenix_simple_intervalsApp {
    return Application.getApp() as garmin_fenix_simple_intervalsApp;
}