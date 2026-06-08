Return-Path: <linux-kbuild+bounces-13655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+CfMBn7JmqSpAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13655-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:25:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65365936B
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:25:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=oRtlOgJ1;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13655-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13655-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3D253223FFA
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 16:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A40B3D1CB4;
	Mon,  8 Jun 2026 16:25:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446423D0C12;
	Mon,  8 Jun 2026 16:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935910; cv=none; b=KTwSEUsESarQb/UKXikGv9HX/d1R/G2VbbB7z1bM3phZe/3XWAEbNHgbrq5pAt1KV9n+fblVSo9SJui719FCzvImkRpkpNkxba1gVVUUXp7jrt09QTTgagc4ZkiQ3EMWDJkzPp3EzfdM8Oe8aSoCLsF/4eM4MnqjTXT7CabSQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935910; c=relaxed/simple;
	bh=GMzLUVeFWLZ40gLjsC/rM3teKcgu7q4GmDJjjIZVOFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXJKl2kW8ITrxQlZ2WGs0lC72/SPbdGzLCF2htXJNM97+5djzbB0eogHdv4fNPqnbYWxLMcUyUthGGp3qlCD/H6hCFOrDaMmWR7bIiLzx0I+ucIdmrbL13So2ZEPKJOuJiP9zH1yHL2NKMDTgL8h+y421w1mIKFXg8oyiudI3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=oRtlOgJ1; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=1VTmtkqW0s7kqQ+7QybZTdloVtK/A2fFw2RLZnID1Po=; b=oRtlOgJ1O+CEks+uYPTqaQiQoX
	x/hV3LZi6rGBE2tkIBQ02j4ZVRDXwqYLNNId7gIwZw2JHqGJ71RCtxcndDxEyYGr78w2dCw6UvFvR
	DG8UE1WGBLrZGP1ZdptzJaTaRPuS+Lnk55RwkZKPOnOcTj3/PNfLhL5lW5PfnpiXWdgKNtqxrGzMY
	Wwg987fcYfCbCUOGJSuCxnFREjPDNXXK22rBtna2sH/s3BcbuhBERZU3aefzL8jemjUjzOM18D/bz
	wdVQ74CuWA0YVRgBD7KnHJ1mHqXECA6nIMGf2LCAB2CPYFhh/P/gmVcCo/M3OXCNDbqowXv0/C70v
	LNg3CvLA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWcmh-007kju-07;
	Mon, 08 Jun 2026 16:25:07 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 08 Jun 2026 09:24:01 -0700
Subject: [PATCH v3 4/6] bootconfig: clean build-time tools/bootconfig from
 make clean
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-bootconfig_using_tools-v3-4-4ddd079a0696@debian.org>
References: <20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org>
In-Reply-To: <20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=leitao@debian.org;
 h=from:subject:message-id; bh=GMzLUVeFWLZ40gLjsC/rM3teKcgu7q4GmDJjjIZVOFI=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJuzKbFe7kxY68ror44/Je5dPkbLpIQOlRNDDI
 lgj4yO//5CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaibsygAKCRA1o5Of/Hh3
 bXvKD/9d93blN4VEaye9+U5l3xgtO/6U6M11x1WjRT+2HrHJqVCldp312tpHqPBapkPLfe+2zAO
 9KlkV9gCy9SGmTIWJD8CEusHglmxUwYisfApsAkVVI1+E4Mw1ZStFQfC0c36P9ipV8R/8/NG155
 CZVv2p71AzN9wIS7I01+TsHn7TiavMN+OQ8Tmnv+7gWz71QYDMoc5X1EySHgb870H20f+QY7bzO
 3UmLMB/PVeL8im/Yc/iqW7iEdbQ3g7XkSbFDNhHXwBKJJUMc+6J3NFUEDbxYKXVc1TB0M8ilbY2
 EqDqKkBgdfdszXCdP/hPXoWek3RmpQM9y47MByVjx+v+wxOaBBvcaKLygxWSV2COMuHMxQwmBQY
 SMd7lTe2/LJri7Xvh5P6KCgIJydyXOWPylcRzRMnE9C0O4rBDw0BmyNmABkjXgPy4VeuJgo9ECb
 Cb4t7IhniJZ//UOc97vePWydL+UhZ1VuXkys094zgkTsujKk/m539jvTYbXSk7fkfi3WuZrcPej
 1+UfZDGgG6DqrlO6w9sYzZQlu+Vjh80UK4OLm7i/LZsHgeqiXtUjg1GunGDe5aux/uNWQa0I8pn
 NEHbSkq5y/pIA8RO/zKh37vUzuU5SoQ9sY/Km5HY1R8eDUENr9UIzxVdxhqDFSqG4vbTCTT2/Lb
 ytcpc4asSVlK56Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-13655-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E65365936B

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
index 4a8ea7c90ca8..84ca047f0c10 100644
--- a/Makefile
+++ b/Makefile
@@ -1580,6 +1580,17 @@ ifneq ($(wildcard $(objtool_O)),)
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
@@ -1749,7 +1760,7 @@ vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
+clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean bootconfig_clean
 
 # mrproper - Delete all generated files, including .config
 #
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 4e82fd9553cd..3cb8066d5141 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -27,4 +27,4 @@ install: $(ALL_PROGRAMS)
 	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
 
 clean:
-	$(RM) -f $(OUTPUT)*.o $(ALL_PROGRAMS)
+	rm -f $(OUTPUT)*.o $(ALL_PROGRAMS)

-- 
2.53.0-Meta


