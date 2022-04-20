import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id:button
    property color backgroundColor: mainColor
    property color textColor: "black"
    property string buttonText: "REGISTRAR"
    background: Rectangle{
        anchors.fill: parent
        color: button.backgroundColor
        radius: 10
    }

     Text{
        text: button.buttonText
        color: button.textColor
        anchors.centerIn: parent
        font{
            pixelSize: 15
            family: openSans.name
        }
    }

}
