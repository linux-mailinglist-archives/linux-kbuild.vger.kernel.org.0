Return-Path: <linux-kbuild+bounces-6578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258CA85AB4
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 12:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D55917D459
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D351290081;
	Fri, 11 Apr 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SXjMmusB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D227EC9D;
	Fri, 11 Apr 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369013; cv=none; b=Jagp0ojAHt69wDnlqKIDbT0YdO2r5dbw1af+Rpt/bly61a+89PD6lkStA8e1+MQqCiMmOQNGLMnUyJ4fCueLoMCcRE+3DefZZpzh5VIHiFkIFH5gov5p5GmRw7osNt0nS4ypMqRvW7zAtlc3f5vPwfQYKT3vxyh+fpnbx0KAFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369013; c=relaxed/simple;
	bh=KV7838qVuJFvwP0GE1fI+kpv6Rs/f7TnldAdDLmDYlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCYplPyIG2KAFYvRlrgnE4EBR02BpEt1bnpgtPoRu9yfld7EKtIC1g+BZdiIVhNL+F2USUblcR3Rw5wh9pZkV+jUB5QNM8M27vmpEkML6UaIiNPs71beRCLniKXXsKtHAXXLznpmnsb4L7yjThVHWcPj5tQLw9XnBwEcAriuddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SXjMmusB; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744369007;
	bh=XD6rEhxQqjvTOqUCfuE2USI2iV6mhbN96PZIywkA7yY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SXjMmusBye4hbRvUMMGeaHBJs5G/ZJgv0YX5fdg9qbUaPXKGvGZANQgxlRG3akHUd
	 MgC35D7Hpbg6lErY3zg6e/oA6zCHgGzwm/AMY/vt806jGlynO9KjxZj8GbJio9l0IZ
	 SuKsl11pV10acnhvOsceCSWI0uwJKdo3ZWPM2zYY=
X-QQ-mid: bizesmtp23t1744368979t8c6ba75
X-QQ-Originating-IP: hyEvcGxRx4R8ga2tMqHGxAY7PKJA9kC//8bMj+yDfx8=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 18:56:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5292152857670839937
EX-QQ-RecipientCnt: 14
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Winston Wen <wentao@uniontech.com>,
	Changbin Du <changbin.du@gmail.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 7/7] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
Date: Fri, 11 Apr 2025 18:54:55 +0800
Message-ID: <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105459.90782-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NiOJPUCsZYq4TCDbJhMvCuVKIoJm4Z9GKFmnE8rt2zBpACbE8RjswT02
	xTWnEogZIVT23Qc+qBIt2YChmdJwAXd70ZVCgSu1h1ZyyKoASpYiG1P1S8oFRgFklCSgCkT
	JvTkd5Jn4xxskZf1oFAJu3hmQCFMNcnbV12x1cwwNFNJhMKq1c4bz2HJabB7niBZokXI7/o
	hCxPjR+x1a2y121s4gV0wNa9j6OtJsFzn8hemEYA1ucazgKZx7GTGqpvKszOYsYThLPyc72
	A2BVD/YQ7xmJHUDPQkYQ+rZR8IX6un9uL3qJg0pcKVYAZhDYhyGPA7O9SI1t73SkFf5IGSB
	G77aCV5quGOuzHHUCz4CLoMqjwMidVzpGOPGg6eaPHcoGhOsW5jfKrnMqoPpLF+qCDoiESf
	Un19anxbVUOCntpc70C8OLNW0anZbXTvVXD/hN8a0ToywJ3G3sheRYZLZUVWMX6DOO6qnPL
	ldD/0ZgFFHmSTFfpLY8GFDpWaD0jyMx6+Mpvt4bR194D9kJfPBD+1PWw4QMw1DyKuxY0X+h
	dPggqIIpR61Z5T73sfMStXGs4BC/SSkTfUGe9EUZFiBJpjsPdPGENIrOia3bJrbFKmODLsQ
	Qw5duusCRnhci40xodv1Qt/pjuatfs20LzlV6sS42Zk/Zt/aOjQS8vL1mdgPhJYN6ge/Si6
	OeoL6XsjtvVA+y2JXP2Acmpec3FlS5nRFBtQOr6Tq8u8ADL4MEbb4B9gPhul/Or2zV8TxyA
	bddhGr+zU6aB4Aa52M3qwn7jZ5NoFGt2q9ZlMSaQCHHN4mfELDUR9OZLgeTWg5XS4YT9Sl+
	ZiRfsmdigU7hUtf1TTx8lMG5wGnJL+ucPSERFtp5Br3m89hVPzwhIoxTtjtqvkzvQBx6AdV
	R5Oh2zMmDV5N+jG07q0RSW7qeJTwUUEZ91KeiLAKocLUvqe9KhZOGx8ZTQmrIJy4YPZohg/
	5mxGOSG/SwQZWplkJzjs3uf1ag1s7+jLm5qPrgYxxaVE9WBpGPP/VVJG2rjxU4i0zH3okUZ
	iaFaXc9hFqf3fgSMeB
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

From: Winston Wen <wentao@uniontech.com>

Add a new kernel hacking option CONFIG_NO_AUTO_INLINE that prevents the
compiler from auto-inlining functions not explicitly marked with the
'inline' keyword.

This enhancement improves function tracer capabilities as it can only
trace functions that haven't been inlined by the compiler.

Previous discussions:
Link: https://lore.kernel.org/all/20181028130945.23581-3-changbin.du@gmail.com/

This patch is modified from 917fad29febd ("kernel hacking: add a config
option to disable compiler auto-inlining") which can be founded in
linux-next-history:
Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?id=917fad29febd

Unlike the original implementation, this patch:

1. Make it depends on CC_IS_GCC,
   as Clang 18.1.3 break test_bitmap_const_eval() in lib/test_bitmap.c

2. Make it depends on X86_64,
   as I haven't test other architectures

3. Removes unnecessary cc-option checks per 7d73c3e9c514 ("Makefile:
   remove stale cc-option checks").

4. Update help information.

Cc: Changbin Du <changbin.du@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Winston Wen <wentao@uniontech.com>
Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 Makefile          |  6 ++++++
 lib/Kconfig.debug | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Makefile b/Makefile
index f42418556507..0a9bf33ce75f 100644
--- a/Makefile
+++ b/Makefile
@@ -1071,6 +1071,12 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
+ifdef CONFIG_NO_AUTO_INLINE
+KBUILD_CFLAGS   += -fno-inline-functions \
+		   -fno-inline-small-functions \
+		   -fno-inline-functions-called-once
+endif
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe578..2ebb4802886a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -436,8 +436,23 @@ config GDB_SCRIPTS
 	  instance. See Documentation/process/debugging/gdb-kernel-debugging.rst
 	  for further details.
 
+
 endif # DEBUG_INFO
 
+config NO_AUTO_INLINE
+	bool "Disable compiler auto-inline optimizations (EXPERIMENTAL)"
+	default n
+	depends on CC_IS_GCC && (X86 || LOONGARCH)
+	help
+	  This will prevent the compiler from optimizing the kernel by
+	  auto-inlining functions not marked with the inline keyword.
+	  With this option, only functions explicitly marked with
+	  "inline" will be inlined. This will allow the function tracer
+	  to trace more functions because it only traces functions that
+	  the compiler has not inlined.
+
+	  If unsure, select N.
+
 config FRAME_WARN
 	int "Warn for stack frames larger than"
 	range 0 8192
-- 
2.48.1


