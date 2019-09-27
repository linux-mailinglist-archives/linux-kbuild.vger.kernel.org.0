Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D98EC027E
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 11:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfI0JhV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 05:37:21 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:33057 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfI0JhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8R9a5ub001372;
        Fri, 27 Sep 2019 18:36:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8R9a5ub001372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569576967;
        bh=vJzF8WlgUqc1RsR95UB9lwwYV0dr5aBFLgK7a4VpJl0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a/t82mTwbwWZPr0/tQv9F1qEmfxY+FFesX4KbzmGMTG21vQhlXMBP7rrvpG/Gvk6w
         EC+o8FZKVJbbAVEZoykh5cD2QqCDz/m+73YH1vmQ2Up3QMvK99h0chvD0XxdoYMafC
         uOsZH+QvFnmPwiHz1IRaSCJXFXASiKeDWhOTxiFDswTY2pRWlD9V3c//TfIpSFUCwr
         Rz0S84dpoQubEEROWm9wXT/T9ga6jnFTjaA5V4G6/pBsqw1cEZTCcCRkj3XXFk4KLL
         2mhnuT7X3lne5Abip9GRwCQrTuntCf8So9MR7YqWsmfYyqDEW/17TOx+STvRxZF6TM
         Cy6NJ4OYl1HKw==
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
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] modpost: fix broken sym->namespace for external module builds
Date:   Fri, 27 Sep 2019 18:35:57 +0900
Message-Id: <20190927093603.9140-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927093603.9140-1-yamada.masahiro@socionext.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, external module builds produce tons of false-positives:

  WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.

Here, the <ns> part shows a random string.

When you build external modules, the symbol info of vmlinux and
in-kernel modules are read from $(objtree)/Module.symvers, but
read_dump() is buggy in multiple ways:

[1] When the modpost is run for vmlinux and in-kernel modules,
sym_extract_namespace() correctly allocates memory for the namespace.
On the other hand, read_dump() does not, then sym->namespace will
point to somewhere in the line buffer of get_next_line(). The data
in the buffer will be replaced soon, and sym->namespace will end up
with pointing to unrelated data. As a result, check_exports() will
show random strings in the warning messages.

[2] When there is no namespace, sym_extract_namespace() returns NULL.
On the other hand, read_dump() sets namespace to an empty string "".
(but, it will be later replaced with unrelated data due to bug [1].)
The check_exports() shows a warning unless exp->namespace is NULL,
so every symbol read from read_dump() emits the warning, which is
mostly false positive.

To address [1], I added NOFAIL(strdup(...)) to allocate memory.
For [2], I changed the if-conditional in check_exports().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3961941e8e7a..5c628a7d80f7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2195,7 +2195,7 @@ static int check_exports(struct module *mod)
 		else
 			basename = mod->name;
 
-		if (exp->namespace) {
+		if (exp->namespace && exp->namespace[0]) {
 			add_namespace(&mod->required_namespaces,
 				      exp->namespace);
 
@@ -2453,7 +2453,7 @@ static void read_dump(const char *fname, unsigned int kernel)
 			mod = new_module(modname);
 			mod->skip = 1;
 		}
-		s = sym_add_exported(symname, namespace, mod,
+		s = sym_add_exported(symname, NOFAIL(strdup(namespace)), mod,
 				     export_no(export));
 		s->kernel    = kernel;
 		s->preloaded = 1;
-- 
2.17.1

