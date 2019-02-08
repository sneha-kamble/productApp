class window.Products
  constructor: () ->
    self = @
    console.log "HEREERRE"
    jQuery ->
      $('#products').dataTable
        bProcessing: true
        bServerSide: true
        sAjaxSource: $('#products').data('source')
    # $('#filter_by').select2()
    #
    # $('#filter_by').change ->
    #     selected = $('#filter_by option').filter(':selected').val()
    #     console.log (selected)
    #     $.ajax
    #       url: "/getdata/" + selected
    #       type: "GET"
    #       success: (data) ->
    #         console.log data
    #         $('#content').html(data)
    #       error: (e) ->
    #         console.log e
