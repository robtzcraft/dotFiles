
pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {

    property url homeURL: `${Quickshell.env("HOME")}`

    FileView {
        id: coreJsonFile
        path: `${homeURL}/config.json`
        blockLoading: true
        watchChanges: true
        onFileChanged: this.reload()
    }

    readonly property var jsonData: JSON.parse(coreJsonFile.text())

    FileView {
        id: colorSchemeJsonFile
        path: `${jsonData.system.paths.colorschemes}/${jsonData.ui.colorscheme}.json`
        blockLoading: true
        watchChanges: false
    }

    readonly property var colorSchemeData: JSON.parse(colorSchemeJsonFile.text())

    readonly property int paddingGlobal: ConfigServices.jsonData.ui.config.padding
    readonly property int borderRadius: ConfigServices.jsonData.ui.config.borderRadius
    readonly property int radiusShort: ConfigServices.jsonData.ui.borderRadius.short
    readonly property int radiusMedium: ConfigServices.jsonData.ui.borderRadius.medium
    readonly property int radiusGlobal: ConfigServices.jsonData.ui.borderRadius.global
    readonly property string colorScheme: ConfigServices.jsonData.ui.colors.theme
    readonly property string colorSchemeVariant: ConfigServices.jsonData.ui.colors.variant

    // Fonts
    readonly property string sansFont: ConfigServices.jsonData.ui.fonts.sansFont
    readonly property string monospaceFont: ConfigServices.jsonData.ui.fonts.monospaceFont
    readonly property string monoPropoFont: ConfigServices.jsonData.ui.fonts.monospacePropoFont

    // Colors
    readonly property string backgroundColor: ConfigServices.colorSchemeData.bg0
    readonly property string foregroundColor: ConfigServices.colorSchemeData.fg0
    readonly property string onHoverColor: ConfigServices.colorSchemeData.blue1
    readonly property string focusedColor: ConfigServices.colorSchemeData.green

}
