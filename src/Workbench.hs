module Main where

import Graphics.UI.Gtk
import Control.Monad.Trans.Class

windowProps  = [ containerBorderWidth := 10
	       , windowTitle := "WorkBench"
	       , windowWindowPosition := WinPosCenter
	       , windowResizable := True
	       , widgetWidthRequest := 800
	       , widgetHeightRequest := 600
	       ]

ui = do window <- windowNew
	set window $ windowProps
	after window deleteEvent $ tryEvent $ do lift $ widgetHide window
					         lift $ mainQuit
	widgetShowAll window

main = do initGUI
          ui
          mainGUI
