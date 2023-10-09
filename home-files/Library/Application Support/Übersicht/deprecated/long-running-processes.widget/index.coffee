command: "bash -l long-running-processes.widget/output.sh"

refreshFrequency: '3s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
left: 1%
top: 40%
font-family: monospace
color: white

td
    text-align:left
"""
