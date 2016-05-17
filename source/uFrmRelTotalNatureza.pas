unit uFrmRelTotalNatureza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit,
  FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TfrmRelTotalNatureza = class(TfrmRelatorio)
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    cbxReceita: TCheckBox;
    cbxDespesa: TCheckBox;
    dstDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsTotalPagar: TClientDataSet;
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    cdsTotalReceber: TClientDataSet;
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTotalNatureza: TfrmRelTotalNatureza;

implementation

uses uDmRelatorios, Udm, uFuncoes;

{$R *.dfm}

procedure TfrmRelTotalNatureza.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
        end;
     End;
  inherited;
end;

procedure TfrmRelTotalNatureza.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Per�odo inicial maior quer per�odo final!!!','ATEN��O',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTFINA.Date := Date();
             edtDTFINA.SetFocus;
             Exit;
          End;
        end;
     End;
  inherited;
end;

procedure TfrmRelTotalNatureza.FormShow(Sender: TObject);
begin
  inherited;
        edtDTINIC.Date := Date();
        edtDTFINA.Date := Date();
        //
        uFuncoes.Loja_Combo(cmbNMLOJA);
end;

procedure TfrmRelTotalNatureza.btImprimirClick(Sender: TObject);
begin
     if Empty (cmbNMLOJA.Text) Then
      begin
           cmbNMLOJA.SetFocus;
           exit;
      End;
      //
     if (edtDTINIC.Text = '  /  /    ') Then
      begin
           edtDTINIC.SetFocus;
           exit;
      End;
      //
     if (edtDTFINA.Text = '  /  /    ') Then
      begin
           edtDTFINA.SetFocus;
           exit;
      End;
     //
     if (not (cbxReceita.Checked) and not(cbxDespesa.Checked)) Then
      begin
           Application.MessageBox(PChar('Selecione Receita ou Despesa.'),
                       'ATEN��O', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
           Exit;
      End;
     //
     try
         if (cbxDespesa.Checked) Then
         begin
           with cdsTotalPagar do
             begin
                 Active := False;
                 CommandText := 'Select P.PAG_LOJA, N.NAT_NOME, Sum(P.PAG_VALORPAGO) as VALOR from CONTASPAGAR P ';
                 CommandText := CommandText + 'INNER join NATUREZA N ON P.pag_naturezadespesa = N.NAT_CODIGO ';
                 CommandText := CommandText + 'Where (P.PAG_DATAPAGAMENTO >= :pDTINICIAL) AND (P.PAG_DATAPAGAMENTO <= :pDTFINAL) ';
                 CommandText := CommandText + 'and (P.PAG_LOJA = :pLOJA) ';
                 CommandText := CommandText + 'Group by P.PAG_LOJA, N.NAT_NOME order by N.NAT_NOME ';
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Active := True;
                 //
                 If not (IsEmpty) Then
                 begin
                      First;
                      While not (Eof) do
                      begin
                           dmRelatorios.Adicionar_Total_Pagar_Receber(
                                 1,
                                 FieldByName('NAT_NOME').AsString,
                                 FieldByName('VALOR').AsFloat) ;
                           // Proximo
                           Next;
                      End;
                 End;
                 //
             End;
         End;
         //
         if (cbxReceita.Checked) Then
         begin
           with cdsTotalReceber do
             begin
                 Active := False;
                 CommandText := 'Select R.REC_LOJA, N.NAT_NOME, Sum(R.REC_VALORPARCELA) as VALOR, Sum(R.REC_PAGO) as VALOR_PAGO ';
                 CommandText := CommandText + 'from CONTASRECEBER R INNER join NATUREZA N ON R.REC_NATUREZA = N.NAT_CODIGO ';
                 CommandText := CommandText + 'Where (R.REC_DATAPAGAMENTO >= :pDTINICIAL) AND (R.REC_DATAPAGAMENTO <= :pDTFINAL) ';
                 CommandText := CommandText + 'and (R.REC_LOJA = :pLOJA) ';
                 CommandText := CommandText + 'Group by R.REC_LOJA, N.NAT_NOME order by N.NAT_NOME ';
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Active := True;
                 //
                 If not (IsEmpty) Then
                 begin
                      First;
                      While not (Eof) do
                      begin
                           dmRelatorios.Adicionar_Total_Pagar_Receber(
                                 2,
                                 FieldByName('NAT_NOME').AsString,
                                 FieldByName('VALOR').AsFloat) ;
                           // Proximo
                           Next;
                      End;
                 End;
                 //
             End;
         End;
         //
         If not (dmRelatorios.cdsTotalNatureza.IsEmpty ) Then
          begin
               With dmRelatorios do
                begin
                     lblLoja2.Caption   := 'LOJA      : ' + cmbNMLOJA.Text;
                     lblPeriodo.Caption := 'PER�ODO   : ' +edtDTINIC.Text + ' � '+ edtDTFINA.Text;
                     //
                     If (cbxDespesa.Checked) and not (cbxReceita.Checked) Then
                        lblTipoNatureza.Caption := 'TIPO      : DESPESA';
                     //
                     If not (cbxDespesa.Checked) and (cbxReceita.Checked) Then
                        lblTipoNatureza.Caption := 'TIPO      : RECEITA';
                     //
                     If (cbxDespesa.Checked) and (cbxReceita.Checked) Then
                        lblTipoNatureza.Caption := 'TIPO      : RECEITA e DESPESA';
                     //
                     ppRepTotalNatureza.PrintReport;
                End;
          End
          Else
               Application.MessageBox(PChar('N�o h� movimento no per�odo indicado!!!'),
                       'ATEN��O', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
     Finally
           cdsTotalPagar.Close;
           If not (dmRelatorios.cdsTotalNatureza.IsEmpty) Then
                dmRelatorios.cdsTotalNatureza.EmptyDataSet;
           //
           dmRelatorios.cdsTotalNatureza.Close;
     End;
  inherited;
end;

end.
