﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Инвентаризация") Тогда
		// Заполнение шапки
		Для Каждого ТекСтрокаНоменклатураТ Из ДанныеЗаполнения.НоменклатураТ Цикл
			Если ТекСтрокаНоменклатураТ.Разница > 0 Тогда
				НоваяСтрока = ПриходНоменклатура.Добавить();
				НоваяСтрока.Номенклатура = ТекСтрокаНоменклатураТ.НоменклатураСПР;
				НоваяСтрока.Количество = ТекСтрокаНоменклатураТ.Разница;  
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ДвиженияТоваров Приход
	Движения.ДвиженияТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаПриходНоменклатура Из ПриходНоменклатура Цикл
		Движение = Движения.ДвиженияТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.НоменклатураР = ТекСтрокаПриходНоменклатура.Номенклатура;
		Движение.Количество = ТекСтрокаПриходНоменклатура.Количество;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
