Return-Path: <linux-kbuild+bounces-8849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58CB83730
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16CA625494
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B5F2F6599;
	Thu, 18 Sep 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8Sfdiut"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871D2F2613;
	Thu, 18 Sep 2025 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182823; cv=none; b=d+49aus5poH7VLFv7IbCsQftBBFD2Obk+d4cOCvPVCVCLr/KEjD1ZGZ9vzUEJtWWCSS/UJj8EiFDB04jPLnV7c8PLrXGWmW6ZYkHrQv2mkFRuNOu6R7Cvx4OqYyYzFxk/xXjMyaXavIOYv/PtccE1asJb2a8W4i92QOKg5ruzAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182823; c=relaxed/simple;
	bh=bb5ubgK/wnhVsZbyUpoKbh+1vpm6J0XlrHxcoyqPAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yl7pg4UVK0j16QkhNWx1EDq6W/LeeamzsMQY6RD84g7ji4JzMhXcXxaeVbQRdFbMiY69AxNMENgHPLItT9O0PgXa1WU7UydQHxR9KWySotZG3zgehQaYcURtgAhGBa1UAR4QJCE/kLnX9twTaezWQVueiOfpeEV6dpAkjgzY0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8Sfdiut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47107C4CEFE;
	Thu, 18 Sep 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182822;
	bh=bb5ubgK/wnhVsZbyUpoKbh+1vpm6J0XlrHxcoyqPAfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8SfdiutRi1dNuJaSQDjHvZp2AvAuH3VejsqkAPNU18abPlavYQHq3zelfSQsE1VP
	 sCEYQ7eKxiF/VUtXSIF6qvPXcQtNVFD2HFugj3oK0uF8tBnpBtnNPmjdu02klchked
	 li2tJNnsNygtsQ4XupA23BdbOnHsFgsPozubJW8VwT6qUbWcpLElOomcwuJLGi4d4k
	 tyNg6NYoU/+0oTPODJVsM1Vaa72fGKmYE5OnkhldzO2wx9StOhMFw8hSLIfccNnHyU
	 5lvKcf9Fac9ArnJEjMGMoHfQ5ExZVjig5XjvIwFLkc8u0IbZw6wAQ0PAmceoZGtyxM
	 oaOrCXrqtt5JQ==
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v8 2/8] kbuild: always create intermediate vmlinux.unstripped
Date: Thu, 18 Sep 2025 10:05:46 +0200
Message-ID: <a48ca543fa2305bd17324f41606dcaed9b19f2d4.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
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
Reviewed-by: Nicolas Schier <nsc@kernel.org>
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
2.51.0


