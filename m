Return-Path: <linux-kbuild+bounces-8504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF3B2AEA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3CB5562544
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E74A345722;
	Mon, 18 Aug 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAlD38Az"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634E0343D9F;
	Mon, 18 Aug 2025 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536283; cv=none; b=sJ/0GP7LblImGxUZxNUlQJfwSH5h1hEX7d98t9EI+08I1mxD+JBHji6NT7tJB5ECHxdhq6wpn8e3WznpGBUzpDpRTPHhGl3DlJWI/KFx4uJumhArpAf8YbClA6iNPfLPB3kpg6qSxgfAYVcj0vOMDrcVBxC8HijNNTYvfleHin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536283; c=relaxed/simple;
	bh=HA/kj2G8VEZ3qpSbKjRdZ4syVQXgCOUrd34+Y5crw3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/vJ7hSuwbUhMAr6cq91uZzSICUzGdXbtipHA0Vl5xX/ZnyLDcAlHYx2X9BIFaqaclHbDKPp2kOdeQpPiZ+UPiwUJLDGifDnHKlAZ/hut3LrscCvJqA3UgRADv4jfPkBeIcLc22rcUu0XLQCRQfcjwvxxA5R8uSOzbDjjzaJcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAlD38Az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507B4C4CEF1;
	Mon, 18 Aug 2025 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536282;
	bh=HA/kj2G8VEZ3qpSbKjRdZ4syVQXgCOUrd34+Y5crw3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAlD38AzX5HoEDuEU2iKxNpQ3TkQJDH8qHNjipBDWEd/XruGF/jEx/YxcNUXLVMvx
	 UWJowEbk9ZIImLTa2AuaIp8kDh1Xk526Rq6RcAKrwc7/ZZcwGs0Iccn9nM2CT3RJ9I
	 iJu8Uc9N525oXXTnQc6XBvb84c7CkulEO3IezjP0XxlP7ph2TztrM+kho9Zyp0xr4A
	 9e9cg0JFwHZdmbAKkLSEBEvMmGQ9h6gw2B+r+Erph5LygSsnTUpsTO3rOD8vciu93k
	 C/Wjuct9YVupRmkL48Shk5yE5D93SltM34Su3EDi3JozmIdKZVjNhd1gmgTvuPFgLs
	 t7YJGhvdheHgw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v7 2/8] kbuild: always create intermediate vmlinux.unstripped
Date: Mon, 18 Aug 2025 18:54:56 +0200
Message-ID: <df6f570daa38a22da59135b294705e3c5680e441.1755535876.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755535876.git.legion@kernel.org>
References: <cover.1755535876.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

Generate the intermediate vmlinux.unstripped regardless of
CONFIG_ARCH_VMLINUX_NEEDS_RELOCS.

If CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is unset, vmlinux.unstripped and
vmlinux are identiacal.

This simplifies the build rule, and allows to strip more sections
by adding them to remove-section-y.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 scripts/Makefile.vmlinux | 45 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b64862dc6f08d..4f2d4c3fb7372 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -9,20 +9,6 @@ include $(srctree)/scripts/Makefile.lib
 
 targets :=
 
-ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
-vmlinux-final := vmlinux.unstripped
-
-quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!'.rel*.dyn' $< $@
-
-vmlinux: $(vmlinux-final) FORCE
-	$(call if_changed,strip_relocs)
-
-targets += vmlinux
-else
-vmlinux-final := vmlinux
-endif
-
 %.o: %.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
@@ -61,19 +47,19 @@ targets += .builtin-dtbs-list
 
 ifdef CONFIG_GENERIC_BUILTIN_DTB
 targets += .builtin-dtbs.S .builtin-dtbs.o
-$(vmlinux-final): .builtin-dtbs.o
+vmlinux.unstripped: .builtin-dtbs.o
 endif
 
-# vmlinux
+# vmlinux.unstripped
 # ---------------------------------------------------------------------------
 
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
-$(vmlinux-final): .vmlinux.export.o
+vmlinux.unstripped: .vmlinux.export.o
 endif
 
 ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
-$(vmlinux-final): arch/$(SRCARCH)/tools/vmlinux.arch.o
+vmlinux.unstripped: arch/$(SRCARCH)/tools/vmlinux.arch.o
 
 arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools $@
@@ -86,17 +72,30 @@ cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
-targets += $(vmlinux-final)
-$(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
+targets += vmlinux.unstripped
+vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF
-$(vmlinux-final): $(RESOLVE_BTFIDS)
+vmlinux.unstripped: $(RESOLVE_BTFIDS)
 endif
 
 ifdef CONFIG_BUILDTIME_TABLE_SORT
-$(vmlinux-final): scripts/sorttable
+vmlinux.unstripped: scripts/sorttable
 endif
 
+# vmlinux
+# ---------------------------------------------------------------------------
+
+remove-section-y                                   :=
+remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
+
+quiet_cmd_strip_relocs = OBJCOPY $@
+      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
+
+targets += vmlinux
+vmlinux: vmlinux.unstripped FORCE
+	$(call if_changed,strip_relocs)
+
 # modules.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
@@ -110,7 +109,7 @@ modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
 			modules.builtin vmlinux.map vmlinux.o.map FORCE
 	$(call if_changed,modules_builtin_ranges)
 
-vmlinux.map: $(vmlinux-final)
+vmlinux.map: vmlinux.unstripped
 	@:
 
 endif
-- 
2.50.1


