﻿
&НаКлиенте
Процедура УправлениеВидимостью()
	Элементы.СвязьПоВладельцу.Видимость = ИспользоватьВладельца;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	СисИнфо = Новый СистемнаяИнформация;
	Если Лев(СисИнфо.ВерсияПриложения, 3) = "8.3" Тогда
		Элементы.ИскатьПо.КнопкаВыпадающегоСписка = Истина;
		Элементы.СвязьПоВладельцу.КнопкаВыпадающегоСписка = Истина;
	КонецЕсли;
	УправлениеВидимостью();
КонецПроцедуры

&НаКлиенте
Процедура ОсновныеДействияФормыОК(Команда)
	
	ОповеститьОВыборе(Новый Структура("Источник, Результат, ИскатьПо, СвязьПоВладельцу", 
		"ФормаРедактированияСвязи", Истина, ИскатьПо, СвязьПоВладельцу));
	
КонецПроцедуры
