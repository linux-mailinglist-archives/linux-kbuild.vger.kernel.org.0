Return-Path: <linux-kbuild+bounces-2920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80394D008
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 14:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 397901F225BE
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 12:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500DF194131;
	Fri,  9 Aug 2024 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVct3qvN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF581940B3;
	Fri,  9 Aug 2024 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206021; cv=none; b=a1JT+T/vcvqWSqaIWmUgNofaEc8aItuOhM/a7Oro/M82/2huD9D2Ogwub6iIutaoKivOlfUywCb5cg0nuaiidK1bBlpx0ETeJV2mSZVFXySGr+I40UCAg/ioSDcIopNMIkfBYORR0pbHAxYXR3vJaXM3N9aX3RJGpcx+TIxXuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206021; c=relaxed/simple;
	bh=Khd0Q+yxNjaRJ6HM1jN2DezMjTZjzWz7wbIGnd13yn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ombFersWob/3oBIu+GRb4Q9b2b16nO0Dta3cDHo1f8NYoYhkI/PVSlxKAnsYoYh/kc7ctD9NlV3LIffAFb9qXU0G+gEvAsDtiAsdbJTAvuW0eRTcVtwu2WC+t/mJwz5SZIyL+Bb6j/qoSuDikYqjtt02XmiyVhiDGyIOJd9b2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVct3qvN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FB4C4AF0D;
	Fri,  9 Aug 2024 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723206021;
	bh=Khd0Q+yxNjaRJ6HM1jN2DezMjTZjzWz7wbIGnd13yn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVct3qvNuEXeAcGA8S0LURMQiQ72Rto7JqMseYw5P0JBrv6Ulz/axWM9zdnJT0ECC
	 lM/IBzhr8PdZxgbSr4p8Ruox3hkz+vH+E3K50yAVzbWDKJ7AXE9Q+q8+4bizADYPLF
	 u/8QUf6OPX6RvBu8q3oCK2CisbkCdTZ68907X5E60YRUC7/BbZsphGjWktxxvH8+rH
	 q52YJIjoF4t1053apDODNiHjsJgd6xcMc6ORP+kWOuCYrVHPpjAr30l4Fe6d5N7oOp
	 k8qYFYBswAF+G/udzBsh8viad6Fu1RSipQKh6mxhm0j1LcMHG8lhCmaHl1xRVCzrTw
	 IFLkPhC88++Mg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Moore <paul@paul-moore.com>,
	linux-security-module@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	selinux@vger.kernel.org
Subject: [PATCH 1/2] selinux: do not include <linux/*.h> headers from host programs
Date: Fri,  9 Aug 2024 21:19:01 +0900
Message-ID: <20240809122007.1220219-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809122007.1220219-1-masahiroy@kernel.org>
References: <20240809122007.1220219-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
scripts/selinux") is not the right thing to do.

It is clear from the warning in include/uapi/linux/types.h:

  #ifndef __EXPORTED_HEADERS__
  #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
  #endif /* __EXPORTED_HEADERS__ */

If you are inclined to define __EXPORTED_HEADERS__, you are likely doing
wrong.

Adding the comment:

  /* NOTE: we really do want to use the kernel headers here */

does not justify the hack in any way.

Currently, <linux/*.h> headers are included for the following purposes:

 - <linux/capability.h> is included to check CAP_LAST_CAP
 - <linux/socket.h> in included to check PF_MAX

We can skip these checks when building host programs, as they will
be eventually tested when building the kernel space.

I got rid of <linux/stddef.h> from initial_sid_to_string.h because
it is likely that NULL is already defined. If you insist on making
it self-contained, you can add the following:

  #ifdef __KERNEL__
  #include <linux/stddef.h>
  #else
  #include <stddef.h>
  #endif

scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
also discouraged and should be fixed by a follow-up refactoring.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/selinux/genheaders/Makefile           |  4 +---
 scripts/selinux/genheaders/genheaders.c       |  3 ---
 scripts/selinux/mdp/Makefile                  |  2 +-
 scripts/selinux/mdp/mdp.c                     |  4 ----
 security/selinux/include/classmap.h           | 19 ++++++++++++-------
 .../selinux/include/initial_sid_to_string.h   |  2 --
 6 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index 1faf7f07e8db..866f60e78882 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 hostprogs-always-y += genheaders
-HOST_EXTRACFLAGS += \
-	-I$(srctree)/include/uapi -I$(srctree)/include \
-	-I$(srctree)/security/selinux/include
+HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
diff --git a/scripts/selinux/genheaders/genheaders.c b/scripts/selinux/genheaders/genheaders.c
index 15520806889e..3834d7eb0af6 100644
--- a/scripts/selinux/genheaders/genheaders.c
+++ b/scripts/selinux/genheaders/genheaders.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-/* NOTE: we really do want to use the kernel headers here */
-#define __EXPORTED_HEADERS__
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index d61058ddd15c..673782e3212f 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 hostprogs-always-y += mdp
 HOST_EXTRACFLAGS += \
-	-I$(srctree)/include/uapi -I$(srctree)/include \
+	-I$(srctree)/include \
 	-I$(srctree)/security/selinux/include -I$(objtree)/include
 
 clean-files	:= policy.* file_contexts
diff --git a/scripts/selinux/mdp/mdp.c b/scripts/selinux/mdp/mdp.c
index 1415604c3d24..52365921c043 100644
--- a/scripts/selinux/mdp/mdp.c
+++ b/scripts/selinux/mdp/mdp.c
@@ -11,10 +11,6 @@
  * Authors: Serge E. Hallyn <serue@us.ibm.com>
  */
 
-
-/* NOTE: we really do want to use the kernel headers here */
-#define __EXPORTED_HEADERS__
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 7229c9bf6c27..518209e1beb0 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -1,8 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-#include <linux/capability.h>
-#include <linux/socket.h>
-
 #define COMMON_FILE_SOCK_PERMS                                            \
 	"ioctl", "read", "write", "create", "getattr", "setattr", "lock", \
 		"relabelfrom", "relabelto", "append", "map"
@@ -36,10 +33,6 @@
 	"mac_override", "mac_admin", "syslog", "wake_alarm", "block_suspend", \
 		"audit_read", "perfmon", "bpf", "checkpoint_restore"
 
-#if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
-#error New capability defined, please update COMMON_CAP2_PERMS.
-#endif
-
 /*
  * Note: The name for any socket class should be suffixed by "socket",
  *	 and doesn't contain more than one substr of "socket".
@@ -181,6 +174,18 @@ const struct security_class_mapping secclass_map[] = {
 	{ NULL }
 };
 
+#ifdef __KERNEL__ /* avoid this check when building host programs */
+
+#include <linux/capability.h>
+
+#if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
+#error New capability defined, please update COMMON_CAP2_PERMS.
+#endif
+
+#include <linux/socket.h>
+
 #if PF_MAX > 46
 #error New address family defined, please update secclass_map.
 #endif
+
+#endif /* __KERNEL__ */
diff --git a/security/selinux/include/initial_sid_to_string.h b/security/selinux/include/initial_sid_to_string.h
index 99b353b2abb4..f683a78b21fd 100644
--- a/security/selinux/include/initial_sid_to_string.h
+++ b/security/selinux/include/initial_sid_to_string.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-#include <linux/stddef.h>
-
 static const char *const initial_sid_to_string[] = {
 	NULL, /* zero placeholder, not used */
 	"kernel", /* kernel / SECINITSID_KERNEL */
-- 
2.43.0


