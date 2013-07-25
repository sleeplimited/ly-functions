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
  \tsMove #-0.1 #-5.9 \twoStrDamp <\invTNH ees,\6 g\4 b\3>8\startTextSpan
  -\mkTweak #-0.8 #-7.2 ^\rhp [ bes8\2\stopTextSpan]

}

dynamics = {
  \tsMove #-0.1 #9 \strDampening s8\startTextSpan -\mkTweak #-1.2 #9.8
  ^\twoStrMFlick s8\stopTextSpan
}
percussion = {
  \mkMove #0 #8 s8_\bassSnare s8 
}
  \score {
  <<
      \new TabStaff = "guitar tab" <<
	\set Staff.stringTunings = \stringTuning <ees, g, ees g bes ees'>
	\new TabVoice = "tab" \tab
    \new Dynamics = "dynamics" \dynamics
    \new Dynamics = "percussion" \percussion
      >>
    >>
    \layout {    }

  
} 
