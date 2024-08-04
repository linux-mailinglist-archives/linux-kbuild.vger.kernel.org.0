Return-Path: <linux-kbuild+bounces-2804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6D946C8E
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 07:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB5A1F21696
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 05:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A0C8BEF;
	Sun,  4 Aug 2024 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsOfyjm2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D4320F;
	Sun,  4 Aug 2024 05:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750688; cv=none; b=CBWvurGkUvRcdXv5Tj5WHfcMwF2nfX5JikfrCNcx1wllljqqN9LKDu4ithNGx5L9o2BfVwhqU+H2C3cb7+O8fpdDbi+kLh1WTlymvM1YCupBn4WsGgSVc/aJlEPN/t5MfX093+UtGV5ZQD8gqFHmwZQKGGaGFly769y97mkYwsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750688; c=relaxed/simple;
	bh=HfnLNpR1k8KnURzU3mkSvZ416XU1B8CH83ZTf1ICXWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXR7PrphR9MAhx0dz+bgUNKcAplc3JYHrrD90N4iFDisPceL3LT4nGLgiOUHk+JnWAoCRWRBmszQwia8SdHlUTzXrwHTP7bJM5cSNzou9oiRqX+q4ZWRb01Tor/N2gVzcHYLlcsNknXj8Kjd9Rea+RLZ2qMzXUFZYCEukqp7S0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsOfyjm2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so107707721fa.2;
        Sat, 03 Aug 2024 22:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722750684; x=1723355484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoAXWwOrkvYE6oiXTHRknxHyBes72DPfu56PS+LLAuE=;
        b=GsOfyjm2/fel9BIYvJJsqcDEr1fBAUYTVZBWQlE26u+lSjkACt5fJAJzlFf2mldQWV
         FUMdfdVc82thc+VB/nO4hhEM7n1/r5CMjjaEC+V1sUE1zKoHdw0ONX70s8+CPxZj7NkC
         Y5VC/6jwBrybkK1lpdWi5yDjak9yMyEn6FrZFGXlV8+gX7aDlESlaLmecbtx5s+ijE+x
         ujVA2pysrq5asSh4/69NSa8MOf+lef5HmgBbYM9R+g3Ltb6+ANlZY6zlDIWSvyn2oQPM
         QnL1kUw20uwQKam1+vpD98VBu36k2hkqUHi3VvdJAqId9v//losXWOvA9aAsjylrHo8o
         8bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750684; x=1723355484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoAXWwOrkvYE6oiXTHRknxHyBes72DPfu56PS+LLAuE=;
        b=G6za2Cszobq/r8v2RZWwiVnPqwoX7oCOfPnHELkCkmHUAi8aeYWK38JxyqF2nU+5Rq
         ahq7AYH3wwMkWccb7sesmACZeRt9KiXwR5sbl5dj/4U6VZLM3EvlUfHqBE8piligC59s
         9hvd+lN2mWWnGRvqYkDWsRjm3hnd1kye9I5IAACE0Vkb4d7ybOaNnazIct8RqyJLiExh
         6+Ds4jZM8ol0qtxRbDcC3kHaK2qLSeOGTvLWQXRjNsm+TNizz59QzUQ/FWruHMqgkiZP
         gCTEsVWmBFr0YT+hyFeKic5zdEx9mM5WWlI9zxZdD53sfbT4owU0Bw2pC91bz33TLbDK
         dLXw==
X-Forwarded-Encrypted: i=1; AJvYcCVlFjVM1xDvTLmJxKP1xOv/L7J1MQv1OUN6KJgKpzLHY5BjjTN+hO+3NdBEKr0y92cCW3B0Mj4OuDnujVSHqOMlqh2/kzPMOFCazBQfggeIOr3cjjVmPmZtj158fyV4wpnOaZPCspXKyOm4
X-Gm-Message-State: AOJu0YzcfpYwfTFBplFzEwLaNWwiBek/zvmGFIk8bP658/GFo0sFwmw+
	slVGVJr5BjX1FYqxAtNyRaAnaShwH6LhBvDKgPLsWL927RqnOpgC+ewQ0f4XhyCuOP0fyiPM4+X
	3GGL2RpdfUwSw/iDI44dxv10PHzSEpCMo
X-Google-Smtp-Source: AGHT+IHcLa/Bxklh5raZZOLH8cZDh6ssUUNu5pai7GOwB3B//C/44K3G4Vlm/EJOHt8Gbh7eBChv6plsBEEtNRGVwFk=
X-Received: by 2002:a2e:8718:0:b0:2ef:21e5:1f01 with SMTP id
 38308e7fff4ca-2f15aa888ecmr57770141fa.20.1722750684195; Sat, 03 Aug 2024
 22:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240803125153.216030-1-gnurou@gmail.com> <CAK7LNAS83xr+MUMjQXj7LE1b1ZbRUOd4c+FYHUQv=y97O4Ymqg@mail.gmail.com>
In-Reply-To: <CAK7LNAS83xr+MUMjQXj7LE1b1ZbRUOd4c+FYHUQv=y97O4Ymqg@mail.gmail.com>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Sun, 4 Aug 2024 14:51:12 +0900
Message-ID: <CAAVeFu+mH_PrUHm=i+iSr8Fz14C18D+4A9eq+FPSieLNsqa+PA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 10:47=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Aug 3, 2024 at 9:52=E2=80=AFPM Alexandre Courbot <gnurou@gmail.co=
m> wrote:
> >
> > When trying to build the compile_commands.json target from an external
> > module's directory, the following error is displayed:
> >
> >         make[1]: *** No rule to make target 'scripts/clang-tools/gen_co=
mpile_commands.py',
> >         needed by 'compile_commands.json'. Stop.
>
>
> Good catch.
>
> But, to reproduce this, O=3D option is also needed, right?
>
> e.g.
>
>   $ make O=3Dpath/to/build/dir M=3Dpath/to/external/module/dir

I am building the module as follows:

$ make -C ../linux/build M=3D$PWD modules compile_commands.json

The kernel itself was built with O=3Dbuild though.

> > This appears to be because gen_compile_commands.py is looked up using
> > relative path, which doesn't exist from the module's source tree.
>
>
> The phrase "appears to be ..." is somewhat modest.
>
>
> You can reword this to pin-point the first bad commit.
>
>
> For example:
>
> gen_compile_commands.py was previously looked up using a relative path
> to $(srctree), but commit b1992c3772e6 ("kbuild: use $(src) instead of
> $(srctree)/$(src) for source directory") stopped defining VPATH for
> external module builds.

Thanks, that's much better. I should indeed have bisected to find the
source of the regression.

>
>
>
> > Prefixing the dependency with $(srctree) fixes the problem.
>
>
>
> This needs back-porting.
>
>
> Please add this:
>
> Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src)
> for source directory")

Done, and sent v2 as well.

Thank you!
Alex.

