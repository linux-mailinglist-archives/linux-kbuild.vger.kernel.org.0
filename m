Return-Path: <linux-kbuild+bounces-1120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46086F88A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2668C281098
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04837138A;
	Mon,  4 Mar 2024 02:26:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD8C15B7
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519203; cv=none; b=McKSOeo1c1ITiD+mIPxh3In2tFuP8uqxF0B0lsOfXJy/HoTB99ghEX4QDbBvvOHKMIGGM1LKzMandv0q9jPFzCZNHTQ1Wj0mZzKcgtXRz3KMyw7/ZAG2evDDCZdl47cxT+SzIAML3aB5Qn09tJVwyRG1Ct2rxD/LXDVsvtCzWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519203; c=relaxed/simple;
	bh=0iVKL0RXdm26QxVPfIjRCDJ77FTD9qUHxYZaQrMfFXQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=e+rrecaKc58YiH6r2yVESPZlvS8FtXDHdwV33faA/kLwX/V3wqOuqMrXmzgN+pEDJAXeYzzwpV8gPRUeodtF2CDHPjf98HYoX4chxhzEq0QIXwASz0XZZq7+WK4I0otnZc/NqnzuCvlWlqH498Tlox5f5eDRqilNabVDez5uIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242NrlP021917
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:23:59 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242NriC021916;
	Sun, 3 Mar 2024 18:23:53 -0800 (PST)
	(envelope-from ehem)
Message-Id: <8c827ad193028a0a5875b048923ae67511387902.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 12:03:01 -0800
Subject: [WIP PATCH 12/30] scripts: modify uses of $(srctree) to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Kconfig\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 scripts/Kconfig.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..270ae97b05a9 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -40,19 +40,19 @@ $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
 # Get the C compiler name, version, and error out if it is not supported.
-cc-info := $(shell,$(srctree)/scripts/cc-version.sh $(CC))
+cc-info := $(shell,$(srctree)scripts/cc-version.sh $(CC))
 $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this C compiler is not supported.)
 cc-name := $(shell,set -- $(cc-info) && echo $1)
 cc-version := $(shell,set -- $(cc-info) && echo $2)
 
 # Get the assembler name, version, and error out if it is not supported.
-as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
+as-info := $(shell,$(srctree)scripts/as-version.sh $(CC) $(CLANG_FLAGS))
 $(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
 as-name := $(shell,set -- $(as-info) && echo $1)
 as-version := $(shell,set -- $(as-info) && echo $2)
 
 # Get the linker name, version, and error out if it is not supported.
-ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
+ld-info := $(shell,$(srctree)scripts/ld-version.sh $(LD))
 $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
 ld-name := $(shell,set -- $(ld-info) && echo $1)
 ld-version := $(shell,set -- $(ld-info) && echo $2)
-- 
2.39.2


