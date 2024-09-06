Return-Path: <linux-kbuild+bounces-3451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412196F9EB
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 19:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C347AB239D7
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76FA1D67A1;
	Fri,  6 Sep 2024 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2EXMHJR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3BFE55B;
	Fri,  6 Sep 2024 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725643782; cv=none; b=R9G1hEmtxQxA4n+LVJjCGaybtK0vyYTNhYTPGpltmFInsd/pD3HNAcujqU2wkZ1foebQ1Jo3cLdRGnY0jNG/TNT6EkNN/bg44kuL1bztEL8bcMhK70P8Uz2bENEIX+flU+vtnYCBMtk/jD/Ex3KH/ruWfUDzG6HCPqE+A1JqJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725643782; c=relaxed/simple;
	bh=9MgJgQjUEHtHHW21vLfHte658h6JmHBOSgfbbxrJ2b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRd2SKEhisuK/ByOHP4OH3NZozCsQQ2RwYu8Qr3BqJavfGEpAyDhxO8KtWHJjTaaDAmdAwV+6eZkZnN/FupLwJbHJj6Fuo4sC5bdShpRHKkEoNCuJ79CxdfAYz0OFSd+/hzz0i5xo8JeM0B6hJfJ05tu0kjQbfCybLMVrsFHafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2EXMHJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855D5C4CEC7;
	Fri,  6 Sep 2024 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725643782;
	bh=9MgJgQjUEHtHHW21vLfHte658h6JmHBOSgfbbxrJ2b4=;
	h=From:To:Cc:Subject:Date:From;
	b=r2EXMHJRVxyWSXlwgVW8lEOrnXa6Kh/8EWxJ0DZfHSDvucNpQtUeEfPeb1F5RBizC
	 njF4guKTdQl2mMeSydf7CmQS7x9DIyH2OOmqEPOTSu4ZLjk7s/VrKRJxt3+VJueshG
	 0VumgPutzl4a8GVHHoTEF0bhN5MQkuSi6PsmSSOx4gzqYMe5dqtxei+MrxR9t205OT
	 +ysKleEZXyxG0F+FXFMrfJd4qaehs0R94jOaOvbunE09z2AYAiNjyGmFkJpj0ekDeb
	 vt8OIKwmEm0pGIKYV2B7AmHCHNI0NyumATgHe2VeZItazXOuQF4QbvTLAgKfwmI+rb
	 yTj+i4Rb0GiSA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	selinux@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] selinux: do not include <linux/*.h> headers from host programs
Date: Sat,  7 Sep 2024 02:29:13 +0900
Message-ID: <20240906172934.1317830-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header, security/selinux/include/classmap.h, is included not only
from kernel space but also from host programs.

It includes <linux/capability.h> and <linux/socket.h>, which pull in
more <linux/*.h> headers. This makes the host programs less portable,
specifically causing build errors on macOS.

Those headers are included for the following purposes:

 - <linux/capability.h> for checking CAP_LAST_CAP
 - <linux/socket.h> for checking PF_MAX

These checks can be guarded by __KERNEL__ so they are skipped when
building host programs. Testing them when building the kernel should
be sufficient.

The header, security/selinux/include/initial_sid_to_string.h, includes
<linux/stddef.h> for the NULL definition, but this is not portable
either. Instead, <stddef.h> should be included for host programs.

Reported-by: Daniel Gomez <da.gomez@samsung.com>
Closes: https://lore.kernel.org/lkml/20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com/
Closes: https://lore.kernel.org/lkml/20240807-macos-build-support-v1-7-4cd1ded85694@samsung.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Reword the commit description
  - Keep the location of CAP_LAST_CAP
  - Include <stddef.h> for host programs

 scripts/selinux/genheaders/Makefile              |  4 +---
 scripts/selinux/genheaders/genheaders.c          |  3 ---
 scripts/selinux/mdp/Makefile                     |  2 +-
 scripts/selinux/mdp/mdp.c                        |  4 ----
 security/selinux/include/classmap.h              | 11 ++++++++---
 security/selinux/include/initial_sid_to_string.h |  4 ++++
 6 files changed, 14 insertions(+), 14 deletions(-)

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
index 7229c9bf6c27..5e2b0eaa73c4 100644
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
@@ -36,9 +33,13 @@
 	"mac_override", "mac_admin", "syslog", "wake_alarm", "block_suspend", \
 		"audit_read", "perfmon", "bpf", "checkpoint_restore"
 
+#ifdef __KERNEL__ /* avoid this check when building host programs */
+#include <linux/capability.h>
+
 #if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
 #error New capability defined, please update COMMON_CAP2_PERMS.
 #endif
+#endif
 
 /*
  * Note: The name for any socket class should be suffixed by "socket",
@@ -181,6 +182,10 @@ const struct security_class_mapping secclass_map[] = {
 	{ NULL }
 };
 
+#ifdef __KERNEL__ /* avoid this check when building host programs */
+#include <linux/socket.h>
+
 #if PF_MAX > 46
 #error New address family defined, please update secclass_map.
 #endif
+#endif
diff --git a/security/selinux/include/initial_sid_to_string.h b/security/selinux/include/initial_sid_to_string.h
index 99b353b2abb4..d7ba60b62491 100644
--- a/security/selinux/include/initial_sid_to_string.h
+++ b/security/selinux/include/initial_sid_to_string.h
@@ -1,6 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#ifdef __KERNEL__
 #include <linux/stddef.h>
+#else
+#include <stddef.h>
+#endif
 
 static const char *const initial_sid_to_string[] = {
 	NULL, /* zero placeholder, not used */
-- 
2.43.0


