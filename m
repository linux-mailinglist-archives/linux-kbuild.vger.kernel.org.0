Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31C130141B
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 10:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbhAWJRz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Jan 2021 04:17:55 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:19812 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbhAWJRu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jan 2021 04:17:50 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 10N9Gc91025435;
        Sat, 23 Jan 2021 18:16:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 10N9Gc91025435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611393399;
        bh=4QzM4sK7KqvcXh/+cLML9tHqLm9oGeg6Bz4m8PgGXAM=;
        h=From:To:Cc:Subject:Date:From;
        b=rmPx44zE6Z6uf53vqGc7Z7Jq59f+BLO+Unw0lxa2fTrO2m2oRqsK7qf0sDHkAYJNn
         dX6wy0tb8CNcyD4BY/5b5Ul8W+pT9Xpw5BiYGBb6b5E1jDmSZ8FHsoH1dFLg4HiBYQ
         fAOUemk/M7vx3udwPawKDL9lqS6bj+7auIauY5STTmCnBoSbgYV4gErWR1N1KERL+o
         gOVGffu+ZKVRjxm7EJ7iuuOC2f8eP9+/jbTkm+psIBpelDOb5uoSLsYnk5Kn1hR+W8
         oeOTHp+S3byP3gJcC+wMiAw+qDOSiEisbjMQOdUst5iO/LjGYNU0Lnewr6SRQT6Aax
         rXKFA1li9sDAA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: simplify GCC_PLUGINS enablement in dummy-tools/gcc
Date:   Sat, 23 Jan 2021 18:16:30 +0900
Message-Id: <20210123091631.716794-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With commit 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev
capability test") applied, this check can be way simpler because
now scripts/gcc-plugins/Kconfig only checks plugin-version.h

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/dummy-tools/gcc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index 33487e99d83e..5c113cad5601 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -75,16 +75,12 @@ if arg_contain -S "$@"; then
 	fi
 fi
 
-# For scripts/gcc-plugin.sh
+# To set GCC_PLUGINS
 if arg_contain -print-file-name=plugin "$@"; then
 	plugin_dir=$(mktemp -d)
 
-	sed -n 's/.*#include "\(.*\)"/\1/p' $(dirname $0)/../gcc-plugins/gcc-common.h |
-	while read header
-	do
-		mkdir -p $plugin_dir/include/$(dirname $header)
-		touch $plugin_dir/include/$header
-	done
+	mkdir -p $plugin_dir/include
+	touch $plugin_dir/include/plugin-version.h
 
 	echo $plugin_dir
 	exit 0
-- 
2.27.0

