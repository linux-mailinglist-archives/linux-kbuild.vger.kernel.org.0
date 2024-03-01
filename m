Return-Path: <linux-kbuild+bounces-1121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF686F88B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10AD1F20FD6
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7FF138A;
	Mon,  4 Mar 2024 02:26:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282315B7
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519210; cv=none; b=JsuBBZo/v9W0zZ8NAZ+KBxbDxLL3PWVJVVKNgLO349oiK5u+O+s4tdab7rO1xkEJuDPLuw6AzMM0xebhZDepYpYUrhCX7FOUPyjRZip+480aLfDvF4lQYCq/69t4cxzDTpOYKuTCAbv2wW+pnKE9u3OQd/vm1IJ5yfQurCdlyms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519210; c=relaxed/simple;
	bh=nUmBPlQTy2Sr0KYbfve4M1PKJ9sYPkH/hgYPy89kBo0=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=H+G7olOzkQGXDuidr0Ik/x9QOFr0qyFX+dt/C6Iaqnrm5FvBIhc7Xjydjz7P28CPoV+MLQ+9XtUR0fIjqSNnzWGqCpSud1nW2d8ggPtWPJkPuzGpLv0Ow0p05wtEfBUymRuNTJqpGmclPLb99u+7BhxvzPCShgPvosdSnleeL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242MF34021910
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:22:21 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242MF4K021909;
	Sun, 3 Mar 2024 18:22:15 -0800 (PST)
	(envelope-from ehem)
Message-Id: <dc7956301d3bfd2ab61ec459f37fa2be0aef17bb.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 11:48:49 -0800
Subject: [WIP PATCH 11/30] scripts: modify uses of $(srctree) to assume
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

Include the instance of $(objtree) in include/uapi/Makefile while at it.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Kbuild\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 scripts/Kbuild.include | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 7778cc97a4e0..6d2a3c34a3f2 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -62,7 +62,7 @@ stringify = $(squote)$(quote)$1$(quote)$(squote)
 
 ###
 # The path to Kbuild or Makefile. Kbuild has precedence over Makefile.
-kbuild-dir = $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
+kbuild-dir = $(if $(filter /%,$(src)),$(src),$(srctree)$(src))
 kbuild-file = $(or $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Makefile)
 
 ###
@@ -111,19 +111,19 @@ endef
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
 # Usage:
 # $(Q)$(MAKE) $(build)=dir
-build := -f $(srctree)/scripts/Makefile.build obj
+build := -f $(srctree)scripts/Makefile.build obj
 
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.dtbinst obj=
 # Usage:
 # $(Q)$(MAKE) $(dtbinst)=dir
-dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj
+dtbinst := -f $(srctree)scripts/Makefile.dtbinst obj
 
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.clean obj=
 # Usage:
 # $(Q)$(MAKE) $(clean)=dir
-clean := -f $(srctree)/scripts/Makefile.clean obj
+clean := -f $(srctree)scripts/Makefile.clean obj
 
 # pring log
 #
-- 
2.39.2


