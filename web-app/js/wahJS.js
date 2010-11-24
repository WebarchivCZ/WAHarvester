$(document).ready(function() {
    $(".tabs > ul").tabs();

    $("#debugOpen").click(function() {
        $("#debugInfo").dialog({
            title: 'Debug',
            width: 800,
            position: 'right'
        }).removeClass('hidden');
    });

    $('input[type=submit]').button();
});