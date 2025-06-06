﻿&НаКлиенте
Процедура НаценкаПриИзменении(Элемент)
	Для Каждого СтрокаУстановки Из Объект.Установка Цикл
        СтрокаУстановки.Наценка = Объект.НаценкаР;  
		СтрокаУстановки.НоваяЦенаРозничная = СтрокаУстановки.НоваяЦенаЗакупочная * (1 + СтрокаУстановки.Наценка / 100);
	КонецЦикла;
    Элементы.Установка.Обновить();
КонецПроцедуры

&НаКлиенте
Процедура УстановкаНоваяЦенаРозничнаяПриИзменении(Элемент)
	Для Каждого СтрокаУстановки Из Объект.Установка Цикл
		Если СтрокаУстановки.НоваяЦенаЗакупочная <> 0 Тогда
			СтрокаУстановки.Наценка = (СтрокаУстановки.НоваяЦенаРозничная / СтрокаУстановки.НоваяЦенаЗакупочная - 1) * 100;
        Иначе
            СтрокаУстановки.Наценка = 0;
        КонецЕсли;
    КонецЦикла;
    Элементы.Установка.Обновить();
КонецПроцедуры

&НаКлиенте
Процедура РассчетПроцентаИзменения()
    Для Каждого СтрокаУстановки Из Объект.Установка Цикл 
        Если СтрокаУстановки.СтараяЦенаЗакупочная = 0 Тогда
            СтрокаУстановки.ПроцентИзмененияСтаройЦены = 0;
        Иначе
            СтрокаУстановки.ПроцентИзмененияСтаройЦены = (СтрокаУстановки.НоваяЦенаЗакупочная - СтрокаУстановки.СтараяЦенаЗакупочная) 
                / СтрокаУстановки.СтараяЦенаЗакупочная * 100;  
        КонецЕсли;
    КонецЦикла;
    Элементы.Установка.Обновить();
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
    РассчетПроцентаИзменения();
КонецПроцедуры

&НаКлиенте
Процедура УстановкаСтараяЦенаЗакупочнаяПриИзменении(Элемент)
    РассчетПроцентаИзменения();
КонецПроцедуры

&НаКлиенте
Процедура УстановкаНоваяЦенаЗакупочнаяПриИзменении(Элемент)
    РассчетПроцентаИзменения();
КонецПроцедуры

&НаКлиенте
Процедура УстановкаНаценкаПриИзменении(Элемент) 
	СТЧ = Элементы.Установка.ТекущиеДанные;
	СТЧ.НоваяЦенаРозничная = СТЧ.НоваяЦенаЗакупочная * (1 + СТЧ.Наценка / 100);
КонецПроцедуры
