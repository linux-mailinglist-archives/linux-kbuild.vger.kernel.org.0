Return-Path: <linux-kbuild+bounces-7036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C910AAF55A
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 10:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8BED1BA2E0A
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2514226D05;
	Thu,  8 May 2025 08:17:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0821D596;
	Thu,  8 May 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692242; cv=none; b=jVvICV5oHRRDfNTHHn+fsDHomlSZ4aiYdPkIF/+NClINreqQ4Z3qeKeLlGtmycGMUTFOWn/628jxuWYsfdYL0/w3iob2L9SSFVWn9nUPuo8fbWrnTfdx07fEhgePoPg2bsn52rF4FppTL/NM3H9R+NVjR7Vq4Y274mx98582ITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692242; c=relaxed/simple;
	bh=DQtLfoiwndRcIQmPR0VA4whVgw14Q74a05o6iBstBRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IL+3xCWXcRzR80I7aHWRaDpmYcMH5z7oukHWN/eYKyt+wS1u2+bW8Rk1KBuKUDQ3OR7Z3bjZd1AiHt35pZkN4czzUuZMvNwo2DsDIEkof6B2WTaFLamu/SCEcZdSkbscAY/WOOBqAUZrib2fTTrcgHwFKf4Y8V2kCwqyjhj4lig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-525da75d902so212244e0c.3;
        Thu, 08 May 2025 01:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692238; x=1747297038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow+3EqpCvuYbhqRJAc9aX8aHDpymXtE4VZzdnm2dvZE=;
        b=gxiH6AUlYdDOMN0hZDH8U5nbKPAxp7t0HtPOyjwpOxbnO7w31GoWSS3h7UU3pk1daN
         znCk6Lz2QijluQ/QDtoABA7bZJcqFA84YFE83ICnKYHgSKEHztsDsmE1KhMXXuR7V6Nj
         FmseUG7VrkySzHB7B3Xw5ZIKYgNy/U7LDFQVrdyvdC37uYoWmIYeJOlLAoG7ZRX6r2bD
         JooJ8QCZX2XQcNZ1uNpuXUUf3bUVWhGrroZzRU5q7crNSQ0QFLIbo8zauiKXE+KJFBmG
         ic6UVfMDt2cfqSIOMlpLAXItvRTdRqFiVKmBZjDybqtijm6u8JjAJq/H3yTrbyde5k/l
         jLGg==
X-Forwarded-Encrypted: i=1; AJvYcCVSFakYPLTHSvO9K1ePkYWyVW6pXzQHl2+OziXxAvKpzEgAxInC0flYlnzTdoYkl5IKjNPkmHgusWRZr1U=@vger.kernel.org, AJvYcCWcLeJW3WQVSETU9nCesNzy2mDgPEIsYJ3S7sJt4ELlsIMD2SXtQcBUTL1fUbHcDW59k1cKa1V9oLdeGsOF@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmbVnNHkeS6V2uk1Xr2a9jY5BYzwKUaMHXzUP9pJG8tf052H8
	zhwgUaiE2H9FivUOjUyWO82Uz5vf0cRkRGemMzJtLSDCLDkD07bpFtJfcOt6
X-Gm-Gg: ASbGncuBS8fRKuBPwTxOuZiU4h+meiZtbLb83ev7JRl0VbcjOWvDw47Jdz/GOUdwE/X
	RePEisZiT2UT/TKt/3Uz29vYVYEmgIF3J2y0vpLxyjsa5XM73DF5LJN6j87DiisWQih7NVxn4gS
	QDGbW07qnqXzIVsXpCnWeXzFf00wqeWozXmWUdwL+WpFo8dnTwYZbe6GRJ7POtxPBojFQDIPAWT
	Mb8zYnPn3glqfxKy3yuBFghfAVzXstfnDAeLGYKXCReKcwQFb9bUYzMXNQv8SHDEc4txsygJyrF
	nL9UIuPkfvjmVxduv1q32ekee74Mu8NZP1kWNSqtQny3xTDY9kOe6+0Nmq0xueBfhUgA5WI6ZtY
	KZ6yBSZ0=
