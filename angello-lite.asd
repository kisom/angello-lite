;;;; angello-lite.asd

(asdf:defsystem #:angello-lite
  :serial t
  :description "Agile software project board example."
  :author "Kyle Isom <coder@kyleisom.net>"
  :license "ISC license"
  :depends-on (#:restas
               #:restas-directory-publisher
               #:parenscript
               #:cl-who
               #:st-json)
  :components ((:file "package")
               (:file "angello-lite")
               (:file "routes")))
