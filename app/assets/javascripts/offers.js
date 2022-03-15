$(document).on("turbolinks:load", function() {
    $("#offer-list").DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
            url: "/generate_offer_json",
            dataSrc: "offers",
        },
        serverSide: true,
        pagination: true,
        info: false,
        columns: [
            { title: "Title", data: "title" },
            { title: "Description", data: "description" },
            { title: "Business name", data: "business_name" },
            { title: "Start Time", data: "startdate" },
            { title: "End Time", data: "enddate" },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/offers/' +
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
                    return "<a class='btn btn-info btn-sm' href = '/offers/" + data.id +
                        "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Destroy Offers'>" +
                        'Delete' + '</a>';
                }
            },

        ],
        order: [
            ["1", "desc"]
        ],
    });
});