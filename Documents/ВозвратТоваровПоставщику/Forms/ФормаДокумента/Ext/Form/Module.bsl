﻿
&НаКлиенте
Процедура ТоварыПоставщикуКоличествоПриИзменении(Элемент)
	СТЧ = Элементы.ТоварыПоставщику.ТекущиеДанные;
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПоставщикуЦенаПриИзменении(Элемент)
	СТЧ = Элементы.ТоварыПоставщику.ТекущиеДанные;
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПоставщикуНоменклатураПриИзменении(Элемент)
	СТЧ = Элементы.ТоварыПоставщику.ТекущиеДанные;    
	СТЧ.Цена = ПодгрузкаЦен.ПодстановкаЦены(Объект.Дата, СТЧ.Номенклатура);    
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ДатаПриИзменении(Элемент)
	СТЧ = Элементы.ТоварыПоставщику.ТекущиеДанные;
	Для Каждого СТЧ Из Объект.ТоварыПоставщику Цикл
		СТЧ.Цена = ПодгрузкаЦен.ПодстановкаЦены(Объект.Дата, СТЧ.Номенклатура);    
		РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
	КонецЦикла
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	СТЧ = Элементы.ТоварыПоставщику.ТекущиеДанные; 
	Объект.ИтоговаяСумма = Объект.ТоварыПоставщику.Итог("Сумма");
КонецПроцедуры
