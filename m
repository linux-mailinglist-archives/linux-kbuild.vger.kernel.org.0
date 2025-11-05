Return-Path: <linux-kbuild+bounces-9427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC081C3832F
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 23:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3FC94EA984
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 22:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F21B2EFD95;
	Wed,  5 Nov 2025 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlA+MohT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026BB2DF6EA;
	Wed,  5 Nov 2025 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381836; cv=none; b=Cx9g5R2OTAC6tOkvhcoGrNkmxC1nE2VdkhHJmrVU1gR7v4/U+fUSpoY7v8m6OzBnas1ZL/sYftGx9zEmY9r/rsjakhgjTuYe4Del4TAYjmdYEI7CvrW1P5e+S+NwPylWUbjgxYTE8+ay0SKUVtpWVXfeZcMJF0FwORTLhxR2SS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381836; c=relaxed/simple;
	bh=mYnvpEKBogT7BsYEja2SXk61pPZfhZQoW0bsF8Nq61w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ubkx4/vP9NNz0XDhd5vXyOGYeRYPK5UavJGwRH4BuaNH00WTc8uw8xbl87Vlf9aAxokhp08aPH5ytuYiupeWYCckTrGshzCeTlUGH/ouWtYnEdtxDeiQRR3uxPqL41VxA8eZNYOGyle729s8law+m0ZRNLscGQiNfyIQfrJq19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlA+MohT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA4EC4CEF5;
	Wed,  5 Nov 2025 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762381835;
	bh=mYnvpEKBogT7BsYEja2SXk61pPZfhZQoW0bsF8Nq61w=;
	h=From:Date:Subject:To:Cc:From;
	b=qlA+MohTzsuKi72Z/CfMBJJ8Lc6lpGAN58JpC/EaOcDaFf+aqyK8LzKq0I+y97fFd
	 Pn2zEwHe9ImEZM+Bho9tDelyf2sE9I0cj1eQIyHtyxRUgPp79Se6rwhcCCeAvAyMds
	 6nTaV3WBlYpy7HWw2CVx1K6qQzrgzlKvJUWzBFfJnuy3FAhmLYN0gAihohH6zDBVLk
	 bRa2epBAJVjznyjYyTtJemBA02lkAaszOgWVfDn6VkiFfdAqHjtuYs7jEtOFbMmp9g
	 3ZYQ8zWQjat0xWXWtJfCNk8ltS+2swBfki4oV1eM/AepxbC1POvtIg/V207OIle0Zj
	 bisRqH01QD2sg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 05 Nov 2025 15:30:27 -0700
Subject: [PATCH] kbuild: Strip trailing padding bytes from
 modules.builtin.modinfo
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-kbuild-fix-builtin-modinfo-for-kmod-v1-1-b419d8ad4606@kernel.org>
X-B4-Tracking: v=1; b=H4sIAALQC2kC/x3NwQqDMBAE0F+RPXfB1YZqf6V40GRTF9ukJCqC5
 N+77W0eDDMnZE7CGe7VCYl3yRKDgi4V2HkMT0ZxamjqxhDVBpdpk5dDLwf+0ioB39FJ8BF9TLg
 o0FhLfXe9Ue9a0KVPYu3/Xx5DKV87Guc3dQAAAA==
X-Change-ID: 20251105-kbuild-fix-builtin-modinfo-for-kmod-5cc1984719d3
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Omar Sandoval <osandov@fb.com>, 
 Samir M <samir@linux.ibm.com>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mYnvpEKBogT7BsYEja2SXk61pPZfhZQoW0bsF8Nq61w=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJncFzifhWsavu1JSbIoMF+Yc6vJeUpsppLz1gfa27dcd
 Wbg8fjdUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACay/ywjQ1uugjWHdkLbotqz
 XmcS3FKUONV7XqVdWTndV7rOXMYjn5Fh0YorfySe7Gec4tXp6PtqqX5M7rz4ezL3rnBsPBTBLX+
 FFQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit d50f21091358 ("kbuild: align modinfo section for Secureboot
Authenticode EDK2 compat"), running modules_install with certain
versions of kmod (such as 29.1 in Ubuntu Jammy) in certain
configurations may fail with:

  depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix

The additional padding bytes to ensure .modinfo is aligned within
vmlinux.unstripped are unexpected by kmod, as this section has always
just been null-terminated strings.

Strip the trailing padding bytes from modules.builtin.modinfo after it
has been extracted from vmlinux.unstripped to restore the format that
kmod expects while keeping .modinfo aligned within vmlinux.unstripped to
avoid regressing the Authenticode calculation fix for EDK2.

Cc: stable@vger.kernel.org
Fixes: d50f21091358 ("kbuild: align modinfo section for Secureboot Authenticode EDK2 compat")
Reported-by: Omar Sandoval <osandov@fb.com>
Reported-by: Samir M <samir@linux.ibm.com>
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com/
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Tested-by: Omar Sandoval <osandov@fb.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.vmlinux | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index ced4379550d7..cd788cac9d91 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -102,11 +102,24 @@ vmlinux: vmlinux.unstripped FORCE
 # modules.builtin.modinfo
 # ---------------------------------------------------------------------------
 
+# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
+# tools that expect vmlinux to have sufficiently aligned sections but the
+# additional bytes used for padding .modinfo to satisfy this requirement break
+# certain versions of kmod with
+#
+#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
+#
+# Strip the trailing padding bytes after extracting .modinfo to comply with
+# what kmod expects to parse.
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
+                                    sed -i 's/\x00\+$$/\x00/g' $@
+
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
 
 targets += modules.builtin.modinfo
 modules.builtin.modinfo: vmlinux.unstripped FORCE
-	$(call if_changed,objcopy)
+	$(call if_changed,modules_builtin_modinfo)
 
 # modules.builtin
 # ---------------------------------------------------------------------------

---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20251105-kbuild-fix-builtin-modinfo-for-kmod-5cc1984719d3

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


