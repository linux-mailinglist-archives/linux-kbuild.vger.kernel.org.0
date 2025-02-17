Return-Path: <linux-kbuild+bounces-5777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EACA37C30
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 08:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE38D1631AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 07:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74451190665;
	Mon, 17 Feb 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RrGPv7El";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eaLYpoU/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EB198E84;
	Mon, 17 Feb 2025 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777281; cv=none; b=LAIxoYHBcf5h/2VocxFmElzP2GwxiFrhSRCjQB0K/2Clqh2ezRY0bj+8IXPt6A/whNuE8KT4KIK9R+jMEDovs4qhjLwhkESzDi7xsaR4CKlBe8ncz1enZKUOqz/bABwVp7wOQ/QQFKIGPCUZD3DnmaKHbErAoZCyp+nzhDs/ttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777281; c=relaxed/simple;
	bh=3Mlel136TcYtZin15fAFGGDRy94Qs+xjXkzgX9G5iEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mHU0t7b5ZfFQ3hxyVzVBiwt722Q1NBa/wZnw6Ep3bjc2EyFCXgJ6A32Us6Eltj/4LT/SOcb2baFa3El/KDmWop1Ikfz/xxEzazX481Sh4XjSLb5j6/OToUe2CPGWVJO8Tbm0wOqlnTbZwT5ZiCBeCGLfrbOQ1RzS2cftr3x43T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RrGPv7El; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eaLYpoU/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739777276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mOeqpsxy3WOUCAs+hjzPwYFoK5hFisvXwlEv1uvfwCo=;
	b=RrGPv7ElJvmZkJHC9JMOvvs0KsrPavr6eLHi6KjYkiwV1rLYkOvpRwfHdv+7TVm3GyNekU
	rUjvXlEqU3WgA6wuYjfRDu5PV1cmDlc44Ye5XsS5Xd2p1tDMrO5DdYo25KcKmenSY1OtUa
	u1kBI+87/EZYcE7qqe3Sm1QbZYcXacf/1z+PpZ0ByjDt7Dm0FbGEdTTjQkUGAycjiO+NMG
	ZVYhEsfm41097iWMnI1q5m7Y26xFZGjH7aZg5oycP9Fjc05s9ustYckAdDcjkJKzB3+0Sn
	T/TjHlvDcdJ3Ihbbe4L6fIsANmDmbvwpLmch0gdt/ZVGxpE8hgIYbqTxfe54TA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739777276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mOeqpsxy3WOUCAs+hjzPwYFoK5hFisvXwlEv1uvfwCo=;
	b=eaLYpoU/bG+VqTo30Cyx4kBpKaNblpAJaq5ZVA5+33werYvYsxbGC//XGRQVpOuJ484iHF
	k6C5rTxkAdUdnPBQ==
Date: Mon, 17 Feb 2025 08:27:54 +0100
Subject: [PATCH v2] kbuild: userprogs: use correct lld when linking through
 clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-kbuild-userprog-fixes-v2-1-4da179778be0@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAPnksmcC/4WNQQ6CMBBFr0Jm7Zi2gqAr72FYUDuFiaQlLTQYw
 t2tXMDl+z/v/w0iBaYI92KDQIkje5dBnQp4DZ3rCdlkBiVUJZS84FsvPBpcsjcF36PllSKWVtT
 6qjpqZAPZnQIdRVafbeaB4+zD57hJ8pf+W0wSBVpVVVaXdW1uzWNkt8zBO17PhqDd9/0LH+vBS
 L4AAAA=
X-Change-ID: 20250213-kbuild-userprog-fixes-4f07b62ae818
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739777275; l=2552;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3Mlel136TcYtZin15fAFGGDRy94Qs+xjXkzgX9G5iEs=;
 b=9lTve4IZ+M57ebksbuM1zX0+WyirxLUzJ8hYNgka0PhEtqWh46bybjwMLxmltatxmQo5h3vJu
 gy7XkPzgquPDbpuV9l/tJ0BVJLsIpgVgNHWJRiPH/LiDM7PZRfVlpv+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The userprog infrastructure links objects files through $(CC).
Either explicitly by manually calling $(CC) on multiple object files or
implicitly by directly compiling a source file to an executable.
The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld
would be used for linking if LLVM=1 is specified.
However clang instead will use either a globally installed cross linker
from $PATH called ${target}-ld or fall back to the system linker, which
probably does not support crosslinking.
For the normal kernel build this is not an issue because the linker is
always executed directly, without the compiler being involved.

Explicitly pass --ld-path to clang so $(LD) is respected.
As clang 13.0.1 is required to build the kernel, this option is available.

Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
Cc: stable@vger.kernel.org # needs wrapping in $(cc-option) for < 6.9
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Reproducer, using nolibc to avoid libc requirements for cross building:

$ tail -2 init/Makefile
userprogs-always-y += test-llvm
test-llvm-userccflags += -nostdlib -nolibc -static -isystem usr/ -include $(srctree)/tools/include/nolibc/nolibc.h

$ cat init/test-llvm.c
int main(void)
{
	return 0;
}

$ make ARCH=arm64 LLVM=1 allnoconfig headers_install init/

Validate that init/test-llvm builds and has the correct binary format.
---
Changes in v2:
- Use --ld-path instead of -fuse-ld
- Drop already applied patch
- Link to v1: https://lore.kernel.org/r/20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 96407c1d6be167b04ed5883e455686918c7a75ee..b41c164533d781d010ff8b2522e523164dc375d0 100644
--- a/Makefile
+++ b/Makefile
@@ -1123,6 +1123,11 @@ endif
 KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
+# userspace programs are linked via the compiler, use the correct linker
+ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
+KBUILD_USERLDFLAGS += --ld-path=$(LD)
+endif
+
 # make the checker run with the right architecture
 CHECKFLAGS += --arch=$(ARCH)
 

---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250213-kbuild-userprog-fixes-4f07b62ae818

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


