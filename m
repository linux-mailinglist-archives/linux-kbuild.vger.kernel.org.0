Return-Path: <linux-kbuild+bounces-12336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC22IDlpyWnqxwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12336-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 20:02:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE01535379E
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 20:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 730C6301450C
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 18:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F4C36C9C1;
	Sun, 29 Mar 2026 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jza24isn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332041CEADB
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807346; cv=none; b=kH4Cfd3jUhGeGOAjFAHGwktyZk9xj+xHz0zikF5w+IUeZ7DXxeITbg1R3W2xNsN5kAWqKuMkEGt8ChbMuJozRGK4J6PQkY6L/dq9d/KzAAg7fcRvgF4NsUKK5vUbHy9+HYh3iDXhsN0PYo5dVzf05t9O28W0OqO8gI4VD6SYno4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807346; c=relaxed/simple;
	bh=AuUmX70YCIOL9MRwjEzUCBqZqSRfICNnhLXJj7B/f+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0NLraeMUqOiTHqbgAhxTs9JH48E0VVkxxVZC6cHx40f/Z8uMluoiYUOwbD/8sDiuUb2l8/w3c2TxncI2Yw5gtasJ1N8GIF/EK7bkrtQMidnriO/eSK6JeXD2wfTzNaipX66DPduix4Ux5A34bbBkjFc52/PSeUmlT2CDmh2m7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jza24isn; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12a695044a4so5656148c88.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774807344; x=1775412144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTTMSAJlyIaJ+F3CYv2omNC1B2IyE+vrgz/y7v+evgg=;
        b=Jza24isnM1/wh9rHzrLN2czjXWrKa9SG3th2LVlh4Kyo+zkWLmQh6iek/2Qub+aCrY
         olC1sf47kFTl9arMFAQ1oXyGWtndWzabzEoSJh5ysHt0hrqHmmOkCAFupuhDCDEgqFc7
         C0E9Y1kEYQU/+f/K1w4IwHyVCgNOO0BimI7Yj4NQluUGWxLe0tpCTWUM2yfCOMfxVMLn
         qONNv5t3cSLLaRGUJuP3Q6GoNGFmnFJk3I6WfMfJC8SxkWjRQgTq4IU+hrAvURQo6LUj
         RxUNlark7wgYRAMbuCTf1GBM2QBtT/v+zZiOo1xEsMBtN2mgy2xkxe2M0SWkJDLo69A6
         7vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774807344; x=1775412144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTTMSAJlyIaJ+F3CYv2omNC1B2IyE+vrgz/y7v+evgg=;
        b=rRP6SsP0GgIxwk2VbYWUNXPqGRQPC+FXzFIZ+tJkNlBRgoDLxMtwzrdxUOgKh9WHPF
         zejC4C3vtA6uuueup7Bi1+Vpihg54opbbLVUApfeRgePy7EZtFg45CVfl2gTq2FRPEpw
         a0xJoq+dycXibhJ1n5+6uktUpGrZh4KFdPpXCgl0zEgbYLVy/HbuzrT64mnHtwwcTrZC
         HiaWA9iQa67yZwJZyJPE6nLjtzEdYi7ZFGknN8gFqcYI4vsfjCNVYBbikljwzx1dA67k
         jovaxY2/iAIbI7w8sgvjQuszgqQsO0NclaJV7P07XJWVVCdLvardZ8GaOt4RS9M9uBzj
         UNqw==
X-Forwarded-Encrypted: i=1; AJvYcCXpIUCttJJzHbFWTSvMkFDeR5fBCnk+dCv+2JQj5106K0i51q81akdrxV3D7mzaZln4vuPq9hk402scFJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdO7opu2Ja7yV648tX0disixXCZ6n7i482kmbEFJ3VYRdsJxSq
	ntb93lM06L5aK86bSFzkclN6KE3U0scXEXRsfoBNpZ6F9JUoHJbMVamYSL57eQ==
X-Gm-Gg: ATEYQzykmJwOgdHDJ07nEsuBpbaGjeXNwxGsC5LI3TPzOBybs0jM53I29ouoe4dEVJT
	B3cyboDiUiZxFCrhAOi1zfwb7Ej6CklAdybo7oPHDvFNJJEMj/bOypeTSdzLowymaaVN3N0bHpA
	LJdJX+vr6dqIJAckYRf5zvtx7hay0qFWDcsg50jCAteAYne7rriazpcvndOZQqt5qljuYDLwVWG
	NQqhMS69M072EbXh0tGmBh7WxYPj6aKg9E/DSNIChhRDhfZKksCcVFRy6TbcrITiI30MSRvwsU+
	8WP8xzUYJQvbq+tAy/u9s1M+Gu96QYIjkn0FhW4DOrxXz7HlYlh/kd/Rf7Y3kMxW5aY+EeoNP5B
	P8Nd+r1ibhN+5DYar+oWiE0kRbteGX6KSNvgfAyPV9VxCZOtMF1/v8TB7mpsQBFZRiP/mn6aH0I
	entGg/3OUpmifLwpH7kxaHwZJKGtv6JR+CZWo=
X-Received: by 2002:a05:7022:4398:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-12ab28d8bc3mr6159280c88.24.1774807344130;
        Sun, 29 Mar 2026 11:02:24 -0700 (PDT)
Received: from ArchLinux.tailb773f3.ts.net ([2605:a601:8036:8b00::5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac09e3872sm4845138c88.13.2026.03.29.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:02:23 -0700 (PDT)
From: Samuel Rowberry <sprowdev@gmail.com>
To: masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Rowberry <sprowdev@gmail.com>
Subject: [PATCH] kbuild: add GCC stability warning
Date: Sun, 29 Mar 2026 12:02:26 -0600
Message-ID: <20260329180226.443235-1-sprowdev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,fjasle.eu,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12336-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sprowdev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE01535379E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Newer GCC versions are not fully compatible with the code. Adding a warning lets users know without getting in the way of setups where it is okay to use GCC 15 (or is needed.)

Signed-off-by: Samuel Rowberry <sprowdev@gmail.com>
---
 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 02902bcae..361b5a509 100644
--- a/Makefile
+++ b/Makefile
@@ -720,6 +720,19 @@ endif
 
 export KBUILD_MODULES KBUILD_BUILTIN
 
+# Version check on demand because configs can get stale
+# This check is GCC-only because that is standard
+# and if someone is using a custom setup, then it is
+# assumed that their setup works.
+ifeq ($(KBUILD_BUILTIN)$(KBUILD_MODULES),11)
+ifneq ($(findstring GCC,$(CC_VERSION_TEXT)),)
+CURRENT_CC_VERSION := $(shell $(CC) -dumpversion | cut -d. -f1)
+ifeq ($(shell expr $(CURRENT_CC_VERSION) \>= 15),1)
+$(warning "GCC $(CURRENT_CC_VERSION) detected. Please use GCC 11, 12, or 13 for stability.")
+endif
+endif
+endif
+
 ifdef need-config
 include include/config/auto.conf
 endif
-- 
2.53.0


