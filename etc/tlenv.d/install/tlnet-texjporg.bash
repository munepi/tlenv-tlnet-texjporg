before_install export_texlive_install_tlnet

export_texlive_install_tlnet() {
    local tlnet_texjporg=http://texlive.texjp.org/

    ## auto-detect TeX Live VERSION_NAME
    local detected_version_name
    case "$VERSION_NAME" in
        # current)  ##=> proxy to JAIST or RIKEN
        #     export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${VERSION_NAME}/tlnet/
        #     ;;
        pretest)
            detected_version_name=${VERSION_NAME}
            ;;
        [0-9][0-9][0-9][0-9])
            detected_version_name=${VERSION_NAME}
            ;;
        [0-9][0-9][0-9][0-9]-*)
            detected_version_name=${VERSION_NAME%-*}
            ;;
        *-[0-9][0-9][0-9][0-9])
            detected_version_name=${VERSION_NAME#*-}
            ;;
        [0-9][0-9][0-9][0-9].*)
            detected_version_name=${VERSION_NAME%.*}
            ;;
    esac

    ## set tlnet
    case "${detected_version_name}" in
        201[2-9]|20[2-9][0-9])  ##=> 2012--2099
            export TEXLIVE_INSTALL_TLNET=${tlnet_texjporg}${detected_version_name}/tlnet/
            ;;
        *)
            ;;
    esac
}
