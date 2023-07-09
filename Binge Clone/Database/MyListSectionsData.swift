//
//  MyListSectionsData.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 4/7/23.
//

import UIKit


var myListSectionsData: Sections = Sections(
    sections: [
        //0
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "", footer: ""),
            cells: [
                CellDataType(image: "s", label: "All"),
                CellDataType(image: "s", label: "Live TV"),
                CellDataType(image: "s", label: "Binge Original"),
                CellDataType(image: "s", label: "Others")
            ]),
        //1
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Live TV", footer: "L"),
            cells: [
                CellDataType(image: "Independent-TV_110x110",   label: "1"),
                CellDataType(image: "Bijoy-TV_110x110",         label: "2"),
                CellDataType(image: "Channel-24_110x110",       label: "3"),
                CellDataType(image: "NTV_110x110",              label: "4"),
                CellDataType(image: "Desh-TV_110x110",          label: "5"),
                CellDataType(image: "CHANNEL-I-HD_110x110",     label: "6"),
                CellDataType(image: "RTV-HD_110x110",           label: "7"),
                CellDataType(image: "Ekattor-HD_110x110",       label: "8"),
                CellDataType(image: "Somoy-News_110x110",       label: "9"),
                CellDataType(image: "Independent-TV_110x110",   label: "10"),
                CellDataType(image: "Bijoy-TV_110x110",         label: "11"),
                CellDataType(image: "Channel-24_110x110",       label: "12"),
                CellDataType(image: "NTV_110x110",              label: "13"),
                CellDataType(image: "Desh-TV_110x110",          label: "14"),
                CellDataType(image: "Ekattor-HD_110x110",       label: "15"),
                CellDataType(image: "Somoy-News_110x110",       label: "16"),
                CellDataType(image: "Independent-TV_110x110",   label: "17"),
                CellDataType(image: "Bijoy-TV_110x110",         label: "18"),
                CellDataType(image: "Channel-24_110x110",       label: "19"),
                CellDataType(image: "RTV-HD_110x110",           label: "20"),
                CellDataType(image: "Ekattor-HD_110x110",       label: "21"),
                CellDataType(image: "Somoy-News_110x110",       label: "22"),
            ]),
        //2
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Binge Original", footer: "B"),
            cells: [
                CellDataType(image: "image 20", label: "1",  title: "Sadarghat er Tiger",   progress: 0.1, duration: "1h 21 m remaining"),
                CellDataType(image: "image 5",  label: "2",  title: "Independent",          progress: 0.2, duration: "2h 22 m remaining"),
                CellDataType(image: "image 16", label: "3",  title: "Red",                  progress: 0.3, duration: "3h 23 m remaining"),
                CellDataType(image: "image 70", label: "4",  title: "Pura Ulta",            progress: 0.4, duration: "4h 24 m remaining"),
                CellDataType(image: "image 19", label: "5",  title: "Muntasir",             progress: 0.5, duration: "5h 25 m remaining"),
                CellDataType(image: "image 17", label: "6",  title: "Voyer Golpo",          progress: 0.6, duration: "6h 26 m remaining"),
                CellDataType(image: "image 12", label: "7",  title: "Borof Kaler Golpo",    progress: 0.7, duration: "7h 27 m remaining"),
                CellDataType(image: "image 11", label: "8",  title: "9 April",              progress: 0.8, duration: "8h 28 m remaining"),
                CellDataType(image: "image 10", label: "9",  title: "Made in Chittagong",   progress: 0.9, duration: "9h 29 m remaining"),
                CellDataType(image: "image 9",  label: "10", title: "Coffin",               progress: 0.1, duration: "1h 21 m remaining"),
                CellDataType(image: "image 6",  label: "11", title: "Knock Knock",          progress: 0.1, duration: "1h 21 m remaining"),
                CellDataType(image: "image 4",  label: "12", title: "Blackmail",            progress: 0.2, duration: "2h 22 m remaining"),
                CellDataType(image: "image 2",  label: "13", title: "Kuhelika",             progress: 0.3, duration: "3h 23 m remaining"),
            ]),
        //3
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Others", footer: "O"),
            cells: [
                CellDataType(image: "image 20", label: "1",  title: "Sadarghat er Tiger",   progress: 0.1, duration: "1h 31 m remaining"),
                CellDataType(image: "image 5",  label: "2",  title: "Independent",          progress: 0.2, duration: "2h 32 m remaining"),
                CellDataType(image: "image 16", label: "3",  title: "Red",                  progress: 0.3, duration: "3h 33 m remaining"),
                CellDataType(image: "image 70", label: "4",  title: "Pura Ulta",            progress: 0.4, duration: "4h 34 m remaining"),
                CellDataType(image: "image 19", label: "5",  title: "Muntasir",             progress: 0.5, duration: "5h 35 m remaining"),
                CellDataType(image: "image 17", label: "6",  title: "Voyer Golpo",          progress: 0.6, duration: "6h 36 m remaining"),
                CellDataType(image: "image 12", label: "7",  title: "Borof Kaler Golpo",    progress: 0.7, duration: "7h 37 m remaining"),
                CellDataType(image: "image 11", label: "8",  title: "9 April",              progress: 0.8, duration: "8h 38 m remaining"),
                CellDataType(image: "image 10", label: "9",  title: "Made in Chittagong",   progress: 0.9, duration: "9h 39 m remaining"),
                CellDataType(image: "image 9",  label: "10", title: "Coffin",               progress: 0.1, duration: "1h 31 m remaining"),
                CellDataType(image: "image 6",  label: "11", title: "Knock Knock",          progress: 0.1, duration: "1h 31 m remaining"),
                CellDataType(image: "image 4",  label: "12", title: "Blackmail",            progress: 0.2, duration: "2h 32 m remaining"),
                CellDataType(image: "image 2",  label: "13", title: "Kuhelika",             progress: 0.3, duration: "3h 33 m remaining"),
            ])
    ])

