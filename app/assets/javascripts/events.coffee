$ ->
  $('#calendar').fullCalendar
    editable: false,
    header:
      left: '',
      center: '',
      right: ''
    defaultView: 'month',
    height: 500,
    slotMinutes: 30,
    timezone: false,
    eventSources: [{
      url: '/events',
    }],

    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);


updateEvent = (the_event) ->

  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description

formatDate = (date) ->
  strDate = date.getMonth() + 1 + '/' + date.getDate()

formatTime = (date) ->
  hours = date.getHours()
  console.log date, date.getHours()
  minutes = date.getMinutes()
  ampm = if hours >= 12 then 'pm' else 'am'
  hours = hours % 12
  hours = if hours then hours else 12
  # the hour '0' should be '12'
  minutes = if minutes < 10 then '0' + minutes else minutes
  strTime = hours + ':' + minutes + ' ' + ampm

$ ->
  $('.tile-date').each ->
    date = $(this).html()
    el = new Date(date)
    event_date = formatDate(el)
    event_time = formatTime(el)
    tile_time = $(this).parent().parent().children('.media-right').children('.tile-time')
    $(this).html(event_date)
    tile_time.html("Time " + event_time);
    return