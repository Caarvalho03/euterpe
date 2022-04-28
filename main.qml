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

    property color mainColor: "#ff00ff"
    property color secondColor:"black"
    property color grayGradientColor:"#1C1C1C"

    Rectangle{
        id:backGround
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{position:0.2 ; color: grayGradientColor}
            GradientStop{position:1.0 ; color: secondColor}
        }

        Rectangle{
            id:sideBar
            height: parent.height
            width:80
            color:"transparent"
            anchors{
                left: parent.left
                top: parent.top
            }
            RoundButton{
                id:mainButton
                height: 62
                width: 62
                icon.source: "qrc:/view/assets/images/play.svg"
                icon.color:mainColor
                background: Rectangle{
                    color:secondColor
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
            color: mainColor
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

    FontLoader{
        id:openSans
        source: "qrc:/view/assets/fonts/OpenSans_SemiCondensed-SemiBold.ttf"
    }


}
