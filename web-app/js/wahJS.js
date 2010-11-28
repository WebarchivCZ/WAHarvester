$(document).ready(function() {
    $(".tabs").tabs();

    $("#debugOpen").click(function() {
        $("#debugInfo").dialog({
            title: 'Debug',
            width: 1000,
            position: 'right'
        }).removeClass('hidden');
    });

    $('input[type=submit]').button();

    $('#exception').dialog({width: 1000, title: 'Ooops'});
});