Return-Path: <linux-kbuild+bounces-11683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANH8J//orWmb9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11683-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE542324DD
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A07243014410
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 21:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0C4356A38;
	Sun,  8 Mar 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ebT2VyAB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1A355F25;
	Sun,  8 Mar 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005049; cv=none; b=ftoKUb0DVF1aY0BsXHvvA5MjViVPYNcawM7M+vYyJNtSe0mkOvHHGx6mPyBFk28UCFDaqBqTuK6fFY2sG/YaeZi98Wdem61i0BsVJUyw3yRTBqq7h2tb2yyrzftsXHKphFRJ6+4SAvWWZWhT4/A4i+Sg9cKZUxK/2CNAD6baxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005049; c=relaxed/simple;
	bh=HwLfblw+VRZLHJdgjzQhIHg+sRaFcsc1K0c5qr+oBMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=frfoDmLm5wbkV4udeaF9dMnYVJKh09238czFybUFXuEtm4NLlqzKmFcJ1zW1qyb/pQXqmdru/Nv7c48xKx0nACuZ9SsZ5rigH+RGAjDETDzhBpec32txGFH7ViNn7PJP6faIg/FJtTJ6U/mUlP7PFOlZ9WInqqNpc/zljCkVk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ebT2VyAB; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005045;
	bh=HwLfblw+VRZLHJdgjzQhIHg+sRaFcsc1K0c5qr+oBMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ebT2VyABQsUQ5DK/pJmOfS9GUdwU6LaQk8qxfBLC2h3+okQrXd8PHg6Cz54yF0xwq
	 likZpZziXxOcMUpBsaYwZbMAKWfa388RlQVWhBtmXlONKd/KkHUTrqWUeFwYOanYGj
	 UaedLySmuNzei4jTPVwC1Le58INJVQsS3L4t5www=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Mar 2026 22:24:03 +0100
Subject: [PATCH RFC 3/5] kbuild: uapi: handle UML in architecture-specific
 exclusion lists
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-kbuild-uapi-c-v1-3-86aae09a7f1d@weissschuh.net>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=1749;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HwLfblw+VRZLHJdgjzQhIHg+sRaFcsc1K0c5qr+oBMY=;
 b=DIDGAfWpVSn7G2ouaCJofvVSnkFxYDIZQRSGfJxtScz56ikvQv5mWzrSigzV14hjhZO7nYBMm
 ZwakK5g3dZBAJ1ckmGOzCa8S+WqZ8s3ZQkMEO5YQdiN6bVsYie877+7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 3EE542324DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11683-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

When building User Mode Linux SRCARCH is set to 'um', while the actual
underlying architecture is provided in HEADER_ARCH.

Allow the exclusion lists to work on UML by comparing against
HEADER_ARCH when that is available.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 74f5ba24bb29..edeaf9d778c4 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -7,6 +7,7 @@
 # -std=c90 (equivalent to -ansi) catches the violation of those.
 # We cannot go as far as adding -Wpedantic since it emits too many warnings.
 UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
+UAPI_ARCH := $(or $(HEADER_ARCH),$(SRCARCH))
 
 override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
 
@@ -48,11 +49,11 @@ no-header-test += xen/privcmd.h
 
 # More headers are broken in some architectures
 
-ifneq ($(filter arc openrisc xtensa nios2, $(SRCARCH)),)
+ifneq ($(filter arc openrisc xtensa nios2, $(UAPI_ARCH)),)
 no-header-test += linux/bpf_perf_event.h
 endif
 
-ifeq ($(SRCARCH),sparc)
+ifeq ($(UAPI_ARCH),sparc)
 no-header-test += asm/uctx.h
 no-header-test += asm/fbio.h
 endif
@@ -122,15 +123,15 @@ uses-libc += linux/wireless.h
 uses-libc += regulator/regulator.h
 uses-libc += scsi/fc/fc_els.h
 
-ifeq ($(SRCARCH),hexagon)
+ifeq ($(UAPI_ARCH),hexagon)
 uses-libc += asm/sigcontext.h
 endif
 
-ifeq ($(SRCARCH),nios2)
+ifeq ($(UAPI_ARCH),nios2)
 uses-libc += asm/ptrace.h
 endif
 
-ifeq ($(SRCARCH),s390)
+ifeq ($(UAPI_ARCH),s390)
 uses-libc += asm/chpid.h
 uses-libc += asm/chsc.h
 endif

-- 
2.53.0


