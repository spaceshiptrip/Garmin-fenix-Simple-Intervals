import Toybox.WatchUi;
import Toybox.Graphics;
using Toybox.ActivityMonitor as Act;
using Toybox.Activity as Acty;


class HelloWorldView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }


    function onShow() {
        // Called when the view is shown
    }

    function onHide() {
        // Called when the view is hidden
    }

    // function onUpdate(dc as Graphics.DrawContext) {
    //     // // Get the screen width and height
    //     // var screenWidth = dc.getWidth();
    //     // var screenHeight = dc.getHeight();

    //     // // Calculate the position to center the text
    //     // var text = "Hello World";
    //     // var textWidth = dc.getTextWidth(text);
    //     // var textHeight = dc.getTextHeight();

    //     // var x = (screenWidth - textWidth) / 2;
    //     // var y = (screenHeight - textHeight) / 2;

    //     // // Draw the text in the center
    //     // dc.drawText(x, y, Graphics.FONT_LARGE, text, Graphics.TEXT_JUSTIFY_CENTER);
    // }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        var heartRate = -1;

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

        System.print("HR: " + heartRate);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Item1Layout(dc));
    }

}
