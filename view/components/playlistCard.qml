import QtQuick 2.15
import QtQuick.Controls 2.12

Item {
    width: 345
    height: 345
    Rectangle{
        id:background
        anchors.fill: parent
        clip: true
        color: "#EEEEEE"
        Rectangle{
            id:bottomBar
            height: 132
            width: parent.width
            color: "#9F9999"
            anchors{
                bottom: parent.bottom
                left: parent.left
            }
        }
    }
}
