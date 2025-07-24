Return-Path: <linux-kbuild+bounces-8127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618BB10BEA
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0485A4A85
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397E32DFA46;
	Thu, 24 Jul 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyrGC4Ay"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9A2DECCA;
	Thu, 24 Jul 2025 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365014; cv=none; b=j1nYvjrj0bFnw1DPy1Df0sWfxGXIGmYnMqj8sgEX9ebR+FZxfIzktBu6sbfiYlvTrL3o3CGiB0bMOza+BEiect44JHk0z+K9O6y1IhjCNMAdEjL/m2WzYbYUWNRFK+i1Tpwu7QYxoAj0gGPD7iCUS/pZ7I5efFP0mzsDX61w1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365014; c=relaxed/simple;
	bh=l4XLlaq+sgrse0xJUWH72xDUED3ph1VPSIT0SUNZVi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBM7wLdcu0TZAr0BKpfl3y492fovCOsU6jOYzgDLCB2cUrHVeGpeh48oUSfHaMXbTG3d2qhnKYkk3IhFejmHw+eYL10peoWer1/eQIKT9pp23Zc56O1pIDGBTg/bjxsAFbO8rzBK0afH+P4169VbNvee0qVQ9snYgdWXTQ3PL0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyrGC4Ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E56AC4CEED;
	Thu, 24 Jul 2025 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365013;
	bh=l4XLlaq+sgrse0xJUWH72xDUED3ph1VPSIT0SUNZVi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uyrGC4AyPpUlsfyEdga5U5jvg7kTlpr+uwhOqlCQaPT6OuYRvTv1+ysApROZRhzgL
	 yv16ZLJ7OdWfNrU4+JyTfvjxeZjpXFcdOKXpB6TAxmOSRHGsyWIhasFrzxiHlZTI/5
	 TNWEzbGVVbFfcowVcBze3NokLf6z46dYRbdsm1vQprdW6vih3aIgT6KhZFgN7K6x4g
	 BAHuKax/mcF5dGjY44IKfWF/D1D4Q7Dio2i8r+7lY4YeUpmbW/WAjwtYm8WS+s+F5R
	 qsx7ZStKyWHL4NcDiHmWbIUAn1eNWGKnj43xUjGcfjy5KJ0cAw8LhJzNZ4Yap+ZhXy
	 Gpxix4w5sp1fw==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 02/10] kbuild: always create intermediate vmlinux.unstripped
Date: Thu, 24 Jul 2025 15:49:39 +0200
Message-ID: <63a14a14f1a1083cdb62aa687301c1a8e472185f.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
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


