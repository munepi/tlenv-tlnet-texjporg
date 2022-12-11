before_install export_texlive_install_tlnet

export_texlive_install_tlnet() {
    local tlnet_texjporg=http://texlive.texjp.org/
    case "$VERSION_NAME" in
        # current)  ##=> proxy to JAIST or RIKEN
        #     export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME}/tlnet/
        #     ;;
        pretest)
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME}/tlnet/
            ;;
        [0-9][0-9][0-9][0-9])
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME}/tlnet/
            ;;
        [0-9][0-9][0-9][0-9]-*)
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME%-*}/tlnet/
            ;;
        *-[0-9][0-9][0-9][0-9])
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME#*-}/tlnet/
            ;;
        [0-9][0-9][0-9][0-9].*)
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME%.*}/tlnet/
            ;;
    esac
}
