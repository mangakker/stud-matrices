{!
\brief Модуль работы с матрицами.
}
unit DblMatrix;

interface

uses Math, SysUtils;

type
	{!
	\brief   Одномерный динамический массив чисел с плавающей точкой.
	\typedef TDblArray
	}
	TDblArray = Array of Double;

	{!
	\brief   Двумерный динамический массив чисел с плавающей точкой.
	\typedef TDblArray
	}
	TDblArray2d = Array of TDblArray;

	{!
	\brief Класс по работе с матрицами.
	\class TDblMatrix
	}
	TDblMatrix = class
	private
		//! Ширина матрицы
		iWidth : Cardinal;
		//! Высота матрицы
		iHeight: Cardinal;
		//! Данные
		aData  : TDblArray2d;
		{!
		\brief Получение значения элемента.
		\param row Номер строки (начиная с 0)
		\param col Номер столбца (начиная с 0)
		\return Значение элемента
		}
		function getItem( row, col: Cardinal ): Double;
		{!
		\brief Задание значения элемента.
		\param row Номер строки (начиная с 0)
		\param col Номер столбца (начиная с 0)
		\param val Новое значение элемента
		}
		procedure setItem( row, col: Cardinal; val: Double );
	public
		{!
		\brief Конструктор класса.
		\param w Ширина новой матрицы
		\param h Высота новой матрицы
		}
		constructor create( w, h: Cardinal );
		{!
		\brief Деструктор класса
		}
		destructor destroy(); override;
		{!
		\brief Задание размеров матрицы.
		\param w Новое значение ширины
		\param h Новое значение высоты
		\return TRUE в случае удачи, иначе FALSE
		}
		function setSize( w, h: Cardinal ): Boolean;
		{!
		\brief Получение и задание элементов матрицы.
		\property item[ row, col: Cardinal ]: Double
		\param row Номер строки (начиная с 0)
		\param col Номер столбца (начиная с 0)
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
