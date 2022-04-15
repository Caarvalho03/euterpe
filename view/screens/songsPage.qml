import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
    id:songPages

    ListModel{
        id:songsModel
    }

    Component.onCompleted: {
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
        songsModel.append({"color":"blue"})
    }
    Rectangle{
        id:background
        anchors.fill: parent
        color: "white"
        Rectangle{
            id:coverPhotoRectangle
            height: 330
            width: parent.width
            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color:"white"
                }
                GradientStop{
                    position: 0.9
                    color: "#a9a9a9"
                }
            }
            anchors{
                top:background.top
                left: background.left
            }
            RoundButton{
                id:playButton
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
                    verticalCenter: coverPhotoRectangle.bottom
                    right: coverPhotoRectangle.right
                    rightMargin: 90
                }
            }
        }
        ListView{
            id:songsList
            height: 560
            width: 1360
            clip: true
            y:400
            interactive: true
            boundsBehavior: Flickable.StopAtBounds
            model:songsModel
            delegate: Loader{
                source: "qrc:/view/components/songCard.qml"
                onLoaded: {
                    item.backgroundColor = index % 2 == 0? "#EEEEEE" : "#E0EAFF"
                    item.width =  songsList.width
                    item.height = 56

                }
            }
//            MouseArea{
//                id:wheelHandler
//                onWheel: console.log("x: " + wheel.y)
//                anchors.fill: songsList
//            }
            anchors{
                left: background.left
                leftMargin: 0
            }
        }
    }
}
