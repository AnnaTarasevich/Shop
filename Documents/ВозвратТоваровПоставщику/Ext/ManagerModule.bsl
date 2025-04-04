﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.ВозвратТоваровПоставщику.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ВозвратТоваровПоставщику.Дата,
	|	ВозвратТоваровПоставщику.ИтоговаяСумма,
	|	ВозвратТоваровПоставщику.Номер,
	|	ВозвратТоваровПоставщику.Поставщик,
	|	ВозвратТоваровПоставщику.ТоварыПоставщику.(
	|		НомерСтроки,
	|		Номенклатура,
	|		Количество,
	|		Цена,
	|		Сумма,
	|		Причина
	|	)
	|ИЗ
	|	Документ.ВозвратТоваровПоставщику КАК ВозвратТоваровПоставщику
	|ГДЕ
	|	ВозвратТоваровПоставщику.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьТоварыПоставщикуШапка = Макет.ПолучитьОбласть("ТоварыПоставщикуШапка");
	ОбластьТоварыПоставщику = Макет.ПолучитьОбласть("ТоварыПоставщику");
	Подвал = Макет.ПолучитьОбласть("Подвал");

	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьТоварыПоставщикуШапка);
		ВыборкаТоварыПоставщику = Выборка.ТоварыПоставщику.Выбрать();
		Пока ВыборкаТоварыПоставщику.Следующий() Цикл
			ОбластьТоварыПоставщику.Параметры.Заполнить(ВыборкаТоварыПоставщику);
			ТабДок.Вывести(ОбластьТоварыПоставщику, ВыборкаТоварыПоставщику.Уровень());
		КонецЦикла;

		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
