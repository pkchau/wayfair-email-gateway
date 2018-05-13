# Import file "Gateway Email Validation Mocks"
sketch = Framer.Importer.load("imported/Gateway%20Email%20Validation%20Mocks@1x", scale: 1)

#Set up layer order
sketch.InitialState.index = 2
sketch.ActiveState.index = 1

#Center all screens
sketch.ActiveState.x = 0

#Set opacity to 0 so the 'if statement' in the loop below works
sketch.ActiveState.opacity = 0

#Set up Highlight 
sketch.Screen1.subLayers[1].subLayers[3].opacity = 0
sketch.Screen1.subLayers[1].subLayers[3].x = 145 
sketch.Screen1.subLayers[1].subLayers[3].width = 55
	
#Set up blinking cursor animation
animationBlinkCursor = new Animation ({
	layer: sketch.Screen1.subLayers[1].subLayers[1]
	properties:
		opacity: 0
	time: 0.5
	delay: 0.25
	repeat: 100
})
animationBlinkCursor.start()

#On form field tap
sketch.Screen.subLayers[0].on Events.Tap, (event) ->
	sketch.ActiveState.opacity = 1
	sketch.ActiveState.bringToFront()
	if sketch.ActiveState.opacity == 1
		#After a short delay, Show email pre-domain typing
		Utils.delay 2, ->
			#Set up Email Text
			fullEmailText = "happycamper@"
			emailText = new TextLayer
				text: ""
				fontSize: 16
				fontFamly: "helvetica"
				fontWeight: '500'
				color: "black"
				x: 28
				y: 182
			
			#Set up Email Text Animation
			totalDelay = 0
			typeLetter = (letter, delay) ->
				totalDelay += Utils.randomNumber .2,.3
				Utils.delay totalDelay, -> emailText.text += letter
				
			for letter,i in fullEmailText
				typeLetter letter, i

				#Hide cursor
				sketch.Screen1.subLayers[1].subLayers[1].animate
					properties:
						opacity: 0
						scale: 0
				
				#Hide browser suggested domains
				Utils.delay 0.3, ->
						sketch.Screen1.subLayers[2].animate
							properties:
								opacity: 0
								time: 0.03
				###
				#Set up ghosted popular domain
				ghostedPopularDomain = new TextLayer
					text: "gmail.com"
					fontSize: 16
					fontFamly: "helvetica"
					fontWeight: '500'
					color: "#DEDEDE"
					opacity: 0
					x: 141
					y: 182

				#Show popular domains
				Utils.delay 3.3, ->
					ghostedPopularDomain.opacity = 1
				###
				#Set up ghosted @X domain
				ghostedXDomain = new TextLayer
					text: "ail.com"
					fontSize: 16
					fontFamly: "helvetica"
					fontWeight: '500'
					color: "#black"
					opacity: 0
					x: 155
					y: 182
				
				#Add in @X
				Utils.delay 3.3, ->
					emailText.text = fullEmailText + "m" 
					#ghostedPopularDomain.opacity = 0
					Utils.delay 0.6, ->
						ghostedXDomain.opacity = 1
						sketch.Screen1.subLayers[1].subLayers[3].opacity = 1
					
				#On tapping a, fill in leter
				sketch.Screen1.subLayers[0].subLayers[1].subLayers[1].on Events.Tap, (event) ->
					#Fill in email domain
					fullEmailTextDomain = "happycamper@ma"
					ghostedXDomain.text = "il.com"
					ghostedXDomain.x = 165
					sketch.Screen1.subLayers[1].subLayers[3].x = 155
					sketch.Screen1.subLayers[1].subLayers[3].width = 45
					emailText.textReplace(emailText.text,fullEmailTextDomain)
					
					#On tapping c, fill in letter
					sketch.Screen1.subLayers[0].subLayers[1].subLayers[2].on Events.Tap, (event) ->
						#Fill in email domain
						fullEmailTextDomain = "happycamper@mac"
						ghostedXDomain.text = ".com"
						ghostedXDomain.x = 173
						sketch.Screen1.subLayers[1].subLayers[3].x = 163
						sketch.Screen1.subLayers[1].subLayers[3].width = 40
						emailText.textReplace(emailText.text,fullEmailTextDomain)
						
						#On tapping the email field, fill in the email domain
						sketch.Screen1.subLayers[3].on Events.Tap, (event) ->
							#Fill in email domain
							fullEmailTextDomain = "happycamper@mac.com"
							ghostedXDomain.opacity = 0
							sketch.Screen1.subLayers[1].subLayers[3].opacity = 0
							emailText.textReplace(emailText.text,fullEmailTextDomain)
					
						#On tapping the Continue, fill in the email domain
						sketch.Screen1.subLayers[1].on Events.Tap, (event) ->
							#Fill in email domain
							fullEmailTextDomain = "happycamper@mac.com"
							ghostedXDomain.opacity = 0
							sketch.Screen1.subLayers[1].subLayers[3].opacity = 0
							emailText.textReplace(emailText.text,fullEmailTextDomain)
				
						#On tapping go, fill in the email domain
						sketch.Screen1.subLayers[0].subLayers[3].on Events.Tap, (event) ->
							#Fill in email domain
							fullEmailTextDomain = "happycamper@mac.com"
							ghostedXDomain.opacity = 0
							sketch.Screen1.subLayers[1].subLayers[3].opacity = 0
							emailText.textReplace(emailText.text,fullEmailTextDomain)
						
						#On tapping .com, fill in the email domain remainder
						sketch.Screen1.subLayers[0].subLayers[7].subLayers[0].on Events.Tap, (event) ->
							#Fill in email domain
							fullEmailTextDomain = "happycamper@mac.com"
							ghostedXDomain.opacity = 0
							sketch.Screen1.subLayers[1].subLayers[3].opacity = 0
							emailText.textReplace(emailText.text,fullEmailTextDomain)