import Toybox.WatchUi;
import Toybox.Graphics;

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
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Item1Layout(dc));
    }

}
