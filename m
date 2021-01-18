Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8512A2FAABD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 20:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390462AbhART5V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 14:57:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:50066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437705AbhARTz4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 14:55:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9752722B49;
        Mon, 18 Jan 2021 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610999703;
        bh=1Q1hvGAJ1AQ1LSuhU8FC0F5hJb4xVqDfCJ3UaGiXHdA=;
        h=From:To:Cc:Subject:Date:From;
        b=hobP6JgMPXwRcyEaM5jf9N+XSgWaSFNlnb3gSVXZqM5E+vTJ8sFXLw1lx/q03+/T7
         p9GKYE5q4+D1vBILED+sB8T+E0zJ6+qMDkX2ue7b2OFTLsYLxCSIpEmK6s2HgUsxOB
         eL23Tao25//dBaObN8eO+xI3Q71qHTZZXoLihMkJW7D7HAIwJH3JVFpCukE1ZSjsHc
         MbIdgOlIREefEeOhVjIyL01mFMY40irrUcVnfTcEG+q9NR+vFw/4ZZZIMQd9mmPUTS
         t+x66YkdZVB9J9rCSgWCn2aMUgBcCRbwDPlMcvck+iLSzVvVz1SpqVIVhpwQ5UQJZ1
         SiMyIfVi5tohA==
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, Sasha Levin <sashal@kernel.org>,
        stable@kernel.org
Subject: [PATCH v2] kbuild: give the SUBLEVEL more room in KERNEL_VERSION
Date:   Mon, 18 Jan 2021 14:54:53 -0500
Message-Id: <20210118195453.761623-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SUBLEVEL only has 8 bits of space, which means that we'll overflow it
once it reaches 256.

Few of the stable branches will imminently overflow SUBLEVEL while
there's no risk of overflowing VERSION.

Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
should create a better balance between the different version numbers we
use.

The downside here is that Linus will have 8 bits less to play with, but
given our current release cadence (~10 weeks), the number of Linus's
fingers & toes (20), and the current VERSION (5) we can calculate that
VERSION will overflow in just over 1,000 years, so I'm kicking this can
down the road.

Cc: stable@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Changes in v2:

 - Fix code that attempted to reverse LINUX_VERSION_CODE back into
   individual version components.

 Makefile                                       | 7 +++++--
 drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
 drivers/scsi/gdth.c                            | 6 +++---
 drivers/usb/core/hcd.c                         | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
 include/linux/usb/composite.h                  | 4 ++--
 kernel/sys.c                                   | 2 +-
 tools/perf/tests/bpf-script-example.c          | 2 +-
 tools/perf/tests/bpf-script-test-kbuild.c      | 2 +-
 tools/perf/tests/bpf-script-test-prologue.c    | 2 +-
 10 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 9e73f82e0d863..23d0494e48bc7 100644
--- a/Makefile
+++ b/Makefile
@@ -1252,8 +1252,11 @@ endef
 
 define filechk_version.h
 	echo \#define LINUX_VERSION_CODE $(shell                         \
-	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
-	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
+	expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
+	echo \#define LINUX_VERSION_MAJOR $(VERSION); \
+	echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL); \
+	echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL); \
+	echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
 endef
 
 $(version_h): FORCE
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index ca6f2fc39ea0a..5c520214385cd 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -235,8 +235,8 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
 	remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
 
 	snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
