$ ->

  $('.submit-comment').on 'click', ->

    name = $('input[name=name]')
    content = $('input[name=content]')

    shake_fields = []

    if name.val() < 2
      shake_fields.push name

    if phone.val() < 10
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/comments.json',
    {
      'order[username]': username.val(),
      'order[phone]': phone.val(),
      'order[email]': email.val(),
      'order[message]': message.val()
    },
    (data) =>

    )