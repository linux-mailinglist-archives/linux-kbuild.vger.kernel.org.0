Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC131A2C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 17:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhBLQb4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 11:31:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhBLQaJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 11:30:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DA5E64E7A;
        Fri, 12 Feb 2021 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613147368;
        bh=pPydJmMuskF2h5jMsOuWbH8ejnYogVvqwMz1wSmC790=;
        h=From:To:Cc:Subject:Date:From;
        b=uMQlNCRRAH5smkk25PVRpp8/svC4jUlzA0VV2qGYLmdEfrJ4nfXCYios6S7+6qGb7
         uP/UbPt/ql7m4nXS5E4gADaNnDpTC6c36EPkPw8E1+PbugykRcMjAgrg7pwkvd0uI4
         6Ewvsq3bXHmVLVX62binrBmSJ8b07DLUIxSGzdb/Uy1O103eO9HUDMU0hX6rbngaah
         aLJgyxtBb7dSnA3d2BGNMjDdHh7mG6mzsV0gB27+4Lu8dAfFr/oeKQBS8HNc/o6KKQ
         NVE26gujKxcO3rnduJi7REK8hEAA0naSsQKa1zzQFT7UdB3CjJOohJ5iitzKVJAZl1
         9a9zosUZfWP2g==
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] kbuild: simplify access to the kernel's version
Date:   Fri, 12 Feb 2021 11:29:24 -0500
Message-Id: <20210212162924.2269887-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of storing the version in a single integer and having various
kernel (and userspace) code how it's constructed, export individual
(major, patchlevel, sublevel) components and simplify kernel code that
uses it.

This should also make it easier on userspace.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile                                       | 5 ++++-
 drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
 drivers/usb/core/hcd.c                         | 4 ++--
 drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
 include/linux/usb/composite.h                  | 4 ++--
 kernel/sys.c                                   | 2 +-
 6 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 12607d3891487..1fdd44fe16590 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,10 @@ define filechk_version.h
 		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
 	fi;                                                              \
 	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
-	((c) > 255 ? 255 : (c)))'
+	((c) > 255 ? 255 : (c)))';                                       \
+	echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
+	echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
+	echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
 endef
 
 $(version_h): FORCE
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index ca6f2fc39ea0a..29f886263dc52 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -235,8 +235,8 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
 	remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
 
 	snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
-		 (u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >> 8) & 0xff),
-		 (u16)(LINUX_VERSION_CODE & 0xffff));
+		LINUX_VERSION_MAJOR, LINUX_VERSION_PATCHLEVEL,
+		LINUX_VERSION_SUBLEVEL);
 
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
-- 
2.27.0

