class FormComment

  constructor: (form) ->
    @formComment = $(form)

  init: ->
    @formComment.validate
      submitHandler: (form) =>
        url = @formComment.attr 'action'
        method = @formComment.attr 'method'

        @sendAjax url, method

        undefined
    undefined

  sendAjax: (url, method) =>
    $.ajax
      dataType: 'json'
      type: method
      url: url
      data: @formComment.serialize()
      success: (data) =>
        console.log data

        $('#comments').append '<p>' + data.body + '</p><p>' + data.formatted_created_date + '</p><hr>'

        @formComment.trigger 'reset'

    undefined

$ ->
  formComment = new FormComment('#new-comment')
  formComment.init()







# todo class
# formComment = new FormComment()
# formComment.initValidation() // + sendAjax()

#$ ->
#  $formComment = $('#new-comment')
#
#  $formComment.validate
#    submitHandler: (form) ->
#      url = $formComment.attr 'action'
#      method = $formComment.attr 'method'
#
#      $.ajax
#        dataType: 'json'
#        type: method
#        url: url
#        data: $formComment.serialize()
#        success: (data) ->
#          console.log data
#
#          $('#comments').append '<p>' + data.body + '</p><p>' + data.formatted_created_date + '</p><hr>'
#
#          $formComment.trigger 'reset'
#
#      undefined

