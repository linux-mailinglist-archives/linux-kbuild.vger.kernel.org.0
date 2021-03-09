Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E72332BF2
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 17:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhCIQ0e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 11:26:34 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:47157 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhCIQ03 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 11:26:29 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 129GPmqj014156;
        Wed, 10 Mar 2021 01:25:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 129GPmqj014156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615307149;
        bh=EhPEE3oHKhL3vmJHIpnrH/DrMpFTrrE0NYQj/7BwJD0=;
        h=From:To:Cc:Subject:Date:From;
        b=Eg1tKjTpG8j5yvqd2Yse5TOe8sMmOVB2em+wI0mYKUtpw0nmZiBW+p+DsVXzHmEb8
         +KZeZw1m6kA7VI0OJJk1ZyGbOTJXIRpPfhijDUC90h+v7N92bsk/ZFtcHg7IwwC0dT
         TsriLGsQDBdTrmVWDslGO3szJlix5p6jSMzTSOrX9Rtf+ckYoMMveWx/PmmBOqHwM/
         vH0bBVfQ8Ul7AZnBBRmNZXmJ5AamEmSjlWVJf3bJ6gYASmL3MFGCJ1Ssw1MZbTnylz
         wBdFFtqAestmTe3pMxhPXbPOFW1lBukyVg/jYss518qBK1B8xbNHbcOmahvdvWtmX0
         JQsh86ZlhiK1Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jiri Slaby <jslaby@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: dummy-tools: adjust to scripts/cc-version.sh
Date:   Wed, 10 Mar 2021 01:25:45 +0900
Message-Id: <20210309162545.637647-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit aec6c60a01d3 ("kbuild: check the minimum compiler version in
Kconfig") changed how the script detects the compiler version.

Get 'make CROSS_COMPILE=scripts/dummy-tools/' back working again.

Fixes: aec6c60a01d3 ("kbuild: check the minimum compiler version in Kconfig")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Perhaps, Jiri may have already noticed this issue, and have a similar patch.
I just checked ML, but I did not find a patch to fix this.


 scripts/dummy-tools/gcc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index 7b10332b23ba..39e65fee59bd 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -57,9 +57,9 @@ if arg_contain --version "$@"; then
 fi
 
 if arg_contain -E "$@"; then
-	# For scripts/gcc-version.sh; This emulates GCC 20.0.0
+	# For scripts/cc-version.sh; This emulates GCC 20.0.0
 	if arg_contain - "$@"; then
-		sed 's/^__GNUC__$/20/; s/^__GNUC_MINOR__$/0/; s/^__GNUC_PATCHLEVEL__$/0/'
+		sed -n '/^GCC/{s/__GNUC__/20/; s/__GNUC_MINOR__/0/; s/__GNUC_PATCHLEVEL__/0/; p;}'
 		exit 0
 	else
 		echo "no input files" >&2
-- 
2.27.0

