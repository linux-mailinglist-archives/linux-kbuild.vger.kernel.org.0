Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA0A429BAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 04:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhJLC5c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 22:57:32 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:23655 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhJLC5c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 22:57:32 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 19C2tHgu006145;
        Tue, 12 Oct 2021 11:55:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 19C2tHgu006145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634007318;
        bh=iGUsNJiesUCJuiMYmwPeollH/LLyJvPcYCPtTzfg4mQ=;
        h=From:To:Cc:Subject:Date:From;
        b=DzhHsFgk8chfZh1nGTQzVVUpu/75Y95H7OLia0mrHif1tGNwv2e1yhZFPW6wDWxP0
         hPMrJlycR97sfe/FBpEh6HVHKyKY5EKvnBDlZb6E/wxTc3NOyjaI16QIMKBA1mClku
         dJxay74d7KKbVRvbJmiySHt4a+lH2s8ygq+YNyG7N1hiwU65HVfGnVqHcwaPaVam1c
         HB3vBUefiZsMJBdFZsiMc1pBrJLPcgk2+p/l3Yjscb3HJ23aEsuEvy3bI8mSu8qmef
         OXZwLqdufbStYxaHOQcTHiNoa5eMw5KzmvXcX3MFf+HaGj00aFy97Ujg2rM1O3cY5n
         vtoQI/iHhbvIg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gen_init_cpio: add static const qualifiers
Date:   Tue, 12 Oct 2021 11:55:14 +0900
Message-Id: <20211012025514.448804-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add 'const' to constant arrays. I also added missing 'static'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_init_cpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 03b21189d58b..bf5b98c6cf8d 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -188,7 +188,7 @@ struct generic_type {
 	mode_t mode;
 };
 
-static struct generic_type generic_type_table[] = {
+static const struct generic_type generic_type_table[] = {
 	[GT_DIR] = {
 		.type = "dir",
 		.mode = S_IFDIR
@@ -491,7 +491,7 @@ static void usage(const char *prog)
 		prog);
 }
 
-struct file_handler file_handler_table[] = {
+static const struct file_handler file_handler_table[] = {
 	{
 		.type    = "file",
 		.handler = cpio_mkfile_line,
-- 
2.30.2

