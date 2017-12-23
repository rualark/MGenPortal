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
  subtitle = "GenCA1: test-repeat (2017-11-29 22:10)"
}

\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/GenCA1/test-repeat.mid), Rule penalty: 402  \char ##x27F9  0, Distance penalty: 15, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

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
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF/sp1 Constrained local range (15 notes <m6) (X consecutive notes have total range less than Y)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF/sp1 Constrained local range (7 notes <4th) (X consecutive notes have total range less than Y)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Notes stagnation (7 notes <4 pi) (X consecutive notes use less than Y pitches)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 6 at 6:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Notes stagnation (7 notes <4 pi) (X consecutive notes use less than Y pitches)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>7 any direction) (Stepwise motion more than X notes in any direction in cantus)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Notes stagnation (7 notes <4 pi) (X consecutive notes use less than Y pitches)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 10 at 10:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/GenCA1/test-repeat.mid), Rule penalty: 402  \char ##x27F9  0, Distance penalty: 15, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/GenCA1/test-repeat.mid), Rule penalty: 417  \char ##x27F9  0, Distance penalty: 36, Cantus: low, Key: Am
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
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
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
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style  \circle f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style  \circle g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Notes repeat (7 in 10) (Repeat of X notes within Y notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 2 at 2:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Notes repeat (7 in 10) (Repeat of X notes within Y notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>4 one direction) (Stepwise motion more than X notes in one direction in cantus)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>7 any direction) (Stepwise motion more than X notes in any direction in cantus)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 11 at 11:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Notes repeat (5 in 7) (Repeat of X notes within Y notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 16 at 16:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 17 at 17:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Notes repeat (5 in 7) (Repeat of X notes within Y notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 21 at 21:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 28 at 28:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Unaltered VII (before Im) (Next (or second to next in cadence))

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 29 at 29:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"3 (from midi/GenCA1/test-repeat.mid), Rule penalty: 101  \char ##x27F9  1, Distance penalty: 8, Cantus: low, Key: F
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

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

  {  \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 4:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
      \vspace #2
"#"3 (from midi/GenCA1/test-repeat.mid), Rule penalty: 101  \char ##x27F9  0, Distance penalty: 14, Cantus: low, Key: F
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
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/GenCA1/test-repeat.mid), Rule penalty: 2  \char ##x27F9  1, Distance penalty: 4, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style  \circle f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 12 at 12:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>4 one direction) (Stepwise motion more than X notes in one direction in cantus)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (3rd)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 12 at 12:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>4 one direction) (Stepwise motion more than X notes in one direction in cantus)

}
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/GenCA1/test-repeat.mid), Rule penalty: 2  \char ##x27F9  0, Distance penalty: 10, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/GenCA1/test-repeat.mid), Rule penalty: 4  \char ##x27F9  1, Distance penalty: 5, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style  \circle g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style  \circle d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 2:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 10 at 10:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/GenCA1/test-repeat.mid), Rule penalty: 4  \char ##x27F9  0, Distance penalty: 10, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"6 (from midi/GenCA1/test-repeat.mid), Rule penalty: 165  \char ##x27F9  163, Distance penalty: 6, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style  \circle e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 12 at 12:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Uncompensated: precompensated (5th)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 13 at 13:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 3 at 3:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF Stepwise motion (>4 one direction) (Stepwise motion more than X notes in one direction in cantus)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 12 at 12:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Uncompensated: precompensated (5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 13 at 13:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \bold {
      \vspace #2
"#"6 (from midi/GenCA1/test-repeat.mid), Rule penalty: 165  \char ##x27F9  0, Distance penalty: 15, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/GenCA1/test-repeat.mid), Rule penalty: 3  \char ##x27F9  2, Distance penalty: 6, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 3 at 3:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (3rd)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/GenCA1/test-repeat.mid), Rule penalty: 3  \char ##x27F9  0, Distance penalty: 8, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"8 (from midi/GenCA1/test-repeat.mid), Rule penalty: 165  \char ##x27F9  104, Distance penalty: 5, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Notes repeat (3 sym. in 4) (Symmetric repeat of X notes within Y notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"8 (from midi/GenCA1/test-repeat.mid), Rule penalty: 165  \char ##x27F9  0, Distance penalty: 12, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"9 (from midi/GenCA1/test-repeat.mid), Rule penalty: 104  \char ##x27F9  103, Distance penalty: 6, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 3 at 3:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (3rd)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 3 at 3:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"9 (from midi/GenCA1/test-repeat.mid), Rule penalty: 104  \char ##x27F9  0, Distance penalty: 15, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"10 (from midi/GenCA1/test-repeat.mid), Rule penalty: 249  \char ##x27F9  102, Distance penalty: 4, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style  \circle e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 2 at 2:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - CF/sp1 Constrained local range (7 notes <4th) (X consecutive notes have total range less than Y)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Notes stagnation (7 notes <4 pi) (X consecutive notes use less than Y pitches)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - E

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
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"10 (from midi/GenCA1/test-repeat.mid), Rule penalty: 249  \char ##x27F9  0, Distance penalty: 10, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"11 (from midi/GenCA1/test-repeat.mid), Rule penalty: 62  \char ##x27F9  1, Distance penalty: 4, Cantus: low, Key: Am
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
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
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
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Two consecutive 3rds (plain)

}
\markup \wordwrap \bold {
      \vspace #2
"#"11 (from midi/GenCA1/test-repeat.mid), Rule penalty: 62  \char ##x27F9  0, Distance penalty: 7, Cantus: low, Key: Am
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e'1
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
      \vspace #2
"#"12 (from midi/GenCA1/test-repeat.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 5, Cantus: low, Key: Am
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
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
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
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style  \circle d''1
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
  \char ##x2460 NOTE 11 at 11:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (3rd)

}
\markup \wordwrap \bold {
      \vspace #2
"#"12 (from midi/GenCA1/test-repeat.mid), Rule penalty: 1  \char ##x27F9  0, Distance penalty: 5, Cantus: low, Key: Am
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
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
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
"#"13 (from midi/GenCA1/test-repeat.mid), Rule penalty: 0, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"14 (from midi/GenCA1/test-repeat.mid), Rule penalty: 102  \char ##x27F9  101, Distance penalty: 5, Cantus: low, Key: Am
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

  {  \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
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

  {  \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First note not tonic (Other)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (3rd)

}
\markup \wordwrap \bold {
      \vspace #2
"#"14 (from midi/GenCA1/test-repeat.mid), Rule penalty: 102  \char ##x27F9  0, Distance penalty: 17, Cantus: low, Key: Am
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
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 VII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style f''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { TSVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { s }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 TIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sIIo }  }
 \speakOff \revert NoteHead.style gs'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { t }  }

  }
}
>>
\markup \wordwrap \bold {
      \vspace #2
"#"15 (from midi/GenCA1/test-repeat.mid), Rule penalty: 62  \char ##x27F9  1, Distance penalty: 4, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style  \circle d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 16 at 16:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 11 at 11:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Compound tritone framed (unresolved). Tritone with one intermediate note, framed by two melody direction changes

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 16 at 16:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"15 (from midi/GenCA1/test-repeat.mid), Rule penalty: 62  \char ##x27F9  0, Distance penalty: 9, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

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

