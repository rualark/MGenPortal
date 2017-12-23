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
  subtitle = "GenCA1: test-leap-size (2017-11-29 22:10)"
}

\markup \wordwrap \bold {
      \vspace #2
"#"1 (from midi/GenCA1/test-leap-size.mid), Rule penalty: 4724  \char ##x27F9  0, Distance penalty: 102, Cantus: low, Key: C
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
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style f'1
_\markup{ \teeny \on-color #(rgb-color 0.824 0.925 0.750) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style a'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style g'1
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
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle a''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle e'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle d'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { S }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c'''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle d'''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.592 0.269 0.000) \char ##x2716  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.690 0.204 0.000) {
  - Range (cf >M9)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (13 notes <20) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 2 at 2:1 - A

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \with-color #(rgb-color 0.000 0.667 0.000) {
  - No melody development (10 notes <16) (Melody direction within X notes is less than Y deci-semitones)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 3 at 3:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - E

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 5 at 5:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap up size (maj7)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 6 at 6:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap down size (maj7)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Leap down size (m7)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 8 at 8:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Leap up size (m7)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 9 at 9:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Tonic note (>3 within 9) (More than X tonic note equivalents within Y notes (except first and last tonic). At border without tonic - one more tonic is allowed.  Weights:  Leap >M3 to tonic adds 30%. Note length decrease two times decreases 30%. Downbeat adds 30%. Longer than previous adds 30%. Perfect consonance adds 20%.)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Note stagnation (>4 in 9 notes). Same note repeats more than X times during stag_note_steps steps

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 10 at 10:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 11 at 11:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Note stagnation (>4 in 9 notes). Same note repeats more than X times during stag_note_steps steps

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 12 at 12:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \with-color #(rgb-color 0.294 0.468 0.000) {
  - Harmonic penalty (repeat)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 13 at 13:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap up size (>8th)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Note stagnation (>4 in 9 notes). Same note repeats more than X times during stag_note_steps steps

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 14 at 14:1 - D

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap down size (>8th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + 1far MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 15 at 15:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap down size (>8th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive leaps, 1x3rd ignored (>3)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive leaps, 1x3rd ignored (>3)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Note stagnation (>4 in 9 notes). Same note repeats more than X times during stag_note_steps steps

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Consecutive unidirectional leaps (Sum >6th)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Far + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 16 at 16:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Leap up size (>8th)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 9 notes (>6 leaps)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 9 notes (>22 notes) (Total leaps length more than X notes:  3 is third, 4 is fourth and so on)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 15 notes (>8 leaps)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 15 notes (>32 notes) (Total leaps length more than X notes:  3 is third, 4 is fourth and so on)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 17 at 17:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Note stagnation (>4 in 9 notes). Same note repeats more than X times during stag_note_steps steps

}
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/GenCA1/test-leap-size.mid), Rule penalty: 695  \char ##x27F9  611, Distance penalty: 8, Cantus: low, Key: C
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
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style b''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style b'1
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

  {  \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style  \circle b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { tsVI }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 VIIo }  }
^\markup{ \tiny \with-color #(rgb-color 0.988 0.005 0.000) \char ##x2716  }
 \speakOff \revert NoteHead.style  \circle b1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style  \circle c'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }

  }
}
>>
\markup \wordwrap \bold {
  \char ##x2461 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.690 0.204 0.000) {
  - Range (cf >M9)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 4 at 4:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + no MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2461 NOTE 7 at 7:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Note stagnation (LT 8va leap). Same note repeats more than X times during stag_note_steps steps (Octave leap to leading tone)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - No + close MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 1 at 1:1 - C

}
\markup \wordwrap \with-color #(rgb-color 0.690 0.204 0.000) {
  - Range (cf >M9)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Skipped notes (>1 joined)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 3 at 3:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Note stagnation (LT 8va leap). Same note repeats more than X times during stag_note_steps steps (Octave leap to leading tone)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 4 at 4:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Close + no MDC (>5th)

}
\markup \wordwrap \bold {
  \char ##x2460 NOTE 7 at 7:1 - B

}
\markup \wordwrap \with-color #(rgb-color 0.196 0.533 0.000) {
  - Note stagnation (LT 8va leap). Same note repeats more than X times during stag_note_steps steps (Octave leap to leading tone)

}
\markup \wordwrap \with-color #(rgb-color 0.592 0.269 0.000) {
  - Many leaps within 9 notes (>22 notes) (Total leaps length more than X notes:  3 is third, 4 is fourth and so on)

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - Uncompensated leap (>5th). If no other uncompensated rules worked.

}
\markup \wordwrap \with-color #(rgb-color 0.988 0.005 0.000) {
  - No + close MDC (>5th)

}
\markup \wordwrap \bold {
      \vspace #2
"#"2 (from midi/GenCA1/test-leap-size.mid), Rule penalty: 695  \char ##x27F9  0, Distance penalty: 36, Cantus: low, Key: C
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
 \speakOff \revert NoteHead.style e''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
 \speakOff \revert NoteHead.style d''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { sII }  }
 \speakOff \revert NoteHead.style c''1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { T }  }
 \speakOff \revert NoteHead.style b'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x00D0  }  }
 \speakOff \revert NoteHead.style g'1
_\markup{ \teeny \on-color #(rgb-color 1 1 1) \pad-markup #0.4 \concat { \char ##x0111 tIII }  }
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

