command: "bash -l mac-logs.widget/output.sh"

refreshFrequency: '5s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
left: 0%
top: 2%
text-align: left
font-family:monospace
color: red
"""
