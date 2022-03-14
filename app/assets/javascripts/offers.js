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
            { title: "Start Time", data: "start_date" },
            { title: "End Time", data: "end_date" },
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
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/offers/' +
                        data.id +
                        "/delete" +
                        '">' +
                        "Destroy" +
                        "</a>"
                    );
                },
            },

        ],
        order: [
            ["1", "desc"]
        ],
    });
});