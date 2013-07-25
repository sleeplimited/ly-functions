\version "2.16.2"
\include "functions-LL.ly"

 tab = {
  \key a \major
  \numericTimeSignature
  \time 4/4
  \override Beam #'damping = #100000
  \tabFullNotation
  \stemDown
  \override Staff.TabNoteHead #'font-series = #'narrow
  \override Staff.Stem #'stemlet-length = #0.75
  \tsMove #-0.1 #-6.10 \twoStrDamp <\invTNH ees,\6 g\4 b\3>8\startTextSpan
  -\mkTweak #-0.8 #-7.5 ^\rhp [ bes8\2\stopTextSpan] \tsMove #-0.1 #-6.10
  \threeStrDamp <\invTNH ees,\6
  b\3>8\startTextSpan -\mkTweak #-0.8 #-7.5 ^\rhp [ bes8\2\stopTextSpan] 

}

dynamicsfive = {
  s4 
  \tsMove #-0.1 #11.62 \strDampening s8\startTextSpan -\mkTweak #-1.2 #12.5
  ^\oneStrMFlick s8\stopTextSpan
}
dynamics = {
  \tsMove #-0.1 #9.1 \strDampening s8\startTextSpan -\mkTweak #-1.2 #10.0
  ^\twoStrMFlick s8\stopTextSpan
}
percussion = {
  \mkMove #-0.08 #8 s8_\bassSnare s8 \mkMove #-0.08 #8 \tsMove #-0.1 #11.1
  \strDampening s8_\bassSnare\startTextSpan s8\stopTextSpan
}
  \score {
  <<
      \new TabStaff = "guitar tab" <<
	\set Staff.stringTunings = \stringTuning <ees, g, ees g bes ees'>
	\new TabVoice = "tab" \tab
    \new Dynamics = "dynamics" \dynamics
    \new Dynamics = "dynamicsfive" \dynamicsfive
    \new Dynamics = "percussion" \percussion
      >>
    >>
    \layout {    }

  
} 
