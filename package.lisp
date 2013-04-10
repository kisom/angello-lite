;;;; package.lisp

(restas:define-module #:angello-lite)

(defpackage #:angello-lite
  (:use #:cl))

;;; let's use all five hatemails
(setf (who:html-mode) :HTML5)
