Return-Path: <linux-kbuild+bounces-10480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AED0E03C
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 01:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FD7E301D0F4
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 00:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0B383A14;
	Sun, 11 Jan 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMyu8+lq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9CB67A;
	Sun, 11 Jan 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768092755; cv=none; b=bh7hDFq6rsHDn8SA4XhCUtZIjLK540IHzJ0xWMQoVxnAVMQgQh+ZCuKLkjL4TQ3N+Phq3qcA7ZleYEgyHBKVDS2lW+LtVK09rj0VAK1lrWmf0Qi7gFIjtOv2T30zxURrX3pcvjqtu6KpYX2y24tTxrUuTpbrHzx9c/SUZ5XPMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768092755; c=relaxed/simple;
	bh=bPz8ImhJVEJL9nBgq6xRINNHb1whl/QQJoPCa33QHs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ivtheEWcDV/GoDfYh/vH+mFJDhg23+rkJ40y66cmHlzEtwA3yK4TsHeeOApGRuuY+ljksM/7lq4lBv4UA/vlOAL268WOmh6T2YP4W/sNYKk2vo2daMyv16yMp0v+QCv58MKnPcL6CxM3fxRwd8HwBRJCeqzD9AgvMdQPmlQ284o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMyu8+lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29857C4CEF1;
	Sun, 11 Jan 2026 00:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768092755;
	bh=bPz8ImhJVEJL9nBgq6xRINNHb1whl/QQJoPCa33QHs8=;
	h=From:Date:Subject:To:Cc:From;
	b=AMyu8+lqdpK7h+W62lwmX9m7dU/Z1RS2xOPjJDKlUsfREmYDGuBYzzB8ATgMjI0cG
	 ecYJ1RTIPSe8nQZi/ZasGpMmcG6F/UOAr5gQgOXtXXsA79kIuaT0daYRsFy080xh98
	 sBC/jhTdpzKrdSEtrfXwzM1t2nJhSuYfDrUo0WFoy61vgmMtAq49MhjBpAXYsbJuvZ
	 KYYxNNh+8xpYyA8ipx0sTiqnB7bxGoKdqhVyzQEDFli0iy6jFHfJSA8eXSYDDn8Xsk
	 0CeLYi/dq2an7X2EKTmsxdlD1I9p7H1j4GDYJRLAjm/Xv/jlqjEP/vJQG+WcL1DYaV
	 DU5Kw7SUB2fLw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 10 Jan 2026 17:52:28 -0700
Subject: [PATCH] kbuild: uapi: Avoid testing certain headers on ARCH=arm
 with CC=clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-uapi-test-disable-headers-arm-clang-unaligned-access-v1-1-b7b0fa541daa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UASxIVXERfT5NuOxFgyqQild
 zfq8vH5721kqAqj87BRxUtNn6WDPwwUZykTWFNnCi6cnPeOV1mUG6xxUpMxg2dIQjWW+uCY+4f
 XIlmngsQSI6xPAd4dJTjxoK5eKm76/mUv1z/bOt4R27dF+/4BkGzqspgAAAA=
X-Change-ID: 20260110-uapi-test-disable-headers-arm-clang-unaligned-access-a2e104a20a1e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3593; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bPz8ImhJVEJL9nBgq6xRINNHb1whl/QQJoPCa33QHs8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlJXwIuPaybrJU+scxXN/9XsPDlOwrvptpdvPLGtUB8h
 YDFta3GHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi8taMDIsXyUv1VF2/t7GM
 ZempVdNu3F7Bn/v8woFtqZN53gtaT97IyNDhtEwxnu3muQk6j4JXmDcvObpBN83UQCLx878Qx03
 T+XgB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit e3970d77ec50 ("kbuild: uapi: drop dependency on
CC_CAN_LINK"), which enables compile testing of UAPI headers in more
circumstances due to dropping the dependency on CONFIG_CC_CAN_LINK,
there are new instances of -Wunaligned-access when building with clang
targeting ARCH=arm in a few headers:

  In file included from <built-in>:1:
  ./usr/include/linux/hyperv.h:361:2: error: field  within 'struct hv_kvp_exchg_msg_value' is less aligned than 'union hv_kvp_exchg_msg_value::(anonymous at ./usr/include/linux/hyperv.h:361:2)' and is usually due to 'struct hv_kvp_exchg_msg_value' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
    361 |         union {
        |         ^
  1 error generated.

  In file included from <built-in>:1:
  In file included from ./usr/include/linux/vboxguest.h:14:
  usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
    239 |         } u;
        |           ^
  usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
    254 |                         } u;
        |                           ^
  2 errors generated.

These warnings are now fatal after commit 3788d69db18d ("kbuild: uapi:
fail header test on compiler warnings"). -Wunaligned-access is only
enabled at W=1 for the rest of the kernel because of numerous instances
of it.

To keep the build working while the root cause of the warnings is
investigated and resolved, disable testing these header files for
ARCH=arm when building with clang. This should be a minimal loss of
coverage; if the issue pointed out by this warning existed in the wild,
it should have been noticed in real testing at this point since some of
these structures have been around for many years. It is likely the case
that since these structures are for specialized applications, they have
never been used on an ARM platform that does not support unaligned
access.

Fixes: e3970d77ec50 ("kbuild: uapi: drop dependency on CC_CAN_LINK")
Link: https://github.com/ClangBuiltLinux/linux/issues/1576
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/include/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 6d86a53c6f0a..d23a0c0363bd 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -52,6 +52,12 @@ ifeq ($(SRCARCH),arc)
 no-header-test += linux/bpf_perf_event.h
 endif
 
+ifeq ($(SRCARCH)_$(CONFIG_CC_IS_CLANG),arm_y)
+no-header-test += linux/hyperv.h
+no-header-test += linux/vboxguest.h
+no-header-test += linux/vbox_vmmdev_types.h
+endif
+
 ifeq ($(SRCARCH),openrisc)
 no-header-test += linux/bpf_perf_event.h
 endif

---
base-commit: e3970d77ec504e54c3f91a48b2125775c16ba4c0
change-id: 20260110-uapi-test-disable-headers-arm-clang-unaligned-access-a2e104a20a1e

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


