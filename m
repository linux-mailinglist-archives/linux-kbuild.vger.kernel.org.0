Return-Path: <linux-kbuild+bounces-6697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44289A93F85
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 23:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE3917C462
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F0B241674;
	Fri, 18 Apr 2025 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2WCddnk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3141760;
	Fri, 18 Apr 2025 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012364; cv=none; b=pphn8enxvvdTTYQhYeIeQ3S88jcVayEVGsvB7OjmY0nVpX4ZM4SUVgZqcVIIEhcrusJiIWAkhXRzuhCZweH5gw4upF2FC1tkbFN3XCgRJOc+5Po6qkE1fTh6d2S24gjAYwHOHxNHclB3/TlbKHS6MwQijuxwDg3irVkeLXJVPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012364; c=relaxed/simple;
	bh=Dxddxm0RejabRVjCTL14ao3nM8RrH3k/YV8zdVVdCso=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BgPN8fECWa+fK2V4c1S6Gt4K1PPghNA8RAH8ChoThdUvREQUKfZ7p5InceAF2GIKL6G53XvXg4NTQQ7rUUoHX1n8TdBdvl46nI0Hgpou+e0TJMtpEsSqwqq44KQcoC+JFf+3M6yWGunOs/skZNcWJ4ZXYP/HV8ao6BsrLtQ4PI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2WCddnk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B194C4CEE2;
	Fri, 18 Apr 2025 21:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745012364;
	bh=Dxddxm0RejabRVjCTL14ao3nM8RrH3k/YV8zdVVdCso=;
	h=From:To:Cc:Subject:Date:From;
	b=G2WCddnkCUd9nuX4LNZaI9Bc6KvI6JUPHUd7atC1tG4qG8yCRUmD3UBZewEiLJ+cS
	 tp/eU62QRFVpv+UR2Y5SadYgnWE4h9m2J04MizlxXOFzq098DtDK7MBA+aK2mc96+H
	 tfbawR1cbyMP7vu6WBeQ2hZNQJOYTIscf3PkJsQJY77JGJuctcfP5fKPWe5A/U39jM
	 qA8yu+v7E5GksMxIGucwygtHLtyy/+yfVU/7UvBi+eg3Tbbf4//3PEbpKy6NRtCRyR
	 264rLnzRFaknCTjvmRXOk0mNw7P564ZdWP0NSGSTjhCBrlpEt1jm97yP9Kn2STR45Y
	 MFgOU73WviJbg==
From: Kees Cook <kees@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: Switch from -Wvla to -Wvla-larger-than=0
Date: Fri, 18 Apr 2025 14:32:39 -0700
Message-Id: <20250418213235.work.532-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972; i=kees@kernel.org; h=from:subject:message-id; bh=Dxddxm0RejabRVjCTL14ao3nM8RrH3k/YV8zdVVdCso=; b=owGbwMvMwCVmps19z/KJym7G02pJDBlMR75tUNcXehp4aNuTF9IufZcazwSYsVpMuhT1SYfV7 DZjXfTDjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIlU6zD8sxcrPZD7z3HyfV5/ l5P7Zidtu6JR9j1/s8OLWSp8sROaOxkZ7tvemrNQJZAjpFqnUJfJSVdjfeDhLfxyf09LOTKE/fv OCwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Variable Length Arrays (VLAs) on the stack must not be used in the kernel.
Function parameter VLAs[1] should be usable, but -Wvla will warn for
those. For example, this will produce a warning but it is not using a
stack VLA:

    int something(size_t n, int array[n]) { ...

Clang has no way yet to distinguish between the VLA types[2], so
depend on GCC for now to keep stack VLAs out of the tree by using GCC's
-Wvla-larger-than=0 option (though GCC may split -Wvla[3] similarly to
how Clang is planning to).

Switch to -Wvla-larger-than=0 and adjust the two VLA-checking selftests
to disable the updated option name.

Link: https://en.cppreference.com/w/c/language/array [1]
Link: https://github.com/llvm/llvm-project/issues/57098 [2]
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217 [3]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-mm@kvack.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <llvm@lists.linux.dev>
---
 lib/Makefile               | 2 +-
 mm/kasan/Makefile          | 2 +-
 scripts/Makefile.extrawarn | 9 +++++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index f07b24ce1b3f..37b6e5782ecb 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -71,7 +71,7 @@ CFLAGS_test_bitops.o += -Werror
 obj-$(CONFIG_TEST_SYSCTL) += test_sysctl.o
 obj-$(CONFIG_TEST_IDA) += test_ida.o
 obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
-CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
+CFLAGS_test_ubsan.o += $(call cc-option, -Wno-vla-larger-than)
 CFLAGS_test_ubsan.o += $(call cc-disable-warning, unused-but-set-variable)
 UBSAN_SANITIZE_test_ubsan.o := y
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index 1a958e7c8a46..0e326116a70b 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -35,7 +35,7 @@ CFLAGS_shadow.o := $(CC_FLAGS_KASAN_RUNTIME)
 CFLAGS_hw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
 CFLAGS_sw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
 
-CFLAGS_KASAN_TEST := $(CFLAGS_KASAN) $(call cc-disable-warning, vla)
+CFLAGS_KASAN_TEST := $(CFLAGS_KASAN) $(call cc-option, -Wno-vla-larger-than)
 ifndef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
 # If compiler instruments memintrinsics by prefixing them with __asan/__hwasan,
 # we need to treat them normally (as builtins), otherwise the compiler won't
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d75897559d18..0229b10c5d81 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -45,8 +45,13 @@ endif
 # These result in bogus false positives
 KBUILD_CFLAGS += $(call cc-disable-warning, dangling-pointer)
 
-# Variable Length Arrays (VLAs) should not be used anywhere in the kernel
-KBUILD_CFLAGS += -Wvla
+# Stack Variable Length Arrays (VLAs) must not be used in the kernel.
+# Function array parameters should, however, be usable, but -Wvla will
+# warn for those. Clang has no way yet to distinguish between the VLA
+# types, so depend on GCC for now to keep stack VLAs out of the tree.
+# https://github.com/llvm/llvm-project/issues/57098
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217
+KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=0)
 
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += -Wno-pointer-sign
-- 
2.34.1


