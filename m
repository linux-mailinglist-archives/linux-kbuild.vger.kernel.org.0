Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD1A33A0A2
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbhCMTtL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:11 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39822 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef3018162;
        Sun, 14 Mar 2021 04:48:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef3018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664922;
        bh=UlQUPBcXRdcbmwmF2uLOAqNIUhdvi/rGbPsYGdP8wnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1DyOrIhZmqP9yzARhFoYOzwF52ftCpvT1Ygl38jIw4n2yxeHVueaZMZkmQC4Ccsir
         N2kMYzv1YCsUFBQIMebYKFos5e2MRBAyAH2K8LkhOpDcLFWUqS4VQ9ym1oYKinXY5L
         7dJ4/FEgrm9chZC01rG6bb9VSBPIEFVhRJmlA9gxmbSKKsPajAjtnpV4bOK1SnfzXZ
         kGZYNnYYuN/acfV45oqq5/+zwz6ZK/QK5DDI2n3tCby22dI8+3Z7wgG3JPXNOmKk7G
         0Sj1/LqpgSzpMvQd66wTMkvVYQkI0N1NZBihZzYb8XME3pSV2bUTOStnd7A3eDHUxC
         Nm4kpNZ+L9JNA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] kconfig: add help messages for --help (-h) and --silent (-s)
Date:   Sun, 14 Mar 2021 04:48:27 +0900
Message-Id: <20210313194836.372585-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add missing options and make the help message more readable.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index aac76acfd100..9ebc1acaf1ae 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -496,9 +496,13 @@ static struct option long_opts[] = {
 
 static void conf_usage(const char *progname)
 {
-
-	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
-	printf("[option] is _one_ of the following:\n");
+	printf("Usage: %s [options] <kconfig-file>\n", progname);
+	printf("\n");
+	printf("Generic options:\n");
+	printf("  -h, --help              Print this message and exit.\n");
+	printf("  -s, --silent            Do not print log.\n");
+	printf("\n");
+	printf("Mode options:\n");
 	printf("  --listnewconfig         List new options\n");
 	printf("  --helpnewconfig         List new options and help text\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
-- 
2.27.0

