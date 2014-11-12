$ ->

  waitForMap ->

    #http://geocode-maps.yandex.ru/1.x/?geocode=OLOLOLO
    map = new ymaps.Map($("#map")[0], {center: [63.562057, 53.684480], zoom: 15})
    add_placemark(map)

    add_placemark(map, shop) for shop in $('.shop')



window.add_placemark = (map, shop) ->

  if shop == undefined
    return false

  unless $(shop).attr('lat')
    return false

  console.log $(shop).attr('lat')


  placemark = new ymaps.Placemark(
    [parseFloat($(shop).attr('lat')), parseFloat($(shop).attr('lng'))],
  {
    balloonContent: $(shop).attr('name')
  }
  )

  map.geoObjects.add(placemark)
#  placemark.balloon.open()


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )

