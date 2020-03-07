$(document).ready(function () {

    if (document.URL.search("calculator") > 1)
        scriptLoader("/resources/js/ttpl/calculator.js");

    if (document.URL.search("average") > 1)
        scriptLoader("/resources/js/ttpl/average.js");

    if (document.URL.search("studentDetail") > 1)
        scriptLoader("/resources/js/ttpl/studentDetail.js");

    if (document.URL.search("cutoffMarks") > 1)
        scriptLoader("/resources/js/ttpl/cutoffMarks.js");

    if (document.URL.search("topThreeEnglish") > 1)
        scriptLoader("/resources/js/ttpl/topThreeEnglish.js");

    if (document.URL.search("avgMarksRatio") > 1)
        scriptLoader("/resources/js/ttpl/avgMarksRatio.js");

});

var scriptLoader = function (url) {
    $.ajax(
        {
            type: "GET",
            url: url,
            dataType: "script",
            cache: false
        });
};

