import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import "view/components"


Window{
    id:window
    width: 1440
    height: 1024
    maximumHeight: 1024
    //minimumHeight: height
    maximumWidth: 1440
    //minimumWidth: width
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id:sideBar
        height: parent.height
        width:80
        color:"white"
        anchors{
            left: parent.left
            top: parent.top
        }
        RoundButton{
            id:mainButton
            height: 62
            width: 62
            icon.source: "qrc:/view/assets/images/play.svg"
            background: Rectangle{
                color:"#C4C4C4"
                height: 62
                width: 62
                radius:62/2
            }
            anchors{
                horizontalCenter: sideBar.horizontalCenter
                top: sideBar.top
                topMargin: 18
            }
        }
    }
    Rectangle{
        id:divider
        height: parent.height
        width: 2
        color: "#A19D9D"
        anchors{
            top: sideBar.top
            left: sideBar.right
        }
    }

    StackView{
        id:routes
        initialItem: "qrc:/view/screens/songsPage.qml"
        anchors{
            left: divider.right
            top: parent.top
        }
        height: parent.height
        width: parent.width - sideBar.width
    }
}
