Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8951B63386
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfGIJdG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 05:33:06 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38433 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfGIJc5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:57 -0400
Received: from orion.localdomain ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjBNV-1iNfXb1B1p-00f8fy; Tue, 09 Jul 2019 11:32:42 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        info@metux.net, apw@canonical.com, joe@perches.com,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 2/4] scripts: mkdebian: allow renaming generated debian/rules via env
Date:   Tue,  9 Jul 2019 11:32:37 +0200
Message-Id: <1562664759-16009-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:8RxMCZ0EExgOaxV88l74wKMkDX0CtH6zeqLohpBk6Mjl+jjrB7B
 Tw8pgUAQp78XVLp1IriBcq4lhAkCL7Hd5Usj8SFv3A98K0WsN0eTVviF1exOx6VwMR0dLTW
 Z8zgDIK5zS96kRCExRpcoNeYNM3QyJ3dxFRddf5f/idPUOelcF6w4ilgjWhw7jDyj7gQRyd
 WmiIQXuTAY18e0UoH3uDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4vHSzAF5fWc=:dj9t0ZG4mhtFfEmznKOVdL
 v6HsHLvPp50GhgFAMg0yKB+fcmYn9UamoNf8kZcnXPqW3r6Swrg4P7KNBy3gdc1ojYDp7MqOn
 9uDtfDMsqm6lamwRwfWxSLeWpu0CQ9HtkOZvkRQ0hlU5zlXHxxWgCFcsN8Halyvb41bZLflGj
 B98txiT0qI7iWLo8cRPv1YGKGPZ42jkpfQbdUI5s8UkRqAHIUIXVyldioQawpmvTHqQiqBL39
 D5OfB0+9e1NIoJ9gdBM/z/fO8B58siNjcWeyKyrUV9rSh97SZmYSJ6d02u/WRnUkQAR3CdpH8
 +X/xrvhAnVoHSI4Bx42NfSEV57Ut+XfySDBEYqK0Fd5wzFiUgGjtbO9sffq3FgMzrPAmEFDPC
 2Sp3iw3e/RVfhZ4tTLK1y9NYw4ar/7CSKHEZqcGZXM7yrrY0E9IPAWK6ZtHiPq3Fz4kQZD/Rd
 MEoVridzPCsjKeEZXyRErLrpu++VrdZB9i1aEC2nL0D3aiGF6eG+kcSLZX8q4nnzKHyEu3zq1
 gTLIlNvyCv1H9F9lpBJ+5fXyDJINLY9Fzz8HZBch4zMzdfrEQzesTUPry6H9YfGB8Z6Lyy0Ml
 yG24jGIQB+Dv9/wHZX0lrzH8fXHq8s75RxB68EUuYdN4GpvjG3y6M26wIdmOZUp5TLqQQgGay
 vXE7OLDJzqxQ46K9WaRsmMrsps31qiLnb4pfFYnGDyEp9tJ35jOoU6EVSffdekW/aHDGZmUUX
 2HGiHjpLZgiYxsOXnqIeukT3KxYwUL61vfgJZg==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add new environment variable KDEB_RULES for controlling where the
generated debian rules are written to. By defaults, it's debian/rules,
but packagers might override it for providing their own rules file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 8351584..7a9ca4e 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -99,6 +99,9 @@ kernel_headers_packagename=linux-headers-$version
 dbg_packagename=$packagename-dbg
 debarch=
 set_debarch
+if [ -z "$KDEB_RULES" ]; then
+    KDEB_RULES=debian/rules
+fi
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
@@ -206,7 +209,7 @@ Description: Linux kernel debugging symbols for $version
  all the necessary debug symbols for the kernel and its modules.
 EOF
 
-cat <<EOF > debian/rules
+cat <<EOF > $KDEB_RULES
 #!$(command -v $MAKE) -f
 
 srctree ?= .
-- 
1.9.1

