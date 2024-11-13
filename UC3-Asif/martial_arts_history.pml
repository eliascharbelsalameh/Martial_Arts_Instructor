<?xml version="1.0" encoding="UTF-8" ?>
<Package name="UC3_MartialArtsHistory" format_version="4">
    <Manifest src="manifest.xml" />

    <!-- Behavior Descriptions -->
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="." xar="behavior.xar" />
        <BehaviorDescription name="behavior" src="animations/explain" xar="behavior.xar" />
        <BehaviorDescription name="behavior" src="animations/thoughtful" xar="behavior.xar" />
        <BehaviorDescription name="behavior" src="animations/welcome" xar="behavior.xar" />
    </BehaviorDescriptions>

    <!-- Dialogs -->
    <Dialogs>
        <Dialog name="martial-arts-history" src="dialog/martial-arts-history.dlg" />
    </Dialogs>

    <!-- Resources -->
    <Resources>
        <!-- CSS Files -->
        <File name="all" src="html/css/all.css" />
        <File name="formatting" src="html/css/formatting.css" />
        <File name="home" src="html/css/home.css" />
        <File name="w3" src="html/css/w3.css" />

        <!-- JavaScript Files -->
        <File name="all" src="html/js/all.js" />
        <File name="displayimage" src="html/js/displayimage.js" />
        <File name="displayinfo" src="html/js/displayinfo.js" />
        <File name="fastclick" src="html/js/fastclick.js" />
        <File name="help" src="html/js/help.js" />
        <File name="history-events" src="html/js/history-events.js" />
        <File name="index" src="html/js/index.js" />
        <File name="jquery" src="html/js/jquery.js" />
        <File name="qievents" src="html/js/qievents.js" />
        <File name="vars" src="html/js/vars.js" />

        <!-- HTML Pages -->
        <File name="index" src="html/index.html" />
        <File name="confirmation" src="html/pages/confirmation.html" />
        <File name="displayimage" src="html/pages/displayimage.html" />
        <File name="displayinfo" src="html/pages/displayinfo.html" />
        <File name="displaytext" src="html/pages/displaytext.html" />
        <File name="getinput" src="html/pages/getinput.html" />
        <File name="help" src="html/pages/help.html" />
        <File name="history" src="html/pages/history.html" />

        <!-- Images -->
        <File name="ancient-temple" src="html/pics/ancient-temple.jpg" />
        <File name="masters" src="html/pics/masters.jpg" />
        <File name="pepper-question" src="html/pics/pepper-question.png" />
        <File name="pepper-standing" src="html/pics/pepper-standing.png" />
        <File name="technique" src="html/pics/technique.jpg" />
        <File name="welcome" src="html/pics/welcome.jpg" />

        <!-- Web Fonts -->
        <File name="fa-brands-400-eot" src="html/webfonts/fa-brands-400.eot" />
        <File name="fa-brands-400-svg" src="html/webfonts/fa-brands-400.svg" />
        <File name="fa-brands-400-ttf" src="html/webfonts/fa-brands-400.ttf" />
        <File name="fa-brands-400-woff" src="html/webfonts/fa-brands-400.woff" />
        <File name="fa-brands-400-woff2" src="html/webfonts/fa-brands-400.woff2" />
        <File name="fa-regular-400-eot" src="html/webfonts/fa-regular-400.eot" />
        <File name="fa-regular-400-svg" src="html/webfonts/fa-regular-400.svg" />
        <File name="fa-regular-400-ttf" src="html/webfonts/fa-regular-400.ttf" />
        <File name="fa-regular-400-woff" src="html/webfonts/fa-regular-400.woff" />
        <File name="fa-regular-400-woff2" src="html/webfonts/fa-regular-400.woff2" />
        <File name="fa-solid-900-eot" src="html/webfonts/fa-solid-900.eot" />
        <File name="fa-solid-900-svg" src="html/webfonts/fa-solid-900.svg" />
        <File name="fa-solid-900-ttf" src="html/webfonts/fa-solid-900.ttf" />
        <File name="fa-solid-900-woff" src="html/webfonts/fa-solid-900.woff" />
        <File name="fa-solid-900-woff2" src="html/webfonts/fa-solid-900.woff2" />
    </Resources>

    <!-- Topics -->
    <Topics>
        <Topic name="martial-arts-history_enu" src="dialog/martial-arts-history_enu.top" topicName="martial-arts-history" language="en_US" />
        <Topic name="lexicon_enu" src="dialog/lexicon_enu.top" topicName="lexicon" language="en_US" />
    </Topics>

    <IgnoredPaths />

    <!-- Translations -->
    <Translations auto-fill="en_US">
        <Translation name="translation_en_US" src="translations/translation_en_US.ts" language="en_US" />
    </Translations>
</Package>