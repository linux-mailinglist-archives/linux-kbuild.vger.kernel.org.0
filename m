Return-Path: <linux-kbuild+bounces-7388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEBAD0C0A
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 11:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180C718904DD
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6688619CD16;
	Sat,  7 Jun 2025 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0pR+KCp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE1184F
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Jun 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287306; cv=none; b=QUn+4z5yVNbPqtQn/S/nY0LoAJNam4JRsPHkIsr8w1Fpdo4d9aIl/d0y2QCXTX99mDEPjWC0/TCx9MKBMzEs+hvu+OehuRYaEaaU0p2pW2Vn5mZSpLGDXuVJh2LFCLKDLBr1mZUuCWFwrNeSanL1F+N/XyACLG849WyFDxWy9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287306; c=relaxed/simple;
	bh=ip6yMENfy5Lvdi2LXjCLdqWP+VjEI3nrJABGN52iU30=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OaNAEsLODDg/9usxdV0/9TN/iSpIUxFWULt3UiFH1E2RcEkXVUPrsf/pqpLHMOac4CBacbsdXvxZcpT0ewiRF8ghKo8DPWsyobTKRtduvLHudRHpS4R6GEjHPDGdWERrMSEGEDnZ3LP4CCXsyQmup9u2nSEvnX/kLloKR9mAGlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0pR+KCp; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-23539a1a421so25521385ad.0
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Jun 2025 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749287304; x=1749892104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppiJkAaGrWwvjv8JUgOfZe+GBpRGem5twsH0iulvIAY=;
        b=X0pR+KCps6hh/gyRqhQQbxnyTz0D5RXANd/2CCgikLsmhoalnrwkyKCpuRPbXTZmTK
         n5jv9qnSrcSbV4fZeLo3554fm5RG1chwKlIkn/glIe7XrNSWoRHGgU0ncphqR56K5HVC
         EUTzLnVCa0/ht0NvMmeUZdBXoO2bGrGElAADgUvKrcbZyC4a859dCDxuk4kryjiDjyu0
         +P+CWZSw13//DyO2Qnw03UyXqBe7NZrOPRetsjMJOJeHUXjFvhOKBoEnLR2UMJBOZTqo
         7U7ra+ZScKgrScBhpVwynCu0OEJVsLRkpGi0wvWtaYvAm//XBS4/MGVTxCDeJesB5X/C
         0KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287304; x=1749892104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppiJkAaGrWwvjv8JUgOfZe+GBpRGem5twsH0iulvIAY=;
        b=RJwsk1Ga2IF0ozgOWdliyCcgFTiEJDHdPPzSCfwlPPuALYryHkiz1BYHhCJjvaZlMH
         KiCGewVa6kMY6DGP6obp5yYzUa/0QABoiEFXbOdgxhZY63UH32rjXe90P4WdAl0Y5VqX
         1RamBMmvv5IdXQf/C7i76hE/TCxQ5tFh0bPtQZstJ2jdk47v9NGQnVtPFAGXPqTh68sz
         sGJV4SHhf8y+0XxFB9VIzTzbksFexEhsuDX4Np4fEIWP2AIxjSnKiTfPmrstjdGrnSRL
         9OGEln220K5XSBHbHKsgIQ3g6EVnhRqX+3SQBxDy1aZ5c5hDIykcBgt2H1Od9l2dLh/n
         RkYw==
X-Gm-Message-State: AOJu0YxyG7mqNSc1ePGNDbQNfcwZOITML5kvTOUAn0esbJMzQFflVX/N
	bjLJ0kCs1Bcz5pDipUu8QyK38yAJ5gawk9ZxJKbM5ITFrYkuDXp6Vrfm3bLKiPtiYAc+B+im
X-Gm-Gg: ASbGnct5UogMLzsRBBbbEqGuDAhCDs8EyARF8N5FXQwAxEE27hEcqTi/9mxrx/hHgQ2
	hHVMRTlkirzLU48Xw4Q1ivGjo7qhSMXtQGnhKT5IJ+LXao25Pnji8T6xEPik0lvPdI+AbWGWYID
	cC0bl2WjwN7fepy4HuEma6TipO88njcMsman7da6L/RRUF48QXwVrz1xcZcEuvDhR9VTltuKBqQ
	9GLXq/RfCuaGAeOhkaOl3QOQYFs5MeNWictgNc2Zgi54TgWI+0ej8oxWnl30RQqAFyMRdYavW+R
	VUmQczJMK0i8WxHLUbLYQMkIC171gsqWKZV0dsiagcJIUaTP
X-Google-Smtp-Source: AGHT+IEFVimkCUL8H3GyocVGYuKLV9G7raPFWD9m81tEjxJokes4oRmkhXM2LGP+CL4tFCkyRceHYA==
X-Received: by 2002:a17:902:d2c6:b0:235:efbb:9539 with SMTP id d9443c01a7336-23601cfebb3mr88692965ad.17.1749287303881;
        Sat, 07 Jun 2025 02:08:23 -0700 (PDT)
Received: from localhost.localdomain ([124.70.231.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdf5adsm2438076a91.34.2025.06.07.02.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:08:23 -0700 (PDT)
From: huyubiaox@gmail.com
To: linux-kbuild@vger.kernel.org
Cc: ndesaulniers@google.com,
	masahiroy@kernel.org,
	huyubiao <huyubiaox@gmail.com>
Subject: [PATCH] modpost: Reduce the log level and fix the errors causing livepatch failure
Date: Sat,  7 Jun 2025 17:08:00 +0800
Message-Id: <20250607090800.3033-1-huyubiaox@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: huyubiao <huyubiaox@gmail.com>

Since the commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost"), modpost has become stricter in handling EXPORT_SYMBOL, making it incompatible with older versions of livepatch builds.

Is the error level too strict? In my opinion, even if there are issues with the use of EXPORT_SYMBOL, they are not necessarily fatal to program execution.
---
 scripts/mod/modpost.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fb787a5715..13f81392a4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1055,21 +1055,21 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	label_name = sym_name(elf, label);
 
 	if (!strstarts(label_name, prefix)) {
-		error("%s: .export_symbol section contains strange symbol '%s'\n",
+		warn("%s: .export_symbol section contains strange symbol '%s'\n",
 		      mod->name, label_name);
 		return;
 	}
 
 	if (ELF_ST_BIND(sym->st_info) != STB_GLOBAL &&
 	    ELF_ST_BIND(sym->st_info) != STB_WEAK) {
-		error("%s: local symbol '%s' was exported\n", mod->name,
+		warn("%s: local symbol '%s' was exported\n", mod->name,
 		      label_name + strlen(prefix));
 		return;
 	}
 
 	name = sym_name(elf, sym);
 	if (strcmp(label_name + strlen(prefix), name)) {
-		error("%s: .export_symbol section references '%s', but it does not seem to be an export symbol\n",
+		warn("%s: .export_symbol section references '%s', but it does not seem to be an export symbol\n",
 		      mod->name, name);
 		return;
 	}
@@ -1080,7 +1080,7 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	} else if (!strcmp(data, "")) {
 		is_gpl = false;
 	} else {
-		error("%s: unknown license '%s' was specified for '%s'\n",
+		warn("%s: unknown license '%s' was specified for '%s'\n",
 		      mod->name, data, name);
 		return;
 	}
-- 
2.33.0