X-Google-Smtp-Source: AGHT+IEelZ//mgmVbB5DujUfPdUMi9KvJwGgb5sWRWLEttzilS93LSMTspAUVXAYM1BmIcZ3al55PQ==
X-Received: by 2002:a05:6122:3102:b0:529:f50:7904 with SMTP id 71dfb90a1353d-52c37ab9322mr4843957e0c.9.1746692237755;
        Thu, 08 May 2025 01:17:17 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41f2070sm3121543e0c.45.2025.05.08.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:17:17 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523dc190f95so274013e0c.1;
        Thu, 08 May 2025 01:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8/jrKnQuGjr8b7fufYR3C3HaL/GIlBA6v7GCXuFLSQ5WoZq2LALN/41lr+nSdDqrq3p5IIZz5Y+JGZUk/@vger.kernel.org, AJvYcCVE01VPWwtJ96k6pL3v6CSNSLiiGn4IDX0okBH26O9IKs2TGX8CShoA2gS+rG+ZrTci7VZ372RqhBx7N30=@vger.kernel.org
X-Received: by 2002:a67:e9ca:0:b0:4dd:ad20:a337 with SMTP id
 ada2fe7eead31-4ddad20aba7mr1331118137.7.1746692236562; Thu, 08 May 2025
 01:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507074936.486648-1-masahiroy@kernel.org> <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <b1e4e83c0965e10f2fe59826d19eaf131ec7aef9.camel@sipsolutions.net>
 <CAMuHMdUwE7btR+ebG8-gvPb8GPnxUGPWw3yKR4qM4Uc_mYcHhg@mail.gmail.com> <CAK7LNAT_m+R3Keyys2NpmQWRmZzHNv9FM_ALv=vn_WMzTSWhyw@mail.gmail.com>
In-Reply-To: <CAK7LNAT_m+R3Keyys2NpmQWRmZzHNv9FM_ALv=vn_WMzTSWhyw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 10:17:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuQNi02KTCKnsS6V=POsz9X=2003b+CWxwCc=23ULuYQ@mail.gmail.com>
X-Gm-Features: ATxdqUGI8nxoRV_vYCzmDMnRSJwD-zAQCeANtCnK3wswgqflfW4cB8GVMqBaQt0
Message-ID: <CAMuHMdVuQNi02KTCKnsS6V=POsz9X=2003b+CWxwCc=23ULuYQ@mail.gmail.com>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>, 
	linux-um@lists.infradead.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yamada-san,

On Thu, 8 May 2025 at 10:14, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Thu, May 8, 2025 at 4:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Thu, 8 May 2025 at 07:29, Johannes Berg <johannes@sipsolutions.net> =
wrote:
> > > On Wed, 2025-05-07 at 15:38 -0600, Shuah Khan wrote:
> > > > My workflow:
> > > >
> > > > - Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled
> > > >
> > > > - Check for arch/x86/realmode/rm/pasyms.h
> > > >    ls arch/x86/realmode/rm/pasyms.h
> > > >       arch/x86/realmode/rm/pasyms.h
> > > >
> > > > - make ARCH=3Dum O=3D/linux/build
> > > >
> > > >    This patch cleans the source tree, but doesn't remove
> > > >    arch/x86/realmode/rm/pasyms.h
> > > >
> > > > - ls arch/x86/realmode/rm/pasyms.h
> > > >       arch/x86/realmode/rm/pasyms.h
> > >
> > > Is that even _expected_ to work? If you have x86 built first, I'd alm=
ost
> > > expect you to have to do "make ARCH=3Dx86 mrproper" before building
> > > another ARCH. I don't see how ARCH=3Dum would know how to do a full c=
lean
> > > up of ARCH=3Dx86, unless this is somehow arch-independent?
> > >
> > > Or maybe that's not an issue with other architectures because UML is
> > > special in that it uses parts of x86?
> >
> > Probably.
> > I only use my linux-next source tree for fixing reported build issues o=
n
> > various architectures, and I never use make clean/mrproper.  Works fine=
.
> >
> > > Though I guess the patch here should make it do that, more or less, b=
ut
> > > it can't, likely because you're also switching from in-tree build to =
O=3D
> > > build?
> >
> > Yeah, mixing in-tree and out-of-tree builds causes issues.
> > Never build in-tree in a source tree you use with O=3D (except for
> > e.g. "make tags").
>
> I argue this.
>
> You can start out-of-tree builds after running 'make mrproper'
> for the architecture you want to build the kernel for.
>
> Hence, Kbuild suggests to do so when it determines
> the source tree is not clean enough.

Sorry, I meant "without mrproper" (which wipes my tags file).

> Unfortunately, "make mrproper ARCH=3Dum" did not clean the tree
> deeply enough.   Hence, this patch.

Thanks, fine!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

