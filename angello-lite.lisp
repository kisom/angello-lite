;;;; angello-lite.lisp

(defvar *port* 8080)

(defun run ()
  (restas:start '#:angello-lite :port *port*))

(defun stop ()
  (restas:stop-all))

(defun dev-reset ()
  (ql:quickload :angello-lite)
  (stop)
  (run))

(in-package #:angello-lite)

;;; "angello-lite" goes here. Hacks and glory await!
