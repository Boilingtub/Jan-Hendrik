//JAN-HENDRIK BRINK
//2020-10-10 PAT

unit uEncryptionAlgorythem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls , Math,
  Vcl.ExtCtrls , Shellapi, Vcl.OleCtrls, SHDocVw, Vcl.Buttons;

  const
   CHARACTERSAMOUNT = 256;

type
    TForm1 = class(TForm)
    RedtOutput: TRichEdit;
    edtPlaintextinput: TEdit;
    btnProcess: TButton;
    btnDecrypt: TButton;
    edtDecrypt: TEdit;
    cbWriteToFile: TCheckBox;
    cbReadfromFile: TCheckBox;
    btnClearFile: TButton;
    lblannotationsyntax: TLabel;
    edtClock: TEdit;
    Timer1: TTimer;
    edtPassword: TEdit;
    lblStrengthscore: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bmbLinkToHTML: TBitBtn;
    procedure btnProcessClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure StartupSetup(Sender: TObject);
    procedure btnClearFileClick(Sender: TObject);
    procedure cbReadfromFileClick(Sender: TObject);
    procedure cbWriteToFileClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure bmbLinkToHTMLClick(Sender: TObject);


  private


   TCharacters : array of integer;
   TtempArray : array of integer;
   TEncryptNumbers  : array of Integer;
   EncryptionFile : textfile;
   sReadFileName , sWriteFileName : string;
   ByteBtnDecryptSecondsCOunter : byte;

  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//INTTOBIN FUNCTION  3 - 11000
function IntToCharBin(INumber: integer): string;
var
  IBinCount : Integer;
  cBinCharvalue : Char;
  sOutput : string;
begin
for IBinCount := 0 to 15 do
begin
  if odd(iNumber) then
  cBinCharvalue := '—'//represents 1 in binary
  else
  cBinCharvalue := '–';//represents 0 in binary
 Insert(cBinCharValue , sOutput , soutput.Length+1);
 iNumber := iNumber DIV 2;
end;
Result := sOutput;
end;



//BINARYTOINT FUNCTION 11000 - 3
Function CharBinToInt(sBinaryNumstring : string): integer;
var
iBincount , iBinaryNumber , iNumber : integer;
begin
iBinaryNumber := 0;
iNumber := 0;
for iBinCount := 0 to 15 do
begin
if SBinaryNumString[iBinCount+1] = ('—') then
iBinaryNumber := 1
else
if SBinaryNumString[iBinCount+1] = ('–') then
iBinaryNumber := 0;
iNumber := iNumber + trunc(iBinaryNumber * Power(2 , iBinCount));
end;
Result := iNumber;
end;



//BOOLTOINT FUNCTION true = 1
Function Booltoint(bInputbool : boolean) : integer;
begin
  if bInputbool = true then
  Result := 1
  else if binputbool = false then
  Result := 0;
end;



//=============================================================================================================================================================================================================================================================




// ENCRYPT !!!!!
procedure TForm1.btnProcessClick(Sender: TObject);
var
IpopulateCount , iTTempArrayLength , iTempcOunt ,iTempCOunt1 ,iTempCount2 , iTempCount3 ,iRandomInt , iPasswordOrdValue , iCommentStartPos , iCommentEndPOS : integer;
sPlainText , sEncryptedText , sCurrentChar , sPlainPasswordText , sCommenttext , sTime  : string;

begin
sPlainPasswordText := edtPassword.Text; //Get password
iPasswordORdValue := 0;
for itempcount := 1 to sPlainpasswordtext.length do
  begin
   iPasswordORdValue := iPasswordordvalue + Ord(sPlainpasswordText[itempcount]);
  end;
   Redtoutput.Lines.add(inttostr(iPasswordORdValue));

RedtOutput.Clear;
Randomize;
iTTempArrayLength := CharactersAmount;
SetLength(TTempArray , CHARACTERSAMOUNT)  ;
SetLength(TEncryptNumbers , CHARACTERSAMOUNT);
for IpopulateCount := 0 to CharactersAmount do
begin

