Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8858D116809
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2019 09:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfLIITg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Dec 2019 03:19:36 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45278 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfLIITb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 03:19:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so6319814pgk.12;
        Mon, 09 Dec 2019 00:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lVXrcLZKGANsU8tPDGf4zTebGjz1MfI/kI2qeZ91X0c=;
        b=pUULFXI00O+d51QO2CrfHOGqts6TkPmURJGFY2Hx5h5LRwjxA8LLpCl739Sn+zURkx
         0Syf+TK2h/Gy3IEWyXtwGiSSI8r5LyVhyLmMuE4qdnTalI/GSRX75z8LVVBDRHvjD4uK
         44YJRIWeyZWDrdfhwt/GJU3OhAVMeKiQ4eJl6CoJ3KMfSofmawBsx5aY/7Auz8E0kRIB
         PR7j380sZmXieN2MoRKIyirgyajIskk1esqF7UiAeES30k4vtyX1yIXBr8uVfqxrleMa
         oF3ec6yQxzRpJNi+CiWlZU+8BXzRYISf/Js/pT8DfV5An4n/FyQm9CrfUYI1Ln6gIr1s
         vDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lVXrcLZKGANsU8tPDGf4zTebGjz1MfI/kI2qeZ91X0c=;
        b=dEffETPOJEtuVbHJFwZYBymxD/jLXDc247Tn8Z2RQDK47hRW8gKOgaRIN1cVqECOj5
         8TI55zGVwbbu6nYycNHFhiU2Kq/QDM0jFp6sI/KlhHrQ3DMLqi97oV6Jnejt1Rwvyi4K
         uWFeyJ6uoIJ77CLUfITFp/mUT/ySw6s1bvHF/HtBKGh/mCx+0Ie9QXHDiWmumTwc/IHv
         BhAp18gL9HJCtrd+IRnGq96aW1vLKNE3Rn8wMm7ysaVhgf5DFzRHWmOUTz2rWpo4mMN3
         ObNs4T1h0VBujuTDJ0/GenoI2vcsVjEG0C/nHpHU00YAIvosDwIkmzHmir680TRZLw/i
         iQkQ==
X-Gm-Message-State: APjAAAX+2RrVVCoEc1766763/bzVD1FjOr2mDwDjwj5xzSbG0UPx+l50
        DQHM7WReqF7O2i8qwXB9WTqNlBBhLgP2DA==
X-Google-Smtp-Source: APXvYqxbfbeTkbEc25PmFS4JfnnyWYkx3IwK3B0rBjv3tu1zrkK0Iv1wMQ6f28/CtpitvSTOFpYndg==
X-Received: by 2002:a62:3892:: with SMTP id f140mr24826780pfa.190.1575879570010;
        Mon, 09 Dec 2019 00:19:30 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
        by smtp.gmail.com with ESMTPSA id u2sm23810375pgc.19.2019.12.09.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:19:29 -0800 (PST)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Thomas Hebb <tommyhebb@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kconfig: fix nesting of symbol help text
Date:   Mon,  9 Dec 2019 00:19:19 -0800
Message-Id: <4bbeef61f292caaeae4b555edf42820d113a4d4d.1575879069.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575879069.git.tommyhebb@gmail.com>
References: <cover.1575879069.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When we generate the help text of a symbol (e.g. when a user presses '?'
in menuconfig), we do two things:

 1. We iterate through every prompt that belongs to that symbol,
    printing its text and its location in the menu tree.
 2. We print symbol-wide information that's not linked to a particular
    prompt, such as what it selects/is selected by and what it
    implies/is implied by.

Each prompt we print for 1 starts with a line that's not indented
indicating where the prompt is defined, then continues with indented
lines that describe properties of that particular definition.

Once we get to 2, however, we print all the global data indented as
well! Visually, this makes it look like the symbol-wide data is
associated with the last prompt we happened to print rather than
the symbol as a whole.

Fix this by removing the indentation for symbol-wide information.

Before:

  Symbol: CPU_FREQ [=n]
  Type  : bool
  Defined with prompt at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
    Selects: SRCU [=n]
    Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

After:

  Symbol: CPU_FREQ [=n]
  Type  : bool
  Defined with prompt at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
  Selects: SRCU [=n]
  Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 scripts/kconfig/menu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4d0542875d70..25d836aa60fc 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -831,18 +831,18 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		}
 	}
 
-	get_symbol_props_str(r, sym, P_SELECT, "  Selects: ");
+	get_symbol_props_str(r, sym, P_SELECT, "Selects: ");
 	if (sym->rev_dep.expr) {
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, yes, "  Selected by [y]:\n");
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, mod, "  Selected by [m]:\n");
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, no, "  Selected by [n]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, yes, "Selected by [y]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, mod, "Selected by [m]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, no, "Selected by [n]:\n");
 	}
 
-	get_symbol_props_str(r, sym, P_IMPLY, "  Implies: ");
+	get_symbol_props_str(r, sym, P_IMPLY, "Implies: ");
 	if (sym->implied.expr) {
-		expr_gstr_print_revdep(sym->implied.expr, r, yes, "  Implied by [y]:\n");
-		expr_gstr_print_revdep(sym->implied.expr, r, mod, "  Implied by [m]:\n");
-		expr_gstr_print_revdep(sym->implied.expr, r, no, "  Implied by [n]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, yes, "Implied by [y]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, mod, "Implied by [m]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, no, "Implied by [n]:\n");
 	}
 
 	str_append(r, "\n\n");
-- 
2.24.0

