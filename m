Return-Path: <linux-kbuild+bounces-6498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BABA7F0EC
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 01:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9AA1898F52
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 23:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E212225388;
	Mon,  7 Apr 2025 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnOYkPeg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D35218ABA;
	Mon,  7 Apr 2025 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068150; cv=none; b=LUtbGtENGjDze0c1uoaw1CDN9+0ARvCNZP73fXmLqieAF8oCaQI9taYFcpiGff/2XOBgIAZJwjF1j5rfINQh4MmEOc1u+w1ex752Bb38r145yIrom9s9uT1QtcNuxm8EIhN7XBZfx7m8l7nyIx9OAmSRckkK10JKkTP+Nd9xBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068150; c=relaxed/simple;
	bh=Ls50zjk2LjsxfiQDbwMNPBoaTS7Qfm52P87Ua4vzBSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VYFPVUYOJ6J8+/3pmRFxU9bg18DDCpvkAT+xRN+w6LYVzIsZoi4o6s6frHeRn+HOT5KM/y1utb/d7W3+4dpAkwSL7B9U4ng99r53e2nXoNY2XalruzdWriHk5h+5Kj3qHSkZQYe9K8FAMD4ZZhCTWAZHkctGWYHrBw+a32vPhOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnOYkPeg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88A7C4CEE8;
	Mon,  7 Apr 2025 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068149;
	bh=Ls50zjk2LjsxfiQDbwMNPBoaTS7Qfm52P87Ua4vzBSg=;
	h=From:Date:Subject:To:Cc:From;
	b=ZnOYkPeg+6MV5/3EgmQKlfeGvSukYVXEBNOuI++ZIqpO2sBtZUL95/+qQ2P5dSeKF
	 oSPu4sN8mFyyNOZe8mZiTgX7pC/l4ug0jOOqzLqgiMVRbj4Pu1FPiObGrouvOJJowI
	 6ep3fZqpJEYm+3fRpsNujSFWQTKiN/EmdMob5AdvmEr4UyiGQST4uYQxjZWo1A+9Lu
	 Q9GgAS01ILv9vqFzxq3lvytNllwrTIv+QoI8Q9/4AU0NVnPQnz0r1sflx+97TIro2t
	 RDTxxKfm9DvU4hPk1Gcop4mxa/qk+rcjsSiJxBi8k7bXhwCbcsDWO2tIqpJvY9y8dV
	 IlXPtZwcNoWAw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 07 Apr 2025 16:22:12 -0700
Subject: [PATCH] kbuild: Add '-fno-builtin-wcslen'
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org>
X-B4-Tracking: v=1; b=H4sIACNe9GcC/x3MSQqAMAxA0auUrA3U0uJwFXFRNWpAorROIN7d4
 vIt/n8gUmCKUKsHAp0ceZWEPFPQz14mQh6SwWjjtNUFjrJid/Cys+DVx4UEK+1LV3oqBmchhVu
 gke9/2rTv+wFljN1dZAAAAA==
X-Change-ID: 20250407-fno-builtin-wcslen-90a858ae7d54
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Ls50zjk2LjsxfiQDbwMNPBoaTS7Qfm52P87Ua4vzBSg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlf4ozvNQY8YpTnm1DMN23RuQOm005tNI0+u/bw2k9xr
 YtvN3TYd5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJGNoz/FPrSH7FqHx6o7SF
 udY3j7inkQU18ZfUD6brpOi9+pcssZ+R4WBf1qTeeceyFiYyqy5cJMjY3/7x0bMl93MndZ8Lk1V
 9wgUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A recent optimization change in LLVM [1] aims to transform certain loop
idioms into calls to strlen() or wcslen(). This change transforms the
first while loop in UniStrcat() into a call to wcslen(), breaking the
build when UniStrcat() gets inlined into alloc_path_with_tree_prefix():

  ld.lld: error: undefined symbol: wcslen
  >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2_utils.h:54)
  >>>               vmlinux.o:(alloc_path_with_tree_prefix)
  >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2_utils.h:54)
  >>>               vmlinux.o:(alloc_path_with_tree_prefix)

Disable this optimization with '-fno-builtin-wcslen', which prevents the
compiler from assuming that wcslen() is available in the kernel's C
library

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 38689a0c3605..f42418556507 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,6 +1068,9 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS   += -fconserve-stack
 endif
 
+# Ensure compilers do not transform certain loops into calls to wcslen()
+KBUILD_CFLAGS += -fno-builtin-wcslen
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-fno-builtin-wcslen-90a858ae7d54

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


