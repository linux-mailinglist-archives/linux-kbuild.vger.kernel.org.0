Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099801E9DB3
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgFAF6Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:24 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40026 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaMF023694;
        Mon, 1 Jun 2020 14:57:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaMF023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991072;
        bh=WmqEx7oXxUtLIW9w8WYHcY4WT5S6a7AqK82zGiT0xZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sAkMYyJYr6Y3oc9YYfu2PEljwb2DsmCPiLTqLo53r2vPghtV5ZOky2y+xrvhxOjad
         IMu4/FR6AwYA7bbmOYE16NY1oWSJEm97aqrcAhU9Zys5aWwsCUPjrDrIMQoh1mjXUV
         ZXpYYL8UMw15DWKEliiY7IEoVoKoypiiMtuucc2joRDues9v2uew3TAPSYRuwdvQ4H
         8M6wElB8VzFctZVWEaM444TwrioPavMQgqRYttaQJ2vD6QGyRyqYqrXxadkTaTq0DT
         2gp5v7Vo+cSrBeoGDlqzjfwX/2fiGyoQUh+V0KlIG5JET1PWvTBSnw74IMAiwffWQ0
         HbnhWLu6fHAKg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 36/37] modpost: remove is_vmlinux() helper
Date:   Mon,  1 Jun 2020 14:57:30 +0900
Message-Id: <20200601055731.3006266-36-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that is_vmlinux() is called only in new_module(), we can inline
the function call.

modname is the basename with '.o' is stripped. No need to compare it
with 'vmlinux.o'.

vmlinux is always located at the current working directory. No need
to strip the directory path.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ebfa9b76ba92..a3ffabf4eca5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -88,20 +88,6 @@ static inline bool strends(const char *str, const char *postfix)
 	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
 }
 
-static int is_vmlinux(const char *modname)
-{
-	const char *myname;
-
-	myname = strrchr(modname, '/');
-	if (myname)
-		myname++;
-	else
-		myname = modname;
-
-	return (strcmp(myname, "vmlinux") == 0) ||
-	       (strcmp(myname, "vmlinux.o") == 0);
-}
-
 void *do_nofail(void *ptr, const char *expr)
 {
 	if (!ptr)
@@ -181,7 +167,7 @@ static struct module *new_module(const char *modname)
 
 	/* add to list */
 	strcpy(mod->name, modname);
-	mod->is_vmlinux = is_vmlinux(modname);
+	mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
 	modules = mod;
-- 
2.25.1

