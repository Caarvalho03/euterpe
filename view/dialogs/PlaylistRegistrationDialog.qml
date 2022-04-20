import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.1
import '../components'

Dialog {
    id:dialog
    modal:true
    closePolicy: Popup.NoAutoClose
    height:480
    width: 400

    property var playlist: {
        "name": "nome",
        "pathImage": "imagem"
    }
    signal newPlaylist(var obj)

    QtObject{
        id:internal
        function fillObject(){
            removeWarningText()
            if(playlistTitleField.text.length > 0)
                playlist.name = playlistTitleField.text
            else
                setWarningText(" Título inválido \n")
            if(fileDialog.fileUrl != "")
                playlist.pathImage = fileDialog.fileUrl
            else
                 setWarningText(" Imagem inválida ")
            if(playlistTitleField.text.length > 0 && fileDialog.fileUrl != ""){
                newPlaylist(playlist)
                dialog.close()
                internal.resetForm()
            }
            clearObject()
        }

        function clearObject(){
            playlist.name = ""
            playlist.imagePath = ""
        }

        function setWarningText(text){
            warningText.text += text;
            warningText.visible = true
        }

        function removeWarningText(){
            warningText.text = ""
            warningText.visible = false
        }

        function resetForm(){
            imageField.anchors.fill = undefined
            imageField.height = 50
            imageField.width = 50
            imageField.anchors.centerIn = imageField.parent
            imageField.source = "qrc:/view/assets/images/image.svg"
            colorOverlay.visible = true

            playlistTitleField.text = ""
        }
    }

    background: Rectangle{
        anchors.fill: parent
        gradient: Gradient{
            GradientStop{position:0.2 ; color: grayGradientColor}
            GradientStop{position:1.0 ; color: secondColor}
        }
        radius:10
    }
    V_TextField{
        id:playlistTitleField
        labelText: qsTr("Título")
        anchors{
            top: parent.top
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle{
        id:imageContainer
        height: 213
        width: 345
        color: "transparent"
        radius:10
        border{
            color:mainColor
            width: 2
        }
        anchors{
            top: playlistTitleField.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        Image{
            id:imageField
            width: 50
            height: 50
            anchors.centerIn:parent
            fillMode: Image.Stretch
            source: "qrc:/view/assets/images/image.svg"
            ColorOverlay{
                id:colorOverlay
                anchors.fill: parent
                source: parent
                color: mainColor
            }
        }

        MouseArea{
            id:imageArea
            anchors.fill: parent
            onClicked: fileDialog.open()
        }
    }

    V_Button{
        id:submitButton
        height: 40
        width:100
        buttonText: qsTr("SALVAR")
        anchors{
            top: imageContainer.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: internal.fillObject()
    }
    Text{
        id:warningText
        visible: false
        color: mainColor
        anchors{
            bottom: parent.bottom
            bottomMargin: 5
            horizontalCenter: parent.horizontalCenter
        }
        font{
            pixelSize: 15
            family: openSans.name
        }
    }
    FileDialog{
        id:fileDialog
        folder: shortcuts.pictures
        nameFilters: ["*.png *.jfif *.jpg"]
        onAccepted: {
            imageField.source = fileUrl
            colorOverlay.visible = false
            imageField.anchors.fill = imageField.parent
        }
    }
}
