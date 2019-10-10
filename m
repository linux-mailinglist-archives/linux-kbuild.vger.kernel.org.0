Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849C7D2D6C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2019 17:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfJJPQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Oct 2019 11:16:06 -0400
Received: from mail-wm1-f74.google.com ([209.85.128.74]:40408 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfJJPQF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 11:16:05 -0400
Received: by mail-wm1-f74.google.com with SMTP id o188so2758783wmo.5
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IzMPe/tjamSa0KLYQxTKRfMo0szpHPyKHH63Rc8COQE=;
        b=CEhsoKqb1NUOR2q9K12j5UZX10yW1wI2M3yPsx7L52TxlBGNCNvfJ8OpKpFeodUWNO
         A8V/AN3q5wNrJ4f2inCZFsdFJRT8MoUDRp4LP77DqdmmB5/2jnF0zZMk1UzqK9rmTIZN
         7fQFJyk6lzYIeOtWenG5f9RdXOyf5j6OrG914HRXCGVMNAOZURmjzdtQkUvdMfdy3Wq1
         9/iZ0Yap9Hol6k0NlLwvulKLYBo3qG7C9XQzwpqGYI0RZmuzQZXQvkhOtKJ4yXwrpHgi
         D1uQQmY72bE6vHjTxMJalR8KGShZmbyMybxZQDzfEsFjGhTX15OtTM3Ol9doWeF1+ihk
         x69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IzMPe/tjamSa0KLYQxTKRfMo0szpHPyKHH63Rc8COQE=;
        b=OjV/KGlfBYFXKu9fjeG4Ji/YDeASmrUIA60MmfjwXZ+L4lrO+3DhaiMDEL5cXEtKbl
         nN1i4PHl/PFZKwxFuXtFXF63aAfcZoyMDGLaWW6QyO5MALmPbYCDqeScm47VG+yV5E1j
         YkQevWoHcj4L04cNkpv8WoxftJVdJYQ/yBDHrQVrXsEiyUe/PdhlgQ8PLbYYKJ2Yz0t/
         dJzcZArFZSdTzVVjwWe+8CEHNDXc9lAuJgV7P/6W2dpbGOS3rgJrxVsoD2CYApsSJFdw
         hUzolbSRFzz9JhjrQVYGt3V+ba6SFQpK5utHfQktv9Nt1jz0J8NRWgFC6PqdRligUxxx
         kXnw==
X-Gm-Message-State: APjAAAUUV/xKqkVxR43oOz8xcYpO/JdfNFJUMPPDtKVpVSzluTurVRd7
        6mdZ+GjJwfzw9/5of7BqOPxdJcQ1jNd02A==
X-Google-Smtp-Source: APXvYqxUFrO45AenqhkUTcZaTxun64DQq7V5a8YzdTqBy7fIUjqZPr6+DetwheUXxVd12BKdJKq68KIhnd9B1w==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr8720719wre.339.1570720563350;
 Thu, 10 Oct 2019 08:16:03 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:14:40 +0100
In-Reply-To: <20191010151443.7399-1-maennich@google.com>
Message-Id: <20191010151443.7399-2-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
Subject: [PATCH 1/4] modpost: delegate updating namespaces to separate function
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Let the function 'sym_update_namespace' take care of updating the
namespace for a symbol. While this currently only replaces one single
location where namespaces are updated, in a following patch, this
function will get more call sites.

The function signature is intentionally close to sym_update_crc and
taking the name by char* seems like unnecessary work as the symbol has
to be looked up again. In a later patch of this series, this concern
will be addressed.

This function ensures that symbol::namespace is either NULL or has a
valid non-empty value. Previously, the empty string was considered 'no
namespace' as well and this lead to confusion.

Signed-off-by: Matthias Maennich <maennich@google.com>
---
 scripts/mod/modpost.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4d2cdb4d71e3..9f5dcdff4d2f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -362,6 +362,22 @@ static char *sym_extract_namespace(const char **symname)
 	return namespace;
 }
 
+static void sym_update_namespace(const char *symname, const char *namespace)
+{
+       struct symbol *s = find_symbol(symname);
+       /* That symbol should have been created earlier and thus this is
+        * actually an assertion. */
+       if (!s) {
+               merror("Could not update namespace(%s) for symbol %s\n",
+                      namespace, symname);
+               return;
+       }
+
+       free(s->namespace);
+       s->namespace =
+	       namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
+}
+
 /**
  * Add an exported symbol - it may have already been added without a
  * CRC, in this case just update the CRC
@@ -383,8 +399,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 			s->module = mod;
 		}
 	}
-	free(s->namespace);
-	s->namespace = namespace ? strdup(namespace) : NULL;
+	sym_update_namespace(name, namespace);
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
@@ -2196,7 +2211,7 @@ static int check_exports(struct module *mod)
 		else
 			basename = mod->name;
 
-		if (exp->namespace && exp->namespace[0]) {
+		if (exp->namespace) {
 			add_namespace(&mod->required_namespaces,
 				      exp->namespace);
 
-- 
2.23.0.581.g78d2f28ef7-goog

