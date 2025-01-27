Return-Path: <linux-kbuild+bounces-5558-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954BAA1DC81
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 20:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8563A5528
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 19:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9DE192D9A;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRmVuUEl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561119006B;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005035; cv=none; b=ZCQ8r0Ks8QfkJNDlZ3KwWTvNfAorNvyd3wEPnc3ddKZOUDM5FpqT/S2FsiIM9zl8LEGr8FOO7FeG6+TEtSR8u87r6op/7foczhq3l5oozxWQsZpUdgm2wQLfEIZBPflfZcW7f1JaYdMCppe5Ct9Jr8XHM2yaeyFTMNgOFzoTB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005035; c=relaxed/simple;
	bh=JWdR82V9fln+3rkwIhGCUgHg8nrGmCKkFmeBeaEjtG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sEY2Ptt17gnhSTdm5AWdOABXE2DLOrxkYhAhOvH0C6Aw43PFD133Kf6OOfEb4P0gsnAHpP5sYN2k33s3E4BGuuT9Am61pVYGEFFTpDxmWtY9Wfbe3HlrycUk2Le4+wTfEDM4lCVLY6gV3m/yrtuA8VEIiHRicLiCe5PTFLBYLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRmVuUEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E02C4CEE0;
	Mon, 27 Jan 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005034;
	bh=JWdR82V9fln+3rkwIhGCUgHg8nrGmCKkFmeBeaEjtG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRmVuUEl/UkLlXiGrP713/AyeBI4AFrIy3XMNhiQ3Lf26n83HqVbV5t2CpC03NmK6
	 E3+v7g0I+3SILN6CSCtyeQeLBnx/RCeRdXic56KXqG5o1QE/nYJxKVCoUWWW3Zx2OV
	 Diw7/G1JW1oB1tjsTJnWNvq15gicL8Y30v4+qmDAQW4JqrBZYMQT+1fQYvmrhlMQ+4
	 4TbbGz3DzfU+C3amYpM8JxGvJXD4uXL02drv5RA9LToaDid9S/FNHHlyjH1tBdb8sg
	 c44qZgUCq+Lcqk+O9jXBkihCkjmqWMVYYjjE4bLqm5Ys5dZlfP8e+Guvuqb1cVW5Xz
	 OyjFAqNSdT8gw==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/3] stackinit: Add old-style zero-init syntax to struct tests
Date: Mon, 27 Jan 2025 11:10:26 -0800
Message-Id: <20250127191031.245214-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127190636.it.745-kees@kernel.org>
References: <20250127190636.it.745-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=kees@kernel.org; h=from:subject; bh=JWdR82V9fln+3rkwIhGCUgHg8nrGmCKkFmeBeaEjtG0=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnTbyk5G61NmH1vwssbZ6L/HF1zbf7Jx8zuq7lTu1h2R UXMKS362lHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjCRurOMDJNC7kSaLFqw70ZW wWWuUukoLrO/C86H3F0xc6fr2+sPr85hZPhYLpr851B+h9p51bDMD3zSJ37+mrj/0qmJvcp8+Vt 32zECAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The deprecated way to do a full zero init of a structure is with "= { 0 }",
but we weren't testing this style. Add it.

Signed-off-by: Kees Cook <kees@kernel.org>
---
 lib/stackinit_kunit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/stackinit_kunit.c b/lib/stackinit_kunit.c
index c40818ec9c18..7cc9af181e89 100644
--- a/lib/stackinit_kunit.c
+++ b/lib/stackinit_kunit.c
@@ -101,6 +101,7 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 
 #define INIT_STRUCT_none(var_type)	/**/
 #define INIT_STRUCT_zero(var_type)	= { }
+#define INIT_STRUCT_old_zero(var_type)	= { 0 }
 
 
 #define __static_partial		{ .two = 0, }
@@ -346,6 +347,7 @@ struct test_user {
 /* These should be fully initialized all the time! */
 DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
 DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
+DEFINE_STRUCT_TESTS(old_zero, ALWAYS_PASS);
 /* Struct initializers: padding may be left uninitialized. */
 DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
 DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
@@ -440,6 +442,7 @@ static struct kunit_case stackinit_test_cases[] = {
 	/* These are explicitly initialized and should always pass. */
 	KUNIT_test_scalars(zero),
 	KUNIT_test_structs(zero),
+	KUNIT_test_structs(old_zero),
 	/* Padding here appears to be accidentally always initialized? */
 	KUNIT_test_structs(dynamic_partial),
 	KUNIT_test_structs(assigned_dynamic_partial),
-- 
2.34.1


