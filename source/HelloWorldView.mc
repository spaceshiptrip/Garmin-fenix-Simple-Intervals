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


        View.onUpdate(dc);

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
        // View.findDrawableById("currHR").setText(heartRate);
        // View.findDrawableById("currHR").setText(heartRate.toString());
        // var identifier = "HRLabel";
        // var hrView = View.findDrawableById(identifier);
        // hrView.setText(heartRate);


        // WatchUi.View.find(identifier).setText(heartRate);


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

        System.print(text);

        // Draw the text in the center
        dc.drawText(x, y, Graphics.FONT_LARGE, text, Graphics.TEXT_JUSTIFY_CENTER);

        var myTime = System.getClockTime();
        // var currHRLabel = View.findDrawableById("currHR"");
        // if (currHRLabel == null) {
        //     System.print("currHRLabel is NULL");
        // } else {
        //     System.print("NULL NULL NULL");
        // }




        var view = View.findDrawableById("HRLabel");
        if (view == null) {
            System.print("HRLabel is null");
        } else {
            // view.setText(timeString);
            view.draw(dc);
        }
        

        // Call the parent onUpdate function to redraw the layout
         
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Item1Layout(dc));
    }

}
