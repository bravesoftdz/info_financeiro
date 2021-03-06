unit uFrmCadContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, Mask, DBXpress;

type
  TfrmCadContasReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    dsContasReceber: TDataSource;
    Label1: TLabel;
    cmbLoja: TDBLookupComboBox;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    cmbCliente: TDBLookupComboBox;
    Label4: TLabel;
    dbeDTMOVI: TDBEdit;
    Label5: TLabel;
    dbeDTVENC: TDBEdit;
    Label6: TLabel;
    dbeValor: TDBEdit;
    Label7: TLabel;
    dbeDescricao: TDBMemo;
    DBEdit1: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure dsContasReceberStateChange(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeDTMOVIExit(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasReceber: TfrmCadContasReceber;
  TD : TTransactionDesc;

implementation

uses uDm2, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadContasReceber.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadContasReceber.dsContasReceberStateChange(Sender: TObject);
begin
  If (dm2.cdsContasReceber.Active = True) Then
  Begin
    BtAdicionar.Enabled := dsContasReceber.State in [dsBrowse];
    BtSair.Enabled := dsContasReceber.State in [dsBrowse];
    //
    BtCancelar.Enabled  := dsContasReceber.State in [dsInsert, dsEdit];
    BtGravar.Enabled    := dsContasReceber.State in [dsInsert, dsEdit];
  End
  Else
  begin
    BtAdicionar.Enabled := False;
    BtSair.Enabled := True;
    //
    BtCancelar.Enabled  := False;
    BtGravar.Enabled    := False;
  End;
end;

procedure TfrmCadContasReceber.BtAdicionarClick(Sender: TObject);
Var
   M_NRCRED : Integer;
begin
    //tratabotoes;
    dm.parametros;
    M_NRCRED := dm.CdsConfigCFG_CREDITO.AsInteger + 1;
    //
    DM2.cdsContasReceber.Close;
    With dm2.dstContasReceber do
    Begin
         Active := False;
         CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)';
         Params.ParamByName('pCREDITO').AsInteger := M_NRCRED;
         Active := True;
    End;
    DM2.cdsContasReceber.Open;
    //
    DM2.cdsContasReceber.Append;
    DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger      := M_NRCRED;
    DM2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime := Date();
    DM2.cdsContasReceber.FieldByName('REC_SITUACAO').AsString      := 'A';
    DM2.cdsContasReceber.FieldByName('REC_USUARIO').AsInteger      := StrtoInt(uFrmAdmin.M_CDUSUA);
    cmbLoja.SetFocus;
end;

procedure TfrmCadContasReceber.BtCancelarClick(Sender: TObject);
begin
     DM2.cdsContasReceber.Cancel;
end;

procedure TfrmCadContasReceber.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(cmbLoja.Text) Then
     Begin
         Application.MessageBox('Selecione a loja!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         cmbLoja.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(cmbCliente.Text) Then
     Begin
           Application.MessageBox('Selecione o cliente!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbCliente.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(dbeDTMOVI.Text) Then
     Begin
           Application.MessageBox('Digite a data do movimento!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDTMOVI.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(dbeDTVENC.Text) Then
     Begin
           Application.MessageBox('Digite a data do vencimento!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDTVENC.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(dbeValor.Text) Then
     Begin
           Application.MessageBox('Digite o valor!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeValor.SetFocus;
           Exit;
     End;
     // Inicia um transa��o no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     Try
        If (DM2.cdsContasReceber.State in [dsInsert]) Then
        Begin
             dm.parametros;
             dm.CdsConfig.Edit;
             dm.CdsConfigCFG_CREDITO.AsInteger := dm.CdsConfigCFG_CREDITO.AsInteger + 1;
             dm.CdsConfig.Post;
             dm.CdsConfig.ApplyUpdates(0);
             //
             DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger :=
               dm.CdsConfigCFG_CREDITO.AsInteger;
             dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsInteger    := 1;
             dm2.cdsContasReceber.FieldByName('REC_QTPARCELAS').AsInteger := 1;
        End;
        DM2.cdsContasReceber.Post;
        DM2.cdsContasReceber.ApplyUpdates(0); 
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
        //
        MessageBox (Application.Handle, pChar('Registro gravado com sucesso!!!'),
                     'ATEN��O',MB_ICONINFORMATION+ MB_OK);
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar gravar registro!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transa��o no BD.
              Dm.SqlAdmin.Rollback(TD);
              //
              Close;
        End;
     End;
end;

procedure TfrmCadContasReceber.dbeDTMOVIExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsInsert, dsEdit]) Then
     begin
           try
              StrToDate(dbeDTMOVI.Text);
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTMOVI.Clear;
                     dbeDTMOVI.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadContasReceber.dbeDTVENCExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsInsert, dsEdit]) Then
     begin
           try
              StrToDate(dbeDTVENC.Text);
              //
              If (StrtoDate(dbeDTVENC.Text) < StrtoDate(dbeDTMOVI.Text)) Then
              begin
                   Application.MessageBox(PChar('Data de vencimento menor que a '+
                                               'de movimento!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTVENC.Clear;
                   dbeDTVENC.SetFocus;
                   Exit;
              End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTVENC.Clear;
                     dbeDTVENC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadContasReceber.dbeDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     Key:= Upcase(Key);
end;

procedure TfrmCadContasReceber.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
