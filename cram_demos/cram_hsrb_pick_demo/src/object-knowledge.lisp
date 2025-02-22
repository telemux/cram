;;;
;;; Copyright (c) 2019, Gayane Kazhoyan <kazhoyan@cs.uni-bremen.de>
;;                      Vanessa Hassouna <hassouna@uni-bremen.de>
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;;     * Redistributions of source code must retain the above copyright
;;;       notice, this list of conditions and the following disclaimer.
;;;     * Redistributions in binary form must reproduce the above copyright
;;;       notice, this list of conditions and the following disclaimer in the
;;;       documentation and/or other materials provided with the distribution.
;;;     * Neither the name of the Intelligent Autonomous Systems Group/
;;;       Technische Universitaet Muenchen nor the names of its contributors
;;;       may be used to endorse or promote products derived from this software
;;;       without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(in-package :demo)

(defparameter *lift-z-offset* 0.05 "in meters")
(defparameter *lift-offset* `(0.0 0.0 ,*lift-z-offset*))

(defmethod man-int:get-action-gripping-effort :heuristics 20
    ((object-type (eql :pringles))) 50)

(defmethod man-int:get-action-gripper-opening :heuristics 20
    ((object-type (eql :pringles))) 0.10)

(defmethod man-int:get-object-type-carry-config :heuristics 20
    ((object-type (eql :pringles)) grasp)
  :carry)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; pringles ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; pregrasp offset for pringles size '((0.7 0.0777 0.65))
(defparameter *pringles-pregrasp-xy-offset* 0.03)
(defparameter *pringles-grasp-xy-offset* 0.01 "in meters")
(defparameter *pringles-grasp-z-offset* 0.005 "in meters")

;; SIDE grasp
(man-int:def-object-type-to-gripper-transforms :pringles :left :left-side
  :grasp-translation `(0.0d0 ,(- *pringles-grasp-xy-offset*) ,*pringles-grasp-z-offset*)
  :grasp-rot-matrix man-int:*y-across-z-grasp-rotation*
  :pregrasp-offsets `(0.0 ,*pringles-pregrasp-xy-offset* 0.01)
  :2nd-pregrasp-offsets `(0.0 ,*pringles-pregrasp-xy-offset* 0.01)
  :lift-translation `(0.0 0.0 ,*lift-z-offset*)
  :2nd-lift-translation `(0.0 0.0 ,*lift-z-offset*))

(man-int:def-object-type-to-gripper-transforms :pringles :left :right-side
 :grasp-translation `(0.0d0 ,*pringles-grasp-xy-offset* ,*pringles-grasp-z-offset*)
  :grasp-rot-matrix man-int:*-y-across-z-grasp-rotation*
  :pregrasp-offsets `(0.0 ,(- *pringles-pregrasp-xy-offset*) 0.01)
  :2nd-pregrasp-offsets `(0.0 ,(- *pringles-pregrasp-xy-offset*) 0.01)
  :lift-translation `(0.0 0.0 ,*lift-z-offset*)
  :2nd-lift-translation `(0.0 0.0 ,*lift-z-offset*))

;; BACK grasp
(man-int:def-object-type-to-gripper-transforms :pringles :left :back
  :grasp-translation `(,*pringles-grasp-xy-offset* 0.0d0 ,*pringles-grasp-z-offset*)
  :grasp-rot-matrix man-int:*-x-across-z-grasp-rotation*
  :pregrasp-offsets `(,(- *pringles-pregrasp-xy-offset*) 0.0 0.01)
  :2nd-pregrasp-offsets `(,(- *pringles-pregrasp-xy-offset*) 0.0 0.01)
  :lift-translation `(0.0 0.0 ,*lift-z-offset*)
  :2nd-lift-translation `(0.0 0.0 ,*lift-z-offset*))

;; FRONT grasp
(man-int:def-object-type-to-gripper-transforms :pringles :left :front
  :grasp-translation `(,*pringles-grasp-xy-offset* 0.0d0 ,*pringles-grasp-z-offset*)
  :grasp-rot-matrix man-int:*x-across-z-grasp-rotation*
  :pregrasp-offsets `(,(+ *pringles-pregrasp-xy-offset*) 0.0 0.01)
  :2nd-pregrasp-offsets `(,(+ *pringles-pregrasp-xy-offset*) 0.0 0.01)
  :lift-translation `(0.0 0.0 ,*lift-z-offset*)
  :2nd-lift-translation `(0.0 0.0 ,*lift-z-offset*))
