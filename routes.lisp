;;;; routes for the application

(in-package #:angello-lite)
(defparameter *base-directory*
  (merge-pathnames (truename ".")))
(defun path (rel)
  (merge-pathnames rel *base-directory*))

(defmacro publish-static-dir (name p)
  `(restas:mount-submodule ,name (#:restas.directory-publisher)
     (restas.directory-publisher:*baseurl* '(,p))
     (restas.directory-publisher:*directory* (path (format nil "~A/" ,p)))))

(publish-static-dir -img- "img")
(publish-static-dir -css- "css")
(publish-static-dir -js- "js")

(restas:define-route index ("") (index-view))
(defun index-view ()
  (who:with-html-output-to-string (out nil :prologue t :indent t)
    (:html :ng-app "Angello"
           (:head
            (:title "Angello Lite")
            (:meta :content-type "UTF-8")
            (:link :rel "stylesheet" :type "text/css" :href "/css/normalize.css")
            (:link :rel "stylesheet" :type "text/css" :href "/css/bootstrap.css")
            (:script :src "https://ajax.googleapis.com/ajax/libs/angularjs/1.0.6/angular.min.js")
            (:script :src "/js/app.js"))
           (:body

            (:div :ng-controller "MainCtrl"
                  (:div :class "span4 sidebar-content"
                        (:h2 "Stories")
                        (:div :class "story" :ng-repeat "story in stories"
                              :ng-click "setCurrentStory(story)"
                              (:h4 "{{story.title}}")
                              (:p "{{story.description}}"))
                        (:br)
                        (:a :class "btn" :ng-click "createStory()"
                            (:i :class "icon-plus")))
                  (:div :class "span6 b<ody-content"
                        (:h2 "Story")
                        (:form :class "form-horizontal"
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputTitle" "Title")
                                     (:div :class "controls"
                                           (:input :type "text"
                                                   :placeholder "title"
                                                   :ng-model "currentStory.title")))

                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputStatus"
                                             "Status")
                                     (:div :class "controls"
                                           (:select :id "inputStatus"
                                                    :ng-model "currentStatus"
                                                    :ng-options "s.name for s in statuses"
                                                    :ng-change "setCurrentStatus(currentStatus)")))
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputType"
                                             "Type")
                                     (:div :class "controls"
                                           (:select :id "inputType"
                                                    :ng-model "currentType"
                                                    :ng-options "t.name for t in types"
                                                    :ng-change "setCurrentType(currentStatus)")))
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputDescription"
                                             "Description")
                                     (:div :class "controls"
                                           (:textarea :id "inputDescription"
                                                      :placeholder "Description"
                                                      :rows 3
                                                      :ng-model "currentStory.description")))
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputAcceptance"
                                             "Acceptance Criteria")
                                     (:div :class "controls"
                                           (:textarea :id "inputAcceptance"

                                                      :placeholder "Acceptance Criteria"
                                                      :rows 3
                                                      :ng-model "currentStory.criteria")))
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputReporter"
                                             "Reporter")
                                     (:div :class "controls"
                                           (:input :type "text"
                                                   :id "inputReporter"
                                                   :placeholder "Reporter"
                                                   :rows 3
                                                   :ng-model "currentStory.reporter")))
                               (:div :class "control-group"
                                     (:label :class "control-label"
                                             :for "inputAssignee"
                                             "Assignee")
                                     (:div :class "controls"
                                           (:input :type "text"
                                                   :id "inputAssignee"
                                                   :placeholder "Assignee"
                                                   :rows 3
                                                   :ng-model "currentStory.assignee"))))))))))
