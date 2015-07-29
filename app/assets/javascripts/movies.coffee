root = exports ? this
$(document).ready ->
  $('.moviecontainer #submit_movie .panel-body').each (i, el) ->
      movies = undefined
      movies = new Bloodhound(
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
        queryTokenizer: Bloodhound.tokenizers.whitespace
        limit: 10
        remote: {
            url: "http://www.omdbapi.com/?plot=short&r=json",
            dataType: 'jsonp'
            ajax: {
              type: 'GET',
              jsonp: 'callback',
              dataType: 'jsonp',
              contentType: false
            }
            prepare: (query, settings) ->
                settings.url = settings.url + "&s=" + query
                settings.dataType = 'jsonp'
                return settings
            transform: (rsp) ->
                if rsp.Response == "False"
                    return []
                return rsp.Search
            }
        filter: (rsp) ->
            retval = []
            $.each rsp.results, (i, e) ->
                retval.push {
                    value: e.original_title
                }
            return retval
        )
      movies.initialize()
      $('#movie_title', el).typeahead null,
        name: 'movies'
        display: 'Title',
        hint: true,
        highlight: true,
        minLength: 1
        templates: {  
          empty: [
            '<div class="empty-message">',
              'no suggestions',
            '</div>'
          ].join('\n'),
          suggestion: HandlebarsTemplates['movies/typeahead']
        }
        source: movies.ttAdapter()
      $(el).bind 'typeahead:select', (ev, suggestion) ->
         $.ajax 
            url: "http://www.omdbapi.com/?plot=short&r=json&i=#{suggestion.imdbID}",
            dataType: 'jsonp', 
            jsonp: 'callback',
            timeout: 2000, 
         .fail (a, b, e) -> 
             console.log e
         .then (a, b, e) ->
             $(el).typeahead('val', a.Title)
             $('#movie_year', el).val a.Year
             true
         .always (a, b, e) ->
             $(el).typeahead('close')
         true
      Handlebars.logger.level = 0

    root.movie_callback = (data) ->
      console.log(data) 
      return data
    return
