Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DBA3F0FC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbhHSA7b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:31 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60770 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbhHSA73 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:29 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4p017219;
        Thu, 19 Aug 2021 09:57:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4p017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334671;
        bh=VvcOubkXOX4J0f3OkqzcDKTBLlnxU8IhaGu8KDtg/Ng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T/yfefgkVlzpMKWgUcutzo6ci360DwJwou0ptm0VQtw8T6LXvtPFy+le+1VV5YrGp
         njDMZYwioXs77sQSU7Irbo5JlpJEZPD40NXkP92yH5OpEShqszaHEt8fmOcEU0TTFp
         yIlkasXocLwvmd4y2NohFnXDJB5yBHnOaWJeGFyVHTdwqyC60VoUXuMTBICkyaNvNR
         SGxES4rd+pEYR1t6zJftldhAoWcaZURzTe+8nH9mpd+92WTNU9g/aKUW1e4vKid1kB
         vqdld3Nl2U2uqpUb7dmqli+jFWzApyMfMf0WfTMvDN3N3RJzIq+eEXJk+1zUQTZxFq
         tSO7she8o0VhQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 06/13] kbuild: merge vmlinux_link() between the ordinary link and Clang LTO
Date:   Thu, 19 Aug 2021 09:57:37 +0900
Message-Id: <20210819005744.644908-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When Clang LTO is enabled, vmlinux_link() reuses vmlinux.o instead of
linking ${KBUILD_VMLINUX_OBJS} and ${KBUILD_VMLINUX_LIBS} again.

That is the only difference here, so merge the similar code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 36ef7b37fc5d..a6c4d0bce3ba 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -154,12 +154,23 @@ vmlinux_link()
 	local objects
 	local strip_debug
 	local map_option
+	local objs
+	local libs
 
 	info LD ${output}
 
 	# skip output file argument
 	shift
 
+	if [ -n "${CONFIG_LTO_CLANG}" ]; then
+		# Use vmlinux.o instead of performing the slow LTO link again.
+		objs=vmlinux.o
+		libs=
+	else
+		objs="${KBUILD_VMLINUX_OBJS}"
+		libs="${KBUILD_VMLINUX_LIBS}"
+	fi
+
 	# The kallsyms linking does not need debug symbols included.
 	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
 		strip_debug=-Wl,--strip-debug
@@ -170,22 +181,9 @@ vmlinux_link()
 	fi
 
 	if [ "${SRCARCH}" != "um" ]; then
-		if [ -n "${CONFIG_LTO_CLANG}" ]; then
-			# Use vmlinux.o instead of performing the slow LTO
-			# link again.
-			objects="--whole-archive		\
-				vmlinux.o 			\
-				--no-whole-archive		\
-				${@}"
-		else
-			objects="--whole-archive		\
-				${KBUILD_VMLINUX_OBJS}		\
-				--no-whole-archive		\
-				--start-group			\
-				${KBUILD_VMLINUX_LIBS}		\
-				--end-group			\
-				${@}"
-		fi
+		objects="--whole-archive ${objs} --no-whole-archive	\
+			 --start-group ${libs} --end-group		\
+			 $@"
 
 		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\
 			${strip_debug#-Wl,}			\
-- 
2.30.2

