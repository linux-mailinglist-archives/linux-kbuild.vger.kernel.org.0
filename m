Return-Path: <linux-kbuild+bounces-11115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KgtNgSni2lPXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11115-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:45:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B211F80D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FC53301671A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A458D3321C8;
	Tue, 10 Feb 2026 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovUpUYqi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA8322B8B;
	Tue, 10 Feb 2026 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759937; cv=none; b=isXCEvsyPJFwhF891iyna8GTGMEllHCyiE7Ozw47ORZ9xOJesXeYb0VIVFclz5gIE+wD8gwI0Eo3f2Q+Yym3W1u/dpoKoVVx2t1PzlpKixmaXLDyjb0lqVR1+yueRPUlvproQmRpJATvXPy/HaHqggArlEMJpQ9ZZx1auj9+JsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759937; c=relaxed/simple;
	bh=bvMS0fIDj29T6OmhmMbczsd45h5uqDrzUz7LqYk2E5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8h5xLU8AAfGn7ZG6aTHcAd8g0DlqH6tJih/lANo29C6rUQGjCJzMLjKPnqYQUgcq/ddKbU2xdjhf7Q4ubGvAHu+6skw71IZi5/5qYTwLY5zead7UQBueHppVsQ48d9rB/QIV4tc3a9yl4hZ5DnZ3DLqAlVEG9X0df6XWM9q0E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovUpUYqi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C472DC116C6;
	Tue, 10 Feb 2026 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759937;
	bh=bvMS0fIDj29T6OmhmMbczsd45h5uqDrzUz7LqYk2E5g=;
	h=From:To:Cc:Subject:Date:From;
	b=ovUpUYqig/IJLKsQb7VPHxi8VWpMyUpXMVpEv6D0iENh5G2ERxPUTXEDrquZtInsF
	 yiAitoOpgCbkBldFlNo8fxgPT9pE/J01ObigvmQMiYh6SiizduaNwsa20ETtDmXHZG
	 4zChC18nFbh2zlAYl3tf+FaxUVFV9vHOwjne839m658+7twWPT+6x/Aw9vhAqZIH06
	 rg4C51mg67v83cDq7nZgGmY6xd9v0jeBbsuEoE0UzV80EgRn7k+c9+cwyMfOxO8Gg9
	 B4tk+eUZZFMNvEig4fxsWJ2b9371jfjVbGiZecPv7uST9D2QD5/k9if74Jak9Qohrm
	 dQf0qmaOoRl+g==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Jens Remus <jremus@linux.ibm.com>
Subject: [PATCH] kbuild: Add objtool to top-level clean target
Date: Tue, 10 Feb 2026 13:45:22 -0800
Message-ID: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11115-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 793B211F80D
X-Rspamd-Action: no action

Objtool is an integral part of the build, make sure it gets cleaned by
"make clean" and "make mrproper".

Fixes: 442f04c34a1a ("objtool: Add tool to perform compile-time stack metadata validation")
Reported-by: Jens Remus <jremus@linux.ibm.com>
Link: https://lore.kernel.org/15f2af3b-be33-46fc-b972-6b8e7e0aa52e@linux.ibm.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 Makefile               | 11 ++++++++++-
 tools/objtool/Makefile |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d3a8482bdbd0..ed850044491d 100644
--- a/Makefile
+++ b/Makefile
@@ -1474,6 +1474,15 @@ ifneq ($(wildcard $(resolve_btfids_O)),)
 	$(Q)$(MAKE) -sC $(srctree)/tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
 endif
 
+PHONY += objtool_clean
+
+objtool_O = $(abspath $(objtree))/tools/objtool
+
+objtool_clean:
+ifneq ($(wildcard $(objtool_O)),)
+	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) clean
+endif
+
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
@@ -1637,7 +1646,7 @@ vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean
+clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
 
 # mrproper - Delete all generated files, including .config
 #
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a40f30232929..6964175abdfd 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -29,6 +29,8 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
+RM ?= rm -f
+
 LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
 ifneq ($(OUTPUT),)
   LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
-- 
2.53.0


