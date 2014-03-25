class GoogleMaps extends Framework
  dragAndDrop: ->
    $('.sequenceByDragAndDrop tbody').sortable
      items: 'tr'
      handle: 'td.dragAndDropHandle'
      helper: (e, tr) ->
        originals = tr.children()
        helper = tr.clone()
        helper.children().each( (index)  ->
          $(@).width(originals.eq(index).width())
        )
        return helper
      stop: (event, ui) ->
        table = $(@)
        rows = $(@).find 'tr'
        newIdSequence = []
        rows.each ->
          newIdSequence.push($(@).data 'id')
          return
        $.ajax
          data:
            newIdSequence : JSON.stringify newIdSequence
          url: '/ajax.php?module=themes&action=update_order&language=' + Data.get('core.language')
          success: (data) ->
            if data.code != 200
              table.sortable 'cancel'
            return
          error: ->
            table.sortable 'cancel'
            return
    return

  markers = []
  maps = []
  markersLat = []
  markersLng = []
  multiple = []

  Initialize: ->

    mapcanvases = $('.googleMapsMap');
    #loop all the map fields
    mapcanvases.each( ( index, element ) ->
      $this = $(this).get(0)

      $id = $this.id
      $inputLat = $('#' + $id + '_lat')
      $inputLng = $('#' + $id + '_lng')
      $inputZoom = $('#' + $id + '_zoom')
      $inputCenter = $('#' + $id + '_center')
      multiple[$id] = this.getAttribute('data-multipleMarkers')
      latLngCenter = $inputCenter.val().split(',')
      markersLat[$id] = $inputLat.val().split(',')
      markersLng[$id] = $inputLng.val().split(',')

      # remove empty element if there are no markers
      if markersLat[$id].length == 1 && markersLat[$id][0] == ''
        markersLat[$id] = []
        markersLng[$id] = []

      # create map
      mapoptions =
        zoom: parseInt($inputZoom.val())
        center: new google.maps.LatLng(latLngCenter[0], latLngCenter[1])
        disableDefaultUI: true
        panControl: true
        zoomControl: true
      maps[$id] = new google.maps.Map($this , mapoptions)

      # add event listener to get the center on change

      google.maps.event.addListener(maps[$id], 'center_changed', ->
        $inputCenter.val this.center.lat() + ',' +  this.center.lng()
      )
      google.maps.event.addListener(maps[$id], 'zoom_changed', ->
        $inputZoom.val this.zoom
      )


      # get number of markers
      i = markersLat[$id].length
      # cach the markers because they will be redet by MapsSaveMarkers
      markersLat = markersLat[$id]
      markersLng = markersLng[$id]
      # if there are markers place them
      while i > 0
        i--
        GoogleMaps.current.PlaceMarker $id, new google.maps.LatLng(markersLat[i], markersLng[i])


      # place marker event
      google.maps.event.addListener( maps[$id], "click", (event) ->
        GoogleMaps.current.PlaceMarker $id, event.latLng
      )
      # center map around markers if needed
      if this.getAttribute('data-centerMarkers') == 'true'
        bounds = new google.maps.LatLngBounds()
        i = 0
        while i < markers[$id].length
          bounds.extend markers[$id][i].getPosition()
          i++
        maps[$id].fitBounds bounds
    )

  SaveMarkers: ($id) ->
    markersLat[$id] = []
    markersLng[$id] = []
    for i in markers[$id]
      markersLat[$id].push i.position.lat()
      markersLng[$id].push i.position.lng()
    $('#' + $id + '_lat').val markersLat[$id].join(',')
    $('#' + $id + '_lng').val markersLng[$id].join(',')

  PlaceMarker: ($id, location) ->
    if markers.hasOwnProperty($id) && multiple[$id] == 'false'
      for i in markers[$id]
        i.setMap(null)
      markers[$id].length = 0

    marker = new google.maps.Marker(
      position: location
      map: maps[$id]
    )
    google.maps.event.addListener( marker, 'click', () ->
      marker.setMap null
      i = 0
      while i < markers[$id].length
        if markers[$id][i].getPosition().equals(marker.getPosition())
          index = markers[$id].indexOf(marker)
          markers[$id].splice index, 1
          break
        i++
      GoogleMaps.current.SaveMarkers($id)
    )
    # create array if not excist
    if !markers.hasOwnProperty($id)
      markers[$id] = []
    markers[$id].push marker
    GoogleMaps.current.SaveMarkers($id)

  Load: ->
    if $('.googleMapsMap').length > 0
      script = document.createElement('script')
      script.type = 'text/javascript'
      script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&' + 'callback=GoogleMaps.current.Initialize'
      document.body.appendChild(script)





  @events
  #    '#element' : event : 'functionName'

  @onDomReady [
    'Load'
  ]

GoogleMaps.current = new GoogleMaps()

$ ->

window.GoogleMaps = GoogleMaps