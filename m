Return-Path: <linux-kbuild+bounces-12337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NzOM9F7yWmIyQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12337-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 21:21:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4DC353C4E
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 21:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 310AB3007E02
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 19:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9292631E832;
	Sun, 29 Mar 2026 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYY61hmF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB8257845
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774812096; cv=none; b=R8wXAmJtISlqPPX5fzWu0veVXuCUH7yeRYIQw04DksaGbTtijO/s2QRFEAWj36sdS6nUX4Fc32BHN+M5PrWvJIAEzkvmsq2KHAPZuSNUriZLAositb9c24JFw/8X0oJwQvAdF/6oyKM2VeCxFZvfUA+vtEwyiD/KdQPo8FpsTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774812096; c=relaxed/simple;
	bh=jV3iaHpTosSMIydvmTERG01SKw6JPNciVHzZ6sCKDI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtKPkrXFVSRKx1+fI+riLMobsgaAS1+WYaZAC0JQG3cPNipepY3epzatQ4NO4bEjNpdFbrqDQ6PxGsYvAmiVlE63uSYMSQ6EDx5cUNPUFGo55WBUaYWuPBwq28iM0VrO3OMOudN9f8GjdnDx4Fp1JSG8BdBL3sHayBxjf8MMU4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYY61hmF; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c156c4a9efso3577692eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774812094; x=1775416894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NloHPFKXhPjXUmqlsaHtaANu4HcMUU4znEIX3tQ8dTI=;
        b=VYY61hmFPMmzuIpAKJfZZ5BK7DQvyQ3f2WpJHo7yKyu+zSb1RV0rUmXpVkRUmn4cDq
         73gstW2D9fMsrkWnK8ncVdth8GqxHZVO/Vh+hYFJMlWJp7YBQgTC4YnZwHo7/mh6fKpI
         O7mDSo1VkKw4v1SxQql1uGCHONEkfoK7owGSewtNY2ExzjSAavfn6HMEnLgsgfaDgRcE
         9I65+OYARxRSZIm64LP7qU5WZ16BzGGGceO66Fa4Kp0Y7ckLyZ1CjSro3YyjuKyrSMx6
         6NLB47RUpN7iBwOIG9bzSDsZFwrBevG7z/GSDhUHBJcrUTZ1US6zsEXkfFHAg/1WGHsq
         rqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774812094; x=1775416894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NloHPFKXhPjXUmqlsaHtaANu4HcMUU4znEIX3tQ8dTI=;
        b=etYGt8y5VUoWBGlZ2VyhCl2B4XCgmPpsKYPl99Flam1RuoGzJU1kgMACmXlerlOu6Y
         n7OIlKBPbfoyDFRjgu5+L4YZrjqkHeYWlcODrVjPVxJiVpZkZaPGp8dMjjq/g+z0y1Ma
         PHHj0L22zKI6yOY7OXl5S1D/F3H6RSXUUVjDzwDzR50uVhAxkGzTvd5vJAVSB3u7q1L1
         hCrIlme/SCLTqKG6X2FIqaRQ8FDwKCRKosnqZMd5/7PJr1JtMg1CRm9hc7SgAD7ia4jy
         Iszy8ZaV7TpXsrh6D6oz+sk/oznVnOL5znMa49Bex/cSFCWQVAhsGVrUrBu7uT6v3CNG
         ol8A==
X-Forwarded-Encrypted: i=1; AJvYcCUuu+7W8pn0m7XHFrM94aK9NBfp7jP8M3PiCOwQL6CWnT5y679QTVdLmh6ZJJqHghv+2LjkVQvQM7Ao/SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUCSbA5MyV6WZp9XqYnMqLi2YJkiPxuYv2iOJ9kok100Qt0LJ
	mfw8i1P9T729aazRwoQMeHqUS4jKMGrK+e3anr9V3BiPQpOYYteIpIfQSnXIOA==
X-Gm-Gg: ATEYQzym9JyjLTCO/OGikZj/BviJAKv5RbdwEC5EJ8NgXgXAymM+rMxj6Ge6t8WI1hU
	8uS83FLxlcyhv21JPouidFsJZqdw8v/zTvNORfLmk7ShJki+dizaVEYYf/N+U5Sfag5fusE/nB1
	S7km4m5IlsgVa+opCJa0obKFGBE2D5nQCh1q7abxpYhceju8fuyCThVUAwqtuitryRFKmXwlbzB
	eMzx1QA3U5ycgy2OW3AQneMVMY649c5KQDt5EBGQH0UyyHRZcpO2IK91ath5cnPeY6svCMaf3Fd
	d6sBzAsQc4lizy4+/XnpYA9VwXB1jjJ1E3k8c69dcW8f8lyyWNm/6SakZxW6g0XBuGndKAa+UeP
	DCxADUYruVAaMpbzfYkTtNqQTP21ELANr4GqUQKLsrS7P/AbY7uQ3psY/VxrDtgko0Lr88BeNRW
	ww/BLonVfd1ZzmbnM2du1XoVgr
X-Received: by 2002:a05:7022:90f:b0:128:ce44:be90 with SMTP id a92af1059eb24-12ab28edf14mr4938800c88.28.1774812094397;
        Sun, 29 Mar 2026 12:21:34 -0700 (PDT)
Received: from ArchLinux.tailb773f3.ts.net ([2605:a601:8036:8b00::5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm4892108c88.11.2026.03.29.12.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 12:21:33 -0700 (PDT)
From: Samuel Rowberry <sprowdev@gmail.com>
To: masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Rowberry <sprowdev@gmail.com>
Subject: [PATCH v2] kbuild: add GCC stability warning
Date: Sun, 29 Mar 2026 13:21:39 -0600
Message-ID: <20260329192139.475926-1-sprowdev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,fjasle.eu,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12337-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C4DC353C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Newer GCC versions are not fully compatible with the code.
Adding a warning lets users know without getting in the way
of setups where it is okay to use GCC 15 (or is needed.)

Signed-off-by: Samuel Rowberry <sprowdev@gmail.com>
---
v2:
 - Fixed line wrapping in commit desc

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


