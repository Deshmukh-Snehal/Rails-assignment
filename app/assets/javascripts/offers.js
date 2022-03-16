console.log("hello");
$(document).on("turbolinks:load", function() {
    $("#offer_list_table").DataTable({
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

    // Generates Challenge Filter Query String
    function generateFilterParams() {
        console.log("a");
        var filters = {
            business_id: [$("#businesses :selected").val()]
        }

        $("select[name=businesses]:selected").each(function() {
            filters['business_id'].push($(this).data('val'));
        });
        return filters;
    }

    // Apply Offers Filters
    function applyFilters(filters) {
        console.log("hello", filters);
        if (filters != '') {
            $('#offer_list_table').DataTable().ajax.url(
                    "/generate_offer_json" +
                    "?filters=" + JSON.stringify(filters)
                )
                .load() //selected
        } else {
            $('#offer_list_table').DataTable().ajax.reload();
        }
    }

    // Offer  status filters
    $('.business_sidebar_filter').change(function() {
        console.log("hiii");
        applyFilters(generateFilterParams());
    });
});