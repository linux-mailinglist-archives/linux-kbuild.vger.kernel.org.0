Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A31107F47
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKWQFB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49448 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5I019106;
        Sun, 24 Nov 2019 01:04:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5I019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525088;
        bh=6aYBJLETzzZ9tKk9VjyP9bE0/hE74dTgHGjrEeWx9tY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N7FL27dA/kBwCUd2PiBYIDy2zn0eXNV0eFrD9GtjMz/7rjD/f+UGAV1/F9JwuYckj
         7YnV9+dRizG4tIHpkPqPmdhqenRw6KOj9pO+ZsFtJ5M5pAuhMOttzkV1/y9CpJPVf7
         xwerW59vgpNG13UM0Ci/y9v0ba1HtJGD4wFxr3mE+yDGnAKEQh0jK1GZyjK47N6Sws
         jJaJ/DNQMHmfRrZP6MNkB6JBRuBnT7iJfphGkcfaM9ulj3ex4FJZ6JGzVSVXMwP3+A
         046/QJQ2F8xrsv1/wSnqdGZpw2qjFDXRQRT/iDW8Ch5K3FhotK5XvhTiINI2tSuryN
         oDbPZ4skevYFw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
Date:   Sun, 24 Nov 2019 01:04:29 +0900
Message-Id: <20191123160444.11251-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not defined in the standard headers. #ifndef is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ae6504d07fd6..918c2ba071b5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -24,9 +24,7 @@
 #include <ctype.h>
 #include <limits.h>
 
-#ifndef ARRAY_SIZE
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
-#endif
 
 #define KSYM_NAME_LEN		128
 
-- 
2.17.1

