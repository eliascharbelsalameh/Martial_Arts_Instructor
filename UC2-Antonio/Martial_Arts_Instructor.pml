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
        <Dialog name="ExampleDialog" src="behavior_1/ExampleDialog/ExampleDialog.dlg" />
        <Dialog name="test" src="test/test.dlg" />
        <Dialog name="test-topic" src="test-topic/test-topic.dlg" />
    </Dialogs>
    <Resources>
        <File name="" src=".gitattributes" />
        <File name="README" src="README.md" />
    </Resources>
    <Topics>
        <Topic name="TeachMartialArts_enu" src="TeachMartialArts/TeachMartialArts_enu.top" topicName="martial_arts_history" language="en_US" />
        <Topic name="InitiateInteraction_enu" src="InitiateInteraction/InitiateInteraction_enu.top" topicName="InitiateInteraction" language="en_US" />
        <Topic name="AssessUserSkillLevel_enu" src="AssessUserSkillLevel/AssessUserSkillLevel_enu.top" topicName="AssessUserSkillLevel" language="en_US" />
        <Topic name="TellAStoryAboutMartialArts_enu" src="TellAStoryAboutMartialArts/TellAStoryAboutMartialArts_enu.top" topicName="TellAStoryAboutMartialArts" language="en_US" />
        <Topic name="ExampleDialog_enu" src="behavior_1/ExampleDialog/ExampleDialog_enu.top" topicName="ExampleDialog" language="en_US" />
        <Topic name="test_enu" src="test/test_enu.top" topicName="test" language="en_US" />
        <Topic name="test-topic_enu" src="test-topic/test-topic_enu.top" topicName="test-topic" language="en_US" />
    </Topics>
    <IgnoredPaths>
        <Path src="README.md" />
        <Path src=".gitattributes" />
    </IgnoredPaths>
    <Translations auto-fill="en_US">
        <Translation name="translation_en_US" src="translations/translation_en_US.ts" language="en_US" />
    </Translations>
</Package>
