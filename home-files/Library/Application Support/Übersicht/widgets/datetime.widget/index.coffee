command: "bash -l datetime.widget/output.sh"

refreshFrequency: '1s'

update: (output, domEl) ->
    $(domEl).empty().append("#{output}")

style: """
top: 4%;
left: 50%
color: grey
text-align:center

position: fixed;
transform: translate(-50%, 0);

.month
    margin-top: 10px
    font-size: 60px

.day
    margin-top: 10px
    font-size: 72px

.hm
    margin-top: 10px
    font-size: 120px
    font-family: sans-serif

"""
