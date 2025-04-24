Return-Path: <linux-kbuild+bounces-6731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B4A99CA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 02:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D2D5A4A7A
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 00:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156E5634;
	Thu, 24 Apr 2025 00:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyEdyM49"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B912E5B;
	Thu, 24 Apr 2025 00:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453837; cv=none; b=CgJaIjr0RLb3/zAygWBMomM1hWiHW/11rN9QQwmNUBjmpFqQx980JIRwc5ZE0rJPhJkCWI28ul5kkg7MHLcmF/lzf8alqv81ao1eTREuvfvuHTYjJT38bhXqvhyDeKp+jTf5AePdTfYcIZwTlytsn4aEA0T0Gm5mKILX3bklWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453837; c=relaxed/simple;
	bh=qYC37Vo5nYVYlQVxiTco1BS1/PDOhMyuijYB9VWIZus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3YJz6bNFRBkU+2+7mGu9Yv5tny/96LWiaPUfxZz5TmZPe3I5UeTIso9DXm5o6RsF28EA9kmktF3F7YEwMyBYNSDsyAwWSwV+Iq7HFqFs15egH/zsFchYD8nGbrgJr8iQ8pXfH2S6ByQbQOIA7Ld3rcRsdFgwWbHemkOzletxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyEdyM49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6C6C4CEE3;
	Thu, 24 Apr 2025 00:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745453836;
	bh=qYC37Vo5nYVYlQVxiTco1BS1/PDOhMyuijYB9VWIZus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WyEdyM49aB5dfkLZLH8wkbGEsh+xxNygyaEHVRWs5TtmTAedewZiRuJ8PTPaNigI9
	 ohmu9IeeP8wAmXOYIf210bUKbmNe1IvIlLP+HA/ceg7DrSYfkL7WHS0hTspsVt4HLQ
	 5qlpMIYmKOJR/spmaHlvKszzPf6N1yBi/n3MXwEVGS/6MTn7QFq6Ar17crSVH5Hy4C
	 z65BTHUj2Kbm8/Wy1ppmmrXcjthuykWt1LREIQs6xchI1rh+6ezjHTV8K2OFclZtGt
	 Cd1O+/oWUanhBzRcIDjFMRmhmmukCRWFosj6Bw6KbPd5Kx8KWrEROea3SGMZw7M7j5
	 8eaV7HJBxKkUQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u7kH5-0000000049W-248p;
	Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/4] Makefile: move KERNELDOC macro to the main Makefile
Date: Thu, 24 Apr 2025 08:16:22 +0800
Message-ID: <bb3ea3b49e76aee51dae7762db10c4d38cd67afe.1745453655.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As kernel-doc script is used not only on Documentation, but
also on scripts and drivers/drm Makefiles, move it to the
main makefile, as otherwise sub-makefiles may not have it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/Makefile | 1 -
 Makefile               | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index a006c7681412..8c1f6a3dfc44 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
 # Internal variables.
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
 ALLSPHINXOPTS   = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
 ALLSPHINXOPTS   += $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
 ifneq ($(wildcard $(srctree)/.config),)
diff --git a/Makefile b/Makefile
index 38689a0c3605..2a05988740a9 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,11 @@ endif
 HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
+# the KERNELDOC macro needs to be exported, as scripts/Makefile.build
+# has a logic to call it
+KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+export KERNELDOC
+
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 			 -O2 -fomit-frame-pointer -std=gnu11
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
-- 
2.49.0


