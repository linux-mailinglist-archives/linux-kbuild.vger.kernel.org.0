Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD1B327105
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 07:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhB1GLp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 01:11:45 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:55340 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhB1GLp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 01:11:45 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11S6Aagr009638;
        Sun, 28 Feb 2021 15:10:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11S6Aagr009638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614492636;
        bh=KEDTQhMtT2eYViKsns8H0yabNkx1k3NTqKR6OviKKQ4=;
        h=From:To:Cc:Subject:Date:From;
        b=Md5mhQERflDIRQYPFLyHsJX9rEnKHYRphyE3GUMFvUlkr6yXaUtjOoyKQ2mpPCMf+
         tOiOBP9CCxgWVI7vRjKj22eU3hH6ctver4bw0x7zgAWkYnv2oekVbON9VEI+IEG/pY
         bw//qy24klyKYQsQJ9bFSx48Pz1es9KTaLUYuRUfcw9ztauVaEidJ12mJZTxU2M5we
         TTQYuccxhIiGxb/4i/1xR9G5ZK6iMlWaVa6VToUiQtBNMZsc6iEfdp20t96yEgN4pn
         UHa0PHNmnIAaxwWK2DOybOBLntmCgTscoNb9pOmaecnVMz6CHp87GHQBSFGTHGOKbn
         8lMordguOrclg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/4] kbuild: add image_name to no-sync-config-targets
Date:   Sun, 28 Feb 2021 15:10:25 +0900
Message-Id: <20210228061028.239459-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make image_name' needs include/config/auto.conf to show the correct
output because KBUILD_IMAGE depends on CONFIG options, but should not
attempt to resync the configuration.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 633d2769b6ec..c84a9311df29 100644
--- a/Makefile
+++ b/Makefile
@@ -263,7 +263,8 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile
-no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
+no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
+			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
 
 config-build	:=
-- 
2.27.0

