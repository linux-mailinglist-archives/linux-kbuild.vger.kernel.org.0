Return-Path: <linux-kbuild+bounces-9136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93EBDA25E
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 16:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D0F42031C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFCF2FE57F;
	Tue, 14 Oct 2025 14:47:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2492FE04B
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453228; cv=none; b=bjQ6VMrzABrM+k+01pgiT3ECbhMMrr/yy6ZEosbcEOTivkNUlR3wpDWt2aJ2cKQixJD1NwHa4H4tPGbw6wrO4H+dUtG1kbVz9hl3ny9H0l9PQ72jHoF9Cl7gXeAE5mv68slrbdDE6Bm4iuesuiGdDDeHraie4NgxBwt/aMzrMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453228; c=relaxed/simple;
	bh=hzL27Qiz1m2MYuZZEiql+Cp5XMXOC8gsN35W4EUKEN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o2OnkUGB0l0psFxmtjYDCJbJGI2HoomBtnxXYqkDy90iqFdDH3LNOBfB0aKTa2XcCBqSPboWR0AWJ4g16yndqk6IKjusyjkA/2SwlvH20J+wnkgoIf4oQSBTOsRifwYycBxJqRcE9KM/Te58sTFawoSWXji2FJKSkYHEqBjhEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horky.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horky.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso870370666b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 07:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453223; x=1761058023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOBlUdmQ86aDkoZ0YOztFqBVBPw1Dxd+pEmReFgfDNk=;
        b=O/tDidI9AmPXrd0M4CNH8iwgIdafXQymhVP1CQSG1N9Dc2nYahGFiXjtaJ3fFbMGLj
         ez0g4bnNp4NnBI9/cF9OjVCnk65lXb8fYUOvt22N7XuyKnCPgXN7lIk+MmtDCZCkdkNJ
         bRenVvbcXTUyAztJ15YAMpcxP32Pc0YSXWwLX+7vzyDz5BKUf2gIiEv2RPB1IQs3P0+H
         xHy/J0MuIXQjvLwQoE0afRH44GCgWu9C8KieNusFxTXEDdxvE9gIpK55OEr7tY9elxHZ
         owxw7QmT4oP2YGWPY+0M1Qwwv8s20ESHqh1aHLzgYn7goQxZAmOEFhFTe1Xc99iEmRKs
         MFXg==
X-Gm-Message-State: AOJu0YzKtbTYUbBu4N+sPOl4U+Rlx/sgxmo9/EbfmowRgrxmEnFIpMPy
	H5xKbTmQvSbIe1kbmwEh7yy3ZHu2Ay7AwU5A2nKqwVFkPASNitDlTyVFNXv+KS9y
X-Gm-Gg: ASbGncvGTZC5gvcXcgv/zNaE0jh9/AsTFoRjVKD5L3BOU+cKyKgvUkrrNmLmXfPMp79
	pz3XtVkzTNI4eGJ0xNEWVSkGpMH7ZQYv3cCfQdNG+X48XgzzRuZZlHixJSE0aRMmZYFt30L4mSR
	aNwheP/uI4XiRcWWIjKXB1JSMKD/6Vd+cYXwbucfkfGJwVlnAv3LgtqSAu9/nq1fHtj5jnTjLfZ
	AF2eTZV8mR5KJUQbsYv8GDpSE9XRmQ5PIfuD2fWSD8Y2RuhyWG+fn1oLWOkAq8eJ2ABzAETc5Tz
	cgwz1SK0KeBrJkOuDvbGRtUbUxytxcZ6n3c0AmN4XFip2R0h3cInruAU7sCNFQl2pWQeBQtCdtR
	fHDgdlVoWUBbxhQPNwxIZthmMU2Y0NOfl7JrplaicZ3i1Iyreg9wptKwvCVL77fNPzT0=
X-Google-Smtp-Source: AGHT+IG/ebnf83iufgSgqtCg2TRB8JNxLxGg6n0ny9HfscPZ3OBZCcotYy5K/9hs9/HUMIDnrVmrbw==
X-Received: by 2002:a17:907:3daa:b0:b4a:d0cf:8748 with SMTP id a640c23a62f3a-b50a9a6d769mr2784372866b.13.1760453222818;
        Tue, 14 Oct 2025 07:47:02 -0700 (PDT)
Received: from jamaica.. (ip-78-44-100-18.bb.vodafone.cz. [78.44.100.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12cecsm1188300166b.53.2025.10.14.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:47:02 -0700 (PDT)
From: =?UTF-8?q?Jakub=20Hork=C3=BD?= <jakub.git@horky.net>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jakub=20Hork=C3=BD?= <jakub.git@horky.net>
Subject: [PATCH] kconfig/nconf: Initialize the default locale at startup
Date: Tue, 14 Oct 2025 16:44:06 +0200
Message-ID: <20251014144405.3975275-2-jakub.git@horky.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix bug where make nconfig doesn't initialize the default locale, which
causes ncurses menu borders to be displayed incorrectly (lqqqqk) in
UTF-8 terminals that don't support VT100 ACS by default, such as PuTTY.

Signed-off-by: Jakub Horký <jakub.git@horky.net>
---
 scripts/kconfig/nconf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index ae1fe5f60327..198467d0edda 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -10,6 +10,7 @@
 #include <string.h>
 #include <strings.h>
 #include <stdlib.h>
+#include <locale.h>
 
 #include <list.h>
 #include <xalloc.h>
@@ -1478,6 +1479,8 @@ int main(int ac, char **av)
 	int lines, columns;
 	char *mode;
 
+	setlocale(LC_ALL, "");
+
 	if (ac > 1 && strcmp(av[1], "-s") == 0) {
 		/* Silence conf_read() until the real callback is set up */
 		conf_set_message_callback(NULL);
-- 
2.43.0


