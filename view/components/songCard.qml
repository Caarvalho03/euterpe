import QtQuick 2.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

Item{
    id:songCard
    property color backgroundColor:"gray"
    Rectangle{
        id:background
        color: backgroundColor
        anchors.fill: parent
        Text{
            id:songLabel
            height: 20
            width: 290
            text: qsTr("Nome da música")
            font{
                pixelSize: 16
            }
            anchors{
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }
        Slider{
            id:positionSlider
            width: 188
            height: 24
            stepSize:1
            from:0
            to:100
            value: 50
            snapMode: Slider.NoSnap
            background: Rectangle{
                width:170
                height: 5
                color: "#a9a9a9"
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
            handle: Rectangle{
                width: 20
                height: 20
                radius: 10
                color: "#074EE8"
                x: positionSlider.leftPadding + positionSlider.visualPosition * (positionSlider.availableWidth - width)
                y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
            }
            anchors{
                top: parent.top
                right: parent.right
                rightMargin: 122
                verticalCenter: parent.verticalCenter
            }
            Image{
                id:dragIndicator
                height: 32
                width: 32
                source: "qrc:/view/assets/images/drag.svg"
                anchors{
                    left: positionSlider.right
                    leftMargin: 37
                    verticalCenter: parent.verticalCenter

                }
            }
            ColorOverlay{
                source: dragIndicator
                color: "#767676"
                anchors.fill:dragIndicator
            }
        }
    }
}
