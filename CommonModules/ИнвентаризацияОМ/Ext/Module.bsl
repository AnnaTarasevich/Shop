﻿Функция ПодстановкаЗакупочнойЦены(АктуальнаяДата, ЭлементНоменклатуры) Экспорт     
Отбор = Новый Структура("Номенклатура", ЭлементНоменклатуры);   
ЗначенияРесурсов = РегистрыСведений.ЦеныНаНоменклатуру.ПолучитьПоследнее
																(АктуальнаяДата, Отбор);
Возврат     

ЗначенияРесурсов.ЗакупочнаяЦена

КонецФункции  

Функция ПодстановкаНовойЦены(АктуальнаяДата, ЭлементНоменклатуры) Экспорт     
Отбор = Новый Структура("Номенклатура", ЭлементНоменклатуры);   
ЗначенияРесурсов = РегистрыСведений.ЦеныНаНоменклатуру.ПолучитьПоследнее
																(АктуальнаяДата, Отбор);
Возврат     

ЗначенияРесурсов.РозничнаяЦена

КонецФункции