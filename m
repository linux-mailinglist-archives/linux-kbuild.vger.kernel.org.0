Return-Path: <linux-kbuild+bounces-7276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC360AC486B
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 08:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2113BA08A
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 06:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F141EF0B9;
	Tue, 27 May 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGsdrame"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D11E51E1;
	Tue, 27 May 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327282; cv=none; b=kbvhDACsQRXySnk2GetaMMYvHeGouhtxbHfsgHBJzofxas/CBAUMCPh68gDADaYmW2QCPAvzgSGBvY2jx1XmBCdepAaBphQiz41v3BnD0PIRrHb5XiplItLjfG/BVq7CdPIUx7P7d0d5XYcYR65WYdvg5uaqny97U4qiXtzsBgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327282; c=relaxed/simple;
	bh=LnppPxxgT4dG94wpbP0vtD3nP0ZmSru6h5mdvKc8aW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugrQx2V6VWpTQf6uV5EpwKnQ6PKlUmIdZgz2d0KnJcPdUBT35+PSlixQRzxRVnPQQ75fxIlsJXKsKoCLGd+mtGOpYgPC7xdk2+VgZ/c2XSlHLUguE93axSLMnDam4JaFUOxF3RYgzC6wtWk0XCFbbHGHx1MtvYa2KxymdGmpbws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGsdrame; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E003C4CEEA;
	Tue, 27 May 2025 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748327281;
	bh=LnppPxxgT4dG94wpbP0vtD3nP0ZmSru6h5mdvKc8aW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hGsdrameumAcNqhfM/r2r1oES0/wsbhk7Cf2phXlhTPnmSj/mB+nC8JylyRoJiC0w
	 gTdawvbnhd2H9i28nsFzV2JoaXB1bzUL2E2B8KxLDHY4wXy8MhiyGt9d19C/KWf1Eu
	 JWED6mB759JilHQ5kcxPLrqj4TvYkfLPFuAhsFpPmGnaBcUKfS3u8eJzoYBwkREd+D
	 NBxZ0yS1xQ21KgWgghsjSf7WPQt5EZCIrZJe6m+/+Tz77kkYK3zMQEPjdYhAZZLc2J
	 uijqsgWvwyyZNcKvzm3wdenn+8QYA3oha+H1j+CPh4D08gZo12TeG7EmyBvsyfTh62
	 9gSKVsxY7wsNw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551ed0038a0so3532787e87.2;
        Mon, 26 May 2025 23:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6i9VmXp6pSLUuKYu/I0FOBJPzyGrQ5txatSUfM/GXeR1Wmr4Z92f1C2ZD1WFHreFQRFDF3cQTH7/1JbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ycMwikuosUBQ+RU0boTh6i7J6VbGprpcaI3fY1PV5H27oKDA
	vFTwoNeSFmFEh3SVrcI+0H8KdwLJUAy9v8beio9xv5L2CnMvyZMsfSJQgKvn4dO0noE+jDT9BR5
	NiDEq61KX2UUFlLApT0VWw+t5hkFdVCg=
X-Google-Smtp-Source: AGHT+IHFajMl+cbuBYWjKakvHh/KZC0ATcnwByllYeL/vRGm7w+D5kukx+zGWciy3qfzWPMcitmahGZgrrrwANYUsEk=
X-Received: by 2002:a05:6512:2387:b0:553:268e:5006 with SMTP id
 2adb3069b0e04-553268e525cmr716356e87.55.1748327280309; Mon, 26 May 2025
 23:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
 <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
