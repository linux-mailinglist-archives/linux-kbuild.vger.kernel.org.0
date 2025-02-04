Return-Path: <linux-kbuild+bounces-5610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B9A2699A
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 02:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1B83A6117
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 01:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC13A213E6C;
	Tue,  4 Feb 2025 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qif+79aI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9F8633F;
	Tue,  4 Feb 2025 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631873; cv=none; b=f9uMplSgjwqEquAzH6L/lU+cpALAxvyNxiJbr3Kj8ma2J3wKrsgZunTf6DKeM27JqMhdzty5Q5o1H/Y1xoTh3Pzm+pifTQlP1QaQ84UMg6+DdlIhph1SEi6ulfeTssdZfK1WZccmUThssMFfeEPmUXfqMDqlzyfflxbAP24TljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631873; c=relaxed/simple;
	bh=yD+9AOlFovD1Y8vvdTcHlDFvH/B+nImFEA72s6sbPUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R9OOePjI9YSj7EuDWgEMohhZ0ZJyIKPjBDIjzMfcns21yw02YJ4FShbTNfpyBYsxI8/kjIVLy65EvyejMVI2sCtGd4MTRejRMyhdrFXFGpOyaT1l7vkTkZornAn/uVn7YwEBluQolJjbYcR19e5oUCKoGiOPGjzPboH/o5CipMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qif+79aI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A9C4CEE5;
	Tue,  4 Feb 2025 01:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738631872;
	bh=yD+9AOlFovD1Y8vvdTcHlDFvH/B+nImFEA72s6sbPUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qif+79aIpPQRgo+bz0nadOFVEX7pujUbx961UVneNRoctaxIM/sqLTsm8fZV/smxU
	 t/NS0qsNUiiTHY7wHlb+EiYJr5Iryf10OSHQvUhl+bP7VDlCvhs3Q5xzGwNe64KOmP
	 qHmOGdCkueyJRXNvCM9fSPUOewfYAIJ/8jVm4vLJAVrd5Qolgf8Wii2Q0fqcHsL6Za
	 wvXcar8O5GAxj3DXmAFTSdDxv/oobOFIa7djTsFYvjVsIzV00TGC/hUYTfB6r1eaGa
	 gLBCEv0Nf8JkGInp9C9h3eFNZx2SnzJh6E6JIq4Su1hbWt8qVM3qZqq1MnOmpd2Ntc
	 vZxZcs6OKRdQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.13 6/6] kbuild: Use -fzero-init-padding-bits=all
Date: Mon,  3 Feb 2025 20:17:33 -0500
Message-Id: <20250204011736.2206691-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250204011736.2206691-1-sashal@kernel.org>
References: <20250204011736.2206691-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.1
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees@kernel.org>

[ Upstream commit dce4aab8441d285b9a78b33753e0bf583c1320ee ]

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

Clang continues to fully initialize these kinds of variables[3] without
additional flags.

Suggested-by: Jakub Jelinek <jakub@redhat.com>
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403 [1]
Link: https://lore.kernel.org/linux-toolchains/Z0hRrrNU3Q+ro2T7@tucnak/ [2]
Link: https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae3591614feede727601fa [3]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Link: https://lore.kernel.org/r/20250127191031.245214-3-kees@kernel.org
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Makefile.extrawarn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc78..eb719f6d8d536 100644
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
2.39.5


