Return-Path: <linux-kbuild+bounces-1900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F28C9D94
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 14:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53EB41F22D24
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 12:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1396155C29;
	Mon, 20 May 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJyYELBp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4725FBA0;
	Mon, 20 May 2024 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208948; cv=none; b=lo1RLE+7Jm1NY3Fi4qxg2MJsOiFW6scCkmVB/NEOQ/qJVF6Hjx5BRol9SVguv8f7jspLvZqV2U6+zF65wl98EkhdVeHC85DHfAv68iffK6WZLDnL2FfVDHFiINYqLD5dXvKPervqDyLp0EzykMZi1wgcGsy+Z2NWPdeQB2GI2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208948; c=relaxed/simple;
	bh=xxfBrLnsF1A2xg6Jdz/kmz2DmtquNNmEmxzRupok00A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3dE+m9GwEyOu04OV37lFu3J7jursC8mO4v1Z6bV4EPQ7OIx2MPMyWw+eTjnhiVE1/VqWhfqlTF0vXkifEdkP20rfjvrIfAOXeK5e62Sk1KpJCnCoeFzCoZRxX0SDQvd+xhNsziPufyojBjwXp4Z0BIlrbyjc3W9nzRFbtc1wi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJyYELBp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37EFC4AF09;
	Mon, 20 May 2024 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716208947;
	bh=xxfBrLnsF1A2xg6Jdz/kmz2DmtquNNmEmxzRupok00A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJyYELBp2Z83mPg8efMr9jQdaEsibHaSry6bprWwqtyrcFpHcH1fB8SZ+O4syblea
	 bcjgR51BbvSlTubXRC+pjHSseAkC1OdVNGQe5rSdh3dumXXvn8kuRrLoc9Gj05fXVO
	 +zCG1HYUe+b3B8M7a57pniEfIdeBTkcDN1XPZ4UqcYXLyYNJHFAYYtgdyYnlwPh7O7
	 RXw0btRjNTewyVJglU8I+/pRPa1D56Q8l9sBU+AbHh16HcHJv0pIhrZmiQAtxx8VSz
	 X73yOZmzYkV8pE0U/BoDFaRtrIaO9NKu56jxl2Jlz0PaINxdRg/9nNdC5TCD7GeqTO
	 8bxH6nPVzJ2vw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/4] kbuild: change scripts/mksysmap into sed script
Date: Mon, 20 May 2024 21:42:10 +0900
Message-Id: <20240520124212.2351033-3-masahiroy@kernel.org>
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

The previous commit removed the subshell execution from scripts/mksysmap,
which is now simple enough to become a sed script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh |  2 +-
 scripts/mksysmap        | 19 ++++++-------------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index b0d39a927fbc..c22a213ea6a9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -193,7 +193,7 @@ kallsyms_step()
 mksysmap()
 {
 	info NM ${2}
-	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
+	${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
 }
 
 sorttable()
diff --git a/scripts/mksysmap b/scripts/mksysmap
index e46bafe333bd..c12723a04655 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -1,22 +1,16 @@
-#!/bin/sh -x
-# Based on the vmlinux file create the System.map file
+#!/bin/sed -f
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# sed script to filter out symbols that are not needed for System.map,
+# or not suitable for kallsyms. The input should be 'nm -n <file>'.
+#
 # System.map is used by module-init tools and some debugging
 # tools to retrieve the actual addresses of symbols in the kernel.
 #
-# Usage
-# mksysmap vmlinux System.map
-
-
-#####
-# Generate System.map (actual filename passed as second argument)
-# The following refers to the symbol type as per nm(1).
-
 # readprofile starts reading symbols when _stext is found, and
 # continue until it finds a symbol which is not either of 'T', 't',
 # 'W' or 'w'.
 #
-
-${NM} -n ${1} | sed >${2} -e "
 # ---------------------------------------------------------------------------
 # Ignored symbol types
 #
@@ -92,4 +86,3 @@ ${NM} -n ${1} | sed >${2} -e "
 # ppc stub
 /\.long_branch\./d
 /\.plt_branch\./d
-"
-- 
2.40.1


