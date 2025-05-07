Return-Path: <linux-kbuild+bounces-7027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C581BAAEF22
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 01:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB83D9C58F7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 23:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943792918CB;
	Wed,  7 May 2025 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HZ4AWLe4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14C291899
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659658; cv=none; b=S9dwLS/lICvqvYK0UMEzZL/OCq0e2KSI2rWAmkB1Yxck1w9HU5usrqMIdsoHrGTwAm2z/qVZ7ARGtCKqq72EFvu5F6UaGeOwmsaMgNaLJhC5zASlMdSpCkLZ+QC3SPAzotnBApBWgCxvGNIEL/YEjnKpdcCSRnBs7Ub4iIMpflc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659658; c=relaxed/simple;
	bh=NtbmgkTzn8IARgcBDEgG4o5/FRCG0S2cxfpg5vDT+z4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fj8oHUgTF5+mByzJAXHI8XPsI+FkcGML1t63HxBfH+dqz06clIWB5Qo3BQSaFOJZGWyE0bX+n2EQYVZXXyL6Xv8sGDBtQ1Ik6Dwn4JLmrR169pBoIZrg8UtjKJ4zCHWReS0MmpKeT8qM+yChyGo+DoWM1rPJcXrPhncSRl8W2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HZ4AWLe4; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-739764217ecso379440b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746659656; x=1747264456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7RpuWxwyysfef14AtI+lh3dKsD8m3KYFqA48Pzjpeo=;
        b=HZ4AWLe4WMVpDYZraWjzSdBHJEi6jG9WbGHDOsF2+LocypTB7NvcGm2cAT+QcA5xUq
         3EhHZeEF/ECECzjzSZnXTs1FXaD97n5Mt4BtdXtUz+x8taszoz+7lqLyeswqYfZdsUNa
         MTh8z/4ue334yyK9o3sWAA3+Xcz33hwnoDADB3gOqpeEFOZUTroYzC78vs/qIAg3jggU
         05alJWF5q83GIt1WSGo0UEErt0N700fbJRFOPygEmylDd7pqjUiX4vr7BYX+HHFsQiXy
         50ci9QG1xvLtme7ob39X6159IBFRoGI8cHGU4dUp4ueyYPOD5Lutcku2gCt7ChU+0soP
         o1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659656; x=1747264456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7RpuWxwyysfef14AtI+lh3dKsD8m3KYFqA48Pzjpeo=;
        b=vfZhViZSvM4Wpu4zlpiiLeVWQHS8z6ZIPAz64gTpd5Wul3Q/ePcTSSfQzign8ZRmhF
         +r5wi7kFW3LEEerntzegwIj3audZyztxD4W7AqqibxnVuqSmg6CT8zcLFjQU6Nv2Xc9S
         Nf2C2bUzLnkHXZzruoTdaq9GBCymNVyxcGFRhUq2Ug5Gcmgm+8ND2X3TeZi1EaqZZTlB
         bm6pKnAEvf/y+swQxfE625EPJAhY97nMO2igLfR0ZDDDexjQXClefuar6QiQYU1XO2B2
         +uglxh5hlgtZiMalzrBICssDqzmOPD4gvSOTZb72FlM0gmLbHq0DqIgVBlH8zmiI9Y7Q
         9jmg==
X-Forwarded-Encrypted: i=1; AJvYcCWV/iBJPUSF+vyq9DGln6z+tNtbyKm8oHk8vO90qaoFpUT2jWWb1I/D/8L6adqHznhAihXQ+sz+Zrs2GsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4wQ+j/LrR4fyrCq/SaTY2JgpdNrIgcM8KxY3uGhmdH+/DRSI
	BwsSASF0wH4WaYN9dG/fq51m15V/kGS5iqJuNJH3JhowHOW2e0HVUfHbdkB/T2X22kfQPmb4dNM
	0HjcGjvBIi30vjeSwxsQiPn40+A==
