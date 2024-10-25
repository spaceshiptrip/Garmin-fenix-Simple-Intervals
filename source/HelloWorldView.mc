import Toybox.WatchUi;
import Toybox.Graphics;
using Toybox.ActivityMonitor as Act;
using Toybox.Activity as Acty;
import Toybox.Timer;


class HelloWorldView extends WatchUi.View {

    function initialize() {
        View.initialize();

        var timer = new Timer.Timer();
        timer.start(method(:timerCallBack),500,true);

    }

    function timerCallBack() as Void {
        requestUpdate();
    }

    function onShow() {
        // Called when the view is shown
    }

    function onHide() {
        // Called when the view is hidden
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        View.onUpdate(dc);

        var heartRate = getLatestHeartRate();
 
        System.println("HR: " + heartRate);
   

        var clockTime = System.getClockTime();
        var timeString = Lang.format(
            "$1$:$2$",
            [clockTime.hour, clockTime.min.format("%02d")]
        );
        // var view = findDrawableById("currHR");
        // view.setText(timeString);

        // Get the screen width and height
        // var screenWidth = dc.getWidth();
        // var screenHeight = dc.getHeight();
        // Prepare the text to display
        var text = timeString;

        // // Calculate the position to center the text
        // var textWidth = dc.getTextWidth(text, Graphics.FONT_LARGE);
        // var textHeight = dc.getTextHeight(Graphics.FONT_LARGE);

        // var x = (screenWidth - textWidth) / 2;
        // var y = (screenHeight - textHeight) / 2;

        var x = 30;
        var y = 100;

        System.println(text);

        // Draw the text in the center
            // dc.drawText(x, y, Graphics.FONT_LARGE, text, Graphics.TEXT_JUSTIFY_CENTER);

        // var myTime = System.getClockTime();
        // var currHRLabel = View.findDrawableById("currHR"");
        // if (currHRLabel == null) {
        //     System.print("currHRLabel is NULL");
        // } else {
        //     System.print("NULL NULL NULL");
        // }




        var view = View.findDrawableById("HRLabel") as Text;

        if (view == null) {
            System.println("HRLabel is null");
        } else {

            System.println("drawing dc");
            view.setText(heartRate);

        }
        
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Item1Layout(dc));
    }

    function getLatestHeartRate()  {

        var heartRate = "--";

        if (Act has :getHeartRateHistory) {
            heartRate = Activity.getActivityInfo().currentHeartRate;

            if(heartRate==null) {
                var HRH=Act.getHeartRateHistory(1, true);
                var HRS=HRH.next();

                if(HRS!=null && HRS.heartRate!= Act.INVALID_HR_SAMPLE){
                    heartRate = HRS.heartRate;
                }
            }

            if(heartRate!=null) {
                heartRate = heartRate.toString();
            }
            else{
                heartRate = "--";
            }
        }

        return heartRate;

    }


}
