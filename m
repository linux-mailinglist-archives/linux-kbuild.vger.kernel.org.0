Return-Path: <linux-kbuild+bounces-7723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99EAEABD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 02:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88F277AD78D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 00:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABEED2FB;
	Fri, 27 Jun 2025 00:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JKShoHE6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955972F4A
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Jun 2025 00:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984969; cv=none; b=LuHYemwV7Bju6nLJ4L6446WJqRz6uzjWm6JBMk8c/a9Uo8srU0wvD7Ro5hQ9te7BxFDEH/boSAWcQtFsGiW3mFjcZWG7iDPZSdUdgmlxkuoxMvwDUhZKz1YMoBgi/W+HKVJ9PvoPhFi3uK+/46O6SL2yxAyDzkY902hpIPudRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984969; c=relaxed/simple;
	bh=6xPPIM3NSdh1m0TrrrmsfHxmc3zIoWW2iunm4M56/3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KfUo4+JwsIxdBZ8PIEMnLahKy7DwWqTWSltuwxQ+Cdx2iEp/JzP7I4vx81I02akKj54ZJLb8J3a3tNqGi3z2XRDz2G1YartihwtAA32/XUtymG+GlqIsZonQTXKah+WKUrTQODvJnV9m6XVMvTT7a4Qzm0PQN3VLKRtbKcQDKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JKShoHE6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74880a02689so1285572b3a.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jun 2025 17:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750984967; x=1751589767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqTnG1aDDjwMRPo2TP7Xao/+Fe8Uk4CL284uAHomG2o=;
        b=JKShoHE6NJkr2faS/vt848z/J/cclLZU377qT34A6HNxV33Vamk3UE1RILMgOM8gf9
         LVD6+PFvmT41L6gzMU+/J0csbsgi0aGZLacmxt6l42qPfgMUsO28fvB7xfM823Pr3KIn
         2H+WFnGZQ5IHOHOGi6Q9HHnw3TgeSlJcFoBU/GBt+murODLHa67zV7GyKpZvydu1X1AN
         BnZXZlLOGxyyuLnkKXSlG6pyjXomi8qk0Q082xVY39Ap20bPCqI2Wbsz6gbpk7cWyOwB
         yYXbeIra3Y71eCXLHMWvLe280/i2VhXBpLyHHp4YzUKtK5zWlofAE42gOC5uZFSfDsGl
         2x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984967; x=1751589767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqTnG1aDDjwMRPo2TP7Xao/+Fe8Uk4CL284uAHomG2o=;
        b=q80twJ86iRdW+jPWXgW0Y9y7p5TT/kzsceY42YlcPn3hg1lWrOyStwsXkrn6NYDHzy
         W5klvPBO4icpgD0P0lPpwtfPrCViAfHic0PACUdzqDC9xkrqsJXQ7hITD7k5neRtkhaQ
         01CO/HL07Ksm6Qqocl59BD7pLnu8PkC9q03AWhaxoGrNrc2PLt/+w/IkxVZYt+j4Wgve
         zn+EqsfavIu8wSKAl9pf4Z8h65fEJaH7KK7kyYk9JKePQ0Q24zVjq+pU97cLpBB5WKPK
         Hcc5+W1mubRyqmHXO0EQkF+DQw3DNVzadP0ktPTNH1qrvZSQd001P0plNlcQCvAzXWsw
         qCqg==
X-Forwarded-Encrypted: i=1; AJvYcCVqH2vSA5cfBNZk87GJC5F54mToXBgduJLEsUAiBgprKv7zL8nFAEC6MrCM8YpGx+iN25t0b0ziVFl7rKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKootAQnwRrnQLBuuWpdckQcErTuadvi1TpF+0l1/zdDn/bPWU
	e9L0NiBj419djcgfqxWP4lq6ZLsUquWMc+9AUxYJh6bzShtV1j38dbLJzwE0ut3hPb40Oj83FNo
	1
X-Google-Smtp-Source: AGHT+IFesGng+KgIMxUtWrrJzsPBE/Sg/QLnVskl9GoZ67iH4ln8YIl1w39Y28RU5GrZTx948Vj6oKT28g==
X-Received: from pfbna2.prod.google.com ([2002:a05:6a00:3e02:b0:748:d81f:a79e])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c8:b0:746:298e:4ed0
 with SMTP id d2e1a72fcca58-74af6f57172mr1469555b3a.13.1750984966917; Thu, 26
 Jun 2025 17:42:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:42:43 +0000
In-Reply-To: <CAEzuVAdu3bDXUGgi4U-XY4dRmBxKaCA_OjKrvK-2ftOWWwVEYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAEzuVAdu3bDXUGgi4U-XY4dRmBxKaCA_OjKrvK-2ftOWWwVEYA@mail.gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627004243.19514-1-morbo@google.com>
Subject: [PATCH v4] kconfig: check for a NULL pointer before access
From: Bill Wendling <morbo@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, rdunlap@infradead.org, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without cheecking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
v4:
  - Fix issue with patch formatting.
  - Patch is sent from original email account.
v3:
  - Fix whitespace for real now.
  - Patch from another email account so that the whitespace is retained.
v2:
  - Fix whitespace
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..9c5068225328 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
 		if (prop->visible.tri == no)
 			continue;
 		def_sym = prop_get_symbol(prop);
-		if (def_sym->visible != no)
+		if (def_sym && def_sym->visible != no)
 			return def_sym;
 	}
 
-- 
2.50.0.727.gbf7dc18ff4-goog


