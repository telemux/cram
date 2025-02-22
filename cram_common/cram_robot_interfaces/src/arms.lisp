;;; Copyright (c) 2012, Lorenz Moesenlechner <moesenle@in.tum.de>
;;;                     Gayane Kazhoyan <kazhoyan@cs.uni-bremen.de>
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

(in-package :cram-robot-interfaces)

(def-fact-group arms (;; rules describing the robot arms
                      arm
                      required-arms available-arms
                      arm-joints arm-links
                      hand-links hand-link hand-finger-link gripper-joint
                      end-effector-link robot-tool-frame
                      gripper-meter-to-joint-multiplier
                      gripper-minimal-position gripper-convergence-delta
                      standard<-particular-gripper-transform
                      tcp-in-ee-pose)

  ;;;;;;;;;;;;;;;;;;;;;;;;; rules describing the robot arms

  ;; Unifies ?side with the name of an arm that is present on the ?robot.
  (<- (arm ?robot ?arm)
    (fail))

  ;; ?arms is unified with the list of arms that are required to
  ;; manipulate the object indicated by the ?object-designator.
  (<- (required-arms ?object-designator ?arms)
    (fail))

  ;; Similar to REQUIRED-ARMS but only unifies with currently unused arms.
  (<- (available-arms ?object-designator ?arms)
    (fail))

  ;; Unifies ?arm with the list of joints for that arm.
  (<- (arm-joints ?robot ?arm ?joints)
    (fail))

  ;; Unifies ?arm with a list of links for that arm (includes gripper links).
  (<- (arm-links ?robot ?arm ?links)
    (fail))

  ;; Unifies ?arm with a list of links for the hand of that arm.
  (<- (hand-links ?robot ?arm ?links)
    (fail))

  ;; Unifies a ?link, which belongs to the hand of the robot on ?arm arm
  (<- (hand-link ?robot ?arm ?link)
    (fail))

  ;; Similar to hand-link but gives only the finger links (not palm etc.)
  (<- (hand-finger-link ?robot ?arm ?link)
    (fail))

  ;; Defines joints of robot's grippers
  (<- (gripper-joint ?robot ?arm ?joint)
    (fail))

  ;; Some grippers are commanded in radian, some in CM.
  ;; To keep the interfaces consistent, we assume CM and each robot defines
  ;; how to convert CM opening distance for the gripper into its own unit.
  (<- (gripper-meter-to-joint-multiplier ?robot ?multiplier)
    (fail))

  ;; Sometimes the gripper joint doesn't converge all the way to 0.0
  ;; but rather some other small value such as 0.0015
  (<- (gripper-minimal-position ?robot ?arm ?position)
    (fail))

  ;; The delta at which to say that the gripper converged to the min position
  (<- (gripper-convergence-delta ?robot ?arm ?delta)
    (fail))

  ;; Standard gripper has the Z pointing towards the object
  ;; and X is aligned with the hand opening.
  ;; If the particular robot's gripper is different,
  ;; this predicate defines the cl-transforms:transform of
  ;; standard-gripper_T_particular-gripper
  (<- (standard<-particular-gripper-transform ?robot ?transform)
    (fail))

  ;; Defines end-effector links for arms.
  (<- (end-effector-link ?robot ?arm ?link-name)
    (fail))

  ;; Defines tool frames for arms.
  (<- (robot-tool-frame ?robot ?arm ?frame)
    (fail))

  ;; Defines cl-transforms:pose of ee_P_tcp (should be the same for all arms)
  (<- (tcp-in-ee-pose ?robot ?transform)
    (fail)))
