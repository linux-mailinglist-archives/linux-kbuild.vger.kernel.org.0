Return-Path: <linux-kbuild+bounces-7247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C2AC2BEE
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 00:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6872D1BA55D1
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 22:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235DF21129D;
	Fri, 23 May 2025 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIf8jT68"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15B20E319
	for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748040969; cv=none; b=FLMXhkjrNKZ/1bH9Qgf9RY1wNRVi3E8n+WpcBWfgJU0/IHzzsAWzASlgnvAmHzHEC2EDhZ2kHpBtbU6LCCi5ruKRgI+19QclcUbGKrYu4iqEwVOvihiUfDkrmdFScf5I9ArmiWnCBoskItqHiP4GKBKc27vBdVrBvhEJN/cbbA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748040969; c=relaxed/simple;
	bh=NGj6o1TSHq7NgK9mTN3qfWo5lNA9ZOhTkxnTKNeNFy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rzrP6mDs/ROMTUnJPrnvyQHiwvh89lJaRQTRfkxL84wn8H7aHgH2COSRsitgbXVxsWZZwDoQqOAPe7KTa8cAchiPl0X9iqT3IHr51Vm41QNOV9WsVg+FRqqZYevnrnMarALoQcw7a9OezKH2GiuLFOAgmUTNrWxE/fd+EhOSy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIf8jT68; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601a5747638so578245a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 15:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748040965; x=1748645765; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxStp4QDv+1517JcztzoS+IknMCMQcsrtKk9OWJYKww=;
        b=MIf8jT680zApRZGPE+DmRA7RfISGCytnfYDBffjJTuf6kyMTfDE49NRCR3QGUVLFWT
         BNKOvfU1TA4RvJZxsOzs4gkIDiuzsKXbVNwDwiwSEYdm6OnwIdEi2KQsu37PhjPvtLkv
         bnQymALzeMy6l5kSoc7gHyuyjdH0npVKmbargrJO4UJ1f3APQCWRY4bIaq31/6ynoLd8
         jTvE4tDJSwtZIKNZyy4YzHlvKShbV6gKySaLCzeb4UwycTUdAzRqOkdEz9ZMA4LtlHHt
         qGKlihBF8DQgNtrtGsBFu4p27gDNwB7nT9TiBYjVT7BRwRETHnohveeHsdyjk6iJSwM6
         42KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748040965; x=1748645765;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxStp4QDv+1517JcztzoS+IknMCMQcsrtKk9OWJYKww=;
        b=Zc62rYNvxh1Fbcf4vLvl+/EJs/gv+8Hxri5aHojOkKTIwzK5CvopX0NiDxqPVgihkY
         GmanfgIssZJKEkh84D6wffjE34rf1DkkR9buJAa7Fqu4X7nqG19Pz4V1aWthUOzLj1Gx
         sw7Zbt5x3skH7VLEOdtp1Ox5W06+1CC9U+S34MTJcfGUSTzMhXDBdYRl+KUqzPh5LA8c
         hO3b18LTieIUzr4YKE70AXZcqYClXmHI2KtQxzDH72QfIkMmnmoippm9U1as1uu5pGE1
         2fIPTODnFWQ6yFRUrRV8MSyBq2b29akuUgI7hTVgl0Pu87EpyI28N6yDQD/T4fXU7MZo
         ALDw==
X-Forwarded-Encrypted: i=1; AJvYcCV1DpreWCIW1P96O65k+22cewAqKCDtmool3z3APG2LfWs8puggmynWhhMrxFD159IWMNpJTf2PvuMTzoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0mCz8mEKOM4wD/kVU4QMrpF++dKpSaIR/cNIsGcE2UWlNqEa
	mHZYP7TIb+ioivDJqXFNkRXgpOKzOQq4Lsy4VmuIGTgoJSaSNm4nnc/Ri2w9F+aRgE7ZppUVD7K
	UxrR6SEvo38DaAYaR1pSTaAqNsqOvdxJ7FjzZII4=
X-Gm-Gg: ASbGncvPLRPkxOqfB7YAEGwqF7dMjkYgECJCYOMGZ2egq7edpUnzbptvafSRdXh0GVW
	qfRxCRw/1L8aAaZc36R/6fmJ5ilJbGtRwPwcmVuw4dwAtkwKWdiNKojzbJq5zVWq5r4Tfu2DiWu
	CdfbzXSQwgg7LEDZPLiP/JD2V30vPqhufVpQWEbcub
X-Google-Smtp-Source: AGHT+IE/wg/Q+CytxtXRhEaDTGo9u4Ms800IaJJVdAvoge4pVxbz0SwaQe2RarImpiXn+y3zAmMArP0lyG9Ursx4InE=
X-Received: by 2002:a17:907:7253:b0:ad5:2324:af85 with SMTP id
 a640c23a62f3a-ad85b120251mr89333066b.2.1748040965527; Fri, 23 May 2025
 15:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
In-Reply-To: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 15:55:49 -0700
X-Gm-Features: AX0GCFvviElEY40v5_8eyRqNA1AiBdPHwV7AcPD6ETfsr8U4PUtD5Oy-bTe1HMk
Message-ID: <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
Subject: [PATCH v2] kconfig: check for a NULL pointer before access
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without checking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
v2: Fix whitespaces.
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
- if (def_sym->visible != no)
+ if (def_sym && def_sym->visible != no)
  return def_sym;
  }

-- 
2.49.0.1164.gab81da1b16-goog

