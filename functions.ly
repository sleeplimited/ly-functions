rhc = \markup { \fontsize #-5 \italic "c" }
rha = \markup { \fontsize #-5 { \italic "a" } }
rhm = \markup { \fontsize #-5 \italic "m" }
rhi = \markup { \fontsize #-5 \italic "i" }
rhp = \markup { \fontsize #-5 \italic "p" }
lhone = \markup { \fontsize #-5 \circle \pad-markup #0.2 "1" }
lhtwo = \markup { \fontsize #-5 \circle \pad-markup #0.2 "2" }
lhthree = \markup { \fontsize #-5 \circle \pad-markup #0.2 "3" }
lhfour = \markup { \fontsize #-5 \circle \pad-markup #0.2 "4" }
lhthumb = \markup { \fontsize #-5 \circle \pad-markup #0.2 "T" }
lhguideone = \markup { \fontsize #-5 \circle \pad-markup #0.2 "-1" }
lhguidetwo = \markup { \fontsize #-5 \circle \pad-markup #0.2 "-2" }
lhguidethree = \markup { \fontsize #-5 \circle \pad-markup #0.2 "-3" }
lhguidefour = \markup { \fontsize #-5 \circle \pad-markup #0.2 "-4" }
lhguidethumb = \markup { \fontsize #-5 \circle \pad-markup #0.2 "-T" }

onestrdwnstrm = \markup { \rotate #180 
  \column {
    \combine
    \draw-line #'(0 . 1.5)
    \arrow-head #Y #DOWN ##f
    }
  }
twostrdwnstrm = \markup { \rotate #180 
  \column {
    \combine
    \draw-line #'(0 . 2.5)
    \arrow-head #Y #DOWN ##f
    }
  }
threestrdwnstrm = \markup { \rotate #180 
  \column {
    \combine
    \draw-line #'(0 . 4)
    \arrow-head #Y #DOWN ##f
    }
  }
fourstrdwnstrm = \markup { \rotate #180 
  \column {
    \combine
    \draw-line #'(0 . 5.8)
    \arrow-head #Y #DOWN ##f
    }
  }
fivestrdwnstrm = \markup { \rotate #180 
  \column {
    \combine
    \draw-line #'(0 . 7.2)
    \arrow-head #Y #DOWN ##f
   }
  }
sixstrdwnstrm = \markup {
  \column {
  \rotate #180 {
    \combine
    \draw-line #'(0 . 8.8)
    \arrow-head #Y #DOWN ##f
  }
    }
  }
sixstrupstrm = \markup {
  \column {
    \combine
    \draw-line #'(0 . 8.8)
    \arrow-head #Y #DOWN ##f
    }
  }
fivestrupstrm = \markup {  
  \column {
    \combine
    \draw-line #'(0 . 7.2)
    \arrow-head #Y #DOWN ##f
   }
  }
fourstrupstrm = \markup {  
  \column {
    \combine
    \draw-line #'(0 . 5.8)
    \arrow-head #Y #DOWN ##f
    }
  }
threestrupstrm = \markup {
  \column {
    \combine
    \draw-line #'(0 . 4)
    \arrow-head #Y #DOWN ##f
    }
  }
twostrupstrm = \markup {  
  \column {
    \combine
    \draw-line #'(0 . 2.5)
    \arrow-head #Y #DOWN ##f
    }
  }
onestrupstrm = \markup {  
  \column {
    \combine
    \draw-line #'(0 . 1.5)
    \arrow-head #Y #DOWN ##f
    }
  }

snare = \markup {
  \center-column {
    \combine
    \draw-line #'(0 . 3)
    \halign #CENTER
    \override #'(box-padding . 0) 
    \rounded-box {
      \draw-line #'(1 . 0.5)
    }
  }
}

extendLV = #(define-music-function (parser location further) (number?) 
#{
   \once \override LaissezVibrerTie  #'X-extent = #'(0 . 0)
   \once \override LaissezVibrerTie  #'details #'note-head-gap = #(/ further -2)
   \once \override LaissezVibrerTie  #'extra-offset = #(cons (/ further 2) 0)
#})

bass = \markup {
  \center-column {
    \combine
    \draw-line #'(0 . 3)
    \halign #CENTER
    \override #'(box-padding . 0)
    \rounded-box {
      \filled-box #'(0 . 0.5) #'(0 . 0.5) #0
    }
  }
}
bassSnare = \markup {
  \center-column {
    \combine
    \draw-line #'(0 . 3)
    \halign #CENTER
    \override #'(box-padding . 0) 
    \rounded-box {
      \draw-line #'(1 . 0.5)
      \filled-box #'(0 . 0.5) #'(0 . 0.5) #0 
    }
  }
}
hideFretNumber = {
  \once \override TabNoteHead #'transparent = ##t
  \once \override NoteHead #'transparent = ##t
  \once \override Stem #'transparent = ##t
  \once \override Flag #'transparent = ##t
  \once \override NoteHead #'no-ledgers = ##t
  \once \override Glissando #'(bound-details left padding) = #0.3
}


#(define (new-stil markup)
   ;; Creates a stencil
   (lambda (grob)
     (grob-interpret-markup grob markup)))

tweakTabNoteHead = 
#(define-music-function (parser location mrkp mus)(markup? ly:music?)
                        #{
                        \tweak #'stencil #(new-stil mrkp)
                        #mus
                        #})

newTabNoteHead =
#(define-music-function (parser location mrkp)(markup?)
                        ;; Uses @code{new-stil} in a music-function.
                        ;; Ofcourse it's possible to use:
                        ;; @samp{\\once \\override TabNoteHead #'stencil =
                        ;;         #(new-stil #{ \\markup { \musicglyph #"noteheads.s0la" } #})}
                        ;; directly.
                        #{
                        \once \override TabNoteHead #'stencil = #(new-stil mrkp)
                        #})

% creating a variable as sort of schortcut.
tick = \newTabNoteHead \markup { \musicglyph #"noteheads.s0laThin" }
newTabHeadInChord = \markup { \musicglyph #"noteheads.s0laThin" }

stringSnare = \newTabNoteHead \markup { \override #'(box-padding . 0)
\rounded-box {
  \draw-line #'(1 . 0.5)
}
}

