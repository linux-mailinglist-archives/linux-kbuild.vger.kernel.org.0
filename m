Return-Path: <linux-kbuild+bounces-8275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90356B18FA8
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 20:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2995163C42
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 18:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F42E23D291;
	Sat,  2 Aug 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBn03Nz3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E71A0730;
	Sat,  2 Aug 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754160220; cv=none; b=uenTdQ2E7eHtMJ/a5L2HCY5P6qrOq4mopTDtIvM0OxPluLoz6greqE1eFVDJgXazaDv0FfaDnBcyeBr96ZdJSHpUSL5bGVFgJ76iIuUGrs0UWsdFaQXMYn94hzzBkclJy9rSjWCNYuvpjZR35tqYEyxMnk/s2pPNC+dOgKl14ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754160220; c=relaxed/simple;
	bh=mQLT26HbDMezkOswB66ycYR6QML2I25qybJHR7DuV4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qTqUji6jxLZd18plPcLdiH0TdUp55mROOo9EkhKSVu9YHJjvkGGK3bP6Ai6C0N39mlvHBUjgIT6IemBDZmnvlWhQzyzmCi7QnGBPSVzjb5HAktj/uPeHOyZ0gHxvPdDA83EgZ1dsPI1/yQ16kRi21NHf3rNuLEQuQn0z5cPGFw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBn03Nz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294AAC4CEEF;
	Sat,  2 Aug 2025 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754160219;
	bh=mQLT26HbDMezkOswB66ycYR6QML2I25qybJHR7DuV4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=HBn03Nz3KlhNTOG8MOWhYWKtuhMzeoYZfANlHXX501A00w09BATRyqpLUnPtvN/xx
	 O9Y0zsaxh2rqHIuhb8fyExKko+uj+1BHICWUL6zNxbImTgGl1K5rA6NPPo4EYvrN9z
	 d7qJqrEQdlwx4gsh74bWAMwlFClocBseTwISYLie0rHXuApIdL3TyR+7ke8XfNFM+T
	 q574OCoYEADwMJU7ygcd1LSNNDu/IHAg1pKBTvnqsZGy74KCaWzWyp9jwAzxxdvDBe
	 aZYtd9DDGrHUWEyJA6gW1ex/+OA4KUOPU6TiDEkHE9FPFWqijJTbpeThVLCaECAJsV
	 Su2+YffOoLB0g==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Date: Sat,  2 Aug 2025 11:43:32 -0700
Message-Id: <20250802184328.it.438-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=kees@kernel.org; h=from:subject:message-id; bh=mQLT26HbDMezkOswB66ycYR6QML2I25qybJHR7DuV4Q=; b=owGbwMvMwCVmps19z/KJym7G02pJDBl9MSGG1o/95nz0rb8Y4x+yl4Pz1tsZenMjJ/lyVpX+S 5676qhSRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwESWczH8j/AM8tzhUupnUbD5 RXGJv/Wja/ode7a7brObX3hlIoPkI0aGXbs6iy3OWO+WPHKl4niphW9wXFPW+1nxN8Uc9kR4bzv IAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With the few remaining fixes now landed, we can re-enable the option
-Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
have the required multi-dimensional nonstring attribute support.

Build tested allmodconfig with:
	gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0
	gcc (GCC) 15.1.1 20250521 (Red Hat 15.1.1-2)
	clang version 20.1.8 (Fedora 20.1.8-1.fc42)
	ClangBuiltLinux clang version 21.1.0-rc2
	clang version 22.0.0git

Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: Clang is fixed too! :) (Nathan)
 v1: https://lore.kernel.org/lkml/20250802002733.work.941-kees@kernel.org/
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: <linux-kbuild@vger.kernel.org>
---
 scripts/Makefile.extrawarn | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index dca175fffcab..a1001377dcb2 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -78,9 +78,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
 KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
 KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
-# Currently, disable -Wunterminated-string-initialization as broken
-KBUILD_CFLAGS += $(call cc-option, -Wno-unterminated-string-initialization)
-
 # The allocators already balk at large sizes, so silence the compiler
 # warnings for bounds checks involving those possible values. While
 # -Wno-alloc-size-larger-than would normally be used here, earlier versions
-- 
2.34.1


