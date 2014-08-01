jQuery ->
  $(document).ready ->

    $('#submit_btn').on 'click', (event)->
      $.post('create_object',
        {name: $('#name').val(),
        color: $('#color').val(),
        object: $('#object').val()},
        (data)->
          if $.isArray(data)
            $.each(data, (key, value)->
              $('#errors').append('- '.concat(value).concat('<br>'))
            )
            $('#table_cross').dialog({modal: 'true', width: 750, title: 'Fix this problem(s)', buttons: {
              'Next': ()->
                $('#errors').text('')
                $(this).dialog("close")
              }, open: ()->
                $(this).parent().children().children('.ui-dialog-titlebar-close').hide()
            })
          else
            $('#table_check').dialog({modal: 'true', width: 400, buttons: {
              'Next': ()->
                document.location.href='/'.concat($('#object').val().toLowerCase()).concat('s/').concat(data)
              }, open: ()->
                $(this).parent().children().children('.ui-dialog-titlebar-close').hide()
            })
        )
      event.preventDefault()