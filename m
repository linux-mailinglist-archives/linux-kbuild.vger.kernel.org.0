Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3DF41E732
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352063AbhJAFfS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:18 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25300 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351929AbhJAFfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:07 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVb000646;
        Fri, 1 Oct 2021 14:33:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVb000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066383;
        bh=Iqm0ebRv9z0IooNy+Maz2A58TgKBK4bu96UGV+0zUbk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XoK5/WIOrS1P3CE36GBpfutpt7q9hacupBQSM4JdI8ggAvvAJM2Pp9YqZGqMRluha
         wX5yGYIppYOr8kvCTWD/oIgEm54K6QYj7zJ3/lvyayk1FrWjCdSGrfcMkYGaGelxUv
         rmUSPZbZ5xVwePpBQv8pzDnvsNe0XV7LCJM3ftJzP1DRW7Byrelk0mV3YAnf1gqXtA
         AXzCHE2GbsaoQlK1lXN4DuD91yym18UAdKBxRpAt+iT0BWif9Qlcheq+MnC0m5vyeW
         Q1QjfhpV+DesCBKFesqVTDOxv5zlEGVEUphN6fHKrmjgr5xp8hExFeQRwumxjdsZZD
         TP2dV6bQ/h+pw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] kconfig: refactor conf_touch_dep()
Date:   Fri,  1 Oct 2021 14:32:52 +0900
Message-Id: <20211001053253.1223316-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If this function fails to touch a dummy header due to missing parent
directory, then it creates it and touches the file again.

This was needed because CONFIG_FOO_BAR was previously tracked by
include/config/foo/bar.h. (include/config/foo/ may not exist here)

This is no longer the case since commit 0e0345b77ac4 ("kbuild: redo
fake deps at include/config/*.h"); now all the fake headers are placed
right under include/config/, like include/config/FOO_BAR.

Do not try to create parent directory, include/config/, which already
exists.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 75e45e69d660..9ece2f3b61a6 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -130,31 +130,17 @@ static size_t depfile_prefix_len;
 /* touch depfile for symbol 'name' */
 static int conf_touch_dep(const char *name)
 {
-	int fd, ret;
-	char *d;
+	int fd;
 
 	/* check overflow: prefix + name + '\0' must fit in buffer. */
 	if (depfile_prefix_len + strlen(name) + 1 > sizeof(depfile_path))
 		return -1;
 
-	d = depfile_path + depfile_prefix_len;
-	strcpy(d, name);
+	strcpy(depfile_path + depfile_prefix_len, name);
 
-	/* Assume directory path already exists. */
 	fd = open(depfile_path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
-	if (fd == -1) {
-		if (errno != ENOENT)
-			return -1;
-
-		ret = make_parent_dir(depfile_path);
-		if (ret)
-			return ret;
-
-		/* Try it again. */
-		fd = open(depfile_path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
-		if (fd == -1)
-			return -1;
-	}
+	if (fd == -1)
+		return -1;
 	close(fd);
 
 	return 0;
-- 
2.30.2

