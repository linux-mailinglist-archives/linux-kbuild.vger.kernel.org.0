Return-Path: <linux-kbuild+bounces-9138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43769BDA7BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 17:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887FA19A1643
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 15:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2CF301013;
	Tue, 14 Oct 2025 15:50:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269624C66F
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457024; cv=none; b=WIevHg74pJ3/1dosFpUy1X8S9aJt/OHf43jJuwERSuaO3rcvk4VZpbD1Hl6Uw2JB5Iv2476bQmsTopaZL2zmJpKyDPZ5BGMwqkvMO26Ysi8H13yqMuMXCRelyf2xkTyjPTwWOlOoFZMgppmam30bkRzmamd/MJGfQWYcZc3FllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457024; c=relaxed/simple;
	bh=8wW9A7Hfsu2FtyE9eu1L3cGcD1B8XIMVxYU+07MkaFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nekJzWs5avvgkzpdXZiuCysIQa8kWzva5yG9tqjdHM62T8iIIraxYiQq7dLxmeFzsLfNxizLqfIuGs/rWrLZ5g5EX5UE33pz1QrAXx+xlft/MRJDN9zqOOAIQ42/0X+NN05my4gC0chrzhPcpyA6aDXQAvu4Ym5tXqDKumazKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horky.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horky.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e44f22f15so791462966b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457019; x=1761061819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfvNFpgoA7JDzu03KtbY8j7pJNqAnrxvwDDVwSnZugI=;
        b=gYkTgM4niTI1qZDC4sRwwVIlbmLcLS0KnWlnMTyC1luVmsSIWTId+hw9m/LgA/w190
         K7k3aXYUKKUMsKgAxWeXuOYIURKUtoNIlyxjsCa4wCFHrqabufCdZWRTvHZSw6eqVROp
         LhTmox5KkdZTzOG6ndWzeWvY13YZP2KChlXoi2AEz81IX1FaT8aBs9Yp0MtEqVOIt9oq
         1MuXWHHzFznrgkbnu/h4FqkhRZIgvxtKIzvhYTjrX7jIgGvfuBf+na9wNe4HAVqmLrOy
         DxHvnhxjK7hMDBKzX5kCnwcExkYNa/avw2GkTjIF6A/rLlD7z/P0t9m4gLw50dLfaW0R
         Ad3Q==
X-Gm-Message-State: AOJu0Yy6bGDOyHiLybEFGKkgfI/WrthLWiG2b1df7Fv9K982xUF8drnW
	MADvY+wv8Jwn36WWz95Ka8edl3IK8bJXhH3fO5l13uh3gn13q340nKf6Y5nlcnip
X-Gm-Gg: ASbGncunElQYI80aqESiAjSZ63yHzB7pFKeiU25nkuXb6AaOjUsMM0FW0ams6P+UD1D
	NmuMaenqRFufm/td50/uU1UYaJrqypBmia+8gkeQNOwV2+t7vzEewfL6SyqCpyltdRgAqiOitYI
	1Yiyp9WUyZWUXk44j09YTv+fELe7GVJHyBdFZwWbLe/a5Y+mwDJIdJMSHEbsIqYa8Q57eNwoLc4
	eluxw2i6AjfTu9woGe2xaVzmn7qyuA4dFnyRD8Zq0u9QdeeYWzGE7MY7Tl6szIIFQyJPxm+7K4P
	V4g9fVuxIrspRdzNBOs7Tgdbq2GPUAWQmCRclc5jRABAANqcVGs6T0pwYNLqNi8Ay99VFCop05s
	vByFbcrcj/FbHmlTdCgQWt0kyKuI60OojyXh4cHq+jwybYUBzLcys2S+2hW38GuvUEg+loBSqp4
	zZgqYPkgXs
X-Google-Smtp-Source: AGHT+IFrzNcJc4LRTCmc3RmtM+wWnHntc5d+dwnNIGh9HbsQnpZNJt9jkLHH9KTbAU1PSvCVFPd1mg==
X-Received: by 2002:a17:907:1b21:b0:b5c:66ce:bfe6 with SMTP id a640c23a62f3a-b5c66cec14bmr94865166b.55.1760457018931;
        Tue, 14 Oct 2025 08:50:18 -0700 (PDT)
Received: from jamaica.cek.cz (ip-78-44-100-18.bb.vodafone.cz. [78.44.100.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd7bda3csm7165666b.84.2025.10.14.08.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:50:18 -0700 (PDT)
From: =?UTF-8?q?Jakub=20Hork=C3=BD?= <jakub.git@horky.net>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jakub=20Hork=C3=BD?= <jakub.git@horky.net>
Subject: [PATCH] kconfig/mconf: Initialize the default locale at startup
Date: Tue, 14 Oct 2025 17:49:32 +0200
Message-ID: <20251014154933.3990990-1-jakub.git@horky.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix bug where make menuconfig doesn't initialize the default locale, which
causes ncurses menu borders to be displayed incorrectly (lqqqqk) in
UTF-8 terminals that don't support VT100 ACS by default, such as PuTTY.

Signed-off-by: Jakub Horký <jakub.git@horky.net>
---
 scripts/kconfig/mconf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 84ea9215c0a7..1e3322af06d5 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -18,6 +18,7 @@
 #include <strings.h>
 #include <signal.h>
 #include <unistd.h>
+#include <locale.h>
 
 #include <list.h>
 #include <xalloc.h>
@@ -931,6 +932,8 @@ int main(int ac, char **av)
 
 	signal(SIGINT, sig_handler);
 
+	setlocale(LC_ALL, "");
+
 	if (ac > 1 && strcmp(av[1], "-s") == 0) {
 		silent = 1;
 		/* Silence conf_read() until the real callback is set up */
-- 
2.43.0


