<?xml version="1.0" encoding="UTF-8" ?>
<Package name="Martial_Arts_Instructor" format_version="4">
    <Manifest src="manifest.xml" />
    <BehaviorDescriptions>
        <BehaviorDescription name="behavior" src="behavior_1" xar="behavior.xar" />
    </BehaviorDescriptions>
    <Dialogs>
        <Dialog name="TeachMartialArts" src="TeachMartialArts/TeachMartialArts.dlg" />
        <Dialog name="InitiateInteraction" src="InitiateInteraction/InitiateInteraction.dlg" />
        <Dialog name="AssessUserSkillLevel" src="AssessUserSkillLevel/AssessUserSkillLevel.dlg" />
        <Dialog name="TellAStoryAboutMartialArts" src="TellAStoryAboutMartialArts/TellAStoryAboutMartialArts.dlg" />
    </Dialogs>
    <Resources>
        <File name="" src=".gitattributes" />
        <File name="README" src="README.md" />
        <File name="UC1" src="html/UC1.jpeg" />
        <File name="UC2" src="html/UC2.jpeg" />
        <File name="UC3" src="html/UC3.jpeg" />
        <File name="UC4" src="html/UC4.jpeg" />
        <File name="swiftswords_ext" src="behavior_1/swiftswords_ext.mp3" />
        <File name="taichimove" src="behavior_1/taichimove.pmt" />
    </Resources>
    <Topics>
        <Topic name="TeachMartialArts_enu" src="TeachMartialArts/TeachMartialArts_enu.top" topicName="TeachMartialArts" language="en_US" />
        <Topic name="InitiateInteraction_enu" src="InitiateInteraction/InitiateInteraction_enu.top" topicName="InitiateInteraction" language="en_US" />
        <Topic name="AssessUserSkillLevel_enu" src="AssessUserSkillLevel/AssessUserSkillLevel_enu.top" topicName="AssessUserSkillLevel" language="en_US" />
        <Topic name="TellAStoryAboutMartialArts_enu" src="TellAStoryAboutMartialArts/TellAStoryAboutMartialArts_enu.top" topicName="TellAStoryAboutMartialArts" language="en_US" />
    </Topics>
    <IgnoredPaths />
    <Translations auto-fill="en_US">
        <Translation name="translation_en_US" src="translations/translation_en_US.ts" language="en_US" />
    </Translations>
</Package>
