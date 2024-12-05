unit uInicial;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
   ComCtrls, Menus, Calendar, Spin, Buttons, DateTimePicker, RichMemo,
   uplaysound, HtmlView, LCLIntf, HtmlGlobals, LCLType;

type

   { TfrmInicial }

   TfrmInicial = class(TForm)
      BitBtn1: TBitBtn;
      btnPlaySoundWav: TButton;
      btnSonsDoSistema: TButton;
      btnStopSoundWav: TButton;
      btnWarningMessageBox: TButton;
      btnInputBox: TButton;
      btnCopiarPasta: TButton;
      btnAboutMessageBox: TButton;
      btnInfoMessageBox: TButton;
      btnOpenFileDialog: TButton;
      btnSaveFileDialog: TButton;
      btnPastasDoSistema: TButton;
      btnMoverPasta: TButton;
      btnRenomearPasta: TButton;
      btnRenomearArquivo: TButton;
      btnMoverArquivo: TButton;
      btnGravarTexto: TButton;
      btnLerTexto: TButton;
      btnLerTextoTodo: TButton;
      btnApagarArquivo: TButton;
      btnCopiarArquivo: TButton;
      btnCriarPasta: TButton;
      btnExcluirPasta: TButton;
      btnFolderBrowse: TButton;
      btnFontDialog: TButton;
      btnColorDialog: TButton;
      btnMessageBoxQuestion: TButton;
      btnErrorMessageBox: TButton;
      Button1: TButton;
      btnOpenDocument: TButton;
      btnOpenUrl: TButton;
      btnOpenDocInHtmlViewer: TButton;
      btnSobreLinks: TButton;
      Calendar1: TCalendar;
      DateTimePicker1: TDateTimePicker;
      gbTStringList: TGroupBox;
      gbMessageDialogs: TGroupBox;
      gbOutros: TGroupBox;
      gbDateThings: TGroupBox;
      HtmlViewer1: THtmlViewer;
      Image1: TImage;
      Image2: TImage;
      Label1: TLabel;
      Label2: TLabel;
      MainMenu1: TMainMenu;
      MenuItem1: TMenuItem;
      MenuItem2: TMenuItem;
      PageControl: TPageControl;
      Panel1: TPanel;
      Panel2: TPanel;
      playsound1: Tplaysound;
      RichMemo1: TRichMemo;
      StatusBar1: TStatusBar;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      procedure btnAboutMessageBoxClick(Sender: TObject);
      procedure btnApagarArquivoClick(Sender: TObject);
      procedure btnErrorMessageBoxClick(Sender: TObject);
      procedure btnGravarTextoClick(Sender: TObject);
      procedure btnInfoMessageBoxClick(Sender: TObject);
      procedure btnLerTextoClick(Sender: TObject);
      procedure btnLerTextoTodoClick(Sender: TObject);
      procedure btnMessageBoxQuestionClick(Sender: TObject);
      procedure btnOpenDocInHtmlViewerClick(Sender: TObject);
      procedure btnOpenDocumentClick(Sender: TObject);
      procedure btnOpenUrlClick(Sender: TObject);
      procedure btnPlaySoundWavClick(Sender: TObject);
      procedure btnSobreLinksClick(Sender: TObject);
      procedure btnStopSoundWavClick(Sender: TObject);
      procedure btnWarningMessageBoxClick(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure HtmlViewer1HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: boolean);
      procedure MenuItem2Click(Sender: TObject);
      procedure TabSheet3Show(Sender: TObject);
   private

   public

   end;

var
   frmInicial: TfrmInicial;

const
   caminhoSom = 'D:\Programas\Musica\Alice Cooper\HowYouGonnaSeeMeNow.wav';
   endUrl = 'https://www.oracaodejesus.com';
   endDoc =
      'D:\Lazarus\lzProjetos\Exemplos\assets\HtmlViwerEx\index.html';
   //endFile = 'D:\Lazarus\Projetos\Exemplos\assets\exemplo.html';

implementation

{$R *.lfm}

{ TfrmInicial }

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
   PageControl.ActivePage := TabSheet1;
end;

procedure TfrmInicial.HtmlViewer1HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: boolean);
begin
   // uses LCLIntf
   OpenUrl(SRC);
end;

procedure TfrmInicial.MenuItem2Click(Sender: TObject);
begin
   Close();
end;

procedure TfrmInicial.TabSheet3Show(Sender: TObject);
begin
   HtmlViewer1.LoadFromFile(endDoc); // endDoc = constante acima
end;

procedure TfrmInicial.btnGravarTextoClick(Sender: TObject);
var
   arquivo: TStringList; // Declara-se a TStringList
   DataAtual: TDateTime;
   DataString: string;
   HoraAtual: string;
begin
   // Defino data e hora primeiro
   DataAtual := Now;
   DataString := FormatDateTime('dd/mm/yyyy', DataAtual);
   HoraAtual := FormatDateTime('hh:nn', DataAtual);

   arquivo := TStringList.Create; // Cria-se a TStringList
   // Escrevo o conteúdo desejado
   arquivo.Add('Eduardo Volpi de Almeida');
   arquivo.Add('Rua Willis Roberto Banks 549 apto.72C');
   arquivo.Add('05128-000 - São Paulo - SP');
   arquivo.Add('');
   arquivo.Add('Gravado em ' + DataString + ' às ' + HoraAtual);
   // Salvo para um arquivo de texto
   arquivo.SaveToFile('arqtexto.txt');
   // Fecho / Libero
   QuestionDlg('Exemplos', 'Arquivo Gravado!', mtInformation, [mrYes, 'OK'], 0);
   arquivo.Free;
