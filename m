Return-Path: <linux-kbuild+bounces-13791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40TpA2eGMmr01QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13791-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:35:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC56991F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:35:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=qbTQULmT;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13791-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13791-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81EC7331D35A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7023E3141;
	Wed, 17 Jun 2026 11:24:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2323F5BE6;
	Wed, 17 Jun 2026 11:24:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695457; cv=none; b=OGEGg9o1qclTFpCWyteV56cBMzJPzE9lUuCKaNd1ExQ0Lxf0MgsmQ33b8HssqxXWVs8mCboz+0IeN07z0IZHIJ1i53zL2K8ksS/KTXPC1BRkNwW3f7zX5r0ZS7NtqYHFidpIp8Q+9TxxwTkLsO3FRvoO+7Cno3qcOLgPkMvxsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695457; c=relaxed/simple;
	bh=T7aMnWhYUT/0MfecqLnBaDP8l3Y8FfgDwYwNKXEZ+lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EL6IaeiHHT5/zweDDv2KZgk6N69hxq0cu45qH86lNeTyuADazmaYufIQN16OXxsE+vi5/vnsCXmo8hNGPNzn/hEp/CKSdo2Medmoxj1f3pn/xZGNyr9A6AlyNPDTQZMSyabrH/9Sermb8fHxTyPlPbUTdanV5WSqt7EDvTf5t9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qbTQULmT; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=WnoPaTyd3ZRpXevxMsS5IW8rUqNnI8wag+LdrbKkwCg=; b=qbTQULmTeoR/ufr2Z6vXxH/lyt
	/z2NzLKYz8GGvw4ZCuHdM6cC8JZiQNkIBa/a+MAE0nhAwLhmhm0iZag/L25SekfU3qcn5FFeDpWav
	WsH+ojs6UHLc88FLBDYHr/em9WmpdZVBYzTpRLa4Dcl35YKhCX9J35NL1wSHE+P9DOfi8MoJtD9lT
	4aazKRirXqC9P8ZQO1Ti53PwO5Hu9fDT6lrQ25PwOXc4nqMpuWVYUjVohCZTrtqc4Y88wJBdgx2gS
	Q6qr0xyBVT/BUOgAEeCHXQoBPy8nWW1ZZDyzGD+m6davAx0g12ZiA0LaKNHbBFCb5NKNCTRJl22cw
	ynqCjLzQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZoNJ-00EaFz-03;
	Wed, 17 Jun 2026 11:24:05 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 17 Jun 2026 04:23:36 -0700
Subject: [PATCH v5 4/7] bootconfig: clean build-time tools/bootconfig from
 make clean
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-bootconfig_using_tools-v5-4-fd589a9cc5e3@debian.org>
References: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
In-Reply-To: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503; i=leitao@debian.org;
 h=from:subject:message-id; bh=T7aMnWhYUT/0MfecqLnBaDP8l3Y8FfgDwYwNKXEZ+lE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqMoO7W9diDB38yqfR8UxuxQ+qFAXtq3yUNhosq
 EWR+RUtCCmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajKDuwAKCRA1o5Of/Hh3
 bdejD/93iz6tnlZKchhd2kHXPIFQEwAXfXcvUK6NUKZKF9x4MyvHD96A+nfvsSGMF/JLIOQYqjb
 0MmZKFZ77xVczOy1ajocuUzwRa+ikYZ1AJMGLL9fYeiOE2qiOPLm93isk9TAIXyfjyMZE0tclDH
 u4TONd6fIWVuI1wee/TsLkAkF9wO61725nteBNYy+YCijk57eMlEe02G76mDIlbkxtGpjUm83gc
 Rj4sjuAnID5cCmX8muEE0k4J69GyqfIvK4mViaRx1gb7w0gBGdNNfLjtSEh8/PBDmAv9/D9dZKo
 1prM7lpe4/itUoWuAuB+w+gf3hJRAMMWyrBEh8Y7xv9HYHdRkD8bswrdTiWoeiWNNmViBSMnDQ/
 pkVYkNYLtffg7O70D2tD4yw66vR3Jty9AQcPy/ta+iYlZMBRrRJzj/Q0ieuEWjfbLtV0BFuooSI
 7bpyu8Yp/7QqWCXfzp49rmBQldbRf1sczl9k7VeW2NUm0OZr9e2tuc935tdhUpQah5BaNx7gUhh
 /0zmVIPzQEP6DvaNLqDef48qALCWPQU0LjTQcwJg7D4XveZaH0kNvgdgIvp65tFTYrcYgygDBqX
 +iTbCft7VBW8FJH7NabtpW8K0cBSP3vuoeVnC/7L2ITHSPrA8/M9vTMuJf8NZBYTgZniTO8xZWI
 knYbZwJbcXsQBkQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13791-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DEC56991F6

The previous patch builds tools/bootconfig during 'make prepare' to
render the embedded bootconfig cmdline, but nothing removes it on
'make clean', leaving the compiled tool and its objects behind.

Wire a bootconfig_clean hook into the top-level clean target so the
compiled tool and its objects are removed by make clean, matching the
prepare-wired tools/objtool and tools/bpf/resolve_btfids.

The hook runs tools/bootconfig's Makefile via $(MAKE), which the kernel
build invokes with -rR (MAKEFLAGS += -rR). -rR drops the built-in $(RM)
variable, so the existing "$(RM) -f ..." clean recipe would expand to a
bare "-f ..." and fail. Spell the recipe with a literal "rm -f" so it
keeps working both standalone and when invoked from Kbuild.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Makefile                  | 13 ++++++++++++-
 tools/bootconfig/Makefile |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a7abb3f9a6264..a6e13fa1c1dc1 100644
--- a/Makefile
+++ b/Makefile
@@ -1586,6 +1586,17 @@ ifneq ($(wildcard $(objtool_O)),)
 	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) $(patsubst objtool_%,%,$@)
 endif
 
+PHONY += bootconfig_clean
+
+bootconfig_O = $(abspath $(objtree))/tools/bootconfig
+
+# tools/bootconfig is only built (via the prepare hook above) when
+# CONFIG_BOOT_CONFIG_EMBED_CMDLINE is set; skip its clean otherwise.
+bootconfig_clean:
+ifneq ($(wildcard $(bootconfig_O)),)
+	$(Q)$(MAKE) -sC $(srctree)/tools/bootconfig O=$(bootconfig_O) clean
+endif
+
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
@@ -1756,7 +1767,7 @@ vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
+clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean bootconfig_clean
 
 # mrproper - Delete all generated files, including .config
 #
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 4e82fd9553cde..3cb8066d5141b 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -27,4 +27,4 @@ install: $(ALL_PROGRAMS)
 	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
 
 clean:
-	$(RM) -f $(OUTPUT)*.o $(ALL_PROGRAMS)
+	rm -f $(OUTPUT)*.o $(ALL_PROGRAMS)

-- 
2.53.0-Meta