X-Google-Smtp-Source: AGHT+IErf0bIdsCp80jvIgvn+0MFxfMOafuctLvyIXmHAjlWQ0hZisvPYYkFCiDDgnc6Hu7el4zHrf5zvCTzlE/10Q4=
X-Received: from pfmx22.prod.google.com ([2002:a62:fb16:0:b0:740:813:f7bb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1b4c:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-740a94e60d7mr1497047b3a.7.1746659656344;
 Wed, 07 May 2025 16:14:16 -0700 (PDT)
Date: Wed,  7 May 2025 23:14:08 +0000
In-Reply-To: <20250507231403.377725-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507231403.377725-7-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5212; i=samitolvanen@google.com;
 h=from:subject; bh=NtbmgkTzn8IARgcBDEgG4o5/FRCG0S2cxfpg5vDT+z4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBnSL22f2qe/rvGS5Mnt3bl4/q9fUxMuOLv8fHu+868jY
 4DOnG1iHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAib6oY/tmtfmzreLiHyf8h
 r3/AvtU73LbqNpt6KFT5TD6iOGPRcVZGhl/bs68sPXQvI0T2YPrzgMU3l1jpV/xhEwhkKVPnlqp 05gMA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507231403.377725-11-samitolvanen@google.com>
Subject: [PATCH v3 4/5] Documentation/kbuild: Drop section numbers
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Change the gendwarfksyms documentation to use proper chapter,
section, and subsection adornments instead of fragile section
numbers.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Documentation/kbuild/gendwarfksyms.rst | 44 +++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index e4beaae7e456..9694ec99d190 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -2,8 +2,8 @@
 DWARF module versioning
 =======================
 
-1. Introduction
-===============
+Introduction
+============
 
 When CONFIG_MODVERSIONS is enabled, symbol versions for modules
 are typically calculated from preprocessed source code using the
@@ -14,8 +14,8 @@ selected, **gendwarfksyms** is used instead to calculate symbol versions
 from the DWARF debugging information, which contains the necessary
 details about the final module ABI.
 
-1.1. Usage
-==========
+Usage
+-----
 
 gendwarfksyms accepts a list of object files on the command line, and a
 list of symbol names (one per line) in standard input::
@@ -33,8 +33,8 @@ list of symbol names (one per line) in standard input::
           -h, --help           Print this message
 
 
-2. Type information availability
-================================
+Type information availability
+=============================
 
 While symbols are typically exported in the same translation unit (TU)
 where they're defined, it's also perfectly fine for a TU to export
@@ -56,8 +56,8 @@ type for calculating symbol versions even if the symbol is defined
 elsewhere. The name of the symbol pointer is expected to start with
 `__gendwarfksyms_ptr_`, followed by the name of the exported symbol.
 
-3. Symtypes output format
-=========================
+Symtypes output format
+======================
 
 Similarly to genksyms, gendwarfksyms supports writing a symtypes
 file for each processed object that contain types for exported
@@ -85,8 +85,8 @@ produces C-style type strings, gendwarfksyms uses the same simple parsed
 DWARF format produced by **--dump-dies**, but with type references
 instead of fully expanded strings.
 
-4. Maintaining a stable kABI
-============================
+Maintaining a stable kABI
+=========================
 
 Distribution maintainers often need the ability to make ABI compatible
 changes to kernel data structures due to LTS updates or backports. Using
@@ -104,8 +104,8 @@ for source code annotation. Note that as these features are only used to
 transform the inputs for symbol versioning, the user is responsible for
 ensuring that their changes actually won't break the ABI.
 
-4.1. kABI rules
-===============
+kABI rules
+----------
 
 kABI rules allow distributions to fine-tune certain parts
 of gendwarfksyms output and thus control how symbol
@@ -139,8 +139,8 @@ Currently, only the rules discussed in this section are supported, but
 the format is extensible enough to allow further rules to be added as
 need arises.
 
-4.1.1. Managing definition visibility
-=====================================
+Managing definition visibility
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 A declaration can change into a full definition when additional includes
 are pulled into the translation unit. This changes the versions of any
@@ -168,8 +168,8 @@ Example usage::
 
 	KABI_DECLONLY(s);
 
-4.1.2. Adding enumerators
-=========================
+Adding enumerators
+~~~~~~~~~~~~~~~~~~
 
 For enums, all enumerators and their values are included in calculating
 symbol versions, which becomes a problem if we later need to add more
@@ -223,8 +223,8 @@ Example usage::
 	KABI_ENUMERATOR_IGNORE(e, C);
 	KABI_ENUMERATOR_VALUE(e, LAST, 2);
 
-4.3. Adding structure members
-=============================
+Adding structure members
+------------------------
 
 Perhaps the most common ABI compatible change is adding a member to a
 kernel data structure. When changes to a structure are anticipated,
@@ -237,8 +237,8 @@ natural method. This section describes gendwarfksyms support for using
 reserved space in data structures and hiding members that don't change
 the ABI when calculating symbol versions.
 
-4.3.1. Reserving space and replacing members
-============================================
+Reserving space and replacing members
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Space is typically reserved for later use by appending integer types, or
 arrays, to the end of the data structure, but any type can be used. Each
@@ -276,8 +276,8 @@ The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
 simplify the process and also ensure the replacement member is correctly
 aligned and its size won't exceed the reserved space.
 
-4.3.2. Hiding members
-=====================
+Hiding members
+~~~~~~~~~~~~~~
 
 Predicting which structures will require changes during the support
 timeframe isn't always possible, in which case one might have to resort
-- 
2.49.0.987.g0cc8ee98dc-goog


