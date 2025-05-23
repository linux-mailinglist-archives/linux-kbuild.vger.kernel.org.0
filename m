Return-Path: <linux-kbuild+bounces-7223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A7DAC18DD
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 02:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57EAE9E4037
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 00:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17CC1FDD;
	Fri, 23 May 2025 00:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x5tDtvMk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770F7E9
	for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958880; cv=none; b=BZae9skooP9++qf5xT4dyPgjLAQfjmiU3eRXJb6zMCI0w4wlo/LbmqpHbyhslbaEGQb/fkwqQjZD3fUuGRyLy+pi2LOVDSz+jQDxFSJvDI3IJiy77bigapjYALBcfuxh86z2kbnF5CX51TIvCiMIMge7PzY9F/H9fAgrBogr0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958880; c=relaxed/simple;
	bh=f8QVZMVblX+qS4oCwDMOZOZEon4xBt0rd3Buv0CJ31Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=V0WLqpUS8FCujDRqBk1Gkpr3USucGpo/jyU7dIHIQNy49MGiBHrh/z7MtdqlNdWON5E+fu9/0TQA4xVIE/rUqsZ0B8H9azRB0Q0hO5GQH15KD+3VuFfAxYiCvk9ft0gwyaerby/7hwkxRKBHIPJPRdb28wIXvqHxlegEcx5LrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x5tDtvMk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso108355715e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958877; x=1748563677; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9xVtvlv14mN7U20hdMUeblYw5hN+2V2vd3EC7hDFuo=;
        b=x5tDtvMk2zlj6QtJ8J6XSgdt2UMF/TAc7CZZpGf1r4TtlLNxHxAah92gktSzuMQ3aW
         oldNGaYogwjcHIrIisbI08zU0t3Fc7nh7AdwrQu8srdyOb6ee8MCTl39mHf/AeKUhijH
         983H/nd8qJiHhr4BeZp7PuOLXgk6ZRide/mglbfrvTpWF0x3nt7knhMJezGYIHBqV2nz
         Ahl9vWwVQgyD2kUTUIE0OGcl2kbrO57xtgSqzy62oIMPuhmbbRBcXjqeIAAMRi8c9dp2
         SwGh2zsS042mORyb63wl5FTBaj4arJFtGt4kghpa3MFixwrmQXl9Np+XUnWMR8iD8RXv
         mQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958877; x=1748563677;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9xVtvlv14mN7U20hdMUeblYw5hN+2V2vd3EC7hDFuo=;
        b=tk/UG9KlJXrq/ojuxdMpIInFXynSarzKgMT2Me3AIbE9Ne02hf5MXnvipdzwzVxrMV
         jUFa0yS1uqJiKNvBYpt2726ggxCBflfPvmxNy/xh57xJVraS4JfbXd3FNxIxhJbzs7nt
         p0UaXMa8QCwaD22Z8WVILnXt094W2NxeimM38We638ZxslDHpAHWqCZ6N67DDEnDjixk
         QTN9cvaFS/myhObApy1Vr0dWFjC4G+9zU1+xljSg0rMfHLuhU7CdTk3mNLEJOd8QN7m8
         mKVAra0TBwaGP3B1dllfcQB7+wO7Rh0rRMj9S5ZSvb7VFeHjz4k8g9GLJAP9nw7YTFjJ
         eiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe8J9+MZx7jCiEHx53AaANLdoNWTQ8QO86Hf4/TrWkXq8RoYjWdQx9mFtN16r0VH4ZaQwlR0w3BE8j61I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIp0JeQsIi5vPDXnrWQzx7ewSQ7XubIcLrnQwd/PlV0V16oo1I
	gViRw7zdvH9xdv88/Kt3SCgotqoOklINqn3xEtkrhr07QUEqmpMVJGRrLQLWuaiA/xnCgOIP8cp
	JoYcYKsMumYYtB94Bb6q2YIM5qx+koSgDRVKeE1hA2zm+7+4k/dtfjyCvLw==
X-Gm-Gg: ASbGncsxr4SUVjVSPOdGnzM4jYZNHhR3uEkvQoSuPacefVjIPfMhm6O08Zb54IVYrlY
	4OA+9e3wrmrYXwq4ge65uui1dLAFJhAd/WKykjhpmh+aTAyOvP1jLs0NKy8p8mb+PoeD9zZq6Zm
	/B1Mur2z/Arg7VS8Blfh45ikRlT3zRo5sqclXV89D1
X-Google-Smtp-Source: AGHT+IEoFwqicwEfiuIdcH0/esFh81hFsIk0emOkxWyID8RHGKL9vHSI/sLvVbFjqt0QC+1GWXyqJN4xN6rYGu1q5E0=
X-Received: by 2002:a17:907:7b96:b0:ac7:3817:d8da with SMTP id
 a640c23a62f3a-ad71c144d5emr65091466b.52.1747958867020; Thu, 22 May 2025
 17:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Thu, 22 May 2025 17:07:30 -0700
X-Gm-Features: AX0GCFvALJXtJpI87dxOAmPK8ADw0QZjX4yUGyKt-78leZLg7A7GWPbL1V1pFiw
Message-ID: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
Subject: [PATCH] kconfig: check for a NULL pointer before access
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

