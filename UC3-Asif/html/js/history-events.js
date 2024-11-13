// history-events.js
$(document).ready(function () {
	// Create session
	QiSession(
		function (session) {
			console.log('Connected to Pepper!')

			// Subscribe to memory events
			session.service('ALMemory').then(function (mem) {
				// Watch for page changes
				mem.subscriber('currentPage').then(function (sub) {
					sub.signal.connect(function (value) {
						updatePage(value)
					})
				})

				// Watch for content updates
				mem.subscriber('pageHeading').then(function (sub) {
					sub.signal.connect(function (value) {
						document.getElementById('pageHeading').innerHTML = value
					})
				})

				mem.subscriber('pageText').then(function (sub) {
					sub.signal.connect(function (value) {
						document.getElementById('pageText').innerHTML = value
					})
				})

				mem.subscriber('pageImage').then(function (sub) {
					sub.signal.connect(function (value) {
						document.getElementById('pageImage').src = '../pics/' + value
					})
				})

				// Signal page is loaded
				mem.raiseEvent('pageLoaded', 'history')
			})
		},
		function () {
			console.log('Disconnected from Pepper')
		}
	)
})

// Core event raising function
function raiseEvent(name, value) {
	QiSession(function (session) {
		session.service('ALMemory').then(
			function (mem) {
				mem.raiseEvent(name, value)
			},
			function (error) {
				console.log('Error raising event:', error)
			}
		)
	})
}

// Path selection handlers
function selectPath(path) {
	raiseEvent('pathSelected', path)
}

function selectSubTopic(topic) {
	raiseEvent('subPathSelected', topic)
}

// Interest indication
function indicateInterest(level) {
	raiseEvent('interestLevel', level)
}

// Confirmation handlers
function confirmYes() {
	raiseEvent('yesAnswer', 1)
}

function confirmNo() {
	raiseEvent('noAnswer', 1)
}

// Page update handler
function updatePage(pageData) {
	if (!pageData) return

	const choiceButtons = document.getElementById('choiceButtons')
	if (!choiceButtons) return

	switch (pageData) {
		case 'origins':
			choiceButtons.innerHTML = `
                <button onclick="selectSubTopic('shaolin')" class="large-button brown-btn w3-margin">Shaolin Temple</button>
                <button onclick="selectSubTopic('warfare')" class="large-button red-btn w3-margin">Ancient Warfare</button>
                <button onclick="selectSubTopic('meditation')" class="large-button blue-btn w3-margin">Meditation</button>
            `
			break

		case 'masters':
			choiceButtons.innerHTML = `
                <button onclick="selectSubTopic('ancient')" class="large-button gold-btn w3-margin">Ancient Masters</button>
                <button onclick="selectSubTopic('modern')" class="large-button green-btn w3-margin">Modern Masters</button>
            `
			break

		case 'techniques':
			choiceButtons.innerHTML = `
                <button onclick="selectSubTopic('defense')" class="large-button blue-btn w3-margin">Self Defense</button>
                <button onclick="selectSubTopic('sport')" class="large-button red-btn w3-margin">Sport Combat</button>
            `
			break

		default:
			choiceButtons.innerHTML = `
                <button onclick="selectPath('origins')" class="large-button brown-btn w3-margin">Origins</button>
                <button onclick="selectPath('masters')" class="large-button blue-btn w3-margin">Masters</button>
                <button onclick="selectPath('techniques')" class="large-button green-btn w3-margin">Techniques</button>
            `
	}
}
