Return-Path: <linux-kbuild+bounces-8214-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCBB130B8
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 18:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C7A189267F
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 16:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D609021E0AF;
	Sun, 27 Jul 2025 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6LaPlvm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E421D585;
	Sun, 27 Jul 2025 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634684; cv=none; b=q1cukXdWpScZ2ng4/m0/aS/nM3g2XDh0vrfr1aQkwerFz9kBtemKr0fa762teWPIxC9OrsAl+ut7EctqkKSkgODeo1u7IiASa6zOjA9E2715KHxQbp/eFJbiKi54JVXIZRq0auySVPcYTWj0I0IdcMqsjQ24q1JhgyD+s/ulmnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634684; c=relaxed/simple;
	bh=aky/KLnG+W93c3bsyO6G0smfD+Xe1O+Cyczp3AKHLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTKyz21/MvU+IKwq01AmqwLP3i1iIC9CpX+v0zjbB/aAe8M5vXRzggCQVJQpPoP5qs2w3ej/wD00qvIlYvGKwBoSo6rGW3IXBs8YbGxQ7T75i/aJpq90MmeEejCcDFxC+CMBSnD0KyToDAkKKa2TAyZPOBeQGdtPCTqPUQ0ppdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6LaPlvm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31ecdf5faaeso425872a91.0;
        Sun, 27 Jul 2025 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753634683; x=1754239483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV1RESAXwwVRenoKtubuHGOUDKpGE0S2kgTUEl6ZcyA=;
        b=T6LaPlvmit1v0oPSAG2IPaN0AEXwdXuR2dbg6fzvhvUeCUXp38/ZswTjW90K7nN1jZ
         GGO4HjiPnt1wdctz0SD5ExIEgqfofpab+n+Mnv/EFbEn1zCvt0aEicJtWD+/YJihIUQ5
         X4f2qjAtCqonM+AOTNQBz1A8clyaWEwXkCn2UZARem2u4DlWRMDum6dAic2QAMhxdFPV
         h3fPLMxP9TN7MxNeB3xBka5AiOCDRzbVmEnXijn59pLLloSU/8o0gCgYllJDXBKxwIup
         M8J/F0Y0dZ1Z5onb5pGwKVPCfi7jiW0KWvevYidB52/xLfDMbY2kXbnA7cbbMDle3+pC
         hDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753634683; x=1754239483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV1RESAXwwVRenoKtubuHGOUDKpGE0S2kgTUEl6ZcyA=;
        b=KHWnyLhVWTxA8Suxl3vy38YsZdWrBa+I63hTqSVC8GwUwB4TqE6ltmM/BXj8C/n39d
         L+3sPaxj6Gl/GziObEeiDijzpd6FRGKiUPZf1+pSXG6e2gLo6mIxruu5fRykzfJGJCvf
         ltT/1Ju96NDm4sXt80IUjIyx9R2XFxECXSL7LdBvIyAfVK1brzCtb7YNqTAZrc7+U0Ke
         ti9Nxn1Zg3YBGSV53+oCoBcAXjgCqBUQNK7pcKwHyh3euaoSVMDMMgAMAmWdgSgMbLfz
         jJTGBTT98CnS9INsJSji9ls8yRFP3v0VWGPviHryU0NJdlIkfXvXfStN8VTmD4uDMAg0
         v3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVuAICPjlZDIkeJuoyXTtaD+uzgfs34vmSSUiQcFbgAYPdZcZ2N0FCW4mFzbDBUDwqhvSbIDB2ztaz8DU1b@vger.kernel.org, AJvYcCXF3JKBhOnqifQxIWD9lkFP2XogqqlDqyj2flKy8knVgXfrcgRB6NLRtsS5Uz/9UEmBtt++PyhK/b9zHgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdqYIj2ewN7XaBM9XzwoRxjA0HLJ9pTU0sA/WmKxe+b73nFdt7
	RFb8eRPLpbM84c6uPHSAc4+/2Kk8h9tHlbJOWW+sid1E77qHzIcs8ZEazGRmNyyvwlUmdQ==
X-Gm-Gg: ASbGncvvvAyb+VC/mUskysFG8aLg4IE8WzCNramYKHMAPgBX156mI/Fib0j2/2EH+GA
	QARTPtvFz1w20qr2TkNSeGIAd29oXbdHG6jbk7E0HV2Wi1Jt3+fyjji8xDEndQNhj9bWEZZXWya
	Dx/WiG5VhNc37/6oK9JXk3K6XwHKAcP4RRhyhqIbdxc9k/vVqqdGYiEisMH4Npoz0ZK0ZcTnpS9
	XexC0fijY3E75fpBxnbiI9KS9S1jXXBKojSU8dZkytPUF59DCpPMGptumEzuSbGM2t33IN5FyWZ
	19poqmM2chqeOSV2mSHjnb975yxQw07v5iiQXWYSNqQxq2CwTKCchZNMcgHlrufq3RqhubLt67U
	IJ1OyCQtDP5iBWGiLLtAUajLtXEiWeFvDEy1Q/9IiMQ==
X-Google-Smtp-Source: AGHT+IGUG0ghBNZsPR0rorkBHAJ8wPLWZmy2ouoqQKwI9pxz+BMioHuHTTCL9habl7Hw0C7IuoGoTg==
X-Received: by 2002:a17:90b:5249:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31e77a45975mr9993425a91.34.1753634682428;
        Sun, 27 Jul 2025 09:44:42 -0700 (PDT)
Received: from archlinux ([205.254.163.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ef50e2946sm254948a91.21.2025.07.27.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:44:42 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
Date: Sun, 27 Jul 2025 22:14:33 +0530
Message-ID: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. This patch replaces
it with strncpy(), and null terminates the input string.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 3c6e24b20f5b..5e4a131724f2 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 
 	if (!init)
 		instr[0] = '\0';
-	else
-		strcpy(instr, init);
+	else {
+		strncpy(instr, init, sizeof(dialog_input_result) - 1);
+		instr[sizeof(dialog_input_result) - 1] = '\0';
+	}
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))
-- 
2.50.1


