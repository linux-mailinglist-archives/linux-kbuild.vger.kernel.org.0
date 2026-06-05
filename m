Return-Path: <linux-kbuild+bounces-13592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vnE3Hnm7ImqGcwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13592-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:05:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F058647EDE
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:05:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=bF9GNMsg;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13592-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13592-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33812300E936
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 12:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562F44DB54A;
	Fri,  5 Jun 2026 12:04:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89EF3EEAC5;
	Fri,  5 Jun 2026 12:04:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661056; cv=none; b=EbZUFFvnUlHVol7ZUsCnZ4TswHpCpcvfBdmPh7VEbIjcnqsldCaSFzcsG/qk2ESkl1TQCC745IzTf4xHqEZ+lyf5ONInhqQBAPZUFrL8E17gtdJacVeuBR8OcscIXSt5xBIBtIWYY+WBpff7rMFJOrEycuw80il0EjSViJ1dENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661056; c=relaxed/simple;
	bh=QLtaJ8xc8uG16z0i8uI3fpxi0eetpfLb5x4494AfSyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxIiqH3pupA7MNL8bUWO5M+Rb6Y60/y9UtZWeQ1qXZZ1uwvOHHdKDourQBOT5VGjcPEzsjuQmIsrXwFnh6iNv+A1kmoau+CgarorVbuWfiBBnhJ8+nKrqsbmPsthZV/0qpPvKnLoZ51GpvhWzjPD/9/CB5TpO2JMfARSTQV5c4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bF9GNMsg; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=uNGt7UQ3hKDQDW7phHSPCK/n9FxMsmhzMnjI9+EEnR4=; b=bF9GNMsg7Sjj0FgHOYeGX7P+jI
	05CT4VUcUipogCEPXXr+x1HIw+8a+HfCC8krQ1M4biJNJFXw5dtytXGwnZ8G0p4STXAWsn3Ohn9cv
	7/QDJGLlJ2vUefAYUVVEbdv8ZLM0fBLvmeqldxHbrLxsZIbLczuxi8kmgQWDgFoSUPGr5sydjhbh1
	XfOLsRgK/cbhdbiOuaARiXYDseDQgd4F1pv7hqpmixhKpSPR5DIsuxmDm28lZQ4WVruNsNOgHb/oK
	outIjLchPaEUpTcSvs8eSPZyKAcSOLR6yTUKstrG0JTM4YC+CeWH2QwCm2vpCwcHjcMb9ON4EGjUx
	E6gATjiw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wVTHV-005HHq-04;
	Fri, 05 Jun 2026 12:04:09 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 05 Jun 2026 05:03:35 -0700
Subject: [PATCH v2 4/6] bootconfig: clean build-time tools/bootconfig from
 make clean
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-bootconfig_using_tools-v2-4-d309f544b5f7@debian.org>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
In-Reply-To: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
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
 h=from:subject:message-id; bh=QLtaJ8xc8uG16z0i8uI3fpxi0eetpfLb5x4494AfSyQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIrsf3KruBR3AMGJpK5qF9EPKPRwFk2Xw0fXVk
 hYKWyo3o0qJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiK7HwAKCRA1o5Of/Hh3
 bct2D/9U++USHEnCfjBrk8dUfTq93Fc6wLeWcTew4PC6KL9uwfroetoOIO5GcxKejFqoj/I5uS9
 P2iVOqgX+MkqNEsZdLnEK9IrBQjr18egxMZkUzvFUXAadxa2i3TZz2kkYvTVYBXSFH4jjb5Nyzj
 UEHBNP6EAGr5fP9Gf+SMFbX7aarcBkDAgcmJdsyI4iZQiCr9w0gQf4YAhg2bCGHkuFZAqrjaujD
 xeBroPeWtz0+p4aSYhb7YbV20+AbCTvil9pV2jQ4YIvdiqoIlAqlJn97ipn+b4OlEzvqu9YYEWD
 Qw7MQX+xPqWXFgLuZOtb6yDuwFvmk4qiUgktxXhQ+otDL1Zy1Q6Umr4KLSJTHZ40XtOatfMEc7k
 rpSn5aJ5KpOLcP52bjXCfSQNOVey4LRtxvz86UdOzjbt5Hv332OCEF5EaHIbvV6ANtb9Mraac62
 09/A0pqzhtlFOrxQmaLF83CnoeU9jBvr70jArgyqnJAw2uSdXTJuP7g+SRMb/KJVUE797hWLqcU
 p/b6mpyzrbLaRlADF8z8BkVZiBeMA0XKYWYmah98CB4GHfasKUNNzzHU49q4NgJLqnaHBhx/bqx
 nU2IOIH11Jxalgl8m2U+7Tivpb3dMhwGmZk+fJS5WjSWgpc/+/tRcgt3kL5Vtee+edaTpTwbqVX
 bA5Uj/62nU8Er6g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13592-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F058647EDE

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
index e95992959f44..4f31222ff1d1 100644
--- a/Makefile
+++ b/Makefile
@@ -1574,6 +1574,17 @@ ifneq ($(wildcard $(objtool_O)),)
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
@@ -1743,7 +1754,7 @@ vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
+clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean bootconfig_clean
 
 # mrproper - Delete all generated files, including .config
 #
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index aa75a7828685..86f1a4e64f04 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -31,4 +31,4 @@ install: $(ALL_PROGRAMS)
 	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
 
 clean:
-	$(RM) -f $(OUTPUT)*.o $(ALL_PROGRAMS)
+	rm -f $(OUTPUT)*.o $(ALL_PROGRAMS)

-- 
2.53.0-Meta


