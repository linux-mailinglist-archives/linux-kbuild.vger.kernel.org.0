Return-Path: <linux-kbuild+bounces-3607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D76497B156
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF011C2356B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF82D194AE6;
	Tue, 17 Sep 2024 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxcRo7Hx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7491194AD6;
	Tue, 17 Sep 2024 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582695; cv=none; b=fvft7fx5OwayeKcJGWbfV/McVAWET/tkaggh1v9iHvfozZCgx8vKliJwj/2F1w1GqY7SQLJ1IjvPg/EmsLs2dsR0DfRd2IG+eKYym7mwt8TPJfxCzjo6tiUKk3K+/ftBxno6WW/gdkzEqpPQ02M9/kT89hHPAbe/6Fc2i3zYSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582695; c=relaxed/simple;
	bh=6ovtfxPLSr9bMGDxuc9bLq1SSFe119PmyqlLKy/y1gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8oGr0EXo2xHT4xrr33qmQyggN+tRtF3eWaVr1SC/aGugUUiPDzRxAJEcYLlC7J6ALXbn5AOsSWfG3YHB7IoZAQAZtYX2/Tl7yPH86kfOLWI1YjTsYhDeLEcqM2NnHR2i+hjmaw2YyZvGJmj0kLkj1WemBHz59BTy2rIdbHDgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxcRo7Hx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5C8C4CECD;
	Tue, 17 Sep 2024 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582695;
	bh=6ovtfxPLSr9bMGDxuc9bLq1SSFe119PmyqlLKy/y1gI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SxcRo7Hxr/XE+diRmR2zFq37e+ot4nD4aE1owbXAC0SQ+F2TWekZarZQ/uUuauT9C
	 u0Jwa7AXmYwSGtP4c/RCPj4rTsDK47ns+fEEpYSJWDcxS/i0Vyc+IeVJ4izadvDoAV
	 M0u0DZ5xBnR1WdhUuTLm0zDLJ8R+TSU37uzV4SIeiO0gBmMPupMbGvTf5oSOHRQF57
	 0iNR/bU/5lfz0GO25Qy4uJDeZPhq4TicVVqWAmwk3pinfopcGeKCfdi/l/GN3yWTQG
	 1f2a7U+Yf7lVcx0Ja4AjJTDfpJ0Ta2lzoLYyWngviZF2Zx8VSdCB+w+OYzV2j86pSt
	 daeCHkYTSE9WQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 20/23] kbuild: support -fmacro-prefix-map for external modules
Date: Tue, 17 Sep 2024 23:16:48 +0900
Message-ID: <20240917141725.466514-21-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit makes -fmacro-prefix-map work for external modules built in
a separate output directory. It improves the reproducibility of external
modules and provides the benefits described in commit a73619a845d5
("kbuild: use -fmacro-prefix-map to make __FILE__ a relative path").

When VPATH is not defined (e.g., when the kernel or external module is
built in the source directory), this option is unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b654baa0763a..ce646a6994a6 100644
--- a/Makefile
+++ b/Makefile
@@ -1027,8 +1027,10 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS   += -fconserve-stack
 endif
 
-# change __FILE__ to the relative path from the srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+# change __FILE__ to the relative path to the source directory
+ifdef VPATH
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(VPATH)/=)
+endif
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
-- 
2.43.0