TEncryptNumbers[IpopulateCount] := IpopulateCount;
TTempArray[IPopulateCount] := iPopulateCount;

end;

 //Generate key
for iTempCount := CHARACTERSAMOUNT downto 1 do
begin

 iTTempArrayLength := iTTempArrayLength - 1;
 iRandomInt := Random(iTTempArrayLength);
 TEncryptNumbers[iTempCount] := TTempArray[iRandomInt];
 TTempArray[IRandomInt] := TTempArray[iTempCount];
 insert(inttoCharBin(TEncryptNumbers[iTempCount] + iPasswordORdvalue ) , sEncryptedText , SEncryptedText.Length+1 ); //MAKEING KEY (Encrypt) With Numbers and Converting to CharBin
 end;

//Insert Integer representing password length
insert(inttoCharBin(sPlainPasswordText.Length) ,sEncryptedText , sEncryptedText.Length+1); //Insert Length of Password

//Encrypt Password to be part of the output string
for ITempCount1 := 1 to sPlainPasswordText.Length do
begin
     sCurrentChar := Copy(sPlainPasswordText , 1 ,1);
     Delete(sPlainPasswordText ,1 ,1);

for iTempCount2 := 1 to CharactersAmount do
   begin

   if chr(TCharacters[iTempCount2]) = sCurrentChar then
   insert(inttoCharBin(TEncryptNumbers[iTempCount2]) , sEncryptedText , SEncryptedText.Length+1);  //Inserting Numbers and Converting them to CharBin in to sEncryptedText

   end;

end;


//Read From TextFile
 if cbReadFromFile.Checked = false then
 sPlainText := edtPlainTextInput.Text
 else if cbReadFromFile.Checked = true then
 begin
 AssignFile(EncryptionFile, sReadFileName);
 Reset(EncryptionFile);
 RedtOutput.Lines.LoadFromFile(sReadFileName);
 sPlainText := RedtOutput.Text;
 CloseFile(EncryptionFile) ;
 Showmessage('Read Plain Text From : ' + sReadFileName);
 RedtOutput.Lines.Clear;
 end;
//Here !


