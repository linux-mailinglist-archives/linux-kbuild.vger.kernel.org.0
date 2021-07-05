Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B5E3BB70F
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 08:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhGEGJs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 02:09:48 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:43864 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhGEGJr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 02:09:47 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 16566tPA011962;
        Mon, 5 Jul 2021 15:06:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 16566tPA011962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625465216;
        bh=qWlGY0thC/WOpDJ6uEc+qlRqsEeRf+Hs11ZSahrMJe0=;
        h=From:To:Cc:Subject:Date:From;
        b=gsF7tIxs22j/kSmncsRIj/5BFqFEnaPJLvlgLH7A7t2OwiA5fM2Oq/xMsDD1knCVJ
         JJ4qFCYeWkrwdwcQJEVqz1q8B0eSH34lK+gwvHxz80XP6sSWKjUJs64glU3T7sJJcx
         LLtUnL+hagBj9E4SdJmAaeBX1t178vk6zKeNmgKMApB7d048e12KuUD/u0c/rn2e8X
         mVL8mhGHwx0h1T5LWNXaW2/yz7+reNYR2WKG0/XTraQXdMMfwdMHtaDh2AlMB+MX+0
         nXUEraHekX4ffYTdNxFpPUnIW1e0GQ1tVXBDYPBwXxa72KM3NzsK1gmh67WmWKKdVP
         TiDsqBHsq/jDg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: check duplicated syscall number in syscall table
Date:   Mon,  5 Jul 2021 15:06:54 +0900
Message-Id: <20210705060654.135741-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, syscall{hdr,tbl}.sh sorts the entire syscall table, but you
can assume it is already sorted by the syscall number.

The generated syscall table does not work if the same syscall number
appers twice. Check it in the script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/syscallhdr.sh | 2 +-
 scripts/syscalltbl.sh | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 848ac2735115..22e34cd46b9b 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -69,7 +69,7 @@ guard=_UAPI_ASM_$(basename "$outfile" |
 	sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
 	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g')
 
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$infile" | sort -n | {
+grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$infile" | {
 	echo "#ifndef $guard"
 	echo "#define $guard"
 	echo
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index aa6ab156301c..6abe143889ef 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -52,10 +52,15 @@ outfile="$2"
 
 nxt=0
 
-grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n | {
+grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
 
 	while read nr abi name native compat ; do
 
+		if [ $nxt -gt $nr ]; then
+			echo "error: $infile: syscall table is not sorted or duplicates the same syscall number" >&2
+			exit 1
+		fi
+
 		while [ $nxt -lt $nr ]; do
 			echo "__SYSCALL($nxt, sys_ni_syscall)"
 			nxt=$((nxt + 1))
-- 
2.27.0

