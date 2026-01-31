Return-Path: <linux-kbuild+bounces-10956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIiqLpMZfmnKVgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10956-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:02:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36EC29D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 219D7300A605
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E15C2C08A2;
	Sat, 31 Jan 2026 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXzxeNNk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905576026;
	Sat, 31 Jan 2026 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769871760; cv=none; b=TYxbXKEqvDJ0x64JhI79ViUzLjUmzz8DBAzWV5DJ1lhM2A8taovZir9AYqgIsqLjRH1PnfDWqDwRscVOyiLJ3ESMDOAV8A0OG69KQGmShkbltyxk1WtKHQm463TJ6A3MV2vbabo0/C3KBVHtqQG/tHgpHH0aTYf7I7bAjBeydUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769871760; c=relaxed/simple;
	bh=evR7J1cgRygUP/vp6mbLTdnFKPRUX/a0xZWUlakiNQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AGUyZDxDWDpRa9vM3w9tEkiNUDDPcnB7lV3pwNM94WV7Ex455Pkh50kadqfCPKFBTAYMY7VAgG/yNxiJ3VIAyc3AFR6K0ep0UpoF1Mg8nmmJEFmPxHCOV6zgFNr4y3/KVFFilmg8EUsQC93oMK0ikfxdL60BSMM1Q8tNE9CfjE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXzxeNNk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A56C4CEF1;
	Sat, 31 Jan 2026 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769871759;
	bh=evR7J1cgRygUP/vp6mbLTdnFKPRUX/a0xZWUlakiNQQ=;
	h=From:Date:Subject:To:Cc:From;
	b=hXzxeNNkn6ZDr3E9Ovt3e0lGG5jG7lt+Q2LtvEIk2IZFfmiFYXDVhVtPrg8Q6KRfp
	 oGGaTczv3yygP1KXwQEE+e+v5CqhQfBsFLfFAJ8gSxuhTMdHH10WLUPr7sCSTRBsGE
	 z22xtjb72kM+btRpJpgExhT/f5qAOaX1ehEBbRIV59+Dz94azn2HAAmsWm12ZEa1iQ
	 lsUVF3hLqVKlThXwXOn9tF3/dBvq3um4rzSYMrdXzTXTlpDYfwQnrC+YEmBv29LDqW
	 s6E+S4QJXISGudEmPlm+KXtiaCZqVMQlNQZSBRkTnTw+4JyDRLSNtwAcrmRzlFcmiG
	 jZKEbckeZ2g1g==
From: Nicolas Schier <nsc@kernel.org>
Date: Sat, 31 Jan 2026 16:02:32 +0100
Subject: [PATCH] kbuild: Run kernel-doc only for in-tree builds
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-run-kernel-doc-only-in-tree-v1-1-93a9c695dfb1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIcZfmkC/x3NQQrCMBBG4auUWTuQRNDBq4gLbX/tYJnIpBVLy
 d2NLr/NexsVuKLQqdvI8dai2RrirqN+vNoDrEMzpZAOIe4j+2L8hBsmHnLP2aaV1Xh2gKPcIEe
 IpCDUCi/HXT//+vnSPGqZs6+/Wa31C7cVBq18AAAA
X-Change-ID: 20260131-run-kernel-doc-only-in-tree-18be87e88208
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nsc@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Rong Zhang <i@rong.moe>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=evR7J1cgRygUP/vp6mbLTdnFKPRUX/a0xZWUlakiNQQ=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpfhmID1QaN9RoqpmqJs+ZfdJXiaJV/0wtAv/P8
 vFy1IucEdOJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaX4ZiAAKCRAHUgpwFiYS
 aYqMEAC7uAKSIKaXkBYfWmLwWIhtyzPG3QAdUAdZxQ8w+yAnSJs9m5/BeM7w1Fb199gIMRkwBlZ
 FX0hVnhVFj4OY44uMXaMGAMn4gQt8+Z5VSgsLDVsQGKeufQROpnOcbyNoo3vbGVH9vU8Cer3Cvf
 26kF2hv6DLNq+Rx2tpBIilk51dWqiqHq1/G7nBukAwDhRvqWBQGgs1vjcvSsjOJkEdMqBCefXiw
 fBeH7LO1n8Gp7Q+Wo7eM1jl3teFS1cdwlWdwBuFYuuDKBy+/teR1cXlXyUopSrontfzL/jGctMZ
 rckubJnCfhABZt5nZh2nG/zwTzEoEUlFZc494J9ma7HM8RgqDlPT4yhksbhteLqEXi07SQCYQHN
 OspAb5HttoVZPjBLi6asN90S4sWJ5yvor43io3KLomxgLIJUiEzaHPQcVCaGwolJNUiVd9EI01l
 5i1DDzlrLugkOfkiJLWHwz3A4uMXxy3LsZThNS1kL1CPYEtSbCOI4eIkPDu61g/pnO/BlrBLoM7
 HwQWXTLa4DR0HfIwYqmCvP3XNk1Zn98S+vRvtjMFNg0HmaowIWsYgnFn2CuYCAjaxLd7SzcwW+g
 cNOG4Adgc+tZqEV0vWcISeLYIk+vTnthen/L2I+55H0lud36Ta3N7sBz9VxjnqxAwMrs668p2Yf
 8q7EQgxYhQ1GgSQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10956-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A36EC29D6
X-Rspamd-Action: no action

Stop running kernel-doc when building out-of-tree kernel modules.

Rong Zhang reported that building external modules with W set fails
since v6.19-rc1 as the kernel-doc Python modules are no more available
when building against a kernel module build tree exported by
scripts/package/install-extmod-build.

As there is no good reason for checking documentation when building
out-of-tree kernel modules, stop it.

Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/linux-kbuild/20260129175321.415295-1-i@rong.moe
Suggested-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
I left out a 'Cc: stable@kernel.org' as the problem exists just since
v6.19-rc1; please intervene ASAP if you think it should be added.
---

---
Thanks for the report (Rong) and the patch suggestion (Mauro)!
I left out a 'Cc: stable@kernel.org' as the problem exists just since
6.19-rc1; please intervene ASAP if you think it should be added.
---
 scripts/Makefile.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5037f4715d7491761b75d086441367c6c08c099e..05674bae3c637b4476a11b5e6af630d8daa3b613 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -166,10 +166,12 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
-ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
-        $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
-        $<
+ifeq ($(KBUILD_EXTMOD),)
+    ifneq ($(KBUILD_EXTRA_WARN),)
+      cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
+            $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
+            $<
+    endif
 endif
 
 # Compile C sources (.c)

---
base-commit: 6d60354ea2f90352b22039ed8371c4f4321df90e
change-id: 20260131-run-kernel-doc-only-in-tree-18be87e88208

Best regards,
-- 
Nicolas


