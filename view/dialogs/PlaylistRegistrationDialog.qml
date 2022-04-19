import QtQuick 2.15
import QtQuick.Controls 2.15

Dialog {
    id:dialog
    modal:true
    closePolicy: Popup.NoAutoClose
    height: 600
    width: 400
    background: Rectangle{
        anchors.fill: parent
        color: "white"
        radius:10
    }
}
