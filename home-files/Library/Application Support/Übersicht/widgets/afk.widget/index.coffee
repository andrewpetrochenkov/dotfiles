command: "bash -l afk.widget/output.sh"

refreshFrequency: '1s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
top: 40%
right: 30%
text-align: center
vertical-align: middle

color: green
font-size: 300px;
font-family: sans-serif
"""
