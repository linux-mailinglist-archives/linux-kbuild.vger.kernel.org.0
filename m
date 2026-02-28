Return-Path: <linux-kbuild+bounces-11487-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ibHiJ+p/oml33gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11487-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 06:40:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2B1C070D
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 06:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86EDE306BC27
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 05:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096052EB5AF;
	Sat, 28 Feb 2026 05:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVTRs4NT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91AF19C553;
	Sat, 28 Feb 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772257255; cv=none; b=Ca7StPMmW3wHnNu9DKXAFW9NHpfLzktWtr3IknBbJuARJFC6utKeHuPQ7ARsTQd+xiFkohQam56ODACBnXcC859sxMMI58x6wLdIiitt8UyIhrbs+qT6cw4kPMtoMoT7N8hentMHRCfcpw0DOws8a01wlqj/XQaI35/iwyPdM9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772257255; c=relaxed/simple;
	bh=unWUnBCso7D379TXK3U7KKkypdtoBm8/+ETzM8K3S+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vB3G86+NuVobfXrdcqMyFk9hck09m0ygAMfkuBjTIYjvkqa6FGxzkAqx1ADngCloUDIEfMOemjgoo3NxsPmrLLg1Z/rs0rxE1YCdwqrQ2rhvAY+Mv5Ar2R9EwCNdMVTfpr8GGd6Rae/VZpVGZrhpxQpYMZf7JU+6q4L34r2jKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVTRs4NT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDBCC116D0;
	Sat, 28 Feb 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772257255;
	bh=unWUnBCso7D379TXK3U7KKkypdtoBm8/+ETzM8K3S+8=;
	h=From:Date:Subject:To:Cc:From;
	b=WVTRs4NTjMG+0QqiBrZLylqqVWSLsdwZqh4C6+1mtjEYwCnTjEpLHQm7HH5rrLy1M
	 V3JxqVChPpUMUZ8H2mm5xOSCP+LBbBVJla+sNLeDjpi8r7gbN7332FkQwn6n2MVB2K
	 L4kFCGptSbnYP7Inu+Xr4zLxNtDwJeXNMczTZwOuYs95dJsUftkRL+ofazdENyC7CR
	 ZRkT1Qv6Icy1eBQvVig9idmPTIIP/uGqTlkf5O7mBX0so9AiJkO0wxfi5dPrt31Lco
	 5LYgM32dNg9iex9R+Kvfa9FdvNvZM3byAwYGzaSQi3afhe8otu76l01LAxOoAu/8aV
	 kLEYmF6DsJLww==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 27 Feb 2026 22:40:48 -0700
Subject: [PATCH] kbuild: Leave objtool binary around with 'make clean'
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORvYKrjhq4iHNMs0ozbSbkUZe
 3erHr/L/2+QJalkODcbJCma1WJFd2iA7xRvgjpWg2vdqXWuRyqmI5qfF7OAXiOlNyZ5WKGAHIQ
 iDkeWfvLMA3VQQ88kk75+k8v177z6WXj5lmHfP+67ReOGAAAA
X-Change-ID: 20260227-avoid-objtool-binary-removal-clean-83ce7fbcc8a1
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>, 
 Rainer Fiebig <jrf@mailbox.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3715; i=nathan@kernel.org;
 h=from:subject:message-id; bh=unWUnBCso7D379TXK3U7KKkypdtoBm8/+ETzM8K3S+8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmL6p8enNxzSmPFuyKdPcotjv8m3Jrx7uX1JbU7+jLLl
 u101Fz9uaOUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMJHQCI8MBkdX3T7qLLJRL
 OrN2jxGzz5fEj0/vvL7ZvGCLYaLmLe1khv95Px6d6jl3+Np3tcVRV/d5PnFmf7GqsujZRe1fWcv
 X/fdgBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11487-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: EDD2B1C070D
X-Rspamd-Action: no action

The difference between 'make clean' and 'make mrproper' is documented in
'make help' as:

  clean     - Remove most generated files but keep the config and
              enough build support to build external modules
  mrproper  - Remove all generated files + config + various backup files

After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
target"), running 'make clean' then attempting to build an external
module with the resulting build directory fails with

  $ make ARCH=x86_64 O=build clean

  $ make -C build M=... MO=...
  ...
  /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory

as 'make clean' removes the objtool binary.

Split the objtool clean target into mrproper and clean like Kbuild does
and remove all generated artifacts with 'make clean' except for the
objtool binary, which is removed with 'make mrproper'.

Cc: stable@vger.kernel.org
Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
Reported-by: Michal Suchanek <msuchanek@suse.de>
Closes: https://lore.kernel.org/20260225112633.6123-1-msuchanek@suse.de/
Reported-by: Rainer Fiebig <jrf@mailbox.org>
Closes: https://lore.kernel.org/62d12399-76e5-3d40-126a-7490b4795b17@mailbox.org/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I realize that this will technically decend into tools/objtool twice
during cleaning when running mrproper but I don't think it is the end of
the world for a much simpler implementation.

I can take this via kbuild-fixes with a proper Ack or it can go through
-tip, does not matter to me.
---
 Makefile               | 8 ++++----
 tools/objtool/Makefile | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index e944c6e71e81..d76d706a5580 100644
--- a/Makefile
+++ b/Makefile
@@ -1497,13 +1497,13 @@ ifneq ($(wildcard $(resolve_btfids_O)),)
 	$(Q)$(MAKE) -sC $(srctree)/tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
 endif
 
-PHONY += objtool_clean
+PHONY += objtool_clean objtool_mrproper
 
 objtool_O = $(abspath $(objtree))/tools/objtool
 
-objtool_clean:
+objtool_clean objtool_mrproper:
 ifneq ($(wildcard $(objtool_O)),)
-	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) clean
+	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) $(patsubst objtool_%,%,$@)
 endif
 
 tools/: FORCE
@@ -1686,7 +1686,7 @@ PHONY += $(mrproper-dirs) mrproper
 $(mrproper-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
 
-mrproper: clean $(mrproper-dirs)
+mrproper: clean objtool_mrproper $(mrproper-dirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.rmeta' \) \
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 6964175abdfd..50d3e38e6137 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -142,13 +142,15 @@ $(LIBSUBCMD)-clean:
 	$(Q)$(RM) -r -- $(LIBSUBCMD_OUTPUT)
 
 clean: $(LIBSUBCMD)-clean
-	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
 	$(Q)find $(OUTPUT) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
 	$(Q)$(RM) $(OUTPUT)arch/x86/lib/cpu-feature-names.c $(OUTPUT)fixdep
 	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep
 	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.objtool
 	$(Q)$(RM) -r -- $(OUTPUT)feature
 
+mrproper: clean
+	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
+
 FORCE:
 
-.PHONY: clean FORCE
+.PHONY: clean mrproper FORCE

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260227-avoid-objtool-binary-removal-clean-83ce7fbcc8a1

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


