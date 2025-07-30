import "root:/modules/common/"
import QtQuick
import QtQuick.Layouts

Text {
    id: root
    property real iconSize: Appearance?.font.pixelSize.small ?? 16
    property real fill: 0
    property real truncatedFill: Math.round(fill * 100) / 100 // Reduce memory consumption spikes from constant font remapping
    renderType: Text.NativeRendering
    font {
        hintingPreference: Font.PreferFullHinting
        family: Appearance?.font.family.iconMaterial ?? "Material Symbols Rounded"
        pixelSize: iconSize
    }
    verticalAlignment: Text.AlignVCenter
    color: Appearance.m3colors.m3onBackground

    font.variableAxes: { 
        "FILL": truncatedFill,
        // "wght": font.weight,
        // "GRAD": 0,
        "opsz": iconSize,
    }
}
