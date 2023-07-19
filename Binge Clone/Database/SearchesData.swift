//
//  SearchesData.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 11/7/23.
//

import UIKit


var topSearchesData: Sections = Sections(
    sections: [
        //0
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Top Searches", footer: "T"),
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

    ])



var resultsData: Sections = Sections(
    sections: [
        //0
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Results", footer: "R"),
            cells: [
                //stays empty when searched and found then appended
//                CellDataType(image: "image 20", label: "1",  title: "Sadarghat er Tiger",   progress: 0.1, duration: "1h 21 m remaining"),
//                CellDataType(image: "image 5",  label: "2",  title: "Independent",          progress: 0.2, duration: "2h 22 m remaining"),
//                CellDataType(image: "image 16", label: "3",  title: "Red",                  progress: 0.3, duration: "3h 23 m remaining"),
//                CellDataType(image: "image 70", label: "4",  title: "Pura Ulta",            progress: 0.4, duration: "4h 24 m remaining"),
//                CellDataType(image: "image 19", label: "5",  title: "Muntasir",             progress: 0.5, duration: "5h 25 m remaining"),
//                CellDataType(image: "image 17", label: "6",  title: "Voyer Golpo",          progress: 0.6, duration: "6h 26 m remaining"),
//                CellDataType(image: "image 12", label: "7",  title: "Borof Kaler Golpo",    progress: 0.7, duration: "7h 27 m remaining"),
//                CellDataType(image: "image 11", label: "8",  title: "9 April",              progress: 0.8, duration: "8h 28 m remaining"),
//                CellDataType(image: "image 10", label: "9",  title: "Made in Chittagong",   progress: 0.9, duration: "9h 29 m remaining"),
//                CellDataType(image: "image 9",  label: "10", title: "Coffin",               progress: 0.1, duration: "1h 21 m remaining"),
//                CellDataType(image: "image 6",  label: "11", title: "Knock Knock",          progress: 0.1, duration: "1h 21 m remaining"),
//                CellDataType(image: "image 4",  label: "12", title: "Blackmail",            progress: 0.2, duration: "2h 22 m remaining"),
//                CellDataType(image: "image 2",  label: "13", title: "Kuhelika",             progress: 0.3, duration: "3h 23 m remaining"),
            ]),

    ])



var recommendedShowsData: Sections = Sections(
    sections: [
        //0
        SectionDataType(
            headerFooter: SupplementaryDataType(header: "Recommended Shows", footer: "R"),
            cells: [
//                CellDataType(image: "image 20", label: "1",  title: "Sadarghat er Tiger",   progress: 0.1, duration: "1h 21 m remaining"),
//                CellDataType(image: "image 5",  label: "2",  title: "Independent",          progress: 0.2, duration: "2h 22 m remaining"),
//                CellDataType(image: "image 16", label: "3",  title: "Red",                  progress: 0.3, duration: "3h 23 m remaining"),
//                CellDataType(image: "image 70", label: "4",  title: "Pura Ulta",            progress: 0.4, duration: "4h 24 m remaining"),
//                CellDataType(image: "image 19", label: "5",  title: "Muntasir",             progress: 0.5, duration: "5h 25 m remaining"),
//                CellDataType(image: "image 17", label: "6",  title: "Voyer Golpo",          progress: 0.6, duration: "6h 26 m remaining"),
//                CellDataType(image: "image 12", label: "7",  title: "Borof Kaler Golpo",    progress: 0.7, duration: "7h 27 m remaining"),
//                CellDataType(image: "image 11", label: "8",  title: "9 April",              progress: 0.8, duration: "8h 28 m remaining"),
                CellDataType(image: "image 10", label: "9",  title: "Made in Chittagong",   progress: 0.9, duration: "9h 29 m remaining"),
                CellDataType(image: "image 9",  label: "10", title: "Coffin",               progress: 0.1, duration: "1h 21 m remaining"),
                CellDataType(image: "image 6",  label: "11", title: "Knock Knock",          progress: 0.1, duration: "1h 21 m remaining"),
                CellDataType(image: "image 4",  label: "12", title: "Blackmail",            progress: 0.2, duration: "2h 22 m remaining"),
                CellDataType(image: "image 2",  label: "13", title: "Kuhelika",             progress: 0.3, duration: "3h 23 m remaining"),
            ]),

    ])
