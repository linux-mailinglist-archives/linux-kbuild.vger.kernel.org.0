Return-Path: <linux-kbuild+bounces-8206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C83B12C13
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 21:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E48A1897C65
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 19:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4550028A1D7;
	Sat, 26 Jul 2025 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJKmfSWH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8315289364;
	Sat, 26 Jul 2025 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753558997; cv=none; b=Ht9KG2GuvPg4sI08tz7T3Vu8vmXJIVsBZfrLJuRjQtDZrDpQIs3+FgSouaPuZYixSrd3JWZBwqy6mOcukEU5TOiPGbJeEmDjWOIFekhySPvaKJ5ehN7MK2PqrESZLdfIu26znmG2vV38tOocdT1m4Ylv9Sk0/VpiXBvWu02WYTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753558997; c=relaxed/simple;
	bh=ewwAGXYQx+W8x+pd7R8Jympoa83WOwHhV70nvSBXx2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=csFjDN5o/ukc+S84AjF+kYgF80lFOBdiYKulryw4Klbxgzd1vyVindgHxUrahGKoqf8JDU6md6mEShvqftjJ3ZIiJdNmysYzxJLRAd/MLA7BgUkUrcftaC5CjZokmNgGTn8V2uQ73PqvxkxdSsiYHBIugw/grUszqn5T7InBYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJKmfSWH; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b170c99aa49so2370422a12.1;
        Sat, 26 Jul 2025 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753558995; x=1754163795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htr25Q3EqoJs/RnKOvRYvkQWeNG52TSDYyn5JmIh6Ug=;
        b=XJKmfSWHBia3/lWvkUGoComIf/r8wk6Gsp+eS48Hll0Q0s8v9WsKa3Yu1YEU1IBM95
         1HxxutIfJB7QN3lAy9XteWwxIFeFLRicUMWTOmH55IEJkY3hxF816zXwQyZkGju4L0mc
         NKu2jQvx+iuNNDMOrpPGcOkAMEljIrZHMpvPYTorpjneigkpF1pMxJVl0uBtSQGzKas7
         COu53yW6XDXgR9CY1wspfmBo6tLspItXAw5OpgH3qglbnEHuGpRCeofYsnALuYmrItvM
         0cEHV6aE3N+zRU2WiHVk9rqMRfOrvf/3GCBJVvVZ3Xa04eEAQ4zYbL7PQwJ3XMg1BFIb
         6s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753558995; x=1754163795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htr25Q3EqoJs/RnKOvRYvkQWeNG52TSDYyn5JmIh6Ug=;
        b=Bnts7gxYlfwiQvLvsgQiu38WikNXIIhthj7fr/W2ITsyDc9Ip5wUBoDAuK9x0Zxy0N
         +OxKgLtc4yJ8Z0RDnCMMWkJQwmbAs7fvNo5SIgHCSKsRaO8OKaTsji1BxW/ksonnLjQa
         WgIAsr54KFjKKAI0txQSeiOmhHU6Rr86/TSLn0K6VffyQb9t8b0uG+cdCFMPSwPiCX8c
         tWFeTWL2X+7C45f62f/nbkS/P4rO3re6mU0emp4/2mShONSm42DUx8iXjrJHob5Dd75R
         QnTZL2n/cM7SqUYxFRaUnhYFchsHX84y5s6bXVfB+ysCIHxBCS34fqW2y+udcwKiGr5N
         mfIA==
X-Forwarded-Encrypted: i=1; AJvYcCUqeIpSnD7lLr4WonfGUImUvNKlv14rQ3lN+BkbYuVKDg4Buo2o+HWXA5mag3Dg773mCqQs9UbcDno4sys=@vger.kernel.org, AJvYcCXpVfbah3lfj2BOAoMDkVkoldHY2eCa0068bCiE+8T+DB6qppAcsmoXRig1vulfkwq1uuvUY+LWBTDjdNEf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjLypNt4J2kw0RuwlojXrFy4DNKuRlyS00sWUfENI2nd6hanMX
	nKMM2l5PNdJm9bKUZvjKUMHu3lcc5xrh6a8lSNwGutlpwovwxRLOnAsv
X-Gm-Gg: ASbGnctHIa2eWhD6QacNTM/QfKjXkUyyi8M4HLUF//yl8njVlwrO1OAZLe6jidoXp7Y
	4CVapUwaWmnfiw+pP2Udv5ouammWIboN8V0uvKkagMQHlnauMdJC8rwpq8Cy3eBafkGwgrfzwqN
	xjTOWQO49S5BiytYzmx+inkdcxu3jvji0Av77NXBzfpIAdqDJrPjjqXh8sUDwD3oAseYNwo/3Uw
	mXNs/tQUqNk3cEB0yMoc9iS6W8r5wVYolhd5hPX9foMq6EZej3jzfqQZqTS25zv3r/QbM5zrffD
	F5c56Hv8kEB+7zBSYdTovyzwQSu7L9vZ1Cbt7p5a6D3jUyVT2OaAeFg3JUGRnYsVV3AfR9Chw+n
	bDHLfZ+nQaSt/JDwoPM0h2doK9EkdLw==
X-Google-Smtp-Source: AGHT+IHcNOhaDkQvXHeAcX3tHTWFDDHAIQV3WPJV0TCZr8nlgyFIHZC5qMHEJldAhEnwV4QtTy0Xmw==
X-Received: by 2002:a17:903:2f46:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23fb30be14bmr105687575ad.29.1753558994884;
        Sat, 26 Jul 2025 12:43:14 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe56c407sm21996955ad.192.2025.07.26.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 12:43:14 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] kconfig/lxdialog: replace strcpy with snprintf in print_autowrap
Date: Sun, 27 Jul 2025 01:13:07 +0530
Message-ID: <20250726194307.182093-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() does not perform bounds checking and can lead to buffer overflows
if the source string exceeds the destination buffer size. In 
print_autowrap(), replace strcpy() with snprintf() to safely copy the 
prompt string into the fixed-size tempstr buffer.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/lxdialog/util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 964139c87fcb..b34000beb294 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -345,8 +345,7 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 	int prompt_len, room, wlen;
 	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator = 0;
 
-	strcpy(tempstr, prompt);
-
+	snprintf(tempstr, sizeof(tempstr), "%s", prompt);
 	prompt_len = strlen(tempstr);
 
 	if (prompt_len <= width - x * 2) {	/* If prompt is short */
-- 
2.50.1


