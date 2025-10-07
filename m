Return-Path: <linux-kbuild+bounces-9033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7950BC0818
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 09:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9991898859
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 07:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856B0255E34;
	Tue,  7 Oct 2025 07:43:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2221D3CA
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759822993; cv=none; b=g0giyE5AxsGCcH++kyzTP3KTTBmOVaxYn46j2zNT2co92XgXou14NawjTVhbxSWUProaPMhSvbqf1YEUfjmjA8Sl1zOiRYrOdfyJuJoLe9uOpybGvmOJIYpnD/IWn/PBX/9OAud2ugQdzvp7wDvLv9CkyLtOslv5lymja9cGa8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759822993; c=relaxed/simple;
	bh=yD3QIkLWD6CmpQEwsafFM6XowJaBglaGuKWBSqHUs7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qU8ja9aV4qHJIoZlJKabqWiA2LU/rY4WZvpb2TTPoqB9oDUEpYKC8dSzEBbIROhSd7aH22wp88AFHjRHXc7vSUcz4+u4P8YuNC4Krl8B3eaIbQbLd8H/6pamzNktf8veevGblzpJ0XhoJMN8/TNhppJO/n7pQhWbeIMR+micog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so3695911241.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Oct 2025 00:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759822990; x=1760427790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7xFWmE6FERg0BV2hLFsu2RpZYyTvYQhUdrHdelRqPs=;
        b=LXEiNFjLWZYyW8lltLPRIZpYsTN32wOMlbRsruZaQknwfmP1O/I0qxWS/yYPFKaYom
         uNtFXm2XEk1BBcKsyCTKZzkCerVqdIsIbFjE0qrrZS33a8QppnqvIGfSMzgk5qIUmE2L
         6I5bHP3EKQpSq+dtjA8LMewqMACMkupMg8JbPAKAX/yFMbUR/ro90xaIzyqAMoG5bdr9
         AsfQ464KL1eQ52LXtb/WX1kPj31X83vRZ+BZksxAXmMJyytrwoGU8eO46ngNEm1qUXLs
         EoiDOkBwz+cH9SmyNuVR0OHLiGt/QKxT8y1K/vuD+bjm6v5cs3D51Jgn2BPwRpF4o1bU
         qiiA==
X-Forwarded-Encrypted: i=1; AJvYcCVPvUmxEhKiAS2ueI5lW1H1+6clatTAIMCBo+l6heSpPu8KmNZACYRWDyRgQm8C76nFzu6KXjLf74eIG9k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7Nz9ClGk6m+H68qFvJh/SZ0nwQ4gJO4F42JP2EztRzqvkw/I
	PXbBpkYerruCQEybAxKflr1i0E2CexmsXxW2kBLEr9DL9MhHV/Joj+JFwvmLExMA
X-Gm-Gg: ASbGncsmWwHQ6dOb0cpyVK1T+j6qjzGqEwbmosY5kZYV3g6EcQoQqhuHE3Dnq/6woei
	JuAmdoIFcKnIZQn4anshehhC1rHAgUWn4pUSXkILC3c9d6u3suRyf5yDFIxWbQ/qtoEKH/YPpXV
	KuwXu28C6jq9iMk2bLBCOlm0dCSagJ9c4gQ6A9L4USAvyL3t0FMmKilRTUlzJpS4KzQDCHQ7CG/
	5jC5z5VqVXwNJONnf1z4vgRBC3ujK0Yp548rrZe9h1iBMxRZJeQG0DP9OVD3/0/nALLF0u9EMEW
	RaMlNeWL8L+yPnhFPdRsKKONu6XPSlOh+DuzQaJPhT61aQFdcGVB7bXChMTq95ScNkBTXPNWiNb
	I8gaX6c84jV7to8AfbEkg8o4/+3pFas/ke3A+DSjcSz7hN1VpnPbMAtq35KJhBa3atKUl45CIOs
	kfFgS4Ta8J
X-Google-Smtp-Source: AGHT+IEBIG+2bsol7PNaUZ/8QU2jl7SIwOB9Tv0nPkf1QL40HWtrt84kosHlMvAasallC/4BEZHLXQ==
X-Received: by 2002:a05:6102:80a9:b0:59d:ad3:e1e4 with SMTP id ada2fe7eead31-5d41d01e26fmr5894763137.5.1759822990222;
        Tue, 07 Oct 2025 00:43:10 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4c5d697sm3532552241.0.2025.10.07.00.43.09
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:43:09 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso3017839241.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Oct 2025 00:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAlp9neiY9t532L7s8Xb9ZhE1rfLozf9mrM5xz1FKF0kTkSboZFyNT92ClxY3ZotlS/LZULgWwb2pa2PU=@vger.kernel.org
X-Received: by 2002:a05:6102:2acb:b0:5ca:a978:8a with SMTP id
 ada2fe7eead31-5d41d1728f1mr5458809137.33.1759822989670; Tue, 07 Oct 2025
 00:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
 <mvm347wjj90.fsf@linux-m68k.org> <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
 <20251006180201.GA429708@ax162>
In-Reply-To: <20251006180201.GA429708@ax162>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Oct 2025 09:42:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi09MEU+AUE7C5OtJzO1ZiQ-1OVVi9EWNxt7vHA3ZvVw@mail.gmail.com>
X-Gm-Features: AS18NWD5V9LmBNtT9znIAEdUf0-LOhM5TAhAk1S7CGHt0o8L8arsWU6hMHw8j3s
Message-ID: <CAMuHMdUi09MEU+AUE7C5OtJzO1ZiQ-1OVVi9EWNxt7vHA3ZvVw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 6 Oct 2025 at 20:02, Nathan Chancellor <nathan@kernel.org> wrote:
> On Mon, Oct 06, 2025 at 03:20:52PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 6 Oct 2025 at 14:40, Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > On Okt 06 2025, Geert Uytterhoeven wrote:
> > > > --- a/usr/include/headers_check.pl
> > > > +++ b/usr/include/headers_check.pl
> > > > @@ -155,6 +155,8 @@ sub check_sizetypes
> > > >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> > > >               check_include_typesh($included);
> > > >       }
> > > > +     # strip comments (single-line only)
> > > > +     $line =~ s@\/\*.*?\*\/@@;
> > >
> > > I don't think you need to quote the forward slashes in the regexp.
> >
> > Thanks, you are right!
> >
> > So far for not just following my instinct, but looking for similar functionality
> > in other scripts like scripts/kernel-doc.pl...
>
> I will fix this up when applying. I think I am going to adjust the
> comment to
>
>   # strip single-line comments, as types may be referenced within them
>
> just to be a little more verbose about why it is being done.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

