Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E37380ADB
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 May 2021 15:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbhENN7x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 May 2021 09:59:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhENN7w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 May 2021 09:59:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 741156101A;
        Fri, 14 May 2021 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621000721;
        bh=6zfBRrh4LAMFP1QHtESFHgEFY8LPdKGXiVfm/ooztKQ=;
        h=From:To:Cc:Subject:Date:From;
        b=GhEH95fkrSHs5vIB5M4PZaV7emSgPYdeI48v1mX0c9mAy0ivY5Y0F6ZT1N0qnz8Av
         p5tHMfTUpM1jolbzUb0dJMFSGXVSpQckw0UfBdlDS3jaQHdvLn4/G0ECGjs/PkbT+H
         ydV5b6UN5fTZNn6X1dW69uzEeTBfpawUueK5G1wAmtAgTiJPVsunxwnDJmyONQU6GL
         iKVt+TZZkt2lxneM4Ugoq2OoSOeuAFcaNVp+lTlR4KihkbdEszQ9L7HAaqft5QnktO
         6aJXp4HqiAcujNEAVKGcUeDEp9xhAcYh7s+ZDv/JxpFxW+iOzuKRxnRSy1UNpVZ0cJ
         kYnBwNQd1MmOw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Kbuild: shut up uboot mkimage output when building quietly
Date:   Fri, 14 May 2021 15:57:33 +0200
Message-Id: <20210514135752.2910387-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When building with 'make -s', most architectures produce no output
at all unless there are warnings. However, on at leat mips and nios2
there is output from /usr/bin/mkimage when that is installed:

  Image Name:   Linux-5.12.0-next-20210427-00716
  Created:      Wed Apr 28 22:03:30 2021
  Image Type:   NIOS II Linux Kernel Image (gzip compressed)
  Data Size:    2245876 Bytes = 2193.24 KiB = 2.14 MiB
  Load Address: d0000000
  Entry Point:  d0000000

Make these behave like the others and check for the '${quiet}'
variable to see if we should redirect the output to /dev/null.
Any errors and warnings from mkimage will still be seen as those
get sent to stderr.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/mkuboot.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mkuboot.sh b/scripts/mkuboot.sh
index 4b1fe09e9042..031b5d6b839f 100755
--- a/scripts/mkuboot.sh
+++ b/scripts/mkuboot.sh
@@ -17,4 +17,8 @@ if [ -z "${MKIMAGE}" ]; then
 fi
 
 # Call "mkimage" to create U-Boot image
-${MKIMAGE} "$@"
+if [ "${quiet}" != "silent_" ]; then
+${MKIMAGE} "$@" ${REDIRECT}
+else
+${MKIMAGE} "$@" ${REDIRECT} > /dev/null
+fi
-- 
2.29.2

