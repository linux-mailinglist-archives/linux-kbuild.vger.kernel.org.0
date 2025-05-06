Return-Path: <linux-kbuild+bounces-6978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3BAACF40
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 23:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35A89170B72
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 21:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BDB2165E9;
	Tue,  6 May 2025 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVl+SE4T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7019AA63;
	Tue,  6 May 2025 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565594; cv=none; b=e584S1sf13TAX3RmP3elSrbzKIIBPxPdStLg5ivkqkZStpwFO2QtyxRLn0TKCvTu5Vuvr05T5zFMBDU/vWmYSv2mNi7vW2QnS97Gvcl46gMAL7hhMaq3GtJIHecqHaRbV+BOJwiDnNQX0w7iW81xdTNPVkVd0ZwN/eR7fRE69zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565594; c=relaxed/simple;
	bh=74lje376FlTSuXCICkSnr8qOkLged5xjB5xPmh1n+yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X2J3wRhGWt6f655dEY/1GoAwSM3frx0tvzGXug/UBmA+J7CMkU/HyfBv4pJD2EIQ5/4oCGVHthSKdRsugzfgk0TPmUbqQ6a3+ckjZBKuiB9iUgXoV0eK1Ol37jj11eilIZxOStMnI4yjFbD3Q5YPjsLed9uSSrSZ38lFdQIyD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVl+SE4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAF1C4CEE4;
	Tue,  6 May 2025 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746565593;
	bh=74lje376FlTSuXCICkSnr8qOkLged5xjB5xPmh1n+yc=;
	h=From:Date:Subject:To:Cc:From;
	b=aVl+SE4TL/+aQ4RxUww9NntBllXCHmZe2GcxFp1ljeqowgPN7Wue3GOb+J/bndWNZ
	 Pox0FmI+TlEN6PEeQjzjedMI6kRLJZMj7pDK0J2yw1GItskOI2cIt35pvlIdNQazgZ
	 nnJYdHPhEEFHVIkRCXNvwEaOd8mG47+yvE2XzZrzkf8loaPPBGmMvX1CjX/EyRpZJB
	 OXAXKDjqKQ9KTvzp4gijrXrk09lWY7Um+bTYvn1StVp6t+e0ya9FUyOlrDYpWlJmWZ
	 DPQSuGPOlL7ZuqwjexXQO6csbMBePfW9d8a4sv0bqPPRg4Dcm5UxktiLXWpJn9/qfa
	 6nf4BMfYHtlBg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 06 May 2025 14:02:01 -0700
Subject: [PATCH v2] kbuild: Disable -Wdefault-const-init-unsafe
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-default-const-init-clang-v2-1-fcfb69703264@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMh4GmgC/3WNyw6CMBBFf4XM2jF9CCGu/A/CgrYDTCStaZFoS
 P/dimt3c27uPbNDosiU4FrtEGnjxMEXUKcK7Dz4iZBdYVBC1eKiBToah+eyog0+rciey7mUIpq
 GlDStE9o0UOaPSCO/DnXXF545rSG+j0+b/KY/aS3kf+kmUaB2yjZWtrUz5nan6Gk5hzhBn3P+A
 P1JxFLBAAAA
X-Change-ID: 20250430-default-const-init-clang-b6e21b8d03b6
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Marcus Seyfarth <m.seyfarth@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6468; i=nathan@kernel.org;
 h=from:subject:message-id; bh=74lje376FlTSuXCICkSnr8qOkLged5xjB5xPmh1n+yc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlSlddEjFj3Top9qLKz+JuF2bVnW4yWNRUvtF/qnr4vc
 bLpNN9dHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiDnKMDIv81zbtfiQ2Wb2E
 Lc1V/df79pNTnO4/r71TdnEnY49W2n2G/xFMhfnaF6ZP0e7QftXdNqsw/eGJ/sTInkPnU6z0bjy
 0YwAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A new on by default warning in clang [1] aims to flags instances where
