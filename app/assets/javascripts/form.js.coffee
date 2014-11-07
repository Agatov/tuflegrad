$ ->


  $('.submit-vacancy').on 'click', ->

    name = $('input[name=name]')
    phone = $('input[name=phone]')

    shake_fields = []

    if name.val() < 2
      shake_fields.push name

    if phone.val() < 10
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      "/vacancies/#{$(@).attr('vacancy_id')}/reply.json",
    {
      'order[name]': name.val(),
      'order[phone]': phone.val()
    },
    (data) =>

    )

    name.val('')
    phone.val('')

    $('.modal-overlay').show()
    $('.modal').show()

    $('.modal-overlay').on 'click', ->
      $('.modal').hide()
      $('.modal-overlay').hide()


  $('.submit-comment').on 'click', ->

    name = $('input[name=name]')
    content = $('textarea[name=content]')

    shake_fields = []

    if name.val() < 2
      shake_fields.push name

    if content.val() < 10
      shake_fields.push content

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/comments.json',
    {
      'comment[name]': name.val(),
      'comment[content]': content.val()
    },
    (data) =>

    )

    name.val('')
    content.val('')

    $('.modal-overlay').show()
    $('.modal').show()

    $('.modal-overlay').on 'click', ->
      $('.modal').hide()
      $('.modal-overlay').hide()


  window.shake_field = (field) ->
    shake(field, i) for i in [1..10]


  window.shake = (field, i) ->

    if i%2
      field.animate({width: '-=15'}, 100)
    else
      field.animate({width: '+=15'}, 100)