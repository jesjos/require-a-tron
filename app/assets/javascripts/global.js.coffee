
$ () =>
	$(".clickableRows tr").click(() -> window.location.href = $(@).data("url"))