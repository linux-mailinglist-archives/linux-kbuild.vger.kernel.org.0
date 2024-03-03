Return-Path: <linux-kbuild+bounces-1113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DD86F867
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC38280F52
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED04AA31;
	Mon,  4 Mar 2024 02:11:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F11362
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518265; cv=none; b=O5h3NkkenTy6fKB6iGZHfXEP3I4LYqHcT6Hxp1nNbWCxC3DwcGvN1+hLA5hvQxQG81taAPm4E8YxH4yj13PO44z2vC5kDpH0s6i8t213EjXiClskpnRwL04iDxewLtlPxADPGChHxpSFRQRwJSnFgdrhHQIMhcFwQEqe7dx8xSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518265; c=relaxed/simple;
	bh=h4/hvtZxNmGc4xWK0xDrhpXuUKYEUSPg1jU4l/Le7s4=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=lwC8lsneB6cw8ZE/SFZi6RufKpyw7MapvDv0dULUl3BqyLH3qPHeRs+td9fX0TIaReo7Hi4CrAZxFbOemNUn0Y0BKp1D+x1WueXnD9aWzQUjcrX/sl466G+UIW8ui4Ej64cCBy3aZa1uI1NQP1hitL80LYxSnom9oTTzxhOhqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242Aj3J021818
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:10:51 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242AiaP021817;
	Sun, 3 Mar 2024 18:10:44 -0800 (PST)
	(envelope-from ehem)
Message-Id: <f0595a783d60c80c78a861ff70e7cf52f3a0729a.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 04/30] build: add trailing slash to $(*tree)
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This better handles the case of $({src|obj}tree) being the current
directory and $({src|obj}) being an absolute path.  Instead of being
".", $({src|obj}tree) ends up empty, and $({src|obj}) can be directly
appended.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
I suspect the Makefile sections in tools/ are attempting to solve the
*exact* *same* issue.  Problem is that workaround requires changes in
every Makefile, whereas this looks closer to the root cause.

I'm less than 100% sure I've avoided all spacing changes.  I forget
where, but I seem to recall running into a space which was instead a tab.

`find . -name Makefile* -print0 | xargs -0 grep -e^\[\[:space:\]\]\*srctree.\*=`
is a handy way to locate these.
---
 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index a7696f13bece..6d7758a76429 100644
--- a/Makefile
+++ b/Makefile
@@ -246,24 +246,24 @@ else # need-sub-make
 
 ifeq ($(abs_srctree),$(abs_objtree))
         # building in the source tree
-        srctree := .
+        srctree := ./
 	building_out_of_srctree :=
 else
         ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
                 # building in a subdirectory of the source tree
-                srctree := ..
+                srctree := ../
         else
-                srctree := $(abs_srctree)
+                srctree := $(abs_srctree)/
         endif
 	building_out_of_srctree := 1
 endif
 
 ifneq ($(KBUILD_ABS_SRCTREE),)
-srctree := $(abs_srctree)
+srctree := $(abs_srctree)/
 endif
 
-objtree		:= .
-VPATH		:= $(srctree)
+objtree		:= ./
+VPATH		:= $(srctree).
 
 export building_out_of_srctree srctree objtree VPATH
 
-- 
2.39.2


