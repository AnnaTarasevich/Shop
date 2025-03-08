﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ДвиженияТоваров Расход
	Движения.ДвиженияТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаТоварыПоставщику Из ТоварыПоставщику Цикл
		Движение = Движения.ДвиженияТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.НоменклатураР = ТекСтрокаТоварыПоставщику.Номенклатура;
		Движение.Количество = ТекСтрокаТоварыПоставщику.Количество;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
