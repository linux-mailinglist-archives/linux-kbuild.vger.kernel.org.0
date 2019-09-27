Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D63EC027B
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 11:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfI0JhN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 05:37:13 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:33064 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfI0JhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8R9a5uc001372;
        Fri, 27 Sep 2019 18:36:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8R9a5uc001372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569576968;
        bh=k0hBXKWoJkYYxdDyuOyeX7IT6hvCtlLoJTUWwkZpHoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2NU1Uj+GZgATSlHQ/wpNiFGS13yTeurDYkQ5oWGWobbFSPBjB+S2L6Fw/LgnWkTAq
         hWIRQQ41fCSLUNCBf+HYJZpbU959wGqrEA72oxHXEOjKJMSWh0zUo3N/sSGmjzhqzA
         D32uDOKQCjHot8mwF7RjQ3ysW8A3joNSk4qE8q1zcFV/svc+eMf4VFKUt2JxAYJCKw
         rysk1hb7vz3OotkLSrzSX5ezVfEFv12Sr9ojoceyMo6VmsPBBWJhLrk4vNps7///3U
         yEBu+i2JGF6ZOMzg2oRMYSRJkvsMvIqDtV92F3sTt+tEvDeBMXe70++/0/ZmSO0rt4
         ozmoh+j5CsHlw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] module: swap the order of symbol.namespace
Date:   Fri, 27 Sep 2019 18:35:58 +0900
Message-Id: <20190927093603.9140-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927093603.9140-1-yamada.masahiro@socionext.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, EXPORT_SYMBOL_NS(_GPL) constructs the kernel symbol as
follows:

  __ksymtab_SYMBOL.NAMESPACE

The sym_extract_namespace() in modpost allocates memory for the part
SYMBOL.NAMESPACE when '.' is contained. One problem is that the pointer
returned by strdup() is lost because the symbol name will be copied to
malloc'ed memory by alloc_symbol(). No one will keep track of the
pointer of strdup'ed memory.

sym->namespace still points to the NAMESPACE part. So, if you like,
you can free it with complicated code like this:

   free(sym->namespace - strlen(sym->name) - 1);

I would not say it is fatal since we seldom bother to manually free
memory in host programs. But, I can fix it in an elegant way.

I swapped the order of the symbol and the namespace as follows:

  __ksymtab_NAMESPACE.SYMBOL

then, simplified sym_extract_namespace() so that it allocates memory
only for the NAMESPACE part.

I prefer this order because it is intuitive and also matches to major
languages. For example, NAMESPACE::NAME in C++, MODULE.NAME in Python.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/export.h |  4 ++--
 scripts/mod/modpost.c  | 16 +++++++---------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 95f55b7f83a0..0695d4e847d9 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,7 +52,7 @@ extern struct module __this_module;
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.balign	4					\n"	\
-	    "__ksymtab_" #sym NS_SEPARATOR #ns ":		\n"	\
+	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
 	    "	.long	__kstrtab_ns_" #sym "- .		\n"	\
@@ -76,7 +76,7 @@ struct kernel_symbol {
 #else
 #define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
 	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
-	asm("__ksymtab_" #sym NS_SEPARATOR #ns)				\
+	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
 	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtab_ns_##sym }
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5c628a7d80f7..d171b0cffb05 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -350,18 +350,16 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 
 static const char *sym_extract_namespace(const char **symname)
 {
-	size_t n;
-	char *dupsymname;
+	char *namespace = NULL;
+	char *ns_separator;
 
-	n = strcspn(*symname, ".");
-	if (n < strlen(*symname) - 1) {
-		dupsymname = NOFAIL(strdup(*symname));
-		dupsymname[n] = '\0';
-		*symname = dupsymname;
-		return dupsymname + n + 1;
+	ns_separator = strchr(*symname, '.');
+	if (ns_separator) {
+		namespace = NOFAIL(strndup(*symname, ns_separator - *symname));
+		*symname = ns_separator + 1;
 	}
 
-	return NULL;
+	return namespace;
 }
 
 /**
-- 
2.17.1

