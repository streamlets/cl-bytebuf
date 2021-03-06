;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10 -*-


;;;; Copyright (c) 2015, Varoun P. All rights reserved.

;;;; Redistribution and use in source and binary forms, with or without
;;;; modification, are permitted provided that the following conditions are met:

;;;;     1. Redistributions of source code must retain the above copyright
;;;;        notice, this list of conditions and the following disclaimer.

;;;;     2. Redistributions in binary form must reproduce the above copyright
;;;;        notice, this list of conditions and the following disclaimer in the
;;;;        documentation and/or other materials provided with the distribution.

;;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;;; POSSIBILITY OF SUCH DAMAGE.

(in-package :bytebuf)

;;;; The external protocol

;;; Buffer level operations.
(defgeneric bytebuf-array (bytebuf)
  (:documentation "Returns the backing byte vector of the buffer. "))

(defgeneric writer-index (bytebuf)
  (:documentation "Returns the writer index of the buffer."))

(defgeneric reader-index (bytebuf)
  (:documentation "Returns the reader index of the buffer."))

(defgeneric readable-bytes (bytebuf)
  (:documentation "Returns the number of readable bytes, this is value of the
  writer index minus the reader index"))

(defgeneric bytebuf-capacity (bytebuf)
  (:documentation "Returns the number of octets this buffer can hold."))

(defgeneric writable-bytes (bytebuf)
  (:documentation "Returns the number of writable bytes, this is the capacity
  minus the writer index."))

(defgeneric readable-p (bytebuf)
  (:documentation "Returns the number of readable bytes, or nil if the
  writer-index minus the reader-index is not greater than zero."))

(defgeneric writable-p (bytebuf)
  (:documentation "Returns the number of writable bytes, or nil if the capacity
  minus the writer-index is not greater than zero."))

;;; Byte level operations.
(defgeneric get-bytebuf-byte (bytebuf index)
  (:documentation "Returns the byte (as an integer between 0 and 255), at the
specified absolute index. ByteBuf indexing is zero based - The first byte is at
index 0, the last at (capacity bytebuf) - 1."))

(defgeneric read-bytebuf-byte (bytebuf)
  (:documentation "Returns the byte (as an integer between 0 and 255) at the
  current reader-index, and increments the reader index by 1."))


(defgeneric write-bytebuf-byte (int bytebuf)
  (:documentation "Writes the byte (int between 0 and 255) at the current
  writer-index, and increments the writer-index by one."))

(defgeneric get-bytebuf-bytes (dst buffer &key index dst-index length)
  (:documentation "Transfers this buffer's data to the destination starting at
  the specified absolute index. dst-index is the first index to write to, length
  is the number of bytes to transfer."))

(defgeneric read-bytebuf-bytes (dst buffer &key dst-index length)
  (:documentation "Transfers the buffer's data to the destination. dst-index is
  the starting index at the destination, length is the number of bytes. The
  reader index is incremented by the correct value."))

(defgeneric set-bytebuf-bytes (src buffer &key index src-index length)
  (:documentation "Transfers the specified source data into this buffer,
  starting at the specified index. If src-index is provided, data starting from
  that index is used. Lenght is the number of bytes to transfer."))


(defgeneric write-bytebuf-bytes (src buffer &key src-index length)
  (:documentation "Transfers the specified source bytes into this buffer. If
  src-index is provided, data starting from that index is used. Length is the
  number of bytes to transfer."))
