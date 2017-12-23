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
  subtitle = "GenCA2: test-pco-apart (2017-11-14 19:28)"
}

\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 2, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI" }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 5 at 5:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 2, Rule penalty: 952  \char ##x27F9  3, Distance penalty: 56, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"4"
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

  { r2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style g'2
 \speakOff \revert NoteHead.style f'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style d'2
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style a'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI/C" }
 \speakOff \revert NoteHead.style c''2
 \speakOff \revert NoteHead.style g'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \revert NoteHead.style \speakOn a'2
 \speakOff \revert NoteHead.style b'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo/D" }  }
 \speakOff \revert NoteHead.style d''2
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"3"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
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

  { r2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style  \circle c'2
 \speakOff \revert NoteHead.style f'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style d'2
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T/E" }
 \speakOff \revert NoteHead.style  \circle e'2
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle e''2
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.690 0.204 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''2
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style  \circle b'2
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle g'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle a'2
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2463 NOTE 5 at 3:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Slurs within 10 notes (1). For counterpoint species 1-3

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 12 at 7:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Direct leaping movement (5 cadence). Direct movement to interval with leaping motion in higher voice

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Last note (upper G) (Last G note in upper voice is allowed only when last note in lower voice is C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 2:5 - D

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Perfect consonances < 4/4 apart (other). Two same non-close perfect consonances in neighboring measures less than 4 notes apart (If other rules in this row did not apply)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 6 at 3:5 - E

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Perfect consonances < 4/4 apart (other). Two same non-close perfect consonances in neighboring measures less than 4 notes apart (If other rules in this row did not apply)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 7 at 4:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.690 0.204 0.000) {
  - Range (int >15va) (Maximum burst interval is 16th during 3 notes  Perfect: int >8va (burst 12th during 3 notes) Good: int >12va (burst 15th during 3 notes))

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Harmonic penalty (repeat)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 8 at 4:5 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 10 at 5:5 - B

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 9 notes (>6 leaps)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 9 notes (>22 notes) (Total leaps length more than X notes:  3 is third, 4 is fourth and so on)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive leaps, 1x3rd ignored (>3)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 11 at 6:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Dissonance (downbeat)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 12 at 6:5 - A

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 13 at 7:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Last note (upper G) (Last G note in upper voice is allowed only when last note in lower voice is C)

}
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 2, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI" }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 5 at 5:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 3, Rule penalty: 501  \char ##x27F9  276, Distance penalty: 14, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"4"
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

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c'4
 \revert NoteHead.style \speakOn d'4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style f'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style a'4
 \revert NoteHead.style \speakOn g'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \revert NoteHead.style \speakOn d'4
 \speakOff \revert NoteHead.style e'4
 \revert NoteHead.style \speakOn f'4
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style a'4
 \revert NoteHead.style \speakOn b'4
 \speakOff \revert NoteHead.style c''4
 \revert NoteHead.style \speakOn a'4
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'4
 \speakOff \revert NoteHead.style g'4
 \revert NoteHead.style \speakOn f'4
  \staccatissimo  \revert NoteHead.style \speakOn e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo/D" }  }
^\markup{ \tiny \with-color #(rgb-color 0.392 0.403 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style b4
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"3"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
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

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c'4
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle g'4
 \speakOff \revert NoteHead.style f'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style a'4
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style a'4
 \speakOff \revert NoteHead.style b'4
 \speakOff \revert NoteHead.style c''4
 \speakOff \revert NoteHead.style a'4
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'4
 \speakOff \revert NoteHead.style g'4
 \speakOff \revert NoteHead.style f'4
  \staccatissimo  \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style  \circle e'4
 \speakOff \revert NoteHead.style d'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2463 NOTE 17 at 5:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Dissonance (downbeat)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Harmonic penalty (3x2)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 18 at 5:3 - B

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Multiple harmonies in measure (inside) (In measures before penultimate)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 21 at 6:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.392 0.403 0.000) {
  - Passing downbeat dissonance (parallel). In upper voice only (Dissonance is formed by parallel movement of voices)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 25 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Missing letters in a row (>4)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 1:3 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y decisemitones)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 3 at 1:5 - D

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Dissonance upbeat (leap)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Multiple harmonies in measure (inside) (In measures before penultimate)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 6 at 2:3 - A

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Perfect consonances < 4/4 apart (other). Two same non-close perfect consonances in neighboring measures less than 4 notes apart (If other rules in this row did not apply)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 17 at 5:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Dissonance (downbeat)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Harmonic penalty (3x2)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 18 at 5:3 - B

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Multiple harmonies in measure (inside) (In measures before penultimate)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 21 at 6:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.392 0.403 0.000) {
  - Passing downbeat dissonance (parallel). In upper voice only (Dissonance is formed by parallel movement of voices)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 24 at 6:7 - D

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 25 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
      \vspace #2
"#"3 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 2, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI" }
 \speakOff \revert NoteHead.style e1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style c1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 5 at 5:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"3 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 3, Rule penalty: 483  \char ##x27F9  217, Distance penalty: 11, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"4"
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

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c'4
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \revert NoteHead.style \speakOn d'4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style b'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo/D" }  }
 \speakOff \revert NoteHead.style a'4
 \revert NoteHead.style \speakOn g'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \revert NoteHead.style \speakOn d'4
 \speakOff \revert NoteHead.style e'4
 \revert NoteHead.style \speakOn f'4
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c''4
 \revert NoteHead.style \speakOn b'4
 \speakOff \revert NoteHead.style a'4
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style b'4
 \speakOff \revert NoteHead.style g'4
 \revert NoteHead.style \speakOn f'4
  \staccatissimo  \revert NoteHead.style \speakOn e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
 \revert NoteHead.style \speakOn e'4
 \speakOff \revert NoteHead.style d'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"3"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
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

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c'4
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle g'4
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo/D" }  }
 \speakOff \revert NoteHead.style a'4
 \speakOff \revert NoteHead.style g'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style f'4
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c''4
 \speakOff \revert NoteHead.style b'4
 \speakOff \revert NoteHead.style a'4
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style  \circle a'4
 \speakOff \revert NoteHead.style g'4
 \speakOff \revert NoteHead.style f'4
  \staccatissimo  \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d'4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style d'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style c1
 \speakOff \revert NoteHead.style e1
 \speakOff \revert NoteHead.style d1
 \speakOff \revert NoteHead.style c1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2463 NOTE 2 at 1:3 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y decisemitones)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 17 at 5:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Missing letters in a row (>4)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 21 at 6:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.392 0.403 0.000) {
  - Passing downbeat dissonance (parallel). In upper voice only (Dissonance is formed by parallel movement of voices)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 24 at 6:7 - D

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 25 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 1:3 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y decisemitones)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (13 notes <20) (Melody direction within X notes is less than Y decisemitones)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 3 at 1:5 - D

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Dissonance upbeat (leap)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Far + 1far MDC (4th)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Multiple harmonies in measure (inside) (In measures before penultimate)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 1:7 - G

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 16 at 4:7 - A

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 17 at 5:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Missing letters in a row (>4)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 21 at 6:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.392 0.403 0.000) {
  - Passing downbeat dissonance (parallel). In upper voice only (Dissonance is formed by parallel movement of voices)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 24 at 6:7 - D

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 25 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 33, Cantus: low, Key: C
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

  {  \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 "T" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 2 at 2:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Harmonic penalty (repeat)

}
\markup \wordwrap \bold {
      \vspace #2
"#"4 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 3, Rule penalty: 227  \char ##x27F9  163, Distance penalty: 28, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"4"
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

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI/C" }
 \speakOff \revert NoteHead.style c''4
 \speakOff \revert NoteHead.style e'4
 \speakOff \revert NoteHead.style a'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"3"
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
 \speakOff \revert NoteHead.style e'1

  }
}
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

  {  \speakOff \revert NoteHead.style e'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle f'4
 \speakOff \revert NoteHead.style  \circle g'4
 \speakOff \revert NoteHead.style a'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style g'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style  \circle b'4
 \speakOff \revert NoteHead.style  \circle a'4
 \speakOff \revert NoteHead.style g'4
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }

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
 \speakOff \revert NoteHead.style e'1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2463 NOTE 4 at 1:7 - A

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no G or D)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 5 at 2:1 - G

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Last note (not C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Start pause (missing) (No starting pause in couterpoint voice for species 2-5)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - First harmony (CE)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 1:7 - A

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 8 at 2:7 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Last note (not whole)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Last note (1/4)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Last note (not C)

}
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 62, Cantus: low, Key: Em
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key e \minor  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "s" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "t" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - First note (not GC)

}
\markup \wordwrap \bold {
      \vspace #2
"#"5 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 3, Rule penalty: 358  \char ##x27F9  541, Distance penalty: 0, Key: Em
}
<<
\new Staff {
  \set Staff.instrumentName = #"4"
  \clef "treble" \key e \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  { r4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "TSVI" }
 \revert NoteHead.style \speakOn b'4
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''4
 \revert NoteHead.style \speakOn b'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''4
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 "TSVI/E" }
 \speakOff \revert NoteHead.style e''4
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 "t" }
 \revert NoteHead.style \speakOn d''4
 \speakOff \revert NoteHead.style c''4
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"3"
  \clef "treble" \key e \minor  \accidentalStyle modern-cautionary
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
 \speakOff \revert NoteHead.style e'1

  }
}
\new Staff {
  \set Staff.instrumentName = #"2"
  \clef "treble" \key e \minor  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  {  \speakOff \revert NoteHead.style a'4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "s/C" }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b'4
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''4
 \speakOff \revert NoteHead.style b'4
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''4
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "TSVI/E" }
 \speakOff \revert NoteHead.style e''4
 \speakOff \revert NoteHead.style d''4
 \speakOff \revert NoteHead.style c''4
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble" \key e \minor  \accidentalStyle modern-cautionary
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
 \speakOff \revert NoteHead.style e'1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2463 NOTE 2 at 1:3 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Dissonance (downbeat)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Notes repeat (2 sym. in 3) (Symmetric repeat of X notes within Y notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First harmony (Other)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 4 at 1:7 - B

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 5 at 2:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Harmonic penalty (repeat)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 6 at 2:3 - E

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Multiple harmonies in measure (inside) (In measures before penultimate)

}
\markup \wordwrap \bold {
  \char ##x2463 NOTE 8 at 2:7 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Last note (not whole)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Last note (1/4)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Last note (not C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Start pause (missing) (No starting pause in couterpoint voice for species 2-5)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - First harmony (Other)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 1:3 - B

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 1:7 - B

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 8 at 2:7 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Last note (not whole)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Last note (1/4)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Last note (not C)

}
\markup \wordwrap \bold {
      \vspace #2
"#"6 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 33, Cantus: low, Key: C
}
<<
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
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
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style a1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI" }
 \speakOff \revert NoteHead.style g1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 "" }  }
 \speakOff \revert NoteHead.style f1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 5 at 5:1 - F

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - 2nd to last note (not GBD)

}
\markup \wordwrap \bold {
  NOTE 6 at 6:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Culmination (multi low) (Multiple culminations in lower voice)

}
\markup \wordwrap \bold {
      \vspace #2
"#"6 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 4, Rule penalty: 503, Key: C
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

  { r2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c''2~
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \revert NoteHead.style \speakOn c''2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo" }  }
 \speakOff \revert NoteHead.style b'2~
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \revert NoteHead.style \speakOn b'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI" }
 \speakOff \revert NoteHead.style a'2~
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \revert NoteHead.style \speakOn a'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0 "" }  }
 \speakOff \revert NoteHead.style g'2~
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \revert NoteHead.style \speakOn g'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "S" }
 \speakOff \revert NoteHead.style f'2
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "bass" \key c \major  \accidentalStyle modern-cautionary
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
 \speakOff \revert NoteHead.style b1
 \speakOff \revert NoteHead.style a1
 \speakOff \revert NoteHead.style g1
 \speakOff \revert NoteHead.style f1
 \speakOff \revert NoteHead.style c'1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 1:5 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 3 at 2:5 - B

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Suspension resolution (9th -> 8va) (Includes 16th and above)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Perfect consonance (LT 8va) (Leading tone octave)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 3:5 - A

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Suspension resolution (9th -> 8va) (Includes 16th and above)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 5 at 4:5 - G

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Suspension resolution (9th -> 8va) (Includes 16th and above)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 6 at 5:5 - F

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Suspension resolution (9th -> 8va) (Includes 16th and above)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (parallel)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Uncompensated leap (4th). If no other uncompensated rules worked. (Possible in cantus)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 7 at 6:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Close perfect consonances (contrary) (Contrary octaves are possible in cadence)

}
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/GenCA2/test-pco-apart.mid), Rule penalty: 123, Cantus: low, Key: C
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

  {  \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.000 0.667 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }

  }
}
>>
\markup \wordwrap \bold {
  NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Range (voice <m6) (Range below m6 is acceptable for cantus up to 10 notes)

}
\markup \wordwrap \bold {
  NOTE 3 at 3:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Adjacent repeat 2 notes (uniform) (Length of first three notes is the same)

}
\markup \wordwrap \bold {
      \vspace #2
"#"7 (from midi/GenCA2/test-pco-apart.mid), Cantus: low, Species: 4, Rule penalty: 308, Key: C
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

  { r2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "T" }
 \speakOff \revert NoteHead.style c''2~
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''2
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 "T/E" }
 \speakOff \revert NoteHead.style b'2~
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "tIII" }  }
 \speakOff \revert NoteHead.style b'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 "VIIo/D" }  }
 \speakOff \revert NoteHead.style a'2~
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style a'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "tsVI/C" }
 \speakOff \revert NoteHead.style g'2~
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 "T" }
 \revert NoteHead.style \speakOn g'2
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 "sII" }
 \speakOff \revert NoteHead.style f'2
^\markup{ \tiny \with-color #(rgb-color 0.294 0.468 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c'1
_\markup{ \teeny \on-color #(rgb-color 0.799 0.950 0.750) \pad-markup #0.4 "T" }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

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
 \speakOff \revert NoteHead.style e'1
 \speakOff \revert NoteHead.style d'1
 \speakOff \revert NoteHead.style c'1
 \speakOff \revert NoteHead.style d'1
 \speakOff \revert NoteHead.style c'1

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 2 at 1:5 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Harmonic penalty (repeat)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 5 at 4:5 - G

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Harmonic penalty (3x2)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 6 at 5:5 - F

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Penultimate measure (no B) (no leading tone is allowed if last bass notes are G-C)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - Uncompensated leap (4th). If no other uncompensated rules worked. (Possible in cantus)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 7 at 6:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.392 0.403 0.000) {
  - Direct leaping movement (8 cadence). Direct movement to interval with leaping motion in higher voice

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Overlap (voices)

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Missing letters in a row (>4)

}
\header {tagline = "This file was created by MGen v2.8-31-gb4cacf7-dirty and engraved by LilyPond"}
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

