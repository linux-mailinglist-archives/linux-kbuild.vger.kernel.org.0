Return-Path: <linux-kbuild+bounces-12762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNEiHbd32WkkqAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12762-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 00:20:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE83DD2B9
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 00:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C78F3060AE4
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 22:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8351C3DFC86;
	Fri, 10 Apr 2026 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH/J/hwS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786C3DF01E
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859188; cv=none; b=KHdlAWun6fPbQgBONqr6tPhuzt7ydkAh9c/3gF4d3c6spOVOvKJkpk1JqHhpJrQiUnZNMzcHjhtO8E435t+FymVjwOffdD4kAMKJaSgoSiJCdqRdbbj9c2HPQREhOoJeKKAseSCR0/PxI3XH+6RBWUPILQzHy6MoQgOJAIE2qWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859188; c=relaxed/simple;
	bh=QaN/2PunQ1R3wJZyKqY2gbgYlHT6Ws9qlntemVaF0iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHVc64Goq+TERDqkJ0uaOBgKPbYENfdKJ3bFmfIDbTQTQq27+e7Fm9cml0UQwaOuZQ/KwUhIVph4hiRPLavdzPFomtbZqnCS5ZRwIleYBZRTeffapZgRgFd3rIyxnIHcq7MlLZkE+1U0tJTG92YrVpcVDMCLA9mZC01qfob4igA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH/J/hwS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c76b0cda2aeso1154206a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775859186; x=1776463986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReVkam/qzqCEjrr/EAV6/YLmHzvOoDol2op4AuX2BSQ=;
        b=nH/J/hwS+KC0ItR9h/h0Bm0imy1ozDb5CEAmDHTY7nT6D28dBiV6WRgON+3hTbj+9g
         WRiXRwRSAB8TRIwwV3YSgRKKSd/Ktu8003fMJCUU1pwsJ9QJjI1QNG4G/VgVhokPQN0e
         /Wt3MASE1GKttcf9uW9PWyNPKvkSKaW+d7Nq97tqHiM6JbAe+VHURzNqV62AgHmx5klV
         beMnuMIU07D1ayPks2D9EC5wFmBTSbOIggclkXWrb6wtmEm8ZRS8JSVVrJ/IUopn11PL
         avtf6HydTF8yFV3ZxSt2LregX6EM21wNyc4gFXDd3g169lASiE48rErbT3QwPgf8RXIZ
         aRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859186; x=1776463986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReVkam/qzqCEjrr/EAV6/YLmHzvOoDol2op4AuX2BSQ=;
        b=H1pIE4oLiTIRAVzmcIYJgrZHKpcCXTwiwE8WwH3/wR/EnZvGv/g8mMjS0InLUIP5dA
         NaNa65Djx7S1hGUVDemfNJMg/5++S9HBW3May+6sggsOMT1ocnSMCqSgHegg85LS8a5E
         He6ob3yoBo2zK6Qs3L/D8uD2gXEUc3oC8IEufUnY7D8e6gorqld9lDBijWmus6EJcJzi
         T6ob6wyBapFeOERU3iTrdSVTB6O+jQWDsrSVYjitqQCxuoDYyQ2fNMnYf9Vu+BYAQqTz
         JvuxTUdYwyOOmz8TO+byyvuVgrKG+XSLWoYxU128+AQqCNohKYaHBW6DkW6nuhuDgNFL
         +dKw==
X-Forwarded-Encrypted: i=1; AJvYcCXm5D4wLhOnSHHDeG2vm5Ajg5MOrVzox5pSH0n8hAjvgonQe79tGaJAXLgEifEcKbC56hzy08237/WK21k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2anEi9YFPc3V+gXtfJ2229cUFzUTjNkVhkpQZ5HGasgkRfFOv
	mWqT0c4lb1JZpPswgc2i0Y/hMZLa8vhCCf1EakZ114IDwsqFIL+NuKB4
