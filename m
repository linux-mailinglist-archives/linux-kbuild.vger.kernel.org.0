Return-Path: <linux-kbuild+bounces-1899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E726B8C9D92
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 14:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165BA1C23529
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 12:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD52056766;
	Mon, 20 May 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvM4nX1g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558956759;
	Mon, 20 May 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208945; cv=none; b=Nli/L3Q3MgVWfJqHMUpIERACcZaK+ADV6PLQ3VV8fnaRC1iB124i4B8SqPNAgPTUH6leCxWN49Bdlp6T8iCuqgSeCwNQiS0lbQLIQdBHj9MnHtx3qkV7hHqUhBqg+TkeDlfjnM4UMquDPFZo5JuL89N/wKUUC9VycDSucaAn6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208945; c=relaxed/simple;
	bh=jG8mJDdrJlMoSFn5bZlZWm1nYCF73MzL4cCC6THUpac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DC89GaaRxGvzhRmft7TMG6oRIBonp3GDno6s0xuCedumk24FViLGa1W2Wd4aVlFHTaXICJodq1iOohMkNdu/5ehAPb6wUtBSESo+zumsPLuXmR5Zf9g2ujr4xmW6EP+iFaysL6aFTiKc6keNVDe4yfMyjmzAHUUWzrVYjZtR2RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvM4nX1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C41BC4AF0B;
	Mon, 20 May 2024 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716208945;
	bh=jG8mJDdrJlMoSFn5bZlZWm1nYCF73MzL4cCC6THUpac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvM4nX1gI1FUddDgTp2bYJGuOsy10xKPa42i6sUuhKwE/SHNxwElEIii9FT6mG3W8
	 ewG+c4OhyrLwl2KRVPYOrVxKGpIQ7PVlL/KRPUMGhtEg9J87S0Re2iCG1hMQtvcxB6
	 bZuD0TIE5wxI8BNtNAST27njc9cGQFKLuihco54n7cMG9Ptc9QMaSIgzIBkzxhghWU
	 ifYXNnCMUQ0712FmsQfRY5O6bb6hN6+5QHGoazy5OHEiu8CzZtyXNhjFvCYPWDozNy
	 ddaEMKthxA12f2b1J5x0nrBcycRCDfvF8mTJDBouawfuP4+BbqUAvK0HO5CsiU3iHF
	 BL39D9n+GMjYw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/4] kbuild: avoid unneeded kallsyms step 3
Date: Mon, 20 May 2024 21:42:09 +0900
Message-Id: <20240520124212.2351033-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520124212.2351033-1-masahiroy@kernel.org>
References: <20240520124212.2351033-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 951bcae6c5a0 ("kallsyms: Avoid weak references for kallsyms
symbols"), the kallsyms step 3 always occurs.

You can compare the build logs.

[Before 951bcae6c5a0]

  $ git checkout 951bcae6c5a0^
  $ make defconfig all
       [ snip ]
    LD      .tmp_vmlinux.kallsyms1
    NM      .tmp_vmlinux.kallsyms1.syms
    KSYMS   .tmp_vmlinux.kallsyms1.S
    AS      .tmp_vmlinux.kallsyms1.S
    LD      .tmp_vmlinux.kallsyms2
    NM      .tmp_vmlinux.kallsyms2.syms
    KSYMS   .tmp_vmlinux.kallsyms2.S
    AS      .tmp_vmlinux.kallsyms2.S
    LD      vmlinux

[After 951bcae6c5a0]

  $ git checkout 951bcae6c5a0
  $ make defconfig all
       [ snip ]
    LD      .tmp_vmlinux.kallsyms1
    NM      .tmp_vmlinux.kallsyms1.syms
    KSYMS   .tmp_vmlinux.kallsyms1.S
    AS      .tmp_vmlinux.kallsyms1.S
    LD      .tmp_vmlinux.kallsyms2
    NM      .tmp_vmlinux.kallsyms2.syms
    KSYMS   .tmp_vmlinux.kallsyms2.S
    AS      .tmp_vmlinux.kallsyms2.S
    LD      .tmp_vmlinux.kallsyms3             # should not happen
    NM      .tmp_vmlinux.kallsyms3.syms        # should not happen
    KSYMS   .tmp_vmlinux.kallsyms3.S           # should not happen
    AS      .tmp_vmlinux.kallsyms3.S           # should not happen
    LD      vmlinux

The resulting vmlinux is correct, but it always requires an additional
linking step.

The symbols produced by kallsyms are excluded from kallsyms itself
because they were previously missing in step 1. With those symbols
excluded, the numbers of symbols matched between step 1 and step 2,
eliminating the need for step 3. Now, this has a negative effect.

Since 951bcae6c5a0, the PROVIDE() directives provide the fallback
definitions, which are not trimmed from the sysmap in step 1 because
${kallsymso_prev} is empty at this point.

In step2, ${kallsymso_prev} is set, and the kallsyms_* symbols are
trimmed again from the sysmap.

Due to the table size difference between step 1 and step 2 (the former
is larger due to the presence of kallsyms_*), step 3 is triggered.

Now the kallsyms_* symbols are always linked, let's stop omitting them
from kallsyms. This avoids unnecessary step 3.

Fixes: 951bcae6c5a0 ("kallsyms: Avoid weak references for kallsyms symbols")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh |  6 +++---
 scripts/mksysmap        | 11 +----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7862a8101747..b0d39a927fbc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -179,7 +179,7 @@ kallsyms_step()
 	kallsyms_S=${kallsyms_vmlinux}.S
 
 	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
-	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms ${kallsymso_prev}
+	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
 	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
 
 	info AS ${kallsyms_S}
@@ -193,7 +193,7 @@ kallsyms_step()
 mksysmap()
 {
 	info NM ${2}
-	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2} ${3}
+	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
 }
 
 sorttable()
@@ -282,7 +282,7 @@ if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
 	${RESOLVE_BTFIDS} vmlinux
 fi
 
-mksysmap vmlinux System.map ${kallsymso}
+mksysmap vmlinux System.map
 
 if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then
 	info SORTTAB vmlinux
diff --git a/scripts/mksysmap b/scripts/mksysmap
index 57ff5656d566..e46bafe333bd 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -4,7 +4,7 @@
 # tools to retrieve the actual addresses of symbols in the kernel.
 #
 # Usage
-# mksysmap vmlinux System.map [exclude]
+# mksysmap vmlinux System.map
 
 
 #####
@@ -92,13 +92,4 @@ ${NM} -n ${1} | sed >${2} -e "
 # ppc stub
 /\.long_branch\./d
 /\.plt_branch\./d
-
-# ---------------------------------------------------------------------------
-# Ignored kallsyms symbols
-#
-# If the 3rd parameter exists, symbols from it will be omitted from the output.
-# This makes kallsyms have the identical symbol lists in the step 1 and 2.
-# Without this, the step2 would get new symbols generated by scripts/kallsyms.c
-# when CONFIG_KALLSYMS_ALL is enabled. That might require one more pass.
-$(if [ $# -ge 3 ]; then ${NM} ${3} | sed -n '/ U /!s:.* \([^ ]*\)$:/ \1$/d:p'; fi)
 "
-- 
2.40.1