-		 (u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >> 8) & 0xff),
-		 (u16)(LINUX_VERSION_CODE & 0xffff));
+		(u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
+		(u16)(LINUX_VERSION_SUBLEVEL));
 
 	/*Send the command*/
 	MLX5_SET(set_driver_version_in, in, opcode,
diff --git a/drivers/scsi/gdth.c b/drivers/scsi/gdth.c
index 5d801388680b0..f43bd53f7a1e6 100644
--- a/drivers/scsi/gdth.c
+++ b/drivers/scsi/gdth.c
@@ -3830,9 +3830,9 @@ static int gdth_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
       { 
         gdth_ioctl_osvers osv; 
 
-        osv.version = (u8)(LINUX_VERSION_CODE >> 16);
-        osv.subversion = (u8)(LINUX_VERSION_CODE >> 8);
-        osv.revision = (u16)(LINUX_VERSION_CODE & 0xff);
+        osv.version = LINUX_VERSION_MAJOR;
+        osv.subversion = LINUX_VERSION_PATCHLEVEL;
+        osv.revision = LINUX_VERSION_SUBLEVEL;
         if (copy_to_user(argp, &osv, sizeof(gdth_ioctl_osvers)))
                 return -EFAULT;
         break;
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index ad5a0f405a75c..3f0381344221e 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -111,8 +111,8 @@ DECLARE_WAIT_QUEUE_HEAD(usb_kill_urb_queue);
  */
 
 /*-------------------------------------------------------------------------*/
-#define KERNEL_REL	bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
-#define KERNEL_VER	bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
+#define KERNEL_REL	bin2bcd(LINUX_VERSION_MAJOR)
+#define KERNEL_VER	bin2bcd(LINUX_VERSION_PATCHLEVEL)
 
 /* usb 3.1 root hub device descriptor */
 static const u8 usb31_rh_dev_descriptor[18] = {
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 6497185ec4e7a..396a7d8393cf6 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -46,8 +46,8 @@
  *    - Make vid/did overridable
  *    - make it look like usb1 if usb1 mode forced
  */
-#define KERNEL_REL	bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
-#define KERNEL_VER	bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
+#define KERNEL_REL	bin2bcd(LINUX_VERSION_MAJOR)
+#define KERNEL_VER	bin2bcd(LINUX_VERSION_PATCHLEVEL)
 
 enum {
 	AST_VHUB_STR_INDEX_MAX = 4,
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index a2d229ab63ba5..7531ce7233747 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -573,8 +573,8 @@ static inline u16 get_default_bcdDevice(void)
 {
 	u16 bcdDevice;
 
-	bcdDevice = bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
-	bcdDevice |= bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
+	bcdDevice = bin2bcd(LINUX_VERSION_MAJOR) << 8;
+	bcdDevice |= bin2bcd(LINUX_VERSION_PATCHLEVEL);
 	return bcdDevice;
 }
 
diff --git a/kernel/sys.c b/kernel/sys.c
index 51f00fe20e4d1..c2225bd405d58 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1243,7 +1243,7 @@ static int override_release(char __user *release, size_t len)
 				break;
 			rest++;
 		}
-		v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;
+		v = LINUX_VERSION_PATCHLEVEL + 60;
 		copy = clamp_t(size_t, len, 1, sizeof(buf));
 		copy = scnprintf(buf, copy, "2.6.%u%s", v, rest);
 		ret = copy_to_user(release, buf, copy + 1);
diff --git a/tools/perf/tests/bpf-script-example.c b/tools/perf/tests/bpf-script-example.c
index ab4b98b3165db..a56bf381335e9 100644
--- a/tools/perf/tests/bpf-script-example.c
+++ b/tools/perf/tests/bpf-script-example.c
@@ -5,7 +5,7 @@
  */
 #ifndef LINUX_VERSION_CODE
 # error Need LINUX_VERSION_CODE
-# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
+# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
 #endif
 #define BPF_ANY 0
 #define BPF_MAP_TYPE_ARRAY 2
diff --git a/tools/perf/tests/bpf-script-test-kbuild.c b/tools/perf/tests/bpf-script-test-kbuild.c
index 219673aa278fb..21663295d5b5a 100644
--- a/tools/perf/tests/bpf-script-test-kbuild.c
+++ b/tools/perf/tests/bpf-script-test-kbuild.c
@@ -5,7 +5,7 @@
  */
 #ifndef LINUX_VERSION_CODE
 # error Need LINUX_VERSION_CODE
-# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
+# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
 #endif
 #define SEC(NAME) __attribute__((section(NAME), used))
 
diff --git a/tools/perf/tests/bpf-script-test-prologue.c b/tools/perf/tests/bpf-script-test-prologue.c
index bd83d364cf30d..8db19e70813cc 100644
--- a/tools/perf/tests/bpf-script-test-prologue.c
+++ b/tools/perf/tests/bpf-script-test-prologue.c
@@ -5,7 +5,7 @@
  */
 #ifndef LINUX_VERSION_CODE
 # error Need LINUX_VERSION_CODE
-# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
+# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
 #endif
 #define SEC(NAME) __attribute__((section(NAME), used))
 
-- 
2.27.0

