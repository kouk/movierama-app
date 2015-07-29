root = exports ? this
$(document).ready ->
  $('.moviecontainer #submit_movie .panel-body #movietitle').each (i, el) ->
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
      $(el).typeahead null,
        name: 'movies'
        display: 'value',
        templates: {
          empty: [
            '<div class="empty-message">',
              'unable to find any Best Picture winners that match the current query',
            '</div>'
          ].join('\n'),
          suggestion: HandlebarsTemplates['movies/typeahead']
        }
        source: movies.ttAdapter()
      $(el).bind 'typeahead:select', (ev, suggestion) ->
          console.log 'Selection: ' + suggestion
      Handlebars.logger.level = 0

    root.movie_callback = (data) ->
      console.log(data) 
      return data
    return
