Return-Path: <linux-kbuild+bounces-6847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D3AA66CF
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7609B9A402A
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 23:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB6F267738;
	Thu,  1 May 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e98t5CLZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4F2676C2;
	Thu,  1 May 2025 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140443; cv=none; b=f7eSns0gt438g9Xx1nksiVmlq8eQ6Ul8VmdtbGvRXozd10CRRrBj7CA54ox2rB7UCejRW1nMCvSk6+7KYObBhaimGjbH99bMpNrvVbs2/pEALbM0KqUSyKoolxKO+6e0tNIJgdr1g0F/zCALCwnwqujqrkYQxxudT7caeVYBUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140443; c=relaxed/simple;
	bh=8FQkbRPJy0zvwunwc1ySRH0Q3DDXGhnAmdLyOpwrQt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRk2abBJq4xjjarJdeq/to+eENxiYDV4IM+IiiUr0sxeeSp02D4nMjyJDZVFHWVPh8Rk+2eXQNyJ4RTEXSpwbspRTM+1pHvePieDa+FakEl74x6zaDeAsHVCO3mO1UGAhnnaGHT5mEkB+kBZtCJvUrZXom5zSkulDbafHt1fpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e98t5CLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0122C4CEEE;
	Thu,  1 May 2025 23:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746140442;
	bh=8FQkbRPJy0zvwunwc1ySRH0Q3DDXGhnAmdLyOpwrQt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e98t5CLZVBcdq9gVdHTrsQvCgC39vIIKgCEg1fESt1HwoyJAB+xdXJH78i5i1twB6
	 4qbGr2nmUZrhBlgv+3YfkBwO8hch37IcBb5Qlp9KU4RJS9JcQ2yv4jYoulIv0H+x70
	 ni/u7vhqvyAEICDgYD3Jm9ZrJm6Y3B+QFgugAcEnn/xLMDcFEmg56yqrqbjxp2+QPA
	 q/fZGRWJiEC4BBWmaph6ULKh2adz5PDTZUU5Oi3vmB1qyP+hLmSKgMx3hhVjFTUUSj
	 YOfeU5315iPpdGQ/fdgQLaV/TATdpQ7QtCB6tmL6gcyiRTAQf2rmRHQo19wfXjQVuW
	 RLeeTrwLORv3A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 01 May 2025 16:00:21 -0700
Subject: [PATCH 1/2] kbuild: Disable -Wdefault-const-init-field-unsafe
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-default-const-init-clang-v1-1-3d2c6c185dbb@kernel.org>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Marcus Seyfarth <m.seyfarth@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8FQkbRPJy0zvwunwc1ySRH0Q3DDXGhnAmdLyOpwrQt8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnCf0Uu7n60XkqwSYDJdLFd0yHLsrOryphOOi1el2DRd
 ifmRFhiRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhIQRjDH76oDPl09vA4/2Ut
 JrufG8anaep8YlD9XbHoaXudmvyZ9wx/OCZmXpTIW1iw/yjj7mqNm5MNM55Oj/nc7aLPfuS8YGw
 bFwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A new on by default warning in clang [1] flags several places within the
kernel where a const member of an aggregate type appears to be
uninitialized:

  include/linux/list.h:409:27: warning: default initialization of an object of type 'union (unnamed union at include/linux/list.h:409:27)' with const member leaves the object uninitialized and is incompatible with C++ [-Wdefault-const-init-field-unsafe]
    409 |         struct list_head *next = smp_load_acquire(&head->next);
        |                                  ^
  include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
    176 | #define smp_load_acquire(p) __smp_load_acquire(p)
        |                             ^
  arch/arm64/include/asm/barrier.h:164:59: note: expanded from macro '__smp_load_acquire'
    164 |         union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;   \
        |                                                                  ^
  include/linux/list.h:409:27: note: member '__val' declared 'const' here

  crypto/scatterwalk.c:66:22: error: default initialization of an object of type 'struct scatter_walk' with const member leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-field-unsafe]
     66 |         struct scatter_walk walk;
        |                             ^
  include/crypto/algapi.h:112:15: note: member 'addr' declared 'const' here
    112 |                 void *const addr;
        |                             ^

  fs/hugetlbfs/inode.c:733:24: error: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-field-unsafe]
    733 |         struct vm_area_struct pseudo_vma;
        |                               ^
  include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'const' here
    803 |                 const vm_flags_t vm_flags;
        |                                  ^

In all audited cases, the members are either not used in the particular
call path, modified through other means such as memset() / memcpy()
because the containing object is not const, or are within a union with
other non-const members. Since these are technically false positives,
the warning was split out from its main group [2] to allow the kernel to
disable it while keeping the variable aspect of the warning enabled.

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef530727a0f4aefff30 [1]
Link: https://github.com/llvm/llvm-project/commit/00f9ef282c7482754a0fea497417604d1deca9fa [2]
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-PVuoSwzv6VWbY=w@mail.gmail.com/
Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d88acdf4085524b672c69fb75148ee87c30f88d8..b4d8265e587082687bc1d3de3fcc70e4a3f4f50d 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -37,6 +37,13 @@ KBUILD_CFLAGS += -Wno-gnu
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
 KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
+
+# clang emits a warning when a const member of an aggregate type is not
+# initialized but there are several places in the kernel where this is
+# intentional because the field is never used within a particular call path,
+# the field is within a union with other non-const members, or the containing
+# object is not const so the field can be modified via memcpy() / memset().
+KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-field-unsafe)
 else
 
 # gcc inanely warns about local variables called 'main'

-- 
2.49.0