In-Reply-To: <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 May 2025 15:27:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
X-Gm-Features: AX0GCFuaORFQD2UseF9ROv_TH5PbEp7tLDpp4aCRUC1SW9KccEsh4m49_eWci6w
Message-ID: <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, May 27, 2025 at 3:16=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Masahiro,
>
> On Wed, 14 May 2025 at 22:15, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > Please pull some Kbuild fixes.
>
> So this isn't actually about your latest kbuild fixes, but more a
> generic kbuild thing now that the merge window has opened..
>
> My build times have gone up by a *lot* lately (and by "lately" I don't
> mean very recently, but in the last month or so), to the point that
> I'm now finding it to be a real annoyance due to it slowing down the
> merge window for me.
>
> I did a profile on the load just to check, and it's all just gcc
> (well, cc1 mainly), so it's not that something else like ccache got
> enabled.
>
> (Things like ccache can speed up builds in other scenarios, but I've
> also seen it slow things down a lot for the worst-case sitation when
> header files change, so I wanted to verify that it's not just that)
>
> So it's just that we're spending a lot more time in the compiler.
>
> I haven't tried to bisect it, and now I'm too busy to, but the two
> main suspects are either that KASAN is now enabled and that just makes
> the builds a lot slower (if so, it's my own fault - introduced by me
> in commit 6f110a5e4f99 "Disable SLUB_TINY for build testing").
>
> Or it's just that I upgraded to F42 and gcc-15 itself is perhaps just
> that much slower.
>
> Anyway, I'm emailing you exactly because I'm busy with the merge
> window and this is causing issues for me but I don't have time to
> figure it out - and so I'm going "maybe Masahiro is aware of this
> already"

I am not aware of the slowness you mentioned.

I compared v6.15-rc1 and v6.15-1972-g914873bc7df9
(today's latest), but I did not see noticable slowness.

masahiro@oscar:~/ref/linux((HEAD detached at v6.15-rc1))$ git describe
v6.15-rc1
masahiro@oscar:~/ref/linux((HEAD detached at v6.15-rc1))$ git clean
-fdx && time make -j24 defconfig all
 [ snip ]
real 1m46.444s
user 27m59.363s
sys 4m47.092s


masahiro@oscar:~/ref/linux(master)$ git describe
v6.15-1972-g914873bc7df9
masahiro@oscar:~/ref/linux(master)$ git clean -fdx && time make -j24
defconfig all
[snip]
real 1m45.410s
user 28m11.197s
sys 4m45.550s


However, building the kernel in Fedora 42 is 30% slower
than in Fedora 41.

So, maybe, this is because you recently upgraded your OS to Fedora 42.




[In Fedora 41 Docker container]

[masahiro@495de5a516cc linux]$ gcc --version | head -n1
gcc (GCC) 14.3.1 20250523 (Red Hat 14.3.1-1)
[masahiro@495de5a516cc linux]$ git clean -fdx && time make -j24 defconfig a=
ll
  [snip]
 real 2m25.794s
user 25m18.131s
sys 5m56.074s



[In Fedora 42 Docker container]

[masahiro@a55a26dda811 linux]$ gcc --version | head -n1
gcc (GCC) 15.1.1 20250521 (Red Hat 15.1.1-2)
[masahiro@a55a26dda811 linux]$ git clean -fdx && time make -j24 defconfig a=
ll
  [snip]
real 3m12.714s
user 35m59.299s
sys 9m10.699s







> I also did notice while timing things that the final module link time
> seems to have limited threading
>
> For the rest of the build, I have load averages in the 100+ range
> (because I build with "-j128"), but then the last few minutes it
> starts dropping a lot when it's in the
>
>   CC [M] ...
>
> stage, and when it hits that Makefile.modfinal stage and we get
>
>   LD [M] ...
>
> stage it seems to have serialized completely and just spends 100% of
> time in one single 'make' instance.
>
> But that may be an effect of the link being so fast that 'ps' and
> 'top' just don't tend to pick them out at all, of course. But I do
> note that the LD [M] phase seems to be entirely serialized with the
> 'CC [M]' phase. Does it really have to be?
>
>                Linus

The last CC[M] and LD[M] stages are very fast, because
the auto-generated *.mod.c files are tiny.



CC [M]     foo.mod.o
CC [M]     bar.mod.o

can be compiled in parallel.


LD [M]     foo.o
LD [M]     bar.o

can be linked in parallel.


So, I believe we can benefit from parallel building.



--=20
Best Regards
Masahiro Yamada

