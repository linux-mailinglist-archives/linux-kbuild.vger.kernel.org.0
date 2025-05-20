Return-Path: <linux-kbuild+bounces-7177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A0ABDDF1
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 16:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6FD3A5C47
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5799E24E019;
	Tue, 20 May 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TbG3J6Xu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755D24C09E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753037; cv=none; b=Numx8KsuxxyEPUAMRLm3lnQARjVW9sL6pBCZFLySrZgqqCsTvwhye42loawH6IlfO9Zhq1GOibFntykxPuMTLbR1GbHmeNOLva1n0i/M2PAvncqPRIQ47DOyXN1cXVwpTbMmG1cQXqyAJH7HBaadVPTErVcJ5FGqxX4dvG+IixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753037; c=relaxed/simple;
	bh=LnU2HMu5FQVmbbV130tV8yW5KhXwrlRqqNXp4oAg6Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHSOck4ICduIrFsWNXaQmpMp3kSD/1SpDo8o355od/paSthUYGGrDDI8exk73f6PGVwwWLduqycONwDyB8FNdsZyT1Kl1sD56iD8ood4dV5uQx3UMlpBkFUyFTBIPVizF+RQl1UZ/skBVfOF3KPkWYvL9IJHCD4j8cTl0Q8nYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TbG3J6Xu; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32805a565e6so55866701fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747753032; x=1748357832; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OirvPWyIXir2GaJImkb/fUid8xpI91V6lGP/kVK2Qzk=;
        b=TbG3J6XuMRaAIiBm7Ar3LJnPr4XEZTpWEiete+YCjsPrTNje9GywxJVr5Wk6Z9PGEq
         0OmPKk4S+mFozYZQ813aKMVyZnIJbqRf5lygOkaZRYaFh7LJTRejRPEwURX4GoFfjZvD
         vfuat5Z0vsYtDSFBs/tzJxMsygQmX7/nyRBjWGEHIEzTSThU2yR6OzG5fouj4VSJy+75
         ufT/5db6P9rknUq/ly+S2CRumc13R60lrZf8pjZ0ZYLycFAn3COzU7N3yKCK58DrnEc8
         KY1p66G5HV9oRz3WI3hJ959QEjNT2Er+/SQ9mem8AaWEqv/Ha+0Q0qmo4ajL7LrFnLoI
         /tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753032; x=1748357832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OirvPWyIXir2GaJImkb/fUid8xpI91V6lGP/kVK2Qzk=;
        b=GdUr6syOgw2mS7N0MxesXwsynLmx5LV9Xa48mTFT8RlC0MLfl6XrJf8H00F6QHlvZH
         ZHVA/nYhd8bj8U3a+KPoIuOxvWzOkd67dREWrrPQDVcLI8AYZPNOHYGS5MDJ3urZpxz/
         almtu1IPB80BKTjY/exSa70TkiMUa6RhgTXjalWYKmym9N+8GAnHTCSFw26RU/CihIRX
         ulSyZaUY+nZL7htfhp9LP0Vs+QyV2OVpN/lP4aSzXW1MKHJsdpPA/+SqDnUN1F2w12Fl
         rN+zMgBNABggR2D9HfEy9P+hYoLZ2XeZsafaj9JV175zH/0T09b5MY0Rc0IpA+V0xjbi
         u4YA==
X-Forwarded-Encrypted: i=1; AJvYcCVje58NhxslbdDpoGYQ5tVzojA0lTDTJ6Ri7YTYtqPiLFqGKEgmulneqCdKr/F8q8r+/HqJmusRepYRUp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2Kz0t7/i+fW8IluHKaDNyYzFdFYqu8qHspU0k1Ak/69zMaOz
	WRANNSLhMzn19kyeIociNOlMHOs4pT9r2KUoKKgYyAfnxCZd10ahT/zgO315gJX9LA6NEu9pFl2
	vOEnc1AvdCZI2XwmT3TpTIRaj3Aegw++vaYcvywEP
X-Gm-Gg: ASbGncv0NBt+vt2o/mNZNcfn+RRWtQRzDeaGh1XiJmpRtv6wxGCZQB7BCLOnejaK9mw
	bZtbwSv9K+Dzz3nEJuYZpUn+J8JAN4O+2XJVaZIzJqS6WpLVvXZz7inK64wq6uyMbmAoR/02iiX
	2YiDqVxlgTXwKHfA3fpP2eDSkXJh2v7KHOXsmzfBVFBL4tFp5EmZqk9APY4UU7tiXAbxASruic6
	qr0a6EPebYy
X-Google-Smtp-Source: AGHT+IHFbaYVWzc1ZO5BGosZBfzj44Zpo0rr1Dn5JGoDuJZkthl8WSCb7+ygGcUCz6PdtphRgmFsQlDrLdMxMmEMC48=
X-Received: by 2002:a2e:bcca:0:b0:30b:f0dd:9096 with SMTP id
 38308e7fff4ca-327f8484885mr66095551fa.12.1747753032039; Tue, 20 May 2025
 07:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com> <20250508164425.GD834338@ax162>
In-Reply-To: <20250508164425.GD834338@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 20 May 2025 16:56:59 +0200
X-Gm-Features: AX0GCFvIRljugCIcQbtSXjz8NxSFlDDJZ4BA92IeoXfPnXvtaGyqWo21owy367U
Message-ID: <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes the
> > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
> > compiler option '-fsanitize-coverage=trace-pc' by now.
> >
> > The commit however misses the important use of this config option in
> > Makefile.kcov to add '-fsanitize-coverage=trace-pc' to CFLAGS_KCOV.
> > Include the compiler option '-fsanitize-coverage=trace-pc' unconditionally
> > to CFLAGS_KCOV, as all compilers provide that option now.
> >
> > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Good catch.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Thanks for fixing this!

> > ---
> >  scripts/Makefile.kcov | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 67de7942b3e7..01616472f43e 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)  += -fsanitize-coverage=trace-pc
> > +kcov-flags-y                                 += -fsanitize-coverage=trace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS) += -fsanitize-coverage=trace-cmp
> >
> >  export CFLAGS_KCOV := $(kcov-flags-y)
> > --
> > 2.49.0
> >

