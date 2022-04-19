import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import "view/components"


Window{
    id:root
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    maximumHeight: 1024
    maximumWidth: Screen.desktopAvailableWidth
    minimumWidth: 665
    visible: true
    x:-1
    y:-1
    title: qsTr("Hello World")

    FontLoader{
        id:openSans
        source: "qrc:/view/assets/fonts/OpenSans_SemiCondensed-SemiBold.ttf"
    }

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
        initialItem: "qrc:/view/screens/playlistsPage.qml"
        anchors{
            left: divider.right
            top: parent.top
        }
        height: parent.height
        width: parent.width - sideBar.width
    }
}
