//
//  ContentView.swift
//  AFTN
//
//  Created by Владимир Ильин on 21.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var ALRtext="""
    301359 УУВЖЗДЗЬ
    (ALR-INCERFA/UUWVZRZX/SOBYTIE
    -RA1500G/A2764-VG
    -COL4/L-RGLA/S
    -UUDN1200
    -K0298F130 LINRU EKTUT GIGDO ABMOM RONUM UMSIS NIBIM AMDEL MOR UNRID
    -URKZ0500 UURP URKK
    -PBN/B2 DOF/210430 REG/RA1500G EET/UUBC0001 URRV0113 OPR/BRAGA  ANDREI RMK/MIN/150 2.0  TEL/+79216514646 KVS/BRAGA ANDREI
    SID/26780768701
    -BRAGA ANDREI /UUWVZRZX/1348/---.-/ТО4КА/WRL/DEJSTWIQ/PRO4AQ
    INFORMACIQ/РМК/Р-Н РЕРАБ Ф170 ДОКЛАД КВС О НЕУСТОЙ4ИВОЙ РАБОТЕ ДВИГАТЕЛЯ РЕШЕНИЕ СЛЕДОВАТЬ НА БЛИЖАЙШИЙ А/Д БУТУРЛИНОВКА СЛЕДУЕТ С ПОСТОЯННЫМ СНИЖЕНИЕМ)
    """
    @State var UNKNOWNtext = """
    ТЛГ №080244 УИААЗТЗЬ
    (ALD-NIL-NIL-REG/NIL DOF/210508 0140 UTC RMK/АЗИМУТ 360 ГРАДУСОВ УДАЛЕНИЕ 100 КМ ОТ А/Д УИАА ДПП ЗАФИКСИРОВАЛ ДВИЖЕНИЕ НЕОПОЗНАННОЙ МЕТКИ, ДВИГАЛАСЬ УСТОЙЧИВО С КУРСОМ 180 ГРАДУСОВ СО СКОРОСТЬЮ 340 КМ/Ч, ИНФОРМАЦИЯ ДОВЕДЕНА ДО ОРГАНОВ ПВО, РЕЖИМ НЕ ОБЪЯВЛЯЛСЯ. ПЛАНОВ ИВП В ДАННОМ РАЙОНЕ НЕТ. В 0145 МЕТКА ПРОПАЛА.)

    ТЛГ №080248 УИААЗТЗЬ
    (ALD-NIL-NIL-REG/NIL DOF/210508 0135 UTC RMK/АЗИМУТ 360 ГРАДУСОВ УДАЛЕНИЕ 155 КМ ОТ А/Д  УИАА ДПП ЗАФИКСИРОВАЛ ДВИЖЕНИЕ НЕОПОЗНАННОЙ МЕТКИ, ДВИГАЛАСЬ СО СКОРОСТЬЮ 200-220 КМ/Ч С КУРСОМ 180 ГРАДУСОВ.ИНФОРМАЦИЯ ДОВЕДЕНА ДО ОРГАНОВ ПВО, РЕЖИМ НЕ ОБЪЯВЛЯЛСЯ.0200 УТЦ МЕТКА ПРОПАЛА)

    ЗЦЗЦ ТРВ029 0552
    СС УУВЖЯДЬЬ
    СС УУВЖЗДЗЬ УУВЖЯДЬЬ
    110552 УУВЖЗРЗЬЮЮЮЮЮ
    (АЛД-НЕОПОЗНАННАЯ ОТМЕТКА-RMK/ НЕОПОЗНАННАЯ ОТМЕТКА 05.29 КООРДИНАТЫ 49.38.01 СШ 39.39.20 ВД ЭШЕЛОН НЕИЗВЕСТЕН НАПРАВЛНЕНИЕ ПОЛЕТА В СТОРОНУ ГОСГРАНИЦЫ)

    СС УРРЖЗДЗЬ
    011212 УРРЖЗРЗЬ
    (ALD-SBI2056-B738/M-DOF/210501 REG/VQBVM RMK/1201 УТЦ ПОД МОЛИК Ф220 КВС ДОЛОЖИЛ О  НЕИСПРАВНОСТИ СИСТЕМЫ НАДДУВА ЗАПРОСИЛ ЗАНЯТИЕ Ф240 И РЕШЕНИИ СЛЕДОВАТЬ НА АЭРОДРОМ НАЗНАЧЕНИЯ ДОМОДЕДОВО.
    РП ПОЛЕТОВ БОРИСОВ В.Г.)
    """
    @State var IVPtext = """
    110948 UHHHZTZX
    (ALD-ZZZZ-ZZZZ/L-DOF/210511 0935 UTC RMK/ВИЗУАЛЬНО НАБЛЮДАЕТСЯ ПОЛЕТ МОТОДЕЛЬТАПЛАНА РАЙОН ПОСАДО4НОЙ ПЛОЩАДКИ ХОХЛАТСКАЯ ВЫСОТА НЕ УСТАНОВЛЕНА 0942 UTC ОД ПВО ПОДАН СИГНАЛ РЕЖИМ)
    111015 UHHHZTZX
    (ALD-ZZZZ-ZZZZ/L-DOF/210511 1010 UTC RMK/ОД ПВО СИГНАЛ РЕЖИМ СНЯТ В 1010 УТЦ ОРГАНЫ ПОЛИЦИИ И ФСБ ОПОВЕЩЕНЫ)

    120157 УХХХЗДЗЬ
    (ALD-ZZZZ-ZZZZ/L-DOF/210512 0100 UTC RMK/В0104 ПО ТЛФ.НА4АЛЬНИКА СМЕНЫ ХАБАРОВСКОГО ЗЦ ПОЛУ4ЕНА ИНФОРМАЦИЯ ОТ ПРЕДСТАВИТЕЛЬ КОМПАНИИ РОМОНО МАКСИМОВОЙ С.Е В РАЙОНЕ ВЫПОЛНЕНИЯ ПОЛЕТОВ БВС МР472 НАБЛЮДАЛА ПОЛЕТ ПАРАПЛАНА (ПАРАПЛАН КИСЛОТНО ЗЕЛЕНОГО ЦВЕТА) РАЙОН ПЛОЩАДКИ СТАРОРУССКОЕ ПЛАНЫ НА ПОЛЕТЫ ПАРАПЛАНЕРИСТОВ В ДАННОМ РАЙОНЕ НЕ ПОДАВАЛИСЬ РАЗРЕШЕНИЕ НЕ ВЫДАВАЛОСЬ ОПОВЕЩЕНЫ ОРГАНЫ ПВО 0105 УТЦ И РУКОВОДИТЕЛЬ ПОЛЕТОВ АП ЮЖНО-САХАЛИНСКА 0110 УТЦ)
    =======================================================
    ОРГАНАМИ ПВО РЕЖИМ НЕ ВВОДИЛСЯ
    ЛИНЕЙНЫЙ ОТДЕЛ ПОЛИЦИИ АП ЮЖНО-САХАЛИНСКА ОПОВЕЩЕН В 0114 УТЦ ОТДЕЛ ПОЛИЦИИ Г.ЮЖНО-САХАЛИНСК ОПОВЕЩЕН В 0117 УТЦ
    """
    @State var BirdStrikeText = """
    ZCZC SPR063 1806
    SS UWWURAYL
    301806 UWSGZTZX
    (ALD-PBD577-B738/M-PBN/B1D1O1S2T1 DOF/210430 REG/VPBQQ ULLI-UWSG-РМК/1729 УТЦ НА АЗИМУТЕ 55 ГРАД УДАЛЕНИЕ 24 КМ ОТ А/П САРАТОВ-ГАГАРИН НА ВЫСОТЕ 3000ФТ ЭКИПАЖ ДОЛОЖИЛ О ПОПАДАНИИ ПТИЦЫ В НОСОВУЮ ЧАСТЬ ВОЗДУШНОГО СУДНА . ПОСАДКА В 1735 УТЦ БЛАГОПОЛУЧНА. М/У ВЕТЕР 190-5 М/С ВИД 10 КМ ЯСНО. РП ЗАХАРОВ Д.Е.)
    (ДОПОЛНЕНИЕ ALD 301806 ПРИ ОСМОТРЕ ВОЗДУШНОГО СУДНА СЛЕДОВ ПОПАДАНИЯ ПТИЦЫ НЕ ОБНАРУЖЕНО)
    РП ЗАХАРОВ Д.Е.
    """
    @State var SickPaxText = """
    СС УРРЖЗДЗЬ
    131619 УРРЖЗРЗЬ
    (ALD-TYA918-B738/M-DOF/210513 REG/VQBKR RMK/1612 ПОД СУРЕМ Ф360 КВС ДОЛОЖИЛ О БОЛЬНОМ ПАССАЖИРЕ НА БОРТУ И РЕШЕНИИ СЛЕДОВАТЬ НА НЕЗАПЛАНИРОВАННЫЙ АЭРОДРОМ УРВВ)

    СС УРРЖЗДЗЬ
    131954 УРРЖЗРЗЬ
    (ALD-PBD187-B738/M-DOF/210513 REG/VQBWI RMK/1948 ПОД НОКЛИ БОЛЬНОЙ ПАССАЖИР НА БОРТУ КВС ПРИНЯЛ РЕШЕНИЕ СОВЕРШИТЬ ПОСАДКУ НА НЕЗАПЛАНИРОВАННОМ АЭРОДРОМЕ УРВА ДЛЯ ОКАЗАНИЯ МЕДИЦИНСКОЙ ПОМОЩИ)
    """
    
    var body: some View {
        TabView {
            
            VStack {
                Text("ALR")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                
                ScrollView {
                    Text("DITRESFA")
                        .foregroundColor(.orange)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Text("ALERFA")
                        .foregroundColor(.yellow)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Text("INCERFA")
                        .foregroundColor(.green)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Text("\(ALRtext)")
                        .font(.footnote)
                        .padding()
                }
            }
            
            VStack {
                Text("ALD")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                ScrollView {
                    Text("Неопознанная метка")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .padding()
                    Text("\(UNKNOWNtext)")
                        .font(.footnote)
                        .padding()
                    
                    Text("Нарушение ИВП")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .padding()
                    Text("\(IVPtext)")
                        .font(.footnote)
                        .padding()
                    
                    Text("Попадание птицы")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .padding()
                    Text("\(BirdStrikeText)")
                        .font(.footnote)
                        .padding()
                    
                    Text("Больной пассажир")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    Text("\(SickPaxText)")
                        .font(.footnote)
                        .padding()
                }
                
            }
            
            VStack {
                Text("RCF")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