X-Gm-Gg: AeBDietdB1AShYwpcSyEw1kFcHdAKHko5nmY9qApZPrY6NgQ2jAaZwC8F6SbUaT5pVr
	BgCqdqbjALP3a2dXXAog3EQBYyXdK0HUD/TMhmRCm23wumEQ12Zr8tGf73oe+IdC7pHi45Gmn5y
	V1OxqM4NTLWMUpa8mi7KJDXQHGERAgmm01GM3XAp9oZk149vUFgVxcJwIhmEnAOdCqQXY+FE9q6
	rsCgHQQW++Y6deNL4rWYdHTHHg8o9ubrAodOfHfq4OG3T1MlyaY61ZdT+eR4GAEsSAalqsMpUhT
	wztISDffsw8j7pJatztnilcKkt4YRIUcQid+Mn7dvGmOUL8zXleFGWjPEO5eeFVQpi0fR8bv5BS
	KnExlnMiSOH9zEkySFVpRwa/Ssc6B4nDjUzjp9lIc4+jDEEQx5z0WyDulhI3QRbig7P0EPOv+CS
	BsRFReDORUAk6+HrnP3EzdDccNIiHXnG2WiHbR2do4Ri06bXobZY0Sqf+oz0RI7WxRx/MgVBjDf
	c/0ds/6ekVgs3eYgfjEhQdw9B92zAUwDcYGeVMo
X-Received: by 2002:a05:6a20:4312:b0:398:b619:b624 with SMTP id adf61e73a8af0-39fe3f1d752mr5445939637.29.1775859186488;
        Fri, 10 Apr 2026 15:13:06 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ff41dsm3142863a12.2.2026.04.10.15.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:13:06 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: document generation of offset header files
Date: Sat, 11 Apr 2026 03:42:54 +0530
Message-ID: <20260410221257.191517-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12762-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piyushpatle228@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ravnborg.org:email,gmx.de:email,ruhr-uni-bochum.de:email]
X-Rspamd-Queue-Id: C0DE83DD2B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the placeholder reference with a description of how Kbuild
generates offset header files such as include/generated/asm-offsets.h.

Remove the corresponding TODO entry now that this is documented.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 Documentation/kbuild/makefiles.rst | 41 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 24a4708d26e8..7521cae7d56f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1285,8 +1285,39 @@ Example::
 In this example, the file target maketools will be processed
 before descending down in the subdirectories.
 
-See also chapter XXX-TODO that describes how kbuild supports
-generating offset header files.
+Generating offset header files
+------------------------------
+
+The ``include/generated/asm-offsets.h`` header exposes C structure
+member offsets and other compile-time constants to assembly code. It
+is generated from ``arch/$(SRCARCH)/kernel/asm-offsets.c``.
+
+The source file uses ``DEFINE()``, ``OFFSET()``, ``BLANK()`` and
+``COMMENT()`` from ``<linux/kbuild.h>``. These emit marker strings
+through inline asm that Kbuild extracts from the compiled assembly
+output.
+
+Example::
+
+  #include <linux/kbuild.h>
+  #include <linux/sched.h>
+
+  int main(void)
+  {
+          OFFSET(TSK_ACTIVE_MM, task_struct, active_mm);
+          DEFINE(THREAD_SIZE, THREAD_SIZE);
+          BLANK();
+          return 0;
+  }
+
+The rules are defined in the top-level ``Kbuild`` and
+``scripts/Makefile.lib``. The header is built during Kbuild's
+``prepare`` phase, after ``archprepare`` and before descending into
+subdirectories.
+
+The same mechanism generates ``include/generated/bounds.h`` from
+``kernel/bounds.c`` and ``include/generated/rq-offsets.h`` from
+``kernel/sched/rq-offsets.c``.
 
 List directories to visit when descending
 -----------------------------------------
@@ -1690,9 +1721,3 @@ Credits
 - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
 - Updates by Sam Ravnborg <sam@ravnborg.org>
 - Language QA by Jan Engelhardt <jengelh@gmx.de>
-
-TODO
-====
-
-- Generating offset header files.
-- Add more variables to chapters 7 or 9?
-- 
2.43.0


