Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC26381815
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 May 2021 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhEOLBN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 May 2021 07:01:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:46516 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235405AbhEOK7M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 May 2021 06:59:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 68AB3B118;
        Sat, 15 May 2021 10:57:58 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id 3B218602D9; Sat, 15 May 2021 12:57:58 +0200 (CEST)
Message-Id: <13e53f8f5dab1e3e070b4cb34bbe8b89f85f5326.1621076083.git.mkubecek@suse.cz>
From:   Michal Kubecek <mkubecek@suse.cz>
Date:   Sat, 15 May 2021 12:11:13 +0200
Subject: [PATCH] kbuild: dummy-tools: adjust to stricter stackprotector check
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@suse.de>, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a regular
percpu variable") modified the stackprotector check on 32-bit x86 to check
if gcc supports using %fs as canary. Adjust dummy-tools gcc script to pass
this new test by returning "%fs" rather than "%gs" if it detects
-mstack-protector-guard-reg=fs on command line.

Fixes: 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a regular percpu variable")
Signed-off-by: Michal Kubecek <mkubecek@suse.cz>
---
 scripts/dummy-tools/gcc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index f6d543725f1e..b2483149bbe5 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -76,7 +76,11 @@ fi
 if arg_contain -S "$@"; then
 	# For scripts/gcc-x86-*-has-stack-protector.sh
 	if arg_contain -fstack-protector "$@"; then
-		echo "%gs"
+		if arg_contain -mstack-protector-guard-reg=fs "$@"; then
+			echo "%fs"
+		else
+			echo "%gs"
+		fi
 		exit 0
 	fi
 
-- 
2.31.1

