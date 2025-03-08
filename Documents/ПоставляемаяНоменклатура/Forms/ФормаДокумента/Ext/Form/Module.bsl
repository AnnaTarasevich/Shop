﻿&НаКлиенте
Процедура ПоставкаЦенаПриИзменении(Элемент)
	СТЧ = Элементы.Поставка.ТекущиеДанные;
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ПоставкаКоличествоПриИзменении(Элемент)
	СТЧ = Элементы.Поставка.ТекущиеДанные;
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура ДатаПриИзменении(Элемент)
	СТЧ = Элементы.Поставка.ТекущиеДанные;
	Для Каждого СТЧ Из Объект.Поставка Цикл   
		РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
	КонецЦикла
КонецПроцедуры


&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	СТЧ = Элементы.Поставка.ТекущиеДанные;
	Объект.Итого = Объект.Поставка.Итог("Сумма");
КонецПроцедуры


&НаКлиенте
Процедура ПоставкаНоменклатураПриИзменении(Элемент)
	СТЧ = Элементы.Поставка.ТекущиеДанные;       
	РасчетСуммыВДокументе.РасчетСуммы(СТЧ);
КонецПроцедуры

&НаКлиенте
Процедура Выгрузить(Команда)
    
    // Формируем данные
    ТекстДляВыгрузки = СформироватьТекстДляВыгрузкиНаСервере();
    
    // Создаем диалог выбора файла
    Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
    Диалог.Заголовок = "Сохранить файл";
    Диалог.Фильтр = "Текстовые файлы (*.txt)|*.txt";
    
    // Устанавливаем имя файла по умолчанию
    ИмяФайлаПоУмолчанию = Объект.Номер + "_Выгрузка.txt";
    Диалог.ПолноеИмяФайла = ИмяФайлаПоУмолчанию; // Устанавливаем имя файла по умолчанию
    
    Если Диалог.Выбрать() Тогда
        ВыбранныйФайл = Диалог.ПолноеИмяФайла;
        
        Попытка
            // Определяем формат по расширению
            Расширение = нРег(Прав(ВыбранныйФайл, 4));
            
            Если Расширение = ".txt" Тогда
                СохранитьВTXT(ВыбранныйФайл, ТекстДляВыгрузки);
            КонецЕсли;
            
            Сообщить("Файл сохранен: " + ВыбранныйФайл);
        Исключение
            Сообщить("Ошибка: " + ОписаниеОшибки());
        КонецПопытки;
    КонецЕсли;
КонецПроцедуры

Функция СформироватьТекстДляВыгрузкиНаСервере()
    
    ТабличнаяЧасть = Объект.Поставка;
    Если ТабличнаяЧасть.Количество() = 0 Тогда
        Возврат "";
    КонецЕсли;
    
    // Формируем заголовки
    Заголовки = "Номенклатура;Единица измерения;Количество;Цена;Сумма";
    Результат = Заголовки + "
    |";
    
    Для Каждого Строка Из ТабличнаяЧасть Цикл
        Результат = Результат + 
            Строка(Строка.Номенклатура) + ";" +
            Строка(Строка.ЕдиницаИзмерения) + ";" +
            Формат(Строка.Количество, "ЧГ=0") + ";" +
            Формат(Строка.Цена, "ЧДЦ=2") + ";" +
            Формат(Строка.Сумма, "ЧДЦ=2") + "
    |";
    КонецЦикла;
    
    Возврат Результат;
КонецФункции

&НаКлиенте
Процедура СохранитьВTXT(Путь, Данные)
    ЗаписьТекста = Новый ЗаписьТекста(Путь);
    ЗаписьТекста.ЗаписатьСтроку(Данные);
    ЗаписьТекста.Закрыть();
КонецПроцедуры