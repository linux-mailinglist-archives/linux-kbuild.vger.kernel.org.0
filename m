Return-Path: <linux-kbuild+bounces-2326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF90924C35
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 01:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4161C21AE7
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 23:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A1D17A59C;
	Tue,  2 Jul 2024 23:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sgje/WwI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFE15B0FA;
	Tue,  2 Jul 2024 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963647; cv=none; b=H+3ZjtLwM0tLpO5sG22yBZY8/bjeezCYtYEPbuybRqNKyA4CodFjvOV0NtsF9WcUw1nxXGXrlwNuzPjBaifAgljmiIVU6Z9F1KK0xDKF7grpf68neAjFc1RTsnkT5PWnzBW7rXTc1GO86Y2YrWSRMe86SGyE2pk0TybjVyR5uWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963647; c=relaxed/simple;
	bh=N+wq443NlUjcf3lRNRxhQH5p2CHjsuOd2xXb07QdHRk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=R1MBW6eRV+R6rU6u8rSobZt8+CbgjyigV5UY3mky5ADrA6UsN7tCS5N1NDLSdbRSfmVbFX7a7xZPsEeSoP0xBO7Rnc7bOl+Nl9uJbvEfWT9Lf7Y75Bn+CbC8Raw1OjmtD0e/9xJ20StM4rhMOFU4WsKYR3y9mESju5/PpAmJ0Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sgje/WwI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58b0beaf703so2286720a12.2;
        Tue, 02 Jul 2024 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719963644; x=1720568444; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJEOaZsRPVbiGuudIWGWy1zvfHhkTSKgzDUwc10vK+0=;
        b=Sgje/WwIhyqX19FCjwF8AF8Yi43KUTwY4g2zjuHVWE66/CglYHMWP2E6aHoed51vn1
         xyPcf/usV3+VczYU80UHE1zYhyG3/inrZUEbiWLjhRPlWlT6Hb3Ljpv/TsS5P6jPZ23a
         eMe/2usMcFCdQnw//AIdaA5yd4EhCT6J3oPxYHIFZr9akenfe8yGdq9YueYcaa60WExj
         ataemVbJiwjcg18e6PL5Er8KEsKF/eb6+k+m13nOOPX+vGnSjulJ1v6MKURODCCrugbS
         uZ9OlDSL1FNP0m9mqQZccSvaCniSTsQLBK6/ksCje5Vdq63gCgnhIsWk045uB154JCkP
         daCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719963644; x=1720568444;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJEOaZsRPVbiGuudIWGWy1zvfHhkTSKgzDUwc10vK+0=;
        b=MQGD7W8wEFsRtBlbHMRhu/yUrxjBAttVwjGSbwXryAAjkZ5nvA3ebmvBKuxvLbJxRk
         oTlApJB5rwsme7ckxbvBC7FxagJIyQoeXYh0mKjxBi61HdFp2ChHkhVCKFzbrHnzOxIJ
         y4eH/fH4kldKp/dYcexBA3y8svhid6ewW4DrdX2j+jhl/4ahbvapnAOxD3h81KyF1cpg
         woy3T9bUd8bazLJ7KEwsZfclkuctUfgTKf8RG/jYX9KbISJnDfEdFYRme1kan5e7DxkP
         Vqv3W2fllPZ1Mka8jFani6lcKdRDXPH8UQlj7zuzeXo99JTWwOTqY+4aevk+AcASEYkh
         9O2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwbIwnB24fY/GS/a1G9RyUnH9cWrd8g2aogcLD0XLt7QDO7rkxM7YDAzHUKPV+qeZgEJthhpJhRU/kxZEUkCMb1p2+ve/jp0g6wYdFfL44s98VI+3+LoZDmESsEQg1mW5fGklinzlzuhRl
X-Gm-Message-State: AOJu0YyrmghXQ14QSdLSWE6LL4yb4QK7NeV7VmsyxkfHcaTHjPSYkAHy
	4B3nwtnxVo9AQPC62f7jGc6ad/IGavofYSIJvm06zy+STEZodHQ7bMPXrPWB
X-Google-Smtp-Source: AGHT+IF/LZCrG2zoDAv3cjefO0IGr0QgiiQyn54Z8x+2P/A6Ygm8z4rCBAE4MqSe7gjXGbjq1US8rg==
X-Received: by 2002:a05:6402:354c:b0:57c:9d54:67db with SMTP id 4fb4d7f45d1cf-5879f0cbdbfmr6803888a12.9.1719963644396;
        Tue, 02 Jul 2024 16:40:44 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50580sm6287616a12.72.2024.07.02.16.40.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:40:42 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 1/3] mm: use zonelist_zone() to get zone
Date: Tue,  2 Jul 2024 23:40:06 +0000
Message-Id: <20240702234008.19101-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Instead of accessing zoneref->zone directly, use zonelist_zone() like
other places for consistency.

No functional change.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mmzone.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index cb7f265c2b96..a34a74f5b113 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1690,7 +1690,7 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
 			zone = zonelist_zone(z))
 
 #define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
-	for (zone = z->zone;	\
+	for (zone = zonelist_zone(z);	\
 		zone;							\
 		z = next_zones_zonelist(++z, highidx, nodemask),	\
 			zone = zonelist_zone(z))
-- 
2.34.1


