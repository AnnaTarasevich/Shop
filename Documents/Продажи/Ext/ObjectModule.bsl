﻿
Процедура ОбработкаПроведения(Отказ, Режим)	
	Движения.ДвиженияТоваров.Записывать = Истина;
	Движения.ПродажиОборот.Записывать = Истина;
	Для Каждого ТекСтрокаЧек Из Чек Цикл
		Движение = Движения.ДвиженияТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.НоменклатураР = ТекСтрокаЧек.Номенклатура;
		Движение.Количество = ТекСтрокаЧек.Количество;    
		
		Движение = Движения.ПродажиОборот.Добавить();
		Движение.Период = Дата;
		Движение.НоменклатураО = ТекСтрокаЧек.Номенклатура;
		Движение.Количество = ТекСтрокаЧек.Количество;    
		Движение.Сумма = ТекСтрокаЧек.Сумма;
	КонецЦикла;
	
КонецПроцедуры
