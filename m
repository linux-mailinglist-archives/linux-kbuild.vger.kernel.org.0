Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C794311A86
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 04:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhBFDx2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 22:53:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:48442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232355AbhBFDvT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 22:51:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1ECB064FB3;
        Sat,  6 Feb 2021 03:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612583437;
        bh=oyWsAoaaylR2Qn509XAgnpBU5prFNdPLKPX4axkvNpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J0V7Br+K/IYLBcg9zeKVGXSAj8KgnEjNQ6249qCLmsmRJ3I1NI27iIiPkex+AQucR
         pP6h9TJsAw5SMtW+Cyv/IVH9BYFV6XnVC8caqKu531gAw75o3t2oPkE9CitiqYnA3J
         u5Qb3swP70hnjv46a3omR7t9cMfTlYD3LHUuwAOelNER7iw7PehFnMO69kQxr/AMn8
         K30G62oeZStL/YCmGVaXy6GndqjDellXE9ni0sX0wvWMTXjV44t/3qZLIjBf2Wn9PK
         DmbCpUmZH+G/yr6s9/TpabZ33h1G/aWFsnfvLJ+B+neGK2EdrEacGkQ6zKKnQEechR
         Yzi6jcUoKJUsA==
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
        Sasha Levin <sashal@kernel.org>, stable@kernel.org
Subject: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and LINUX_VERSION_CODE2
Date:   Fri,  5 Feb 2021 22:50:33 -0500
Message-Id: <20210206035033.2036180-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206035033.2036180-1-sashal@kernel.org>
References: <20210206035033.2036180-1-sashal@kernel.org>
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

We can't however use the original KERNEL_VERSION and LINUX_VERSION_CODE
as userspace has created ABI dependency on their structure, and we risk
breaking this userspace by modifying the layout of the version integers.

Cc: stable@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile                                       | 8 +++++++-
 drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
 drivers/usb/core/hcd.c                         | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
 include/linux/usb/composite.h                  | 4 ++--
 kernel/sys.c                                   | 2 +-
 tools/perf/tests/bpf-script-example.c          | 2 +-
 tools/perf/tests/bpf-script-test-kbuild.c      | 2 +-
 tools/perf/tests/bpf-script-test-prologue.c    | 2 +-
 9 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 157be50c691e5..2177c548e4c24 100644
--- a/Makefile
+++ b/Makefile
@@ -1266,7 +1266,13 @@ define filechk_version.h
 		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
 	fi;                                                              \
 	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
-	((c) > 255 ? 255 : (c)))'
+	((c) > 255 ? 255 : (c)))';                                       \
+	echo \#define LINUX_VERSION_CODE2 $(shell                        \
+	expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
+	echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
+	echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
+	echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL);                \
+	echo '#define KERNEL_VERSION2(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
 endef
 
 $(version_h): FORCE
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index e4c9627485aa5..989f15d9aa7d4 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -237,8 +237,8 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
 	remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
 
 	snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
-		 (u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >> 8) & 0xff),
-		 (u16)(LINUX_VERSION_CODE & 0xffff));
+		(u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
+		(u16)(LINUX_VERSION_SUBLEVEL));
 
 	/*Send the command*/
 	MLX5_SET(set_driver_version_in, in, opcode,
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
index bfd8e77788e29..5c7dea5e0ff16 100644
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
index 5646dad886e61..c71150f2c6390 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -575,8 +575,8 @@ static inline u16 get_default_bcdDevice(void)
 {
 	u16 bcdDevice;
 
-	bcdDevice = bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
-	bcdDevice |= bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
+	bcdDevice = bin2bcd(LINUX_VERSION_MAJOR) << 8;
+	bcdDevice |= bin2bcd(LINUX_VERSION_PATCHLEVEL);
 	return bcdDevice;
 }
 
diff --git a/kernel/sys.c b/kernel/sys.c
index 8bb46e50f02d4..b09fe21e88ff5 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1242,7 +1242,7 @@ static int override_release(char __user *release, size_t len)
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

