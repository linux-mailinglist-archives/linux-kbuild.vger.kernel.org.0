Return-Path: <linux-kbuild+bounces-9011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EEBBE2BF
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 15:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6DBF4EE420
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 13:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7BC2D0619;
	Mon,  6 Oct 2025 13:21:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A152C375E
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759756868; cv=none; b=jUrszO4dRzwE2+M/TAD5WmMYnGGzb/EnVUVkQvi+Q+Gwd827Ty3OYX4UYkV7RcJI1olf+BbdoJz9qjf2fOIYHyTH38L7klBUe+2ipdsnXLtf4FgQdctyjtiOfueIvkrisHtTTdyEEhIQMLtHNM1HXdpwnf9LjhJqAyUhvyhD9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759756868; c=relaxed/simple;
	bh=KMVP6+NUbnV92gLmdFQjNvr3c1BiPckine2kLw4OB/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2WG2HaxBpF2OC+/0VayA8zXtPQKUXiatUbi/9mT3Sd4BiKF7Y69sc6OCZWLpJ7j20bbcS08TJLVvQnLb4meaglzVPCvNCC9WQ0MyOtgrvG1utWmE7HqGZoFL/Ze+UQV4ACbsRlYorJvlMldkS7ei5lBpLdnJ2AT6PRJV5Av2Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a98bcdedeso837364e0c.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 06:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756864; x=1760361664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuRqoxklPAOlbd1RPrmnGLCYcdAv9gdZsGWxssDdsVg=;
        b=CfvcXyzh+lM9jubOHbRwPCKt3OfmkE91TrmjU7rYUjdCqNMgeiDiB7NHTDaFLMjiET
         dJ87AOa3oXh+8SFjpqdWlDido0c2N+iS3Qab7rg4wjAr+LjDFkpS8ISaKs7E8kjm61hd
         rxnjkiCFCzPX4puwOxR1vC/gZneAihmlBDTSiDW2A0UkjNY6/zDve+nYdFqqSQQHoj6G
         J7J02VrX+2/cOZpaDGUmDDBfH/5epe3g0QEZDTKQ9iawVnqsyeuvFcmSCHshRcq4nmXL
         AsoUWU0Vp8+ChPJ4ie4XOc+ghxfR3eFe8Cf3XC7kRFBMtxzwpaPuwRx0tbpg4cv0L5Vj
         WxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ4cVOMSjAKovmRTzw5Cl/k4xkXqU4HqYgfnE4YJ/O8q67x+GHsGqGy3NeUnVHUl/kcmJ4w0XJ1mYbAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rh0UV6JiVuCBrisSKDc8jRdzCFyusfq0StgYAB4ydHq1AHis
	RIWalQatbC6RX/kUB/Jd2MWByouC4p2eAf0P2b44Jk2HWTejWgVA+Q1bX1YnYcE3
X-Gm-Gg: ASbGncugH3jDzasGkATP7qYO7hycy8Rs+qM/417inVYQtt2KmcoMwY9n8xx1lQLq+gk
	uAym3qyj13zaXcnucR2KtLHzz3EFbyHv3Y1rPRYpY+gpY/XCdP9qnP4Rv0iPuz/F+Mbk2p0wHFa
	Voia0MC+9OWQyQMcz5l7FR6peoTT3AV060qRNmSUrcRtNhe1f92Xb22XtfnqvfbPqPyz+brsAAF
	+BHxhmZENBA3eLlRcNnsPs3i71oHFKZ5fs6YGKxkxPXPybF7z2Z7ivXJDU8CKzGuMzw/izVs9Hw
	JNqLBwVfmZjLM6Vl1Co/u8Q/T8mMiIl5htYvhcdStRhJZtqErMESRuZRWk3PjwRbtwOsk+bK16o
	8DUuYPwC3MHtjSuTnaXtJJHkqegmoZdo4lPc61PwkyrskeYtvSaquJ7cOXFNy6UycMRKQkyHv/Q
	9UqfUfHWRo5gGRkmquI1M=
X-Google-Smtp-Source: AGHT+IHmd0gOiOpWmcB27pAVvMlA4RBCZqgipbTUOMbsJtFNOyBLNDEtmq8HfPXcWQ+0JZW4Va9ZdQ==
X-Received: by 2002:a05:6122:3092:b0:54b:bf2f:bcd7 with SMTP id 71dfb90a1353d-5524ea15ff2mr3969285e0c.11.1759756864143;
        Mon, 06 Oct 2025 06:21:04 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf63c6asm2959549e0c.19.2025.10.06.06.21.03
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:21:03 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso2759415137.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 06:21:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVROR4fEPMF7A5tiSrgnsEjIn7bzaW0ley8Kf6fQESXylKvkQ9qGF9+kTyFRZbwj5FCzFnJDpWiQySrfm8=@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5d41d17bfd3mr4212837137.32.1759756863544; Mon, 06 Oct 2025
 06:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
 <mvm347wjj90.fsf@linux-m68k.org>
In-Reply-To: <mvm347wjj90.fsf@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 15:20:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
X-Gm-Features: AS18NWBaXdKwIk39XXp--4bSlHAuBircfzV6tgtSqOZ0QwIv2ppBEo2LZ9edH4Q
Message-ID: <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Mon, 6 Oct 2025 at 14:40, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Okt 06 2025, Geert Uytterhoeven wrote:
> > --- a/usr/include/headers_check.pl
> > +++ b/usr/include/headers_check.pl
> > @@ -155,6 +155,8 @@ sub check_sizetypes
> >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> >               check_include_typesh($included);
> >       }
> > +     # strip comments (single-line only)
> > +     $line =~ s@\/\*.*?\*\/@@;
>
> I don't think you need to quote the forward slashes in the regexp.

Thanks, you are right!

So far for not just following my instinct, but looking for similar functionality
in other scripts like scripts/kernel-doc.pl...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

