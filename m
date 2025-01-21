Return-Path: <linux-kbuild+bounces-5515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE7A17540
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 01:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07B3B3A806B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 00:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EF79475;
	Tue, 21 Jan 2025 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdCNe8Qg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED99879D2;
	Tue, 21 Jan 2025 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737419823; cv=none; b=OomZdSKYn1k5v6wDAV+DK1hXn7btHFudHyvfxfJiqy3w6vRGWoxxz0FJlnawjGwiq8M7qbWTrL4slCgvl2pd0KalIiQ0IAEl1o8tc0W5u3sV4YzR1+VjHGNbOuuAyGS/gaqMYuVOCSbVVh4p1Koanlf6eblL1qv8aZxPJAoe0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737419823; c=relaxed/simple;
	bh=3HnnYi/SmEcGz2glgVrJmb8BnWrs+DQG6iLqEy+biCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qvRijzfvh4aLLDbWpb3MT9EMh2dNLVEtwEIsBhCH4CmwymonsUN4AzPC7uBD3nkXqS/Y9LK9J91loDHXKVoYN3mxjjaZs7xawIsoYX9TDCSci8hxLF+NC4l1o9PXNS0YqfJ0B64LyqNvHRwiqxAcv23ysrrpLU1Qedw0UIhdMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdCNe8Qg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51955C4CEDD;
	Tue, 21 Jan 2025 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737419822;
	bh=3HnnYi/SmEcGz2glgVrJmb8BnWrs+DQG6iLqEy+biCE=;
	h=From:To:Cc:Subject:Date:From;
	b=PdCNe8QgIHqew3aXu0kl3Ne3+Qq+3cHesEQxhIRigZBK9P7ByzqilM5UKoFB9dPBE
	 xPa5fZr6nv2svRcNUfzOpYmdGHjVjk/IM+6O70pP2HG1/YqKJbYANqg9cjypjnIM1e
	 vGqo/xPcljz+vW3yKtZKdRKnopxU/p47F13/XiiM/lS8WqEzPBANokTdD3Yich9/3j
	 vgAmvx7wXyMgbsXUg9lrZdKTBWjR9KXcKsbQNakbz5JEulpPjr+fTp9c+BKsPSyYLD
	 66y99td+dQ4xoUDtl2hXO59qDhjiEnkT2Qsy/tyalU8vSowE2pJVoNQOYQDEcyHYDw
	 ws0JPZ24MCSgQ==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: Use -fzero-init-padding-bits=all
Date: Mon, 20 Jan 2025 16:36:53 -0800
Message-Id: <20250121003646.work.168-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377; i=kees@kernel.org; h=from:subject:message-id; bh=3HnnYi/SmEcGz2glgVrJmb8BnWrs+DQG6iLqEy+biCE=; b=owGbwMvMwCVmps19z/KJym7G02pJDOl9b1Tbuf1uNPy0S5c5+3KDw+kc7bWG1zb9OTzT//Rz+ Y2lTLYcHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNxXsHwv56pnjEi7na2ZfNP mX2TntwtVRHQFbmsqMQQeGDrtv18PowMD5ytQmatL+8wY+v+ssM8a6as/uL6ZhmdT569/l3lL+a wAAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Enable -fzero-init-padding-bits=all when available (GCC 15+). This will
correctly zero padding bits in structs and unions that might have been
left uninitialized, and will make sure there is no regression in union
initializations[1]. This fixes the following stackinit KUnit selftest
cases that had been XFAIL until now because there was no compiler
support:

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

All of the above now pass when built under GCC 15:

    ./tools/testing/kunit/kunit.py run stackinit --arch=x86_64 \
        --make_option CC=gcc-15

Suggested-by: Jakub Jelinek <jakub@redhat.com>
Link: https://lore.kernel.org/linux-toolchains/Z0hRrrNU3Q+ro2T7@tucnak/ [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
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