//Get Comment in Plaintext
for itempcount := 1 to sPlaintext.Length DIV 4 do
begin
iCommentstartPos := pos('/*' , splaintext);
icommentendpos := pos('*\' , splaintext);
sCommentTExt := sCommentText +  ' ' + copy(sPlaintext , iCommentStartPos+2 , iCommentENdPos - (iCommentStartPOs+2));
Delete(sPlaintext , iCommentStartPos , iCommentENdPos+2 - iCommentStartPOs);
end;
insert( '      —' , scommenttext , scommenttext.length+1);


//Encrypt PlainText
 for iTempCount2 := 1 to sPlaintext.Length do
  begin

   sCurrentChar  := Copy(sPlainText ,1 , 1);
   Delete(sPlainText ,1 , 1) ;

   for iTempCount3 := 1 to CharactersAmount do
   begin

   if chr(TCharacters[iTempCount3]) = sCurrentChar then
   insert(inttoCharBin(TEncryptNumbers[iTempCount3] + SPlaintext.length) , sEncryptedText , SEncryptedText.Length+1 );  //Inserting Numbers and Converting them to CharBin in to sEncryptedText

   end;
  end;


  insert(scommenttext , SEncryptedText , 0);

 //Write to Text FIle
 if cbWriteToFile.Checked = true then
 begin

 AssignFile(EncryptionFile, sWriteFileName);
 ReWrite(EncryptionFile);
 Writeln(EncryptionFile , sEncryptedText);
 CloseFile(EncryptionFile)   ;
 Showmessage('Written Encrypted Text To : ' + sWriteFileName);

 end;

 //Here !!
 edtpassword.Text := '';
 cbReadFromFile.Checked := false ;
 cbWriteTOFile.Checked := false;
 RedtOutput.Lines.Add(sEncryptedText);

end;





//=============================================================================================================================================================================================================================================================



//DECRYPT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TForm1.btnDecryptClick(Sender: TObject);
var
iTempCount , iTempCount1 , iTempCount2 , iTempCount3 , iTempCount4 , iPasswordLength , iPasswordOrdValue ,icommentendpos  : integer;
sPlainText , sEncryptedText , sKeyText , sEncryptedPasswordText , sInputPasswordText , SKeySnippet , sCurrentSnippet : string;
begin

btnDecrypt.Enabled := false;

sInputPAsswordText := inputbox('Password','please enter the password for the text you wish to decrypt','');   //get password
iPasswordORdValue := 0;

//get password ord value
for itempcount := 1 to sInputpasswordtext.length do
  begin
   iPasswordORdValue := iPasswordordvalue + Ord(sInputpasswordText[itempcount]);//ascii values of Password characters added together
  end;
   Redtoutput.Lines.add(inttostr(iPasswordORdValue));

RedtOutput.Lines.Clear;

 //ReadFrom Text FIle
 if cbReadFromFile.Checked = false then
sEncryptedText := edtDecrypt.Text
else if cbReadFromFile.Checked = true then
begin
 AssignFile(EncryptionFile, sReadFileName);
 Reset(EncryptionFile);
 Readln(EncryptionFile , sEncryptedText);
 edtDecrypt.Text := sEncryptedText;
 CloseFile(EncryptionFile) ;
 Showmessage('Read Encrypted Text From : ' + sReadFileName);
end;
//End of ReadFrom Text File

//cut out comment

icommentendpos := pos('—' , sencryptedtext);
Delete(sEncryptedtext , 1 , iCommentENdPos);

//Get Key from string
SKeyText := Copy(SEncryptedText , 1 , CharactersAmount * 16);
Delete(sEncryptedText ,1 , CharactersAmount * 16);

for iTempCount :=  CharactersAmount downto 1 do
begin

SKeySnippet := Copy(sKeyText , 1 , 16) ;
tEncryptNumbers[iTempCount] := CharBintoint(sKeySnippet) - ipasswordordvalue;//get and Apply key to each space in TENcryptNUmbers Array so it can be readed and minus the Password ord value to make it readable
Delete(sKeyText ,1 ,16);

end;

//Start Decypting password
iPasswordLength := Charbintoint(Copy(sEncryptedText ,1 ,16)); //Get Password length
Delete(sEncryptedTExt ,1 ,16);

 for iTempCount1 := 1 to iPasswordLength do
  begin

   sCurrentSnippet := Copy(sEncryptedText ,1 ,16);
   Delete(sEncryptedText ,1 ,16);

   for iTempcount2 := 0 to CharactersAmount do
   begin

   if TencryptNumbers[iTempCount2] = CharBintoint(sCurrentSnippet) then
   insert(chr(TCharacters[iTempCount2]) , sencryptedpasswordText , sencryptedpasswordtext.Length+1);

   end;

end;
//END of PAssword decryption

//Check if Password is correct !!
 if NOT (sinputpasswordtext = sencryptedpasswordtext) then
 begin
 edtDecrypt.Clear;
 edtPlainTextInput.clear;
 showmessage('the password you have entered is incorrect');
 Exit;
 end;


 //Start decrypting rest of string
 for iTempCOunt3 := 1 to sEncryptedText.Length DIV 16 do
   begin

   sCUrrentSnippet := Copy(sEncryptedText , 1 ,16);
   Delete(sEncryptedText ,1 ,16);

   for iTempCount4 := 0 to CharactersAmount do
   begin
   if TencryptNumbers[iTempCount4] = CharBintoint(sCurrentSnippet) - (SencryptedTExt.length DIV 16)  then
    insert(chr(TCharacters[iTempCount4]) , sPlainText , sPlainText.Length + 1);

   end;
   end;

   //Write to Text FIle
   if cbWritetoFile.Checked = true then
   begin
   AssignFile(EncryptionFile, sWriteFileName);
   Rewrite(EncryptionFile);
   Writeln(EncryptionFile , sPlainText);
   CloseFile(EncryptionFile)  ;
   Showmessage('Write Decrypted Text TO : ' + sWriteFileName);
   end;
   //Here

 RedtOutput.Lines.Add(sPlainText);
 cbReadFromFile.Checked := false ;
 cbWriteTOFile.Checked := false;
 edtDecrypt.Clear;

end;

  //END OF DECRYPTION !!




//====================================================================================================================================================




 procedure TForm1.bmbLinkToHTMLClick(Sender: TObject);
var
exeDir : string;
begin
ExeDir := ExtractFileDir(Application.ExeName);
ShellExecute(Handle, 'open',
'https://boilingtub.github.io/ITPAT-Website/',nil,nil, SW_SHOWNORMAL) ;
end;




//=============================================================================================================================================================================================================================================================



//Click Read from file check box
procedure TForm1.cbReadfromFileClick(Sender: TObject);
var   openDialogbox : TopenDialog;
begin

if cbReadFromFile.Checked = true then
begin
 openDialogbox := TOpenDialog.Create(self);

 if openDialogbox.Execute then
 begin
 RedtOutput.Lines.Add('Selected Read Text File : '+ openDialogbox.FileName);
 sReadFileName := openDialogbox.FileName;
 end;

edtDecrypt.Text := 'Reading from : ' + sReadFileName;
edtPlainTextInput.text := 'Reading from : ' + sReadFileName;

end;
if cbReadFromFIle.Checked = false then
begin
edtDecrypt.Text := '';
edtPlainTextInput.text := '';
sReadFileName := '';
RedtOutput.Lines.Add('');
RedtOutput.Lines.Add('//You are nolonger reading from a text file//');
RedtOutput.Lines.Add('');
end;
end;


 //=============================================================================================================================================================================================================================================================



//Click om Write to file check box
procedure TForm1.cbWriteToFileClick(Sender: TObject);
var   openDialogbox : TopenDialog;
begin
if cbWriteToFile.Checked = true then
begin
 openDialogbox := TOpenDialog.Create(self);

 if openDialogbox.Execute then
 begin
 RedtOutput.Lines.Add('Selected Write Text File : '+ openDialogbox.FileName);
 sWriteFileName := openDialogbox.FileName;
 end;
end;
if cbWritetoFIle.Checked = false then
begin
sWriteFileName := '';
RedtOutput.Lines.Add('');
RedtOutput.Lines.Add('//You are nolonger Writing to a text file//');
RedtOutput.Lines.Add('');
end;
end;

//=====================================================================================================================================


//Password rating
procedure TForm1.edtPasswordChange(Sender: TObject);
const
SPECIALCHARS : array[1..32] of string = ('~','`','!','@','#','$','%','^','&','*','(',')','+','=','-','_','{','}','[',']','|','\',';',':','''','"','<',',','>','.','/','?');
var
spasswordtext ,sClassification : string;
iscore : byte;
icounter , icounter2 : integer;
bMoreThan8 , bupchar , blowchar , bnum , b2num , bspecial , b2Special , bMoreThan4 , bMoreThan12 , bMoreThan16 ,bMoreThan20 ,bMoreThan24 ,bMoreThan28 , bMOreThan32 ,bMoreThan36 : bool;
begin
spasswordtext := edtPassword.Text;
iScore := 0;
bMoreThan8  := false;
bupchar  := false;
blowchar  := false;
bnum  := false;
b2NUm := false;
bspecial := false;
bMoreThan4 := false;
bMoreThan16 := false;
bMoreThan20 := false;
bMoreThan12 := false;
b2Special := false;
bMoreThan24 := false;
bMoreThan28 := false;
bMoreThan32 := false;
bMoreThan36 := false;

//length scores
if spasswordtext.Length > 4 then
bMoreThan4 := true  ;
if spasswordtext.Length > 8 then
bMoreThan8 := true;
if spasswordtext.Length > 12 then
bMoreThan12 := true;
if spasswordtext.Length > 16 then
bMoreThan16 := true;
if spasswordtext.Length > 20 then
bMoreThan20 := true;
if spasswordtext.Length > 24 then
bMoreThan24 := true;
if spasswordtext.Length > 28 then
bMoreThan28 := true;
if spasswordtext.Length > 32 then
bMoreThan32 := true;
if spasswordtext.Length > 36 then
bMoreThan36 := true;



for icounter := 1 to spasswordtext.length do
begin
if Charinset(spasswordtext[icounter] , ['a'..'z']) then  //point for lowercase character
blowchar := true;
if Charinset(spasswordtext[icounter] , ['A'..'Z']) then //point for uppercase character
bupchar := true;
if (Charinset(spasswordtext[icounter] , ['0'..'9'])) AND (bnum = true) then  //point for 2 numbers
b2num := true;
if Charinset(spasswordtext[icounter] , ['0'..'9']) then  //point for number
bnum := true;

for icounter2 := 1 to 32 do
 begin
 if ((spasswordtext[icounter]) = SpecialChars[iCounter2]) AND (bSpecial = true) then
 b2special := true;
 end;

 for icounter2 := 1 to 32 do
 begin
 if (spasswordtext[icounter]) = SpecialChars[iCounter2] then //point for special 2 characters
 bSpecial := true;
end;

//Add up bools to get score

 iScore := booltoint(blowchar) + booltoint(bupChar) + booltoint(bnum) + booltoint(b2num) + booltoint(bspecial) + booltoint(b2special) + booltoint(bMoreThan4) + booltoint(bMoreThan8) + booltoint(bMoreThan12) + booltoint(bMoreThan16) + booltoint(bMoreThan20) + booltoint(bMoreThan24) + booltoint(bMoreThan28) + booltoint(bMoreThan32) + booltoint(bMoreThan36);


 //get classification for score
if iScore <= 1 then
begin
sclassification := '. None existant';
lblStrengthscore.font.Color := claqua;
end
else if iScore <= 3 then
begin
sclassification := '. Very weak';
lblStrengthscore.font.Color := clred;
end
else if iScore <= 5 then
begin
sclassification := '. Weak';
lblStrengthscore.font.Color := clmaroon;
end
else if iScore <= 7 then
begin
sclassification := '. Ok';
lblStrengthscore.font.Color := clyellow;
end
else if iScore <= 9 then
begin
sclassification := '. Strong';
lblStrengthscore.font.Color := clgreen;
end
else if iScore <= 11 then
begin
sclassification := '. Very Strong';
lblStrengthscore.font.Color := clBlue;
end;
end;

lblStrengthscore.caption := inttostr(iScore) + sClassification;

end;




//=============================================================================================================================================================================================================================================================


//BTNCLEAR

procedure TForm1.btnClearFileClick(Sender: TObject);
begin
 AssignFile(EncryptionFile, sReadFileName);
 Rewrite(EncryptionFile)  ;
 Showmessage('Cleared : ' + sReadFileName);
 CloseFile(EncryptionFile);
 RedtOutput.Lines.Clear;
 edtPlaintextinput.Clear;
 edtDecrypt.Clear;
end;


//=============================================================================================================================================================================================================================================================



//STARTUP
procedure TForm1.StartupSetup(Sender: TObject);
var
iPopulateCount : integer;
begin
RedtOutput.Clear;
SEtlength(tCharacters , CHARACTERSAMOUNT); //set array lenghts
SetLength(TTempArray , CHARACTERSAMOUNT)  ;
SetLength(TEncryptNumbers , CHARACTERSAMOUNT);
for IpopulateCount := 0 to CharactersAmount do
begin

tCharacters[ipopulatecount] := ipopulatecount; //populate Array with integers 0..256
TEncryptNumbers[IpopulateCount] := IpopulateCount;
TTempArray[IPopulateCount] := iPopulateCount;

end;
end;


//============================================================================================================================================================================================================================================================


procedure TForm1.Timer1Timer(Sender: TObject);
var
tclocktime : Ttime;
begin

//clock
tclocktime := now;
edtclock.Text :=  'Current time is : ' + formatdatetime('hh/nn' , tclocktime);

//Delay when decrypting
if btnDecrypt.Enabled = false then
 Inc(ByteBtnDecryptSecondsCOunter);
if ByteBtnDecryptSecondsCOunter > 5 then
begin
btnDecrypt.Enabled := true;
ByteBtnDecryptSecondsCOunter := 0;
end;
end;

end.
