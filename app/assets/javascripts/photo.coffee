# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    Webcam.set({
        width: 320,
        height: 240,
        image_format: 'png',
        jpeg_quality: 90
    })

    Webcam.attach('#web_cam')

    # $('.submit').on 'click', () ->
    #     Webcam.snap (data_uri) ->
    #         Webcam.upload data_uri, '/process', (code, text) ->
    #             document.getElementById('results').innerHTML = text

    $('.submit-g').on 'click', () ->
        Webcam.snap (data_uri) ->
            Webcam.upload data_uri, '/g', (code, text) ->
                document.getElementById('results').innerHTML = text

    $('.submit-m').on 'click', () ->
        Webcam.snap (data_uri) ->
            Webcam.upload data_uri, '/m', (code, text) ->
                document.getElementById('results').innerHTML = text

    $('.submit-r').on 'click', () ->
        Webcam.snap (data_uri) ->
            Webcam.upload data_uri, '/r', (code, text) ->
                document.getElementById('results').innerHTML = text
