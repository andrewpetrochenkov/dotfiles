command: "bash -l ping.widget/output.sh"

refreshFrequency: '1s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
right: 0%
top: 5%
text-align: center
font-family:monospace
"""
