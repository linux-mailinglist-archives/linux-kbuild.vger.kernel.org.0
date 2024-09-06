Return-Path: <linux-kbuild+bounces-3427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890496F246
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 13:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C711C23405
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 11:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF8C1CDA23;
	Fri,  6 Sep 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLKc8QZC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7A1CCB31;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620501; cv=none; b=FFv8KGpFSvRBiyqrP7GmlZ6TszjUJY/YqdHiECQoqAc10/+i/MQsFB6cMneeQOa3baimiBz1pS3iYnvS09I2ZgXaOrjgIreRxgOsKTNm94sqfAhcJWL0lZWP29S6JrsTdAxD4RDwK+j4iBzezCUZ6ZhOiKtF8n0Cp/qKauHQKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620501; c=relaxed/simple;
	bh=mcmfV+bue318YAhiGr6TbJ/6kZY45+peznS5vEAxkuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kvdl0W4HVZ7FAZacox67wIlRlsyTizrZ2ysvyPotAV7cRl9mK3f9IggR1QmpC3RpogPBFEw4KXPfAqqnkvBILLQZjHnaXplowdWvM0f1TddrjQ1/mL1ncCehniqv8P5ChI9Nogl2y6Pfy65Pxz7eFN7Fma4Rz2g4Gu/lSorHXxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLKc8QZC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96CEDC4CEDC;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620500;
	bh=mcmfV+bue318YAhiGr6TbJ/6kZY45+peznS5vEAxkuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tLKc8QZCwoRCRAxn0U00JbT9WGc4rsZhsU2wHJjf8Im+v1UsyPUMHV2QI5dSIqqNI
	 uNKPKwscEE20/d4SR6zWSXCqoiP/2hdLCpU1dHNqrDfzvzACA6OVN/xRHeX6L2E8cl
	 hPZeIOK/y4MBKiN9/pn7OjhJCFVYCF4f5hbXWmO4TFvhktiSsaKYPqt7YfSg0Udryu
	 IlD+FbLRQYsn3OQkd/tY8jX8DflyA70A3m84GgWlib8dX1MGRC1B0a/yQfZjUGP8Vz
	 YFt308FmGM9q8ZSUSELAwKOhncrz1T5ruyEZ0nO4HyAllZdlDgOm6Z3bEV1J/tIDVT
	 Tlh3JZ5MaDa0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86008CE7B00;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:33 +0200
Subject: [PATCH v2 6/8] selinux: do not include <linux/*.h> headers from
 host programs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, William Hubbs <w.d.hubbs@gmail.com>, 
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=5564;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=RWFmHaQGmYDEzsOarge6k0aJ15scCJOPQC2IOBiil4U=;
 b=VoY8M4eX15rBfo1jaRrsV1vsZSumMCAVAjs+tpXO/29zqWL0w803725aHyGd0/FesBCmsyQkE
 pTyc4ai3R+lASS2ZgiReZQMsynGmm/16kMoFWRNqKgAjGUDOpOqYQPK
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Masahiro Yamada <masahiroy@kernel.org>

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
 scripts/selinux/genheaders/Makefile              |  4 +---
 scripts/selinux/genheaders/genheaders.c          |  3 ---
 scripts/selinux/mdp/Makefile                     |  2 +-
 scripts/selinux/mdp/mdp.c                        |  4 ----
 security/selinux/include/classmap.h              | 19 ++++++++++++-------
 security/selinux/include/initial_sid_to_string.h |  2 --
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
2.46.0



