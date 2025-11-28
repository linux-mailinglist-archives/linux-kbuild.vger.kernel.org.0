Return-Path: <linux-kbuild+bounces-9912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAEC930FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 21:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E99234E25F3
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E195D2D46D6;
	Fri, 28 Nov 2025 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb9VnjF+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F927AC28;
	Fri, 28 Nov 2025 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360118; cv=none; b=WVr0Cv3q2WI+3H0Fu1oEO3qPwISA5bmuDUzF8YsqUUXw5Ph1FFwV5vNVwLvUklP7kgRAay/RYWcaiRyHY9rrqNR3IjkFCDaH2ODcZwd2Jh5g4vBiRPm9F87bhDwzt3pVUfFsfPL4E8aggxY2wDfkQSaIiq3cvEl4SFipXYhJzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360118; c=relaxed/simple;
	bh=CSWaeCg0AtDlUP1nzlxnywheToBpLzx0wG6+SaKhy+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XxYGpD7W9tLVfZCSs1+1DIzzs58GYt0ZyDHHS8c5s8OykrLwcxeRSC0oBgipn66tEWChFl1SUcp9rzTG6eUK0VEs3xF9hTuFI60loL5A5rCyfJpEfSFLFQSUZqKhW0EU6y5T9cUTAFcmliymm8ikLI/rNscWJ1RV8wGNuqBpyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb9VnjF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637B1C113D0;
	Fri, 28 Nov 2025 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764360118;
	bh=CSWaeCg0AtDlUP1nzlxnywheToBpLzx0wG6+SaKhy+Q=;
	h=From:Date:Subject:To:Cc:From;
	b=bb9VnjF+Kf1KgZli+1/pRodyLmntzjEt6rYbYShSbO5aJMvfNZmUHUoxaT8l6Lx0+
	 NVsSdnZq9J7jszB4u/dTn+l6dfxwlhfEDnDkPc9OpLdxIymK1B8L5GA0xa1/nQXirR
	 UQyiWyc6mjY+yhcUOx67sXqsl0o1Zwt5jXc/IIACJ0G8vb5J2GebU7C/Q9RAhOnp0E
	 raXRDZH86jRGZ3x3/JZyvxsAw2gMlo1xBxC0RyYBpxxs06mu4494rNf+OjloMAJTaT
	 GI3OKaHElCkrs9zBxDmkRztgKc6a4TICYKffslShImS+8CB46ZQMh0XLNlgnDCbjPP
	 hEDTa6to7qzbw==
From: Nicolas Schier <nsc@kernel.org>
Date: Fri, 28 Nov 2025 21:01:55 +0100
Subject: [PATCH] kbuild: Add top-level target for building gen_init_cpio
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-v1-1-84c63a8fc8d4@kernel.org>
X-B4-Tracking: v=1; b=H4sIALL/KWkC/y2O0Y7CIBBFf6Xh2TFA1hb7tP+xMQbLFSe2wAJtT
 Iz/vt3q47k3M+c+RUFmFNE3T5GxcOEYVlC7Rgw3GzyI3cpCS31QShu6X2YeHVnnqMZEIxaMVG3
 2qHSNmbaagyePcObA9TwkjtR+SQUJyE5JsT5PGVd+bOKf05szfufVX9+huNgCGuI0ce2bpd0rQ
 3lQ/7cTSrHbsr757DrQZpmim0cUSndPiyZJ1hrddc4cW6O/E4Kfa46BH3sHcXq9/gCeG837/wA
 AAA==
X-Change-ID: 20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-6401e0ee0710
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764360120; l=2347;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=CSWaeCg0AtDlUP1nzlxnywheToBpLzx0wG6+SaKhy+Q=;
 b=Z+yWRmNjum6svOFkmC5522o4YMrSA1IkHwNB2WAeVr77HSZBhpuW4g0bbnIlrdxAmi0Gsf4WO
 SYhgzEYRjRqCyQz1EbBt8NjBNlgiwqcsEsWtHK/qyP0q8JBvutqFBoN
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

Add a top-level target for building gen_init_cpio to prevent re-entering
kbuild for 'modules-cpio-pkg'.

The recently introduced target 'modules-cpio-pkg' depends on
gen_init_cpio but there is no simple way to add this dependency as a
prerequisite that can be built in parallel to other recipes.

Introducing the top-level target, enables fixing this and also prepares
a possible move of gen_init_cpio from usr/ to scripts/.

Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
This is based on the patch set from
https://lore.kernel.org/linux-kbuild/20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de
---
 Makefile                 | 6 ++++++
 scripts/Makefile.package | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca716..d5750e5bd633 100644
--- a/Makefile
+++ b/Makefile
@@ -1383,6 +1383,10 @@ ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
 endif
 
+PHONY += usr_gen_init_cpio
+usr_gen_init_cpio: scripts_basic
+	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
+
 PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
@@ -1635,6 +1639,8 @@ distclean: mrproper
 # Packaging of the kernel to various formats
 # ---------------------------------------------------------------------------
 
+modules-cpio-pkg: usr_gen_init_cpio
+
 %src-pkg: FORCE
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
 %pkg: include/config/kernel.release FORCE
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 83bfcf7cb09f..0ec946f9b905 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -201,7 +201,6 @@ quiet_cmd_cpio = CPIO    $@
       cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
 
 modules-$(KERNELRELEASE)-$(ARCH).cpio: .tmp_modules_cpio
-	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
 	$(call cmd,cpio)
 
 PHONY += modules-cpio-pkg

---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-6401e0ee0710
prerequisite-message-id: 20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de
prerequisite-patch-id: 9132e567c46357daaf2bd728ff18bfda1c51a9cb
prerequisite-patch-id: 0dfe03db654169d314d3baaba8536a9bfc9bcc70

Best regards,
-- 
Nicolas


