$(document).ready(function() {
    $('.js-example-basic-single').select2();
});
$(document).ready(function() {
    $("#server-side-sports").DataTable({
        ajax: {
            url: '/get_processed_dataset',
            dataSrc: 'sports'
        },
        serverSide: true,
        pagination: true,
        info: false,
        columns: [
            { data: 'sport_name' },
            { data: 'sport_equipments' },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/sports/' +
                        data.id +
                        "/edit" +
                        '">' +
                        "Edit" +
                        "</a>"
                    );
                },
            },
            {
                "data": null,
                "bSortable": false,
                "mRender": function(data, type, full) {
                    return "<a class='btn btn-info btn-sm' href = '/sports/" + data.id +
                        "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Delete'>" +
                        'Delete' + '</a>';
                }
            },
        ],
        order: [
            ['1', 'desc']
        ]
    })
});
$(document).ready(function() {
    $("#playerTable").DataTable({})
});
$(document).ready(function() {
    $("#achievementTable").DataTable({})
});
$(document).ready(function() {
    $("#postTable").DataTable({})
});
$(document).ready(function() {
    $("#commentTable").DataTable({})
});
$(document).ready(function() {
    $("#annocementTable").DataTable({})
});