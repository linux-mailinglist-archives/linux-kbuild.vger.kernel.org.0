Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9210C2D8879
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 18:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404226AbgLLQ5i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Dec 2020 11:57:38 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:46708 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395531AbgLLQ5a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Dec 2020 11:57:30 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 0BCGsX0O010674;
        Sun, 13 Dec 2020 01:54:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0BCGsX0O010674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607792074;
        bh=bQUf8228hY7aU9FkwXOMLDlqsGArucGEXX7Oltn14HY=;
        h=From:To:Cc:Subject:Date:From;
        b=rGVAQHqVgpIfpj8BQjBxjvAVZ7WIqA9AfFFcH12ehKkiA3COPi9QY5Mf/B+OzrD7+
         n+NyuMpos4Em7Jkeuud+wKnfc5x5iS09xird6wuhlZzl8qCodT/khK9sAPdJPLBBTk
         n3uEsUC3Lk1Lv3ldLGYYkZnqUo/hxX/Ui3yghFdqikCtxLsJO1wULzhBxrhQ9G23Av
         agIK5HpWbI7yCUoCjemGkDAmPZe2p3RVn9xg5u2MOUG2OWfbHIurWivzb2pJRTzV75
         zggLnsLsCYuxTlLb75tDTLXza1gZunfXERXOCPs9wMef5AJzlTf3s6DYwEzT9WjHOc
         jig1/Oa+TTlAg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: do not use scripts/ld-version.sh for checking spatch version
Date:   Sun, 13 Dec 2020 01:54:29 +0900
Message-Id: <20201212165431.150750-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/ld-version.sh was, as its file name implies, originally intended
for the GNU ld version, but is (ab)used for the spatch version too.

Use 'sort -CV' for the version comparison, then coccicheck does not need
to use scripts/ld-version.sh. Fix nsdeps as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/coccicheck | 14 +++++---------
 scripts/nsdeps     |  4 +---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 209bb0427b43..d7f6b7ff130a 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -16,7 +16,6 @@ if [ ! -x "$SPATCH" ]; then
 fi
 
 SPATCH_VERSION=$($SPATCH --version | head -1 | awk '{print $3}')
-SPATCH_VERSION_NUM=$(echo $SPATCH_VERSION | ${DIR}/scripts/ld-version.sh)
 
 USE_JOBS="no"
 $SPATCH --help | grep "\-\-jobs" > /dev/null && USE_JOBS="yes"
@@ -186,14 +185,11 @@ coccinelle () {
 
     OPT=`grep "Options:" $COCCI | cut -d':' -f2`
     REQ=`grep "Requires:" $COCCI | cut -d':' -f2 | sed "s| ||"`
-    REQ_NUM=$(echo $REQ | ${DIR}/scripts/ld-version.sh)
-    if [ "$REQ_NUM" != "0" ] ; then
-	    if [ "$SPATCH_VERSION_NUM" -lt "$REQ_NUM" ] ; then
-		    echo "Skipping coccinelle SmPL patch: $COCCI"
-		    echo "You have coccinelle:           $SPATCH_VERSION"
-		    echo "This SmPL patch requires:      $REQ"
-		    return
-	    fi
+    if [ -n "$REQ" ] && ! { echo "$REQ"; echo "$SPATCH_VERSION"; } | sort -CV ; then
+	    echo "Skipping coccinelle SmPL patch: $COCCI"
+	    echo "You have coccinelle:           $SPATCH_VERSION"
+	    echo "This SmPL patch requires:      $REQ"
+	    return
     fi
 
 #   The option '--parse-cocci' can be used to syntactically check the SmPL files.
diff --git a/scripts/nsdeps b/scripts/nsdeps
index dab4c1a0e27d..e8ce2a4d704a 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -12,11 +12,9 @@ if [ ! -x "$SPATCH" ]; then
 	exit 1
 fi
 
-SPATCH_REQ_VERSION_NUM=$(echo $SPATCH_REQ_VERSION | ${DIR}/scripts/ld-version.sh)
 SPATCH_VERSION=$($SPATCH --version | head -1 | awk '{print $3}')
-SPATCH_VERSION_NUM=$(echo $SPATCH_VERSION | ${DIR}/scripts/ld-version.sh)
 
-if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
+if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
 	echo "spatch needs to be version $SPATCH_REQ_VERSION or higher"
 	exit 1
 fi
-- 
2.27.0

