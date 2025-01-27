Return-Path: <linux-kbuild+bounces-5560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB46BA1DC88
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 20:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44D767A4161
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 19:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCFB194094;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWlta6Iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B619066D;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005035; cv=none; b=NLgvEREF+w7YZp3Pekq+CquptyR6Mu4oI6YUXVnesqvVzTjFs5HoRy7RonwBiOWNontYeH3WESwbFKlzO+q52cpKD/uOZ/WLXZV/S2Jv8m0ujInQbdC4KuV8ECTcuHgkvcEXiAnoGETnuzvOzc+6zV2GxXiWf/uxiM7tDlIRkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005035; c=relaxed/simple;
	bh=GYMmPFEcdDc8y552EQFjhJ7bjqBPWsEEeQCv/amnOaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AdN7YEZX6V/2V9ASN955LNAsxEYpMNZ56jCTiWbYsrdX00RxozCPjnmHzYPRbXBO54qdKwwvC3myN1VPmNqIRIv9AHtwkZmYFAFc085cRWwBQRnE/nUCWD/MM9Fbz/u05xDvOehNPHOSubUufzuw0lqdbnvQyKJpiG1LyLOJJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWlta6Iz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1702C4AF0B;
	Mon, 27 Jan 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005034;
	bh=GYMmPFEcdDc8y552EQFjhJ7bjqBPWsEEeQCv/amnOaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWlta6IzQTA1ABSxOrNDjzQaOW7P4RDttBsd78zjqNk9ETq1cN3stjHXreeRNx0eZ
	 DThelRoLKJ2/RyaV9ShD3tdIUlBl/6oBDZKbvJ04F/PUS8Pl8DDPpl5HOh5rpo3ZsC
	 55/oWpMnWAhXENjYIVTSz91JcU81fOyS11ldMOq5B9h9cwt7hOX9uTlBFXXDeH+HS7
	 3aTte0Ud4B6sPQIxxNFQkQMH+Ex6uT9KdhytQ5f21y5+OG/FYu7975qgFsqp8DVTFU
	 npnFiZJhQIOk/EWX0rKyy3/QgCZwzKgUAEyeOMgMHEbg9XBWkDglsyJUkCHyTvA77n
	 NqpmN9L10GjSw==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/3] kbuild: Use -fzero-init-padding-bits=all
Date: Mon, 27 Jan 2025 11:10:28 -0800
Message-Id: <20250127191031.245214-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127190636.it.745-kees@kernel.org>
References: <20250127190636.it.745-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3925; i=kees@kernel.org; h=from:subject; bh=GYMmPFEcdDc8y552EQFjhJ7bjqBPWsEEeQCv/amnOaI=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnTbylvrX7DITXvIsOETR/aVfoeTvU5pttk1/5vj4PT+ s9MeuESHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNROcjwP6j59Zf9Bb3G6W0/ fy5q2dN5q6vJ2oFbZdZqQ9Mu/zU/3zH84ZlvGd4swaUtven2HOsd2+58u8JjMt969clGy7xK3Qe lLAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

GCC 15 introduces a regression in "= { 0 }" style initialization of
unions that Linux has depended on for eliminating uninitialized variable
contents. GCC does not seem likely to fix it[1], instead suggesting[2]
that affected projects start using -fzero-init-padding-bits=unions.

To avoid future surprises beyond just the current situation with unions,
enable -fzero-init-padding-bits=all when available (GCC 15+). This will
correctly zero padding bits in unions and structs that might have been
left uninitialized, and will make sure there is no immediate regression
in union initializations. As seen in the stackinit KUnit selftest union
cases, which were passing before, were failing under GCC 15:

    not ok 18 test_small_start_old_zero
    ok 29 test_small_start_dynamic_partial # SKIP XFAIL uninit bytes: 63
    ok 32 test_small_start_assigned_dynamic_partial # SKIP XFAIL uninit bytes: 63
    ok 67 test_small_start_static_partial # SKIP XFAIL uninit bytes: 63
    ok 70 test_small_start_static_all # SKIP XFAIL uninit bytes: 56
    ok 73 test_small_start_dynamic_all # SKIP XFAIL uninit bytes: 56
    ok 82 test_small_start_assigned_static_partial # SKIP XFAIL uninit bytes: 63
    ok 85 test_small_start_assigned_static_all # SKIP XFAIL uninit bytes: 56
    ok 88 test_small_start_assigned_dynamic_all # SKIP XFAIL uninit bytes: 56

The above all now pass again with -fzero-init-padding-bits=all added.

This also fixes the following cases for struct initialization that had
been XFAIL until now because there was no compiler support beyond the
larger "-ftrivial-auto-var-init=zero" option:

    ok 38 test_small_hole_static_all # SKIP XFAIL uninit bytes: 3
    ok 39 test_big_hole_static_all # SKIP XFAIL uninit bytes: 124
    ok 40 test_trailing_hole_static_all # SKIP XFAIL uninit bytes: 7
    ok 42 test_small_hole_dynamic_all # SKIP XFAIL uninit bytes: 3
    ok 43 test_big_hole_dynamic_all # SKIP XFAIL uninit bytes: 124
    ok 44 test_trailing_hole_dynamic_all # SKIP XFAIL uninit bytes: 7
    ok 58 test_small_hole_assigned_static_all # SKIP XFAIL uninit bytes: 3
    ok 59 test_big_hole_assigned_static_all # SKIP XFAIL uninit bytes: 124
    ok 60 test_trailing_hole_assigned_static_all # SKIP XFAIL uninit bytes: 7
    ok 62 test_small_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 3
    ok 63 test_big_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 124
    ok 64 test_trailing_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 7

All of the above now pass when built under GCC 15. Tests can be seen
with:

    ./tools/testing/kunit/kunit.py run stackinit --arch=x86_64 \
        --make_option CC=gcc-15

Clang continues to fully initialize these kinds of variables[3] with
additional flags.

Suggested-by: Jakub Jelinek <jakub@redhat.com>
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403 [1]
Link: https://lore.kernel.org/linux-toolchains/Z0hRrrNU3Q+ro2T7@tucnak/ [2]
Link: https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae3591614feede727601fa [3]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/Makefile.extrawarn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7..eb719f6d8d53 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -77,6 +77,9 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
 # Warn if there is an enum types mismatch
 KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
 
+# Explicitly clear padding bits during variable initialization
+KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 KBUILD_CFLAGS += -Wextra
 KBUILD_CFLAGS += -Wunused
 
-- 
2.34.1


