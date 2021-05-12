Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6341137B5CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 08:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhELGUC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 02:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhELGUC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 02:20:02 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA16C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 11 May 2021 23:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Osmlrk5btcEg35OghxGqMf6OOl7F21UX2IJ5aK0KDa4=; b=kfv5rpE+hY+Qm1xl/RAuX5bewt
        1KtmHaWZp1F9cSS0i8EcO9sDfriUW3EWqo7La2SdpBiWMefiM3dqXFplkATz5NxHzxw8Ie5QtDsSC
        rfMsvS1eTkue1wcoCwjebyJ3mZNfgTZxxQnQu5F20PeN+2vghS7+20ePMf0WKZy8F90t0N1RdzFmR
        jgI9QWfwb7bek7fzFNgsVn4WGRU86QKPC+syP8W/Vy0RqnD+B3rWOr/kdXQDQ9kObdHR9aXQ1RKR5
        PgmNB5yzMz98WtgrenkC6JywSHzmvhjqcO15PzHPuAALo6C0ugL8RJ0gADdcQO/+1g6KAswepP4g6
        YlMo8lmA==;
Received: from [2601:1c0:6280:3f0::d9fe]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lgiCo-0028Pb-LF; Wed, 12 May 2021 06:18:51 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        richard -rw- weinberger <richard.weinberger@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: arch/um/include/asm/Kbuild question
Message-ID: <2321702f-b888-87f6-b314-8e5734ee7fa9@infradead.org>
Date:   Tue, 11 May 2021 23:18:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

I thought that adding
+generic-y += rwonce.h

to arch/um/include/asm/Kbuild would fix a build problem:

  CC [M]  fs/hostfs/hostfs_user.o
In file included from ../include/asm-generic/div64.h:27,
                 from ../fs/hostfs/hostfs_user.c:21:
include/linux/compiler.h:248:10: fatal error: asm/rwonce.h: No such file or directory
  248 | #include <asm/rwonce.h>
      |          ^~~~~~~~~~~~~~


but it doesn't seem to be helping.
Do I need to use mandatory-y instead?

Or is arch/um/ with ARCH=um and SUBARCH=i386 just "different"?


The build error is:
ERROR: modpost: "__divdi3" [fs/hostfs/hostfs.ko] undefined!

and my current patch attempt is below

Thanks.

---
From: Randy Dunlap <rdunlap@infradead.org>

<asm-generic/div64.h> wants rwonce.h, so add rwonce.h to the
arch/um/include/asm/Kbuild generic-y list of header files.

ERROR: modpost: "__divdi3" [fs/hostfs/hostfs.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/um/include/asm/Kbuild |    1 +
 fs/hostfs/hostfs_user.c    |   13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

--- linux-next-20210511.orig/fs/hostfs/hostfs_user.c
+++ linux-next-20210511/fs/hostfs/hostfs_user.c
@@ -17,6 +17,7 @@
 #include <sys/syscall.h>
 #include "hostfs.h"
 #include <utime.h>
+#include <asm-generic/div64.h>
 
 static void stat64_to_hostfs(const struct stat64 *buf, struct hostfs_stat *p)
 {
@@ -242,17 +243,21 @@ int set_attr(const char *file, struct ho
 			return err;
 
 		times[0].tv_sec = st.atime.tv_sec;
-		times[0].tv_usec = st.atime.tv_nsec / 1000;
+		times[0].tv_usec = st.atime.tv_nsec;
+		do_div(times[0].tv_usec, 1000);
 		times[1].tv_sec = st.mtime.tv_sec;
-		times[1].tv_usec = st.mtime.tv_nsec / 1000;
+		times[1].tv_usec = st.mtime.tv_nsec;
+		do_div(times[1].tv_usec, 1000);
 
 		if (attrs->ia_valid & HOSTFS_ATTR_ATIME_SET) {
 			times[0].tv_sec = attrs->ia_atime.tv_sec;
-			times[0].tv_usec = attrs->ia_atime.tv_nsec / 1000;
+			times[0].tv_usec = attrs->ia_atime.tv_nsec;
+			do_div(times[0].tv_usec, 1000);
 		}
 		if (attrs->ia_valid & HOSTFS_ATTR_MTIME_SET) {
 			times[1].tv_sec = attrs->ia_mtime.tv_sec;
-			times[1].tv_usec = attrs->ia_mtime.tv_nsec / 1000;
+			times[1].tv_usec = attrs->ia_mtime.tv_nsec;
+			do_div(times[1].tv_usec, 1000);
 		}
 
 		if (fd >= 0) {
--- linux-next-20210511.orig/arch/um/include/asm/Kbuild
+++ linux-next-20210511/arch/um/include/asm/Kbuild
@@ -20,6 +20,7 @@ generic-y += param.h
 generic-y += pci.h
 generic-y += percpu.h
 generic-y += preempt.h
+generic-y += rwonce.h
 generic-y += softirq_stack.h
 generic-y += switch_to.h
 generic-y += topology.h

