Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB881D6704
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgEQJuA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:00 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38330 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LN018560;
        Sun, 17 May 2020 18:49:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LN018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708961;
        bh=kFCU8CeJzGszKuYilLgB6VOA9Ky2gxvI3bq8b+WwfgQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uNb+5DbNXE36Tga51Q7Ot/clwKzq8bRPWzqorAzWrKKw8vSzjLzOYv5L2LuVGU1qJ
         03VJchRkzwafW7wlZRC0wqV/6Hm6CGuOCGOSytLu+cuk0i0rAMgHf5B4t83Ycufv5Q
         ocA4UDcZ6OQUed8y0mMyLGmE9b3w5WzslC3r/UMvK5Sa1KJWI05H2w1Nre5qXb4wA9
         f2xVW8YHtydpplR/OmCEKe+bm69pAOk7MEIKCSwSqaoLSX/2jRQrafBDFPsLFuS4tX
         JIxpkwFW6UL7Vr1RK+uu77rqBh8BWNrts8Xxb/ehvLlOF5G6gje3WWOPQ3FCiRQuDc
         6ceoZdVPkXAeA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 26/29] modpost: set have_vmlinux in new_module()
Date:   Sun, 17 May 2020 18:48:56 +0900
Message-Id: <20200517094859.2376211-27-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Set have_vmlinux flag in a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 003b6fb2303c..79622939a6c7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -181,6 +181,9 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
+	if (mod->is_vmlinux)
+		have_vmlinux = 1;
+
 	return mod;
 }
 
@@ -2002,9 +2005,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
@@ -2452,8 +2452,6 @@ static void read_dump(const char *fname)
 		mod = find_module(modname);
 		if (!mod) {
 			mod = new_module(modname);
-			if (mod->is_vmlinux)
-				have_vmlinux = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
-- 
2.25.1

