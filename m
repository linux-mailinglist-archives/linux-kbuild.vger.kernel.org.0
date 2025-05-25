Return-Path: <linux-kbuild+bounces-7258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C63AC342E
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 13:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829DA1892DBF
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 11:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042DF1DFD86;
	Sun, 25 May 2025 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmTI0sx7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2F7260D;
	Sun, 25 May 2025 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748172518; cv=none; b=D6QzgUtEZyDOu8UxBgGjSU2bxqA0OjzZzBokBTBjkmwWjXmvEIr2iFjVjTZi+vJdvg6yCN3X0WnCe2rMk1UDTYoZw9QDHQorf48eXCFe9+CdcsWRCb5wh0+SEGDGiOEF7FdU9tS5+hORdYCnvI0ulimDUQseZ35SO+I0M/moPLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748172518; c=relaxed/simple;
	bh=UYLwjzdv9Qt8WxVwZ4A/+Ogo3UVfgh3pwQ1MTY19UEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGRpDuag4D1XWOtWQ+L1vdOaHv1n5rPwAcRmHykipGJvflJORGarz6avOtkjZ0jOGEY9zh225K+NAAAZY4NjPLyfnSQSOrYz4mEeAuOvOOKvlmpibvwzUm9PolBDMEeKhVYHGwP3BnzPN8I+skHdSRcNPoT1AsPi8bbmjsMyeQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmTI0sx7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB20CC4CEEA;
	Sun, 25 May 2025 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748172518;
	bh=UYLwjzdv9Qt8WxVwZ4A/+Ogo3UVfgh3pwQ1MTY19UEo=;
	h=From:To:Cc:Subject:Date:From;
	b=QmTI0sx7O+ZUd9rOd9pHw8+s0s+nUVlLOLC75ghhBJxTdEwHtoIKYa0EY24dwVRG3
	 aatbGGSCDnNVR+SjNaJ9p8vhOSWr5UX/smiTIn6paqKaeX21zsyStkoWDqJAmclCNF
	 qxr2fEdNa92p2wRQnIZzbHdQR+K494gKu6NH7Q0aRBVcXuHXBIlPat369QhJXUc5qy
	 DDYoUQeRpuNl8/GQMxmIp2FnhSfzOY1La/MWSBRZ6tmGbEe2+ztCgKgYd2xyXsJ+JX
	 bvotPjK9hfuomsNZfZxTm5ARt6eWXQLrLEP2xqDKeopO5iqhqa800I9h5pNJ/eXHGu
	 J1UUGazc38Ihw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: replace deprecated T option with --thin for $(AR)
Date: Sun, 25 May 2025 20:28:31 +0900
Message-ID: <20250525112833.3808220-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to 'man ar':

    T   Deprecated alias for --thin.  T is not recommended because in
        many ar implementations T has a different meaning, as specified
        by X/Open System Interface.

'man llvm-ar' also states:

    T   Alias for --thin. In many ar implementations T has a different
        meaning, as specified by X/Open System interface.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 6 +++---
 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index efbc0966b82a..682a8002b7a1 100644
--- a/Makefile
+++ b/Makefile
@@ -1201,12 +1201,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := 1
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += vmlinux.a
 vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8d8252229895..284931f2a9a2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -456,7 +456,7 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; \
 	$(if $(real-prereqs), printf "$(obj)/%s " $(patsubst $(obj)/%,%,$(real-prereqs)) | xargs) \
-	$(AR) cDPrST $@
+	$(AR) cDPrS --thin $@
 
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index d858a3223bcd..e37e2db5f528 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -280,7 +280,7 @@ quiet_cmd_ld = LD      $@
 # ---------------------------------------------------------------------------
 
 quiet_cmd_ar = AR      $@
-      cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
+      cmd_ar = rm -f $@; $(AR) cDPrs --thin $@ $(real-prereqs)
 
 # Objcopy
 # ---------------------------------------------------------------------------
-- 
2.43.0


