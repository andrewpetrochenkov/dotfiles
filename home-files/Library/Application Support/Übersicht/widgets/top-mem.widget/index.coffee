command: "bash -l top-mem.widget/output.sh"

refreshFrequency: '5s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
right: 8%
top: 2%
text-align: left
font-family:monospace
color: white
"""
