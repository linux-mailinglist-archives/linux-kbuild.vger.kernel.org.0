Return-Path: <linux-kbuild+bounces-126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FE7F551D
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 01:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689E81C20A8C
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 00:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF50D179;
	Thu, 23 Nov 2023 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fr7LKUrQ"
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 539 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 16:04:37 PST
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A684DD
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 16:04:37 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700697334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=APd5R7wj7h+UmDndBcpcrIZgyAl8kblJEa7hsW1VzXE=;
	b=Fr7LKUrQ1+DPyV59aRzL3jODD/CLS6w6QtYL7iNfwY43PhntlV2CnZKhxbzNFOmlLBi4SO
	q/aFPu3vTEVHuChpUq6NShLz2quOOZh/wFX/lb+bTnnZ+Dw4sLO0OWd2YBvoSKoAlmsb8F
	Hv3l1Yk8Wxh1XvSZjFlhrcEx5+wnTsc=
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: Allow gcov to be enabled on the command line
Date: Wed, 22 Nov 2023 18:55:27 -0500
Message-ID: <20231122235527.180507-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This allows gcov to be enabled for a particular kernel source
subdirectory on the command line, without editing makefiles, like so:

  make GCOV_PROFILE_fs_bcachefs=y

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 scripts/Kbuild.include | 10 ++++++++++
 scripts/Makefile.lib   |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 7778cc97a4e0..5341736f2e30 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -277,3 +277,13 @@ ifneq ($(and $(filter notintermediate, $(.FEATURES)),$(filter-out 4.4,$(MAKE_VER
 else
 .SECONDARY:
 endif
+
+ # expand_parents(a/b/c) = a/b/c a/b a
+expand_parents2 = $(if $(subst .,,$(1)),$(call expand_parents,$(1)),)
+expand_parents  = $(1) $(call expand_parents2,$(patsubst %/,%,$(dir $(1))))
+
+# flatten_dirs(a/b/c) = a_b_c a_b a
+flatten_dirs = $(subst /,_,$(call expand_parents,$(1)))
+
+# eval_vars(X_,a/b/c) = $(X_a_b_c) $(X_a_b) $(X_a)
+eval_vars = $(foreach var,$(call flatten_dirs,$(2)),$($(1)$(var)))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1a965fe68e01..0b4581a8bc33 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -148,7 +148,7 @@ _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(target-stem).lds)
 #
 ifeq ($(CONFIG_GCOV_KERNEL),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)), \
+		$(GCOV_PROFILE_$(basetarget).o)$(call eval_vars,GCOV_PROFILE_,$(src))$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)), \
 		$(CFLAGS_GCOV))
 endif
 
-- 
2.42.0


