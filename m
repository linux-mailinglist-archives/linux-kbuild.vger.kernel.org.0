Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCCF6D2D75
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2019 17:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfJJPQJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Oct 2019 11:16:09 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:56879 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfJJPQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 11:16:07 -0400
Received: by mail-wm1-f73.google.com with SMTP id 4so1904982wmj.6
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1ARHOj6w9aLyVTJEhzjEUyZm1gwUAbrQST+T57l1TKQ=;
        b=GJzkF6KyMP2v5SqFDiGZJugryBGiWEYtoB5Op7MJqsvBGEf1CmHYnQ8lhAWb8rJ5eH
         U1d3KEhCjV9KKwOYgyXJQ2FjPpDgWhGPRsjzCi3CjTkjf/j+DfstrQNGUtEhO5IanBNo
         TN2iZtJvoFLSVDwtNDfXGsg2Sjjf8e8rdF9pQX1efteHrrB4z1Q77M9PFWlabzr0lrtv
         t7GYMczsCoi8TkgZrhAud5IwHrAmQbSwfT6b7CIJESHL3/S1vbL1e14GevU22E0Ls6Ha
         Aq6QXeBCZ+dmN+V/1MsQONiaamFlStqgk0h2VdqlLhl5jF25igC9mEzhrdhI+yPbiTXr
         bOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1ARHOj6w9aLyVTJEhzjEUyZm1gwUAbrQST+T57l1TKQ=;
        b=uaAbRozVaPAu1/8cghsSVQeNR81Z3Lnt7WMdfW1mOAu5u5mRvyNw4k5fpqym5tS6gt
         sheD6yNjZajrqOv1N9/95j209kIZx4aNUXVF7atZ4VMaP6RCduOT4zKdaf9AbSTeioZx
         WnDVy5TplUCZrqSkaIQ4LLafzoiR6CrQFFCx59dEoohgg1NTS5lvxvwfzDRD3YE5o4VY
         iSma4Y05ZydVfT1+VJUCeGFbdaGwISeJ86ZWDNMxIKGZrApFqLGUOfYFPZqF5lE/Rjfl
         YG4zr3oGXgukuMBjYkH4/4BiQ5kfap5xZRX9bhTqZry5Sm64jSJ8Q/ciXXMW+103sf6V
         lPzg==
X-Gm-Message-State: APjAAAWfPuzSFYNhTpWZhiM5TyTMYR27AGOdJTAJl05+huV7rw+OE9M6
        ia7u8V7QELK4vvsQvO5FOIqa8WYDpDiWDg==
X-Google-Smtp-Source: APXvYqyLuvisTP6JI3eALfLl1SscfJp8IEhzE6/QbZAsoJJkpvtr4f8EkjksGu0SFkAYCwb3cUbZwM1xdQ7ydQ==
X-Received: by 2002:a05:6000:128f:: with SMTP id f15mr8853717wrx.319.1570720566104;
 Thu, 10 Oct 2019 08:16:06 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:14:41 +0100
In-Reply-To: <20191010151443.7399-1-maennich@google.com>
Message-Id: <20191010151443.7399-3-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
Subject: [PATCH 2/4] modpost: make updating the symbol namespace explict
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

Setting the symbol namespace of a symbol within sym_add_exported feels
displaced and lead to issues in the current implementation of symbol
namespaces. This patch makes updating the namespace an explicit call to
decouple it from adding a symbol to the export list.

Signed-off-by: Matthias Maennich <maennich@google.com>
---
 scripts/mod/modpost.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 9f5dcdff4d2f..46137b730447 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -382,8 +382,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
  * Add an exported symbol - it may have already been added without a
  * CRC, in this case just update the CRC
  **/
-static struct symbol *sym_add_exported(const char *name, const char *namespace,
-				       struct module *mod, enum export export)
+static struct symbol *sym_add_exported(const char *name, struct module *mod,
+				       enum export export)
 {
 	struct symbol *s = find_symbol(name);
 
@@ -399,7 +399,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 			s->module = mod;
 		}
 	}
-	sym_update_namespace(name, namespace);
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
@@ -761,7 +760,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		if (strstarts(symname, "__ksymtab_")) {
 			name = symname + strlen("__ksymtab_");
 			namespace = sym_extract_namespace(&name);
-			sym_add_exported(name, namespace, mod, export);
+			sym_add_exported(name, mod, export);
+			sym_update_namespace(name, namespace);
 			free(namespace);
 		}
 		if (strcmp(symname, "init_module") == 0)
@@ -2469,12 +2469,12 @@ static void read_dump(const char *fname, unsigned int kernel)
 			mod = new_module(modname);
 			mod->skip = 1;
 		}
-		s = sym_add_exported(symname, namespace, mod,
-				     export_no(export));
+		s = sym_add_exported(symname, mod, export_no(export));
 		s->kernel    = kernel;
 		s->preloaded = 1;
 		s->is_static = 0;
 		sym_update_crc(symname, mod, crc, export_no(export));
+		sym_update_namespace(symname, namespace);
 	}
 	release_file(file, size);
 	return;
-- 
2.23.0.581.g78d2f28ef7-goog

