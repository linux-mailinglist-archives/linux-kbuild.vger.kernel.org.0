Return-Path: <linux-kbuild+bounces-8249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C47B1550C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 00:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67E2A7A61AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 22:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3221824676D;
	Tue, 29 Jul 2025 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="AsyoztsJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553C921FF36
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Jul 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753826697; cv=none; b=FdQA6cgec+Et3f7sPnA2EbAYtAyRhyRuBqbmoUjyA+sZbyLJesiY5ovHNr+KP7P86x+c1aTMPZHm7PmajYUgMirna0F7eGhdXllRWvNmpaYLQyCyyR+11wuex7H2RwD5aZoa6TcvZO5yr3oVhGpPSLEIe6VUQmrCdptdx30kXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753826697; c=relaxed/simple;
	bh=ceUOkYXn51TKbnbiH5oq8ZFfiPD7PVRxsv/g/mfxYic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svXhEECuuG7x/E6Jryn8aHzJLMURZekSCBBPxz+7iAN+u4/SJsDFSKALRuhtgYjHETgu10jEGBqvCCVSFVgp5k1HpBRAbyV6pVAxFRozvNdlSI829Lz+I4/teHWyihjctSnPDpp/xpCQSPh7hULf5UDPUgynit/JbLluH/gqZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=AsyoztsJ; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-136.bstnma.fios.verizon.net [173.48.82.136])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 56TM4okr019843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 18:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1753826691; bh=zJe+bV0B97VIop6E2/wTuB4dEkhC0E1N1kHu+kNmt1s=;
	h=From:Subject:Date:Message-ID:MIME-Version;
	b=AsyoztsJFx81jOHnw0HzX9BeT91pxFhhetxrSHy0aEBxvfSMdvkplAFv1LhWzKCKb
	 n5RLZ6JMJ/eDCV7GKPL44u69CJlMfrs4vBz/DItK0BmC4pdvZCi4X6Pw3StYWrZUEk
	 v+/kpyI1tqdFZriszy/WWZwZrW2LhgdfasHukRV3cd0N5074MukTan/cLjNI31cWQv
	 itEe5dur74N4xLBeprf0Kn3yCWfm7lsCl3TNE++FsaxdVTKchDZPasiL8V/gzrRYHD
	 coB5BEK1o9fJSZYwTp4ccb+bSvdlzz5UKhHpH9Py0OMeHbT9Q5mIjkyVXeir0n9WTY
	 jIUW6T1oiUqjw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 068E62E00D6; Tue, 29 Jul 2025 18:04:50 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: linux-kbuild@vger.kernel.org, kunit-dev@googlegroups.com
Cc: "Theodore Ts'o" <tytso@mit.edu>
Subject: [PATCH] kbuild: run kunit selftests via the top-level kunit target
Date: Tue, 29 Jul 2025 18:04:39 -0400
Message-ID: <20250729220439.421735-1-tytso@mit.edu>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we can make kunit tests easier to run (currently, the way to run
them is via "./tools/testing/kunit/kunit.py run") then it's much more
likely that people will run the Kernel unit tests as part of their
normal development workflow.

See the discusion linked below for more details about the rationale
behind this change.

Link: https://groups.google.com/g/kunit-dev/c/aHnAlT13ayU
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 478f2004602d..1d5257240a5d 100644
--- a/Makefile
+++ b/Makefile
@@ -295,7 +295,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile rustavailable rustfmt rustfmtcheck
+			 outputmakefile rustavailable rustfmt rustfmtcheck kunit
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
@@ -2139,6 +2139,15 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
+PHONY += kunit
+kunit:
+ifeq ($(SRCARCH),x86)
+	$(Q)$(PYTHON3) $(srctree)/tools/testing/kunit/kunit.py run
+else
+	@echo >&2 "Kunit not supported on this architecture: $(ARCH)"
+	@false
+endif
+
 endif # config-build
 endif # mixed-build
 endif # need-sub-make
-- 
2.47.2


