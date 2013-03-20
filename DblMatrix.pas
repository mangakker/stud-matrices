{!
\brief ������ ������ � ���������.
}
unit DblMatrix;

interface

uses Math, SysUtils;

type
	{!
	\brief   ���������� ������������ ������ ����� � ��������� ������.
	\typedef TDblArray
	}
	TDblArray = Array of Double;

	{!
	\brief   ��������� ������������ ������ ����� � ��������� ������.
	\typedef TDblArray
	}
	TDblArray2d = Array of TDblArray;

	{!
	\brief ����� �� ������ � ���������.
	\class TDblMatrix
	}
	TDblMatrix = class
	private
		//! ������ �������
		iWidth : Cardinal;
		//! ������ �������
		iHeight: Cardinal;
		//! ������
		aData  : TDblArray2d;
		{!
		\brief ��������� �������� ��������.
		\param row ����� ������ (������� � 0)
		\param col ����� ������� (������� � 0)
		\return �������� ��������
		}
		function getItem( row, col: Cardinal ): Double;
		{!
		\brief ������� �������� ��������.
		\param row ����� ������ (������� � 0)
		\param col ����� ������� (������� � 0)
		\param val ����� �������� ��������
		}
		procedure setItem( row, col: Cardinal; val: Double );
	public
		{!
		\brief ����������� ������.
		\param w ������ ����� �������
		\param h ������ ����� �������
		}
		constructor create( w, h: Cardinal );
		{!
		\brief ���������� ������
		}
		destructor destroy(); override;
		{!
		\brief ������� �������� �������.
		\param w ����� �������� ������
		\param h ����� �������� ������
		\return TRUE � ������ �����, ����� FALSE
		}
		function setSize( w, h: Cardinal ): Boolean;
		{!
		\brief ��������� � ������� ��������� �������.
		\property item[ row, col: Cardinal ]: Double
		\param row ����� ������ (������� � 0)
		\param col ����� ������� (������� � 0)
		}
		property item[ row, col: Cardinal ]: Double read getItem write setItem;
	end;


implementation


{ TDblMatrix }

constructor TDblMatrix.create( w, h: Cardinal );
begin
	inherited create();
	setSize( w, h );
end;

destructor TDblMatrix.destroy();
begin
	//
	inherited;
end;

function TDblMatrix.getItem( row, col: Cardinal ): Double;
begin
	Result := 0.0;
	if( (col<iWidth) and (row<iHeight) )then
		Result := aData[ row, col ];
end;

procedure TDblMatrix.setItem( row, col: Cardinal; val: Double );
begin
	if( (col<iWidth) and (row<iHeight) )then
		aData[ row, col ] := val;
end;

function TDblMatrix.setSize( w, h: Cardinal ): Boolean;
begin
	Result := TRUE;
	if( (w=iWidth) and (h=iHeight) )then
		Exit;
	try
		SetLength( aData, h, w );
	except
		Result := FALSE;
		Exit;
	end;
	iWidth := w;
	iHeight := h;
end;

end.