const variables without static or thread local storage or const members
in aggregate types are not initialized because it can lead to an
indeterminate value. This is quite noisy for the kernel due to
instances originating from header files such as:

  drivers/gpu/drm/i915/gt/intel_ring.h:62:2: error: default initialization of an object of type 'typeof (ring->size)' (aka 'const unsigned int') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     62 |         typecheck(typeof(ring->size), next);
        |         ^
  include/linux/typecheck.h:10:9: note: expanded from macro 'typecheck'
     10 | ({      type __dummy; \
        |              ^

  include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
    478 |                 if (mtu && time_before(jiffies, rt->dst.expires))
        |                            ^
  include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
    138 | #define time_before(a,b)        time_after(b,a)
        |                                 ^
  include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
    128 |         (typecheck(unsigned long, a) && \
        |          ^
  include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
     11 |         typeof(x) __dummy2; \
        |                   ^

  include/linux/list.h:409:27: warning: default initialization of an object of type 'union (unnamed union at include/linux/list.h:409:27)' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    409 |         struct list_head *next = smp_load_acquire(&head->next);
        |                                  ^
  include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
    176 | #define smp_load_acquire(p) __smp_load_acquire(p)
        |                             ^
  arch/arm64/include/asm/barrier.h:164:59: note: expanded from macro '__smp_load_acquire'
    164 |         union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;   \
        |                                                                  ^
  include/linux/list.h:409:27: note: member '__val' declared 'const' here

  crypto/scatterwalk.c:66:22: error: default initialization of an object of type 'struct scatter_walk' with const member leaves the object uninitialized [-Werror,-Wdefault-const-init-field-unsafe]
     66 |         struct scatter_walk walk;
        |                             ^
  include/crypto/algapi.h:112:15: note: member 'addr' declared 'const' here
    112 |                 void *const addr;
        |                             ^

  fs/hugetlbfs/inode.c:733:24: error: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Werror,-Wdefault-const-init-field-unsafe]
    733 |         struct vm_area_struct pseudo_vma;
        |                               ^
  include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'const' here
    803 |                 const vm_flags_t vm_flags;
        |                                  ^

Silencing the instances from typecheck.h is difficult because '= {}' is
not available in older but supported compilers and '= {0}' would cause
warnings about a literal 0 being treated as NULL. While it might be
possible to come up with a local hack to silence the warning for
clang-21+, it may not be worth it since -Wuninitialized will still
trigger if an uninitialized const variable is actually used.

In all audited cases of the "field" variant of the warning, the members
are either not used in the particular call path, modified through other
means such as memset() / memcpy() because the containing object is not
const, or are within a union with other non-const members.

Since this warning does not appear to have a high signal to noise ratio,
just disable it.

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef530727a0f4aefff30 [1]
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-PVuoSwzv6VWbY=w@mail.gmail.com/
Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Disable -Wdefault-const-init-var-unsafe as well, as '= {}' does not
  work in typecheck() for all supported compilers and it may not be
  worth a local hack.
- Link to v1: https://lore.kernel.org/r/20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org
---
 scripts/Makefile.extrawarn | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d88acdf40855..fd649c68e198 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -37,6 +37,18 @@ KBUILD_CFLAGS += -Wno-gnu
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
 KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
+
+# Clang may emit a warning when a const variable, such as the dummy variables
+# in typecheck(), or const member of an aggregate type are not initialized,
+# which can result in unexpected behavior. However, in many audited cases of
+# the "field" variant of the warning, this is intentional because the field is
+# never used within a particular call path, the field is within a union with
+# other non-const members, or the containing object is not const so the field
+# can be modified via memcpy() / memset(). While the variable warning also gets
+# disabled with this same switch, there should not be too much coverage lost
+# because -Wuninitialized will still flag when an uninitialized const variable
+# is used.
+KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-unsafe)
 else
 
 # gcc inanely warns about local variables called 'main'

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250430-default-const-init-clang-b6e21b8d03b6

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


