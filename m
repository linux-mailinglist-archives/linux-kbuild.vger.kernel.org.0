Return-Path: <linux-kbuild+bounces-7378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E8ACFBD6
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 06:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1606F3AB86D
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 04:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571D11DE3A7;
	Fri,  6 Jun 2025 04:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3s6LnG7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2E1DD0F6;
	Fri,  6 Jun 2025 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183063; cv=none; b=kgSBWFXqgBXyTvyJObpOStxQsCJJoZsZS4VMpH4s4rx5d8PR3aEaZllT+v1ofxKOhPkUMl2dpsYwd0sQUr6Q7qFVY+qlJ9Mw74vfl4y2zfj7UNGajOBnS+fU/q+yYiVVNRW0G/QbEQW816EV5MCvPYrkDcXTJT8nypOk97jC7gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183063; c=relaxed/simple;
	bh=86Dh/Q52b6/llPWHYYB5hoYpZGrYsitSgBTFGkk8RXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1Eawvah4nsI94pb7tmqUYgi3b0fbfPOeNxiQVaQC1POSFWBm9eTzs2dzo/upvSzfZzdzX9BhFf0nNo1+7HNyISmyt09wNsgez0XjwowHVLjwM6MWkRm1LwWc1ljfW0b9RJXGo0/rK/AAnq8nqyPlep+H1FqY1aVmvItdnWF2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3s6LnG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5C1C4CEEE;
	Fri,  6 Jun 2025 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749183062;
	bh=86Dh/Q52b6/llPWHYYB5hoYpZGrYsitSgBTFGkk8RXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W3s6LnG7t24xI3qKN8tPKH2ZicR+uBk3ndA6sCDDqMLQusXprGHlk44vLgeljRo0W
	 NoeesIb6iZWplZDCuga8wkZzpL/Tn8LJ4tSI0gN+iZxAUIUt44rc5V1aZyWpU8JGZI
	 9WUWW4D/pv3lxkg182PMhSef2TJ8OJQTDTNLMkpgcW7gmIDhn4PfctwUCbz2rZVX07
	 Mg7icpOGSJ95Jpj7Nkyd1iyxDlHVeEkd0TwZ1+vkbNZsx6QoXhS6KLzQVcfimjyiUm
	 2e/HhweH/XLyeI2f4IKfERfjz9dOS/Sbes91aBFdMZ01Xj7cOaPRD7aFPPPKljLgK9
	 hz//m597LJgxg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/4] kbuild: always create intermediate vmlinux.unstripped
Date: Fri,  6 Jun 2025 13:10:24 +0900
Message-ID: <20250606041029.614348-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606041029.614348-1-masahiroy@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.43.0


