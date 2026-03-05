Return-Path: <linux-kbuild+bounces-11581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ5vF8VzqWl77wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11581-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:15:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3BE21168C
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BCA230378DA
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 12:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E441E37F73A;
	Thu,  5 Mar 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NHueevwg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D9LRLmFD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB595361645;
	Thu,  5 Mar 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712254; cv=none; b=CuK0hh2SvEBBC2xrWLeKRth3cuoierTirt696XuAM5loL1QiavAcKe4zbIKzzrjpMAubXE6fRD61hq7bGDH9ReEcGr9voXjGC5oF8dNcdFmN0DrViXCRgkuCTl3z0xU9SJnaqTzDShMoTM6LAQv0/ECLZ94z7J5MGg0WkhJhf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712254; c=relaxed/simple;
	bh=EZ0bFcqL7al2I+rKZeG3J8bdpp80FJ/iXODlj16Vidg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kK+LDfukp7zVLFQURqcsAmcsi4KKFVyFPZ75sbCWt3uhD8YkOVq/bJySoSLzaz2PqzPg2TGHRGwr+BHgidK5XU6vnJdNKBTaBx3EgOF/BWB2G12JmfbdpJ5RC99SAEZT7X68Qdw50ZLfuut1Xx8HaRCbt2O6Ic9O1I8im4YNUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NHueevwg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D9LRLmFD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772712251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+g2tYa7DLzt/mJnlsOZCvKl2EDHDqccRtsbZb+rgRxs=;
	b=NHueevwg4HNRatoc2FM90gRbzM29njNShefZhZbA/fTSC3QSytjsQGQ67Y3S0DLwCBtSNE
	f0mWAHduUuwcGMa2f5a5aowucjj3DBjYYd4EwIrWJ1NVi/Yoe/90I8kX0ZeTdfnSMuvlR4
	x2bfsAKHsDKUGtKTXxUDbZgj4Bx0R+yo4K+R1FouBJC3dUPG3yo0HbhCh02rBlSfpzQYsD
	oocNdE7ZTy9+Qz8o6KwjeudjsFClBbDmNPRQ3gKHJ9H+GY3ZlZKx+b7hJxZ8CJHAq2p34/
	9+R6O22ZQ6AWnhKGe0/6EPiz8sbju+GpMcKg+3/Jf54GOPBNVlwGjOr0QWxE4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772712251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+g2tYa7DLzt/mJnlsOZCvKl2EDHDqccRtsbZb+rgRxs=;
	b=D9LRLmFDi1Xb4KSGbnHMMzPTS0aSAxjcZATEQbZ5YbW4ekk6g1JMlkeN4EmNmJmXm7+65j
	md7hWEkX+63TfhCQ==
Date: Thu, 05 Mar 2026 13:04:07 +0100
Subject: [PATCH] kbuild: reduce output spam when building out of tree
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-kbuild-makefile-spam-v1-1-910f6cf218a1@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf+XaZ1ssEb8iD8ftseHoLlKXf3d5n
 KaZCIG9cIBORfB8S5DDJSgyBdOi3cwoJjFQTnVORYnreMlmcNcrW9kYw6l3rLghWzctGashpad
 P8vm3/fC+H1TNFEtmAAAA
X-Change-ID: 20260213-kbuild-makefile-spam-4e72f6792dfa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772712251; l=1706;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=EZ0bFcqL7al2I+rKZeG3J8bdpp80FJ/iXODlj16Vidg=;
 b=9doy78DIV31+wiPQITqADpgH6DS5gYfceFXD7M6g8IradaBSG/Akc4kDR8Hj2wy8msbbkAbLE
 m78XCdLqoBEDmxHaQOQzHibNt6hH7PH71wyEOO4swelFfIBzAzCYmoA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 6D3BE21168C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11581-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The execution of $(call cmd,makefile) will print 'GEN Makefile' on each
build, even if the Makefile is not effectively changed.

Use a filechk command instead, so a message is only printed on changes.

The Makefile is now created even if the build is aborted due to an
unclean working tree. That should not make a difference in practice.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index e944c6e71e81..fae52ab03525 100644
--- a/Makefile
+++ b/Makefile
@@ -676,14 +676,19 @@ print_env_for_makefile = \
 	echo "export KBUILD_OUTPUT = $(CURDIR)"
 endif
 
-quiet_cmd_makefile = GEN     Makefile
-      cmd_makefile = { \
+filechk_makefile = { \
 	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
 	$(print_env_for_makefile); \
 	echo "include $(abs_srctree)/Makefile"; \
-	} > Makefile
+	}
 
-outputmakefile:
+$(objtree)/Makefile: FORCE
+	$(call filechk,makefile)
+
+# Prevent $(srcroot)/Makefile from inhibiting the rule to run.
+PHONY += $(objtree)/Makefile
+
+outputmakefile: $(objtree)/Makefile
 ifeq ($(KBUILD_EXTMOD),)
 	@if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
@@ -704,7 +709,6 @@ else
 	fi
 endif
 	$(Q)ln -fsn $(srcroot) source
-	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260213-kbuild-makefile-spam-4e72f6792dfa

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


