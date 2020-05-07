Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8881C99DA
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2020 20:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgEGSvg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 May 2020 14:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbgEGSvg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 May 2020 14:51:36 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E582824957;
        Thu,  7 May 2020 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588877495;
        bh=jS1JZUc/306T2uxJxfJMUJJif1/i/lbkHg/ck6XKeHg=;
        h=Date:From:To:Cc:Subject:From;
        b=RNyFnZUIZ90jofZMnACoBPDAGi9K3ssrewWXIWSHXKu2NAbgmSsBTd/aLRrAbmvj6
         LpKjnNlOb6hZRuzH9Y6ITmOQT5qP7rdwqalohVkgD2VVByrvQq4LvFG3v4V819+6sb
         xDs3H3kjn0ZehPI2UXNs4Ro+zePY/TaeUt8q9J0Y=
Date:   Thu, 7 May 2020 13:56:01 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: Replace zero-length array with flexible-array
Message-ID: <20200507185601.GA14759@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 scripts/basic/fixdep.c |    2 +-
 scripts/mod/modpost.c  |    2 +-
 scripts/mod/modpost.h  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 877ca2c88246..d98540552941 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -160,7 +160,7 @@ struct item {
 	struct item	*next;
 	unsigned int	len;
 	unsigned int	hash;
-	char		name[0];
+	char		name[];
 };
 
 #define HASHSZ 256
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5c3c50c5ec52..4d4b979d76be 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -166,7 +166,7 @@ struct symbol {
 				    *  (only for external modules) **/
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
-	char name[0];
+	char name[];
 };
 
 static struct symbol *symbolhash[SYMBOL_HASH_SIZE];
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 60dca9b7106b..39f6c29fb568 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -111,7 +111,7 @@ buf_write(struct buffer *buf, const char *s, int len);
 
 struct namespace_list {
 	struct namespace_list *next;
-	char namespace[0];
+	char namespace[];
 };
 
 struct module {

