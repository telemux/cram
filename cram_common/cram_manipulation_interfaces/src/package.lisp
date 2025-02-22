;;;
;;; Copyright (c) 2017, Gayane Kazhoyan <kazhoyan@cs.uni-bremen.de>
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
;;;     * Neither the name of the Institute for Artificial Intelligence/
;;;       Universitaet Bremen nor the names of its contributors may be used to
;;;       endorse or promote products derived from this software without
;;;       specific prior written permission.
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

(in-package :cl-user)

(defpackage cram-manipulation-interfaces
  (:use #:common-lisp #:cram-prolog)
  (:nicknames #:man-int)
  (:export
   ;; object-designator-interfaces
   #:get-object-transform
   #:get-object-pose
   #:get-object-transform-in-map
   #:get-object-pose-in-map
   #:get-object-old-transform
   #:get-object-old-pose
   #:get-object-old-transform-in-map
   #:get-object-old-pose-in-map
   ;; prolog
   #:arms-for-object-type
   #:check-arms-for-object
   #:check-arms-for-object-type
   #:object-in-arms
   #:object-type-subtype #:object-type-direct-subtype
   #:robot-free-hand #:robot-arm-is-also-a-neck #:joint-state-for-arm-config
   #:object-rotationally-symmetric
   #:orientation-matters
   #:unidirectional-attachment
   #:object-tf-prefix
   #:location-always-reachable
   #:object-is-a-robot
   #:object-is-a-container
   #:object-is-a-prismatic-container
   #:object-is-a-revolute-container
   #:object-or-its-reference-in-hand
   #:location-reference-object
   #:location-certain
   #:location-always-stable
   ;; utils
   #:reasoning-engine-for-method
   ;; manipulation-interfaces
   #:get-action-gripping-effort
   #:get-action-gripper-opening
   #:get-object-type-carry-config
   #:get-action-grasps
   #:get-action-trajectory
   #:get-location-poses
   #:get-object-likely-location
   #:get-object-destination
   #:get-container-opening-distance
   #:get-container-closing-distance
   #:get-arms-for-object-type
   ;; grasps
   #:calculate-object-faces
   #:calculate-face-vector
   #:object-type-grasp->robot-grasp
   #:robot-grasp->object-type-grasp
   ;; trajectories
   #:make-traj-segment
   #:traj-segment-label
   #:traj-segment-poses
   #:make-empty-trajectory
   #:get-traj-poses-by-label
   #:calculate-gripper-pose-in-base
   #:calculate-gripper-pose-in-map
   #:get-object-type-robot-frame-slice-up-transform
   #:get-object-type-robot-frame-slice-down-transform
   #:get-object-type-robot-frame-tilt-approach-transform
   ;;
   #:get-object-type-to-gripper-transform
   #:get-object-type-to-gripper-pregrasp-transforms
   #:get-object-type-wrt-base-frame-lift-transforms
   #:def-object-type-to-gripper-transforms
   #:get-object-grasping-poses
   ;;
   #:get-object-type-in-other-object-transform
   #:get-z-offset-for-placing-with-dropping
   #:get-object-placement-transform
   #:def-object-type-in-other-object-transform
   #:get-object-look-from-pose
   ;;
   #:get-source-object-in-target-object-transform
   #:get-tilt-angle-for-pouring
   #:get-wait-duration-for-pouring
   ;; standard-grasps
   #:*x-across-z-grasp-rotation*
   #:*x-across-z-grasp-rotation-2*
   #:*-x-across-z-grasp-rotation*
   #:*-x-across-z-grasp-rotation-2*
   #:*x-across-y-grasp-rotation*
   #:*x-across-y-30-deg-grasp-rotation*
   #:*x-across-y-24-deg-grasp-rotation*
   #:*-x-across-y-grasp-rotation*
   #:*-x-across-y-flipped-grasp-rotation*
   #:*y-across-z-grasp-rotation*
   #:*-y-across-z-grasp-rotation*
   #:*y-across-z-flipped-grasp-rotation*
   #:*-y-across-z-flipped-grasp-rotation*
   #:*y-across-x-grasp-rotation*
   #:*-y-across-x-grasp-rotation*
   #:*z-across-x-grasp-rotation*
   #:*z-across-y-grasp-rotation*
   #:*z-diagonal-grasp-rotation*
   #:*-z-across-x-grasp-rotation*
   ;; standard-rotations
   #:*rotation-around-z-90-matrix*
   #:*rotation-around-z+90-matrix*
   #:*rotation-around-z+180-matrix*
   #:*rotation-around-x+90-matrix*
   #:*rotation-around-z-90-then-x+90-matrix*
   #:*identity-matrix*
   #:*rotation-around-x-180-matrix*
   #:*rotation-around-y-180-matrix*
   #:*rotation-around-x+90-list*
   #:*rotation-around-x-90-list*
   #:*rotation-around-y+90-list*
   #:*rotation-around-y-90-list*
   #:*rotation-around-z+90-list*
   #:*rotation-around-z-90-list*
   #:*rotation-around-z+180-list*))
