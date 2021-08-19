Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B013F0FC0
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhHSA7X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:23 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60450 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhHSA7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:19 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4r017219;
        Thu, 19 Aug 2021 09:57:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4r017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334672;
        bh=RUDO4jzJry61qVqT4mfs6ssC07k4WQc2EZ9PdUGGmXk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qEStO2Ppo9aS6cgTM+D2bW6Ky95lJqK/y3BwLrk630esyDmxdPcfSWFG/TQOXsM+Y
         RIu1v0/RHIzRxWM13xcBbR93Kacf/lq/XCph1AwuUeHcQgY4lRHK6/RmEEKaJAyAog
         xd9vfdQgTDPcLUGKpClcLOAUS6HwfzttqYGIU3TII6U1jbjq7t50+oOE0P3KDm4PDI
         plx/CFgEIRGo7f9saapkx1Zrh8s1NjDlRzX1DbldYjFEHcht5TzmDdS7zG2qc90gKU
         QoKq9kPQQ1gmLm3gUwvv/5eIrGYIAmFcVxuXZloTyW7H2vv6sevHMjK2zGW80jsFsR
         H5uiA7Xg/LA6Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 08/13] kbuild: merge vmlinux_link() between ARCH=um and other architectures
Date:   Thu, 19 Aug 2021 09:57:39 +0900
Message-Id: <20210819005744.644908-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For ARCH=um, ${CC} is used as the linker driver. Hence, the linker
options are prefixed with -Wl, .

Merge the similar code.

I replaced the -T option with the long option --script= so that it
works well with/without ${wl}.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 56 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7b9c62e4d54a..d74cee5c4326 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -149,13 +149,12 @@ objtool_link()
 # ${2}, ${3}, ... - optional extra .o files
 vmlinux_link()
 {
-	local lds="${objtree}/${KBUILD_LDS}"
 	local output=${1}
-	local objects
-	local strip_debug
-	local map_option
 	local objs
 	local libs
+	local ld
+	local ldflags
+	local ldlibs
 
 	info LD ${output}
 
@@ -171,42 +170,33 @@ vmlinux_link()
 		libs="${KBUILD_VMLINUX_LIBS}"
 	fi
 
+	if [ "${SRCARCH}" = "um" ]; then
+		wl=-Wl,
+		ld="${CC}"
+		ldflags="${CFLAGS_vmlinux}"
+		ldlibs="-lutil -lrt -lpthread"
+	else
+		wl=
+		ld="${LD}"
+		ldflags="${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}"
+		ldlibs=
+	fi
+
+	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
+
 	# The kallsyms linking does not need debug symbols included.
 	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
-		strip_debug=-Wl,--strip-debug
+		ldflags="${ldflags} ${wl}--strip-debug"
 	fi
 
 	if [ -n "${CONFIG_VMLINUX_MAP}" ]; then
-		map_option="-Map=${output}.map"
+		ldflags="${ldflags} ${wl}-Map=${output}.map"
 	fi
 
-	if [ "${SRCARCH}" != "um" ]; then
-		objects="--whole-archive ${objs} --no-whole-archive	\
-			 --start-group ${libs} --end-group		\
-			 $@"
-
-		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
-			${strip_debug#-Wl,}			\
-			-o ${output}				\
-			${map_option}				\
-			-T ${lds} ${objects}
-	else
-		objects="-Wl,--whole-archive			\
-			${KBUILD_VMLINUX_OBJS}			\
-			-Wl,--no-whole-archive			\
-			-Wl,--start-group			\
-			${KBUILD_VMLINUX_LIBS}			\
-			-Wl,--end-group				\
-			${@}"
-
-		${CC} ${CFLAGS_vmlinux}				\
-			${strip_debug}				\
-			-o ${output}				\
-			${map_option:+-Wl,${map_option}}	\
-			-Wl,-T,${lds}				\
-			${objects}				\
-			-lutil -lrt -lpthread
-	fi
+	${ld} ${ldflags} -o ${output}					\
+		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
+		${wl}--start-group ${libs} ${wl}--end-group		\
+		$@ ${ldlibs}
 }
 
 # generate .BTF typeinfo from DWARF debuginfo
-- 
2.30.2

