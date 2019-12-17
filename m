Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637881231D8
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 17:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfLQQRt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 11:17:49 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45574 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfLQQPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 11:15:55 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so3379067pls.12;
        Tue, 17 Dec 2019 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a49dwJ8GX08Y5sJ0dDPnBsYrZ13FPO16JKZiTZ6hkms=;
        b=IRavlYuEjd+u06gybsJolSbXoqfJgBxTJ+oPzmUlxUVgFNhE1kC+HLi+K+xYGPZMKz
         PA+CtlIqLl0OswigyyBhLzStx033bCk09W0InIpPhuJ52JCEIfaJ6zpja4kd3IJOAy7H
         26O07AmMzQjNpkEKkc5y/BMPopy1Romq0iipCWmCzJkPPIDfh6rOW2aXA3m+/QzVUmaP
         nynn8SdAKxsqI90PZacNfQsqC+AuOYfMnXRnR74sw7GFJLpVIxMgRVwtiU6f8VNdEQYf
         AHKke3XcM4emb5M7VMTtfBSV6pO2dHWPFhKytYxqcG2iIOWR1LvybRfCIJ7XGvi7CEQ8
         HD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a49dwJ8GX08Y5sJ0dDPnBsYrZ13FPO16JKZiTZ6hkms=;
        b=OCKowUsFwJv51uYPMnaiZfnmRjd1XmGgdAI9ytSMNiqB9fCiryUL5kx6fML2CUk87B
         1y9QL0U0ciHTF/86guSpVxsHcQeOpYPYlGXWfYhSIr6IyMdQr6/A/kmLy52ywMCPZGTO
         ql02GsxPzEcc4UYrm0vPedib3j6Y8GnH868BI7cTzUM7TH0Mks+ey6uxnYgfCP53hXYW
         jdkbCdW1q2rDSkEfZtIqwxlsE0YRCEhhs6YVE9QI1685z5RugqIgZG+XZcnaMYyAoRAn
         Tso55irFSkcfqx6OCZbxqqs5GU+apVNcD+Dpv6l/MklG/17ELDibHm+wSDqHwWzJgynj
         nSmg==
X-Gm-Message-State: APjAAAVTx/MfGVOAdFd8qsO3BdtBFVE2bcK7/XL1QCRk+itW+0iJSyLR
        jSVznLjV1Gt//R+ismRsrfJEWoNNgfX1yw==
X-Google-Smtp-Source: APXvYqzGmI37M9DuaeknFkqQ7u6d7iZv/EDR6mDyLEphhXkh/Z7w9YYwCliKMgFdS7tdbRgTZ9Cs+Q==
X-Received: by 2002:a17:902:aa08:: with SMTP id be8mr23248826plb.255.1576599353911;
        Tue, 17 Dec 2019 08:15:53 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
        by smtp.gmail.com with ESMTPSA id k15sm27704122pfg.37.2019.12.17.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 08:15:53 -0800 (PST)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH v2 3/3] kconfig: fix nesting of symbol help text
Date:   Tue, 17 Dec 2019 08:15:45 -0800
Message-Id: <51c902d29bf8748c411f78405f9638109a5cf4c6.1576599202.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1576599202.git.tommyhebb@gmail.com>
References: <cover.1576599202.git.tommyhebb@gmail.com>
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
  Defined at drivers/cpufreq/Kconfig:4
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
  Defined at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
  Selects: SRCU [=n]
  Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

Changes in v2: None

 scripts/kconfig/menu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index dcf7f32f0bba..ef36d1cf2a76 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -838,18 +838,18 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
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
2.24.1

