//=============================================================================
// UMSMarineVoice - GFour
// Note to mappers: you can place this in your level to have marines say new things!
// Where all the code to call specific voice lines reside.
//=============================================================================
class UMSMarineVoice extends UMSTools;

Struct ListAcquirePhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

Struct ListHelpPhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

Struct ListChargePhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

Struct ListKillPhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

Struct ListRespondPhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

Struct ListBetrayPhrase
{
	var() sound Male[12];
	var() sound Female[12];
};

var() ListAcquirePhrase AcquirePhrases;
var() ListHelpPhrase HelpPhrases;
var() ListChargePhrase ChargePhrases;
var() ListKillPhrase KillPhrases;
var() ListRespondPhrase RespondPhrases;
var() ListBetrayPhrase BetrayPhrases;

var sound Phrase;
var UMSSpaceMarine Marine;

//AcquirePhrases
Function GetPhraseAcquiredMale()
{
	Phrase=AcquirePhrases.Male[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

Function GetPhraseAcquiredFemale()
{
	Phrase=AcquirePhrases.Female[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

//HelpPhrases
Function GetPhraseHelpMale()
{
	Phrase=HelpPhrases.Male[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

Function GetPhraseHelpFemale()
{
	Phrase=HelpPhrases.Female[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

//ChargePhrases
Function GetPhraseChargeMale()
{
	Phrase=ChargePhrases.Male[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

Function GetPhraseChargeFemale()
{
	Phrase=ChargePhrases.Female[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

//KillPhrases
Function GetPhraseKillMale()
{
	Phrase=KillPhrases.Male[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

Function GetPhraseKillFemale()
{
	Phrase=KillPhrases.Female[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

//RespondPhrases
Function GetPhraseRespondMale()
{
	Phrase=RespondPhrases.Male[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

Function GetPhraseRespondFemale()
{
	Phrase=RespondPhrases.Female[Rand(12)];

	if(bLogStuff)
	Log(Phrase);
}

defaultproperties
{
	AcquirePhrases=(Male[0]=Sound'UMSMarinesII.Voice.Ms106',Male[1]=Sound'UMSMarinesII.Voice.Ms206a',Male[2]=Sound'UMSMarinesII.Voice.Ms206b',Male[3]=Sound'UMSMarinesII.Voice.incomingm',Male[4]=Sound'UMSMarinesII.Voice.lockm',Male[5]=Sound'UMSMarinesII.Voice.lookoutm',Male[6]=Sound'UMSMarinesII.Voice.companym',Male[7]=Sound'UMSMarinesII.Voice.Ms106',Male[8]=Sound'UMSMarinesII.Voice.Ms206a',Male[9]=Sound'UMSMarinesII.Voice.Ms206b',Male[10]=Sound'UMSMarinesII.Voice.incomingm',Male[11]=Sound'UMSMarinesII.Voice.lookoutm',Female[0]=Sound'UMSMarinesII.Voice.Ms306a',Female[1]=Sound'UMSMarinesII.Voice.Ms306b',Female[2]=Sound'UMSMarinesII.Voice.incomingf',Female[3]=Sound'UMSMarinesII.Voice.lookoutf',Female[4]=Sound'UMSMarinesII.Voice.heref',Female[5]=Sound'UMSMarinesII.Voice.companyf',Female[6]=Sound'UMSMarinesII.Voice.Ms306b',Female[7]=Sound'UMSMarinesII.Voice.Ms306a',Female[8]=Sound'UMSMarinesII.Voice.incomingf',Female[9]=Sound'UMSMarinesII.Voice.lookoutf',Female[10]=Sound'UMSMarinesII.Voice.heref',Female[11]=Sound'UMSMarinesII.Voice.companyf')
	HelpPhrases=(Male[0]=Sound'UMSMarinesII.Voice.Ms114',Male[1]=Sound'UMSMarinesII.Voice.Ms214a',Male[2]=Sound'UMSMarinesII.Voice.Ms214b',Male[3]=Sound'UMSMarinesII.Voice.Ms209a',Male[4]=Sound'UMSMarinesII.Voice.Ms209b',Male[5]=Sound'UMSMarinesII.Voice.Ms109',Male[6]=Sound'UMSMarinesII.Voice.Ms104',Male[7]=Sound'UMSMarinesII.Voice.Ms204a',Male[8]=Sound'UMSMarinesII.Voice.Ms204b',Male[9]=Sound'UMSMarinesII.Voice.backupm',Male[10]=Sound'UMSMarinesII.Voice.Ms104',Male[11]=Sound'UMSMarinesII.Voice.Ms204b',Female[0]=Sound'UMSMarinesII.Voice.Ms304a',Female[1]=Sound'UMSMarinesII.Voice.Ms304b',Female[2]=Sound'UMSMarinesII.Voice.Ms309a',Female[3]=Sound'UMSMarinesII.Voice.Ms309b',Female[4]=Sound'UMSMarinesII.Voice.Ms314a',Female[5]=Sound'UMSMarinesII.Voice.Ms314b',Female[6]=Sound'UMSMarinesII.Voice.backupf',Female[7]=Sound'UMSMarinesII.Voice.Ms304a',Female[8]=Sound'UMSMarinesII.Voice.Ms309a',Female[9]=Sound'UMSMarinesII.Voice.Ms314a',Female[10]=Sound'UMSMarinesII.Voice.backupf',Female[11]=Sound'UMSMarinesII.Voice.Ms304a')
	ChargePhrases=(Male[0]=Sound'UMSMarinesII.Voice.Ms111',Male[1]=Sound'UMSMarinesII.Voice.Ms211a',Male[2]=Sound'UMSMarinesII.Voice.Ms211b',Male[3]=Sound'UMSMarinesII.Voice.Ms212a',Male[4]=Sound'UMSMarinesII.Voice.Ms212b',Male[5]=Sound'UMSMarinesII.Voice.Ms213a',Male[6]=Sound'UMSMarinesII.Voice.Ms213b',Male[7]=Sound'UMSMarinesII.Voice.Ms113',Male[8]=Sound'UMSMarinesII.Voice.Ms205a',Male[9]=Sound'UMSMarinesII.Voice.Ms205b',Male[10]=Sound'UMSMarinesII.Voice.Ms105',Male[11]=Sound'UMSMarinesII.Voice.Ms112',Female[0]=Sound'UMSMarinesII.Voice.Ms305a',Female[1]=Sound'UMSMarinesII.Voice.Ms305b',Female[2]=Sound'UMSMarinesII.Voice.Ms311a',Female[3]=Sound'UMSMarinesII.Voice.Ms311b',Female[4]=Sound'UMSMarinesII.Voice.Ms312a',Female[5]=Sound'UMSMarinesII.Voice.Ms312b',Female[6]=Sound'UMSMarinesII.Voice.Ms307a',Female[7]=Sound'UMSMarinesII.Voice.Ms307b',Female[8]=Sound'UMSMarinesII.Voice.covermef',Female[9]=Sound'UMSMarinesII.Voice.gogof',Female[10]=Sound'UMSMarinesII.Voice.Ms313a',Female[11]=Sound'UMSMarinesII.Voice.Ms312b')
	KillPhrases=(Male[0]=Sound'UMSMarinesII.Voice.Ms110',Male[1]=Sound'UMSMarinesII.Voice.Ms115',Male[2]=Sound'UMSMarinesII.Voice.Ms116',Male[3]=Sound'UMSMarinesII.Voice.Ms210a',Male[4]=Sound'UMSMarinesII.Voice.Ms210b',Male[5]=Sound'UMSMarinesII.Voice.Ms215a',Male[6]=Sound'UMSMarinesII.Voice.Ms215b',Male[7]=Sound'UMSMarinesII.Voice.Ms216a',Male[8]=Sound'UMSMarinesII.Voice.sdownm',Male[9]=Sound'UMSMarinesII.Voice.nextonem',Male[10]=Sound'UMSMarinesII.Voice.scratchm',Male[11]=Sound'UMSMarinesII.Voice.thathurtm',Female[0]=Sound'UMSMarinesII.Voice.Ms310a',Female[1]=Sound'UMSMarinesII.Voice.Ms310b',Female[2]=Sound'UMSMarinesII.Voice.Ms315a',Female[3]=Sound'UMSMarinesII.Voice.Ms315b',Female[4]=Sound'UMSMarinesII.Voice.Ms316a',Female[5]=Sound'UMSMarinesII.Voice.Ms316b',Female[6]=Sound'UMSMarinesII.Voice.takethatf',Female[7]=Sound'UMSMarinesII.Voice.nastyf',Female[8]=Sound'UMSMarinesII.Voice.scratchf',Female[9]=Sound'UMSMarinesII.Voice.messf',Female[10]=Sound'UMSMarinesII.Voice.Ms316b',Female[11]=Sound'UMSMarinesII.Voice.Ms310b')
	RespondPhrases=(Male[0]=Sound'UMSMarinesII.Voice.onmywaym',Male[1]=Sound'UMSMarinesII.Voice.imonitm',Male[2]=Sound'UMSMarinesII.Voice.rogerm',Male[3]=Sound'UMSMarinesII.Voice.affirmativem',Male[4]=Sound'UMSMarinesII.Voice.willdom',Male[5]=Sound'UMSMarinesII.Voice.Ms108',Male[6]=Sound'UMSMarinesII.Voice.Ms208a',Male[7]=Sound'UMSMarinesII.Voice.Ms208b',Male[8]=Sound'UMSMarinesII.Voice.yougotitm',Male[9]=Sound'UMSMarinesII.Voice.Ms108',Male[10]=Sound'UMSMarinesII.Voice.Ms208a',Male[11]=Sound'UMSMarinesII.Voice.Ms208b',Female[0]=Sound'UMSMarinesII.Voice.Ms308a',Female[1]=Sound'UMSMarinesII.Voice.Ms308b',Female[2]=Sound'UMSMarinesII.Voice.onmywayf',Female[3]=Sound'UMSMarinesII.Voice.imonitf',Female[4]=Sound'UMSMarinesII.Voice.rogerf',Female[5]=Sound'UMSMarinesII.Voice.ten4f',Female[6]=Sound'UMSMarinesII.Voice.aquiref',Female[7]=Sound'UMSMarinesII.Voice.okf',Female[8]=Sound'UMSMarinesII.Voice.Ms308a',Female[9]=Sound'UMSMarinesII.Voice.Ms308b',Female[10]=Sound'UMSMarinesII.Voice.rogerf',Female[11]=Sound'UMSMarinesII.Voice.imonitf')
	bLogStuff=True
}