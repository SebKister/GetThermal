import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5
import GetThermal 1.0
import "qrc:/controls"
import "qrc:/images"

Item {
    id: item1
    anchors.fill: parent

    property alias acq: acq
    property alias player: player
    property alias videoOutput: videoOutput
    width: 640

    UvcAcquisition {
        id: acq
    }

    UvcVideoProducer {
        id: player
        uvc: acq
    }

    RowLayout {
        spacing: 0
        anchors.fill: parent

    

        Pane {
            x: 220
            width: 400
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            topPadding: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectFit
                source: player
               
            }
        }




        Pane {
            width: 40
            Layout.minimumWidth: 40
            Layout.fillHeight: true
            visible: acq.cci.supportsRadiometry

        
            RangeDisplay {
                id: rangeDisplay
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                acq: acq
            }
        }

    }

}