end;

procedure TfrmInicial.btnInfoMessageBoxClick(Sender: TObject);
begin
   // Apenas Windows
   MessageBox(0, 'Mensagem de Informação do Windows', 'Título da Janela',
      MB_OK or MB_ICONINFORMATION);

   // Multiplataforma
   MessageDlg('Aviso', 'Mensagem de Informação Multiplataforma.',
      mtInformation, [mbOK], 0);
end;

procedure TfrmInicial.btnApagarArquivoClick(Sender: TObject);
var
   arquivo: string;
begin
   arquivo := 'arqtexto.txt';
   if (FileExists(arquivo)) then
   begin
      if QuestionDlg('Exemplos', 'Tem certeza que deseja apagar este arquivo?',
         mtConfirmation, [mrYes, 'Sim', mrNo, 'Não'], 0) = mrYes then
      begin
         DeleteFile(arquivo);
         QuestionDlg('Exemplos', 'Arquivo Apagado!', mtInformation, [mrYes, 'OK'], 0);
      end;
   end
   else
      QuestionDlg('Exemplos', 'Arquivo Inexistente!', mtInformation, [mrYes, 'OK'], 0);
end;

procedure TfrmInicial.btnAboutMessageBoxClick(Sender: TObject);
begin

end;

procedure TfrmInicial.btnErrorMessageBoxClick(Sender: TObject);
begin
   // Apenas Windows
   MessageBox(0, 'Mensagem de Erro do Windows', 'Título da Janela',
      MB_OK or MB_ICONERROR);

   // Multiplataforma
   MessageDlg('Aviso', 'Mensagem de Erro Multiplataforma.', mtError, [mbOK], 0);
end;

procedure TfrmInicial.btnLerTextoClick(Sender: TObject);
var
   arquivo: TStringList;
   i: integer;
begin
   arquivo := TStringList.Create;
   arquivo.LoadFromFile('arqtexto.txt');

   for i := 0 to arquivo.Count - 1 do
      ShowMessage(arquivo.Strings[i]);

   arquivo.Free;
end;

procedure TfrmInicial.btnLerTextoTodoClick(Sender: TObject);
var
   arquivo: TStringList;
begin
   arquivo := TStringList.Create;
   arquivo.LoadFromFile('arqtexto.txt');
   ShowMessage(arquivo.Text);

   arquivo.Free;
end;

procedure TfrmInicial.btnMessageBoxQuestionClick(Sender: TObject);
begin
   // Exemplo Windows Somente:  uses LCLType
   if MessageBox(0, 'Deseja continuar?', 'Confirmação', MB_YESNO or MB_ICONQUESTION) = idYes then
      ShowMessage('Você escolheu Sim')
   else
      ShowMessage('Você escolheu Não');

   // Exemplo Multiplataforma
   if QuestionDlg('Sair', 'Tem certeza que deseja sair da aplicação?', mtConfirmation,
      [mrYes, 'Sair', mrCancel, 'Cancelar'], 0) = mrYes then
      ShowMessage('Você escolheu Sim');

end;

procedure TfrmInicial.btnOpenDocInHtmlViewerClick(Sender: TObject);
begin
   PageControl.ActivePage := TabSheet3;
end;

procedure TfrmInicial.btnOpenDocumentClick(Sender: TObject);
begin
   //uses LCLIntf
   OpenDocument(endDoc);
end;

procedure TfrmInicial.btnOpenUrlClick(Sender: TObject);
begin
   // uses LCLIntf
   OpenUrl(endUrl);
end;

procedure TfrmInicial.btnPlaySoundWavClick(Sender: TObject);
begin
   if (FileExists(caminhoSom)) then
   begin
      playsound1.SoundFile := caminhoSom;
      playsound1.Execute;
   end
   else
      QuestionDlg('Exemplos', 'Arquivo Não Localizado!', mtError, [mrYes, 'OK'], 0);

end;

procedure TfrmInicial.btnSobreLinksClick(Sender: TObject);
begin
   QuestionDlg('Sobre Links',
      'Links devem ser tratados no evento "OnHotSpotClick" do HtmlViewer. ' +
      'Veja exemplo acessando o evento citado.',
      mtInformation, [mrYes, 'OK'], 'HelpKeyWordEdit');

end;

procedure TfrmInicial.btnStopSoundWavClick(Sender: TObject);
begin
   playsound1.StopSound;
end;

procedure TfrmInicial.btnWarningMessageBoxClick(Sender: TObject);
begin
   // Apenas Windows
   MessageBox(0, 'Mensagem de Aviso do Windows', 'Título da Janela',
      MB_OK or MB_ICONWARNING);

   // Multiplataforma
   MessageDlg('Aviso', 'Mensagem de Aviso Multiplataforma.', mtWarning, [mbOK], 0);
end;

procedure TfrmInicial.Button1Click(Sender: TObject);
begin

end;

end.
