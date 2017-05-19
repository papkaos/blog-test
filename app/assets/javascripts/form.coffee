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
        $('[data-scroll-pagination]').append '<p>' + data.body + '</p><p>' + data.formatted_created_date + '</p><hr>'

        @formComment.trigger 'reset'

    undefined

document.addEventListener 'turbolinks:load', ->
  formComment = new FormComment('#new-comment')
  formComment.init()