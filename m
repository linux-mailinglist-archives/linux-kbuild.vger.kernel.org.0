Return-Path: <linux-kbuild+bounces-8459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C05BB26672
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD3755E30C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0222D3002AC;
	Thu, 14 Aug 2025 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSP/Nwra"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1343002A3;
	Thu, 14 Aug 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176878; cv=none; b=SDnpcwsjWnbVctAxt42eRbQzW7gvGYlp0F/1Z5b+waOA4FhhU65D8O9wfgTVckT8kSNyeha3WVqBXQAZnzPeBVeceGvaJFEtWoL3ziQmwx5t1WrtzX3BUhinmikLd17KgkraeGzasiZXuHqZ1XUoD37+vyPXm8pBbC0jFyq5Arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176878; c=relaxed/simple;
	bh=l4XLlaq+sgrse0xJUWH72xDUED3ph1VPSIT0SUNZVi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNdbs9FlQTp8UD81PCmf3nEBRKsyG9nFKScCjQLaA6rMH8yUrTMDfYZmUKSCrzbOs/JyQ8yIM11KE7/Wnoe66PNmwCBcKCNrgWOeEfONBWloCgsHwqd8rrwJ0EjdrwIY/k3YXUSSYX/tF0OS5PB3Ef5zP3JI83G/U8hf10j7208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSP/Nwra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34062C4CEEF;
	Thu, 14 Aug 2025 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176878;
	bh=l4XLlaq+sgrse0xJUWH72xDUED3ph1VPSIT0SUNZVi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSP/NwrawB9S7eLpuoXv5xvhCET0QVHSwuHbsBkANK5gmU4qjhD8G0Ezo7M4lOe4l
	 aILkgPoV5/mPQ4jhT4IURw28kozATIjyaKFpv5W+jPvbu93VtRMGAFxPbS0dpcsG5/
	 aJ+aWwLBUUhfphEZ9K12xdf5uyPEpw5Q9pLMpGgkbkj/UcD+S/R7hjDrjRrmj6A3r5
	 7zN9SKNY/PEae3hsh9Rhx7NHOnaWx0mSB92qBVjAruaZKjfzEkbrm6rz3k6snIcwC3
	 cdE3SiPyPWouhDlqYpdYCnsvBxEt1Bam3SEIK41DRGapk5NL0X8fdRt2lPW+ZynzE8
	 TdrTUaBMgh9qw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v6 1/9] kbuild: always create intermediate vmlinux.unstripped
Date: Thu, 14 Aug 2025 15:07:09 +0200
Message-ID: <a3090f262c9e40f2f2300e52843050a16cc3f6b4.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
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
index b64862dc6f08..4f2d4c3fb737 100644
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


