Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A371E66DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2020 17:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404796AbgE1Pys (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 May 2020 11:54:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60384 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404774AbgE1Pyr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 May 2020 11:54:47 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jeKrj-00056b-UX; Thu, 28 May 2020 15:54:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] modpost: close file when fstat fails
Date:   Thu, 28 May 2020 16:54:43 +0100
Message-Id: <20200528155443.421933-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a failed fstat error return path fails to close an open file.
Fix this by setting buf to NULL and returning via the error exit path.

Addresses-Coverity: ("Resource leak");
Fixes: commit 076ad831dfe8 ("modpost: add read_text_file() and get_line() helpers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/mod/modpost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e4691127f051..3012e5f8ec7e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -109,8 +109,10 @@ char *read_text_file(const char *filename)
 	if (fd < 0)
 		return NULL;
 
-	if (fstat(fd, &st) < 0)
-		return NULL;
+	if (fstat(fd, &st) < 0) {
+		buf = NULL;
+		goto close;
+	}
 
 	buf = NOFAIL(malloc(st.st_size + 1));
 
-- 
2.25.1

