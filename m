Return-Path: <linux-kbuild+bounces-8460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64196B2667B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F7A5E34A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BFE3009EC;
	Thu, 14 Aug 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHsEQkM+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E433009E2;
	Thu, 14 Aug 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176881; cv=none; b=H5XsT7DW9PDakcKswctk9Gx1jzSWgjqHh47pcQsX7SzGf926t2PuQEZt74MJJqA7B2DKp2m+qyOmfrtDySaN7XHqtc0uuKLVnG1lBCbfd3l71FJuMTfKkfTUnkdr1cEBpENVEa6PPDUX9QTcyeOiAMwtcv+RU5HlVOKhEJ8QXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176881; c=relaxed/simple;
	bh=j3sdaQZPKptTw8rHjWPPPeRJiy7P+Pdobg3gv3L4SEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxrNfJAX7IIlMtW+M7Bm8GGFKSi+zVUschjTIvC81YZlyAm2OYnuwha+uF5wSB+qygguKuxIaEX4B87MB78HRQOr7xJVrjZ0QXGars39Mb9MkFtWJjZkOG3UQUXqW12BSEeHmxpH+xtMT6dhLUKuS2vxLZ76ArAuJi5IsAUeLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHsEQkM+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FA2C4CEF7;
	Thu, 14 Aug 2025 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176881;
	bh=j3sdaQZPKptTw8rHjWPPPeRJiy7P+Pdobg3gv3L4SEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHsEQkM+Rdx7q3R8SFOT/gbqvb/L+TgB6UBR7LCyjDP2ptL0eML17J49JgvVDnpCt
	 on8adBK7y40jHcJggAXynpuJeRV8qeHMjWR7gWYKc6ufBSOk0Bnc8dfSk/l3H4qJFP
	 OcUKid5hilBbJdqcp9pufE+AYZ2RKHbbjzYaOAeUbUYbYHI6o01AHvwjYgd4lEqfO0
	 Yhx5VR2PwYI5N6rjxeR7ZpZuSUuzOXDICm8/7n1/EejHUPl6T2EvJYkH4R/x2o+VRZ
	 Ivje1lASaJqNCb4P7pjw+5tTPQ4XibVQFvPXovrA661f4BuU0ZMC8AcmLXljYLXrlY
	 Fc8oSSlsdBfdA==
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
Subject: [PATCH v6 2/9] kbuild: keep .modinfo section in vmlinux.unstripped
Date: Thu, 14 Aug 2025 15:07:10 +0200
Message-ID: <243fb41d0b5309920365c5a3c00017a3021ccf1e.1755170493.git.legion@kernel.org>
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

Keep the .modinfo section during linking, but strip it from the final
vmlinux.

Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.

This change will allow the next commit to extract the .modinfo section
from the vmlinux.unstripped intermediate.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 scripts/Makefile.vmlinux          | 2 +-
 scripts/mksysmap                  | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..cfa63860dfd4 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 
 /* Required sections not related to debugging. */
 #define ELF_DETAILS							\
+		.modinfo : { *(.modinfo) }				\
 		.comment 0 : { *(.comment) }				\
 		.symtab 0 : { *(.symtab) }				\
 		.strtab 0 : { *(.strtab) }				\
@@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	*(.discard.*)							\
 	*(.export_symbol)						\
 	*(.no_trim_symbol)						\
-	*(.modinfo)							\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
 
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 4f2d4c3fb737..e2ceeb9e168d 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -86,7 +86,7 @@ endif
 # vmlinux
 # ---------------------------------------------------------------------------
 
-remove-section-y                                   :=
+remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
 
 quiet_cmd_strip_relocs = OBJCOPY $@
diff --git a/scripts/mksysmap b/scripts/mksysmap
index 3accbdb269ac..a607a0059d11 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -79,6 +79,9 @@
 / _SDA_BASE_$/d
 / _SDA2_BASE_$/d
 
+# MODULE_INFO()
+/ __UNIQUE_ID_modinfo[0-9]*$/d
+
 # ---------------------------------------------------------------------------
 # Ignored patterns
 #  (symbols that contain the pattern are ignored)
-- 
2.50.1


