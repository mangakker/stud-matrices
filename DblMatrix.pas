unit DblMatrix;

interface

uses Math, SysUtils;

type
	{!
	\brief   A one-dimensional dynamic array of floating point numbers.
	\typedef TDblArray
	}
	TDblArray = Array of Double;

	{!
	\brief   A two-dimensional dynamic array of floating point numbers.
	\typedef TDblArray
	}
	TDblArray2d = Array of TDblArray;

	{!
	\brief Class to work with matrices.
	\class TDblMatrix
	}
	TDblMatrix = class
	private
		//! Width of the matrix
		iWidth : Cardinal;
		//! Height of the matrix
		iHeight: Cardinal;
		//! Matrix's data
		aData  : TDblArray2d;
		{!
		\brief Getting the value of the item.
		\param row	Row number (starting with 0)
		\param col	Column number (starting with 0)
		\return		Value of the matrix cell
		}
		function getItem( row, col: Cardinal ): Double;
		{!
		\brief Setting value of the item.
		\param row	Row number (starting with 0)
		\param col	Column number (starting with 0)
		\param val	New value of the matrix cell
		}
		procedure setItem( row, col: Cardinal; val: Double );
	public
		{!
		\brief The class contructor.
		\param w	Width of the new matrix
		\param h	Height of the new matrix
		}
		constructor create( w, h: Cardinal );
		{!
		\brief The class destructor.
		}
		destructor destroy(); override;
		{!
		\brief Set new size of the matrix.
		\param w	New width of the matrix
		\param h	New height of the matrix
		\return		TRUE if success, otherwise FALSE
		}
		function setSize( w, h: Cardinal ): Boolean;
		{!
		\brief Get/set the matrix cell.
		\property item[ row, col: Cardinal ]: Double
		\param row	Row number (starting with 0)
		\param col	Column number (starting with 0)
		}
		property item[ row, col: Cardinal ]: Double read getItem write setItem;
		{!
		\brief Getting width of the matrix.
		\property width: Cardinal
		}
		property width: Cardinal read iWidth;
		{!
		\brief Getting height of the matrix.
		\property height: Cardinal
		}
		property height: Cardinal read iHeight;
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
