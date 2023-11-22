Return-Path: <linux-kbuild+bounces-104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4687F3C99
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 04:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19290B2147A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 03:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F6F8BED;
	Wed, 22 Nov 2023 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E1yqsT3Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B4D18E
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 19:48:47 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-280165bba25so4406611a91.2
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 19:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700624926; x=1701229726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dli5291sgoxdBf0M7ZcZCemBOpnn4oJYx/LL1st4SQ=;
        b=E1yqsT3YLm8x6TGPOSPxSmSnLdYJ0cXCSHSJ1SFo7IGo56sXCEFJe5xLQeRW7PmyEF
         kjHLfTOfPXLNitFeyxZlTgHJG2p75BbV5fs96A1K+0b38p46ddPJ/NXy9winayYilZjd
         vr52kJGLIK2MCb9Dgz2xnI+brWfx8MboR80Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700624926; x=1701229726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dli5291sgoxdBf0M7ZcZCemBOpnn4oJYx/LL1st4SQ=;
        b=e0emUNJTfN6x3TGhCHS9WgNPLBiUnwGHlKHFieO6+tgLcGI+wWI3oN6fnRe22CV2eb
         qG2scBOJomzqI05I9fDEGk0RnUQ4T6B5KcZeM4egZgYJ02qVQGSuam3t0c1F+WyPP3h/
         wlMqwJYo2ovWJ7TH2nOp73hDHdEcsykJQGTfeiLGqFdHGBfl+7f4uB//hBK2LpH+tUT8
         wit5ll0RIGVvQi9zMFhJFBPAlsXSUXOlhIK8Emq7MVlbRBAbfFBHk0sMUoe2FPoZJ+t2
         kMHayxeg+IoeeuuRf64I8pKwOhK8yK8pAMtHCf3kL7YjuQBvFMO+jd7BBpdncuvUxaJc
         jSzw==
X-Gm-Message-State: AOJu0Yz0JaYcJOrUkp5c8WBrXd1FiInq8iWhNh9erKtyrGlWe37xCENl
	+S3sf5QgzX+piaNhp47oL0lDxw==
X-Google-Smtp-Source: AGHT+IFVjXM1ZR3Y2Vn54mvt9XyjmYWMc0GfXoY/IyKyfKoyP3+LBBRYkTtIcayEk07Hmy7kFJKAnQ==
X-Received: by 2002:a17:90b:1d8f:b0:27d:2109:6279 with SMTP id pf15-20020a17090b1d8f00b0027d21096279mr1340292pjb.12.1700624926197;
        Tue, 21 Nov 2023 19:48:46 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:1aba:fb75:807e:7620])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090adc1000b00280215e7aebsm300191pjv.15.2023.11.21.19.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:48:45 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Patrick Georgi <pgeorgi@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stefan Reinauer <reinauer@google.com>
Subject: [PATCH] kconfig: WERROR unmet symbol dependency
Date: Wed, 22 Nov 2023 12:47:45 +0900
Message-ID: <20231122034753.1446513-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When KCONFIG_WERROR env variable is set treat unmet direct
symbol dependency as a terminal condition (error).

Suggested-by: Stefan Reinauer <reinauer@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 scripts/kconfig/symbol.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index a76925b46ce6..34fc66e075b7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -37,6 +37,7 @@ static struct symbol symbol_empty = {
 
 struct symbol *modules_sym;
 static tristate modules_val;
+static int sym_warnings;
 
 enum symbol_type sym_get_type(struct symbol *sym)
 {
@@ -317,12 +318,14 @@ static void sym_warn_unmet_dep(struct symbol *sym)
 			       "  Selected by [m]:\n");
 
 	fputs(str_get(&gs), stderr);
+	sym_warnings++;
 }
 
 void sym_calc_value(struct symbol *sym)
 {
 	struct symbol_value newval, oldval;
 	struct property *prop;
+	const char *werror;
 	struct expr *e;
 
 	if (!sym)
@@ -338,8 +341,9 @@ void sym_calc_value(struct symbol *sym)
 		sym_calc_value(prop_get_symbol(prop));
 	}
 
+	werror = getenv("KCONFIG_WERROR");
+	sym_warnings = 0;
 	sym->flags |= SYMBOL_VALID;
-
 	oldval = sym->curr;
 
 	switch (sym->type) {
@@ -430,6 +434,9 @@ void sym_calc_value(struct symbol *sym)
 		;
 	}
 
+	if (sym_warnings && werror)
+		exit(1);
+
 	sym->curr = newval;
 	if (sym_is_choice(sym) && newval.tri == yes)
 		sym->curr.val = sym_calc_choice(sym);
-- 
2.43.0.rc1.413.gea7ed67945-goog


