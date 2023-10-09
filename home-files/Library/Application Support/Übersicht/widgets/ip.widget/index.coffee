command: "bash -l ip.widget/output.sh"

refreshFrequency: '10s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
top: 2%;
right: 1%
color: white

td:nth-child(1)
    font-size: 10px

td:nth-child(2)
    font-size: 12px
"""
