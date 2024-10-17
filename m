Return-Path: <linux-kbuild+bounces-4166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 856069A2A6A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 19:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AC8E28772F
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 17:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7CD1DFE11;
	Thu, 17 Oct 2024 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pua+mYqJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981291DFE06;
	Thu, 17 Oct 2024 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184968; cv=none; b=Gv66/nZNxWxAlDQtyywZ3g/c45JrSB64AK/ZO/njOvaryNZVvcYtjXKMFOx6IqzyxS1TXWnzoumQqZfe3QCdrlcz1Veu7ZRESs0BR+htl44tX4yYzs6FS6XoMjO9TbeK/XBx0pOpCcuRZMj2W65OSJ1JNE1jY0kFH/FAR0a2pGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184968; c=relaxed/simple;
	bh=m/EkYw2s59ro8v1uZNnuDskZpSm80+cYs5IMSQ2weqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YYY77m22uRjJRwfPrCkrxe/Vuks2Z6euMSBYimQotuqqiMVULX2n9D+5ziQnXbs5JSHsBYmemVSiic++RJFyjsVFXuOOw2Xp2KuGuOidDawk1XiIPQ7NfhgV8QKc2Dw6dPSe4gkqbpBoKfk0cQsXnhHPjTAt/IvLiUxXkFfkhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pua+mYqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E892C4CECD;
	Thu, 17 Oct 2024 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729184968;
	bh=m/EkYw2s59ro8v1uZNnuDskZpSm80+cYs5IMSQ2weqM=;
	h=From:Date:Subject:To:Cc:From;
	b=Pua+mYqJLoNh+RDMls9nHh47VkCBtx0Z6qNwUxJRFavT/4z3wW4udsyzim87WtxR0
	 MopPUu+rsQ5I5h35/UoD4GFtg/WD7DNLDW0UP2UKAV3ZM4PLFZD5nMWJtcIFGXSbKi
	 g6X+oxFN/JyehtYm8rymAZ7kGjw5FyHbQcbQqVbXEcDt+JUxykg+9YgMHsl25yqoXo
	 mWM3aj5QR0E92SuuHd1s/Hqbg2mAEUSf60uxU+30dAWduGtq0gnNss1oJnz1N1n/sd
	 jCdoxThuJaEEpJWq90GMP12T5jEoy5/TcH0CKj/0gUuFQJHIykEPRIpOufxe7hWKHC
	 /ucwMxjONORZQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 17 Oct 2024 10:09:22 -0700
Subject: [PATCH v2] kbuild: Move -Wenum-enum-conversion to W=2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMFEEWcC/42NQQ6CMBBFr0Jm7RjaNEBdeQ/DotIRJmJrpggaw
 t2tnMDl+/l5b4VEwpTgVKwgNHPiGDLoQwHd4EJPyD4z6FIbVaoKPSd3HQmnJWI35gdSeD1wcRI
 49AmpttZ4Y27WNJAtT6Ebv/fCpc08cJqifPbgrH7r/+5ZoUJHTVP52pW6suc7SaDxGKWHdtu2L
 5iU4GXPAAAA
X-Change-ID: 20241016-disable-two-clang-enum-warnings-e7994d44f948
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Aleksei Vetrov <vvvvvv@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2857; i=nathan@kernel.org;
 h=from:subject:message-id; bh=m/EkYw2s59ro8v1uZNnuDskZpSm80+cYs5IMSQ2weqM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmCLsc1Q+du8D5w+Vl7NoeOedrz8lO6juJzsu9rfNU/5
 WoWdqaho5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkvgYjw9eT/9m+/1nAdpSn
 +WzLtTdvdNSm/CiftlahejmbF+/BB6oMfzi7ZT3WLpuYGXzqSvS/LIVzmooRLvnS/oz/H+8MDA0
 S5gMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

-Wenum-enum-conversion was strengthened in clang-19 to warn for C, which
caused the kernel to move it to W=1 in commit 75b5ab134bb5 ("kbuild:
Move -Wenum-{compare-conditional,enum-conversion} into W=1") because
there were numerous instances that would break builds with -Werror.
Unfortunately, this is not a full solution, as more and more developers,
subsystems, and distributors are building with W=1 as well, so they
continue to see the numerous instances of this warning.

Since the move to W=1, there have not been many new instances that have
appeared through various build reports and the ones that have appeared
seem to be following similar existing patterns, suggesting that most
instances of this warning will not be real issues. The only alternatives
for silencing this warning are adding casts (which is generally seen as
an ugly practice) or refactoring the enums to macro defines or a unified
enum (which may be undesirable because of type safety in other parts of
the code).

Move the warning to W=2, where warnings that occur frequently but may be
relevant should reside.

Cc: stable@vger.kernel.org
Fixes: 75b5ab134bb5 ("kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1")
Link: https://lore.kernel.org/ZwRA9SOcOjjLJcpi@google.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Move -Wenum-enum-conversion to W=2, instead of disabling it
  outright (Arnd)
- Leave -Wenum-compare-conditional in W=1, as there are not that
  many instances, so it can be turned on fully at some point (Arnd)
- Link to v1: https://lore.kernel.org/r/20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org
---
 scripts/Makefile.extrawarn | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..04faf15ed316a9c291dc952b6cc40fb6c8c330cf 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -130,7 +130,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
 KBUILD_CFLAGS += -Wno-enum-compare-conditional
-KBUILD_CFLAGS += -Wno-enum-enum-conversion
 endif
 
 endif
@@ -154,6 +153,10 @@ KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-type-limits
 KBUILD_CFLAGS += -Wno-shift-negative-value
 
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += -Wno-enum-enum-conversion
+endif
+
 ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
 endif

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241016-disable-two-clang-enum-warnings-e7994d44f948

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


