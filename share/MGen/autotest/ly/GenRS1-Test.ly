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
  subtitle = "GenRS1: Test (2017-11-29 22:10)"
}

\markup \wordwrap \bold {
      \vspace #2
Whole piece, Key: C
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

  { 
    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4.~
 \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4~
 \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8~
 \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4.~
 \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8~
 \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8~
 \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8~
 \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4
r4
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4~
 \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4~
 \speakOff \revert NoteHead.style a'4
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'4.
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'8~
 \speakOff \revert NoteHead.style f'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8~
 \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8~
 \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'2
r2
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8~
 \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8~
 \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4~
 \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8~
 \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4.~
 \speakOff \revert NoteHead.style g'8
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'4.
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8~
 \speakOff \revert NoteHead.style b'8
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4~
 \speakOff \revert NoteHead.style f'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4~
 \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'2
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8~
 \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.~
 \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8~
 \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4~
 \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4.~
 \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8~
 \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b'4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a'4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g'8

  }
}
\new Staff {
  \set Staff.instrumentName = #"1"
  \clef "treble^8" \key c \major  \accidentalStyle modern-cautionary
  \time 4/4
  % \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)
  % \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \new Voice \with {
  	\remove "Note_heads_engraver"
  	\consists "Completion_heads_engraver"
  	\remove "Rest_engraver"
  	\consists "Completion_rest_engraver"
  }

  { 
    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4.~
 \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4~
 \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8~
 \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4.~
 \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8~
 \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8~
 \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8~
 \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4
r4
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4~
 \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4~
 \speakOff \revert NoteHead.style a''4
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''4.
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''8~
 \speakOff \revert NoteHead.style f''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8~
 \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8~
 \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''2
r2
r4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8~
 \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8~
 \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4~
 \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8~
 \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4.~
 \speakOff \revert NoteHead.style g''8
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''4.
r2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8~
 \speakOff \revert NoteHead.style b''8
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4~
 \speakOff \revert NoteHead.style f''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4~
 \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.
r4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''2
r8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8~
 \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.~
 \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8~
 \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style c''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style d''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4~
 \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style f''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4.~
 \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style e''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8~
 \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''2

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style b''4

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''8

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style a''4.

    \override NoteHead.color = #(rgb-color 0.000 0.000 0.000) 
    \override Stem.color = #(rgb-color 0.000 0.000 0.000)  \speakOff \revert NoteHead.style g''8

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

