\version "2.18.2"
\language "english"
\paper { #(include-special-characters) }
circle =
\once \override NoteHead.stencil = #(lambda (grob)
    (let* ((note (ly:note-head::print grob))
           (combo-stencil (ly:stencil-add
               note
               (circle-stencil note 0.1 0.4))))
          (ly:make-stencil (ly:stencil-expr combo-stencil)
            (ly:stencil-extent note X)
            (ly:stencil-extent note Y))))
speakOn = {
  \override Stem.stencil =
    #(lambda (grob)
       (let* ((x-parent (ly:grob-parent grob X))
              (is-rest? (ly:grob? (ly:grob-object x-parent 'rest))))
         (if is-rest?
             empty-stencil
             (ly:stencil-combine-at-edge
              (ly:stem::print grob)
              Y
              (- (ly:grob-property grob 'direction))
              (grob-interpret-markup grob
                                     (markup #:center-align #:fontsize -4
                                             #:musicglyph "noteheads.s2cross"))
              -2.3))))
}

speakOff = {
  \revert Stem.stencil
  \revert Flag.stencil
}

#(define-markup-command (on-color layout props color arg) (color? markup?)
   (let* ((stencil (interpret-markup layout props arg))
          (X-ext (ly:stencil-extent stencil X))
          (Y-ext (ly:stencil-extent stencil Y)))
     (ly:stencil-add (ly:make-stencil
                      (list 'color color
                        (ly:stencil-expr (ly:round-filled-box X-ext Y-ext 0))
                        X-ext Y-ext)) stencil)))

\header {
  subtitle = "GenCA1: known-cf-min (2017-11-29 22:10)"
}

\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 6, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 10 at 10:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>4 one direction) (Stepwise motion more than X notes in one direction in cantus)

}
\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 6, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/known-cf-min.mid), Rule penalty: 334  \char ##x27F9  0, Distance penalty: 26, Cantus: low, Key: F
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key f \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key f \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 9 at 9:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - 2nd to last note (not V/VIII/II)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 10 at 10:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Last note (not tonic)

}
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/known-cf-min.mid), Rule penalty: 334  \char ##x27F9  0, Distance penalty: 26, Cantus: low, Key: F
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key f \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"3 (from midi/known-cf-min.mid), Rule penalty: 0, Cantus: low, Key: Cm
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style ef'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style af'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style ef'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 4, Cantus: low, Key: Dm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 4, Cantus: low, Key: Dm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 4, Cantus: low, Key: Dm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 4, Cantus: low, Key: Dm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key d \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"6 (from midi/known-cf-min.mid), Rule penalty: 0, Cantus: low, Key: Gm
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key g \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style ef''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style bf'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/known-cf-min.mid), Rule penalty: 144  \char ##x27F9  0, Distance penalty: 7, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 2 at 2:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Notes repeat (2 sym. in 3) (Symmetric repeat of X notes within Y notes)

}
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/known-cf-min.mid), Rule penalty: 144  \char ##x27F9  0, Distance penalty: 7, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"8 (from midi/known-cf-min.mid), Rule penalty: 0, Cantus: low, Key: Bm
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key b \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style fs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style fs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style cs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"9 (from midi/known-cf-min.mid), Rule penalty: 183  \char ##x27F9  0, Distance penalty: 9, Cantus: low, Key: Cm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style ef''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle ef''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style ef''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Two consecutive 3rds (plain)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - E\flat 

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Two consecutive 3rds (plain)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Uncompensated leap (5th). If no other uncompensated rules worked.

}
\markup \wordwrap \bold {
      \vspace #2
"#"9 (from midi/known-cf-min.mid), Rule penalty: 183  \char ##x27F9  0, Distance penalty: 9, Cantus: low, Key: Cm
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style ef''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"10 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 9, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
      \vspace #2
"#"10 (from midi/known-cf-min.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 9, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"11 (from midi/known-cf-min.mid), Rule penalty: 223  \char ##x27F9  0, Distance penalty: 7, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Consecutive leaps, 1x3rd ignored (3)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Consecutive leaps, 1x3rd ignored (3)

}
\markup \wordwrap \bold {
      \vspace #2
"#"11 (from midi/known-cf-min.mid), Rule penalty: 223  \char ##x27F9  0, Distance penalty: 7, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"12 (from midi/known-cf-min.mid), Rule penalty: 0, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"13 (from midi/known-cf-min.mid), Rule penalty: 296  \char ##x27F9  0, Distance penalty: 16, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style fs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style gs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style fs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style gs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 2 at 2:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Uncompensated leap (4th). If no other uncompensated rules worked. (Possible in cantus)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (4th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 3 at 3:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Altered far neighbour (VI<->VI"#")

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - F"#"

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - VII near VI"#" (4 notes before) (X notes before VI"#")

}
\markup \wordwrap \bold {
      \vspace #2
"#"13 (from midi/known-cf-min.mid), Rule penalty: 296  \char ##x27F9  0, Distance penalty: 16, Cantus: low, Key: Am
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key a \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style fs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style gs''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\header {tagline = "This file was created by MGen v2.8-187-gd67a0b3 and engraved by LilyPond"}
\markup { 
  \vspace #2
  \bold Legend:
} 

\markup {
  \line {
  \vspace #1
    \column {
      \char ##x2461
      \bold 4:3
      \raise #0.3 \tiny \with-color #(rgb-color 0.000 0.767 0.000) \char ##x2716
      \raise #0.3 \tiny \with-color #(rgb-color 0.867 0.0 0.000) \char ##x2716
      \raise #0.9 \circle \note #"1" #1
      \raise #0.9 \musicglyph #"noteheads.s2xcircle"
      \raise #0.9 \musicglyph #"noteheads.s0harmonic"
      \char ##x00D0
      \char ##x0111
    }
    \hspace #5
    \column {
      "Voice number (2) is shown before note"
      "For each note bar number (4) and croche beat (3) is shown"
      "This note violates minor rule"
      "This note violates major rule"
      "This note was corrected"
      "This note is a dissonance"
      "This note has negative rpos (can be passing or auxiliary)"
      "This letter is used for major Dominant chord to distinguish from D note"
      "This letter is used for minor Dominant chord to distinguish from D note"
    }
  }
} 

