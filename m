Return-Path: <linux-kbuild+bounces-3035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1326954157
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 07:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9380B284D79
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 05:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1122837B;
	Fri, 16 Aug 2024 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sz6QhdeK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C598286A
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723787344; cv=none; b=iwkeBQCF58hyY+jRchNeZlfj8ncIaqY5GMhJtS008r6Y6HyTyBe7nlXUW7WysQjikpKNuBcBW/HhrNTDA7jiGkeSyCJ32pqRWeu4hALM58Jqpo2LCYiYBXTmj1tiHpjgbqOBsBy0ONPuzrXpuwP6apCDEmkciMeplurV+5ZElyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723787344; c=relaxed/simple;
	bh=oCIfkEYlcBCKKejScrp1dIHsZ1LKtlvNnrUS4iR+v18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkvt1jQVMpU90Yxifa3UyM74qiorl4n3XCQu08WHW9kiA0YagznVmrppIguEf8yJpFNfr+jEiTAMT1xokDYswvEDDiLkV+PKvPO9trq0IPlrx5f/bIoCqX1CxX3EJAwYYv7fEm9OQ2B0u6GvSSRO7VR8xqeOW8fl7+J2klG3wxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sz6QhdeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8567C4AF0B
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 05:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723787343;
	bh=oCIfkEYlcBCKKejScrp1dIHsZ1LKtlvNnrUS4iR+v18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sz6QhdeK3rWmNNK32ansJ9pX3TrdDn+kuU8FimTIxk6GpkYULCq2DfxyQzAWnCq04
	 Wlp5Xss2IdTajSDRql9cpTc9N1dowSUCjfjLfVfyMWngeNvOqtBimvlt/Q5HbNvkL6
	 uom+FJ8A4Ig23PU0PxdVqe7jxtlRltXh09C45SHZnr26lmEqt8PhDbz49UKQkrBkWh
	 QAMIZJGuKOrqyrYDQ/bg2Ebv8t81ac5D8Y2JPv6hOa8+EQHLAiZa5ZRq7iPC5fC/bK
	 0IJdp9rRUTNlCP1T6Gi59YlJJuVqVnLoYRHtXWOs2iebYGuckDk69t3/YSjGEUb4hL
	 ZOF9FulbKWAcQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efbb55d24so2954597e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 22:49:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOGS2dkxnDkBxJQ9hSEnpn61r60wVqQ9hsLAlDneuQBdVelhl1CUvZ9SI9h+3ELFfSWqpWkbKlhboKPjoCAHijj4wuVIDfcTm2OpOY
X-Gm-Message-State: AOJu0YzAc3p03Ii3U/bUi17JYggWacjoWOolOB6zKURZugZ7O3wmc13f
	C8PPRio1WRUMgEbUwtOanIXoycUljhl0C4ZmnRJ4BEhBI19ux0PO33igsRoZMy7pStAtACx/ueq
	w9tikonYJTMWYhR8PT8WmOb/pzHE=
X-Google-Smtp-Source: AGHT+IF3eNvDnmIdyc2Ctr1DHluY+pjCO4s9mFfcj2r4VJCeOAyAg6AeMrgmDvOijUHQJWql5zTpLAd4gN2pqSfZG0g=
X-Received: by 2002:a05:6512:3046:b0:532:fb9e:a175 with SMTP id
 2adb3069b0e04-5331c691504mr1529702e87.6.1723787342317; Thu, 15 Aug 2024
 22:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815110059.4912-1-tianyuanhao3@163.com> <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
 <CAK7LNASTXOe5_VR2n79EFbp6a=hLoKKstoy31zf1nZv2PXjcaA@mail.gmail.com> <2204647a.20c4.19158fc37fd.Coremail.tianyuanhao3@163.com>
In-Reply-To: <2204647a.20c4.19158fc37fd.Coremail.tianyuanhao3@163.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Aug 2024 14:48:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARK4p=kOZE5V6q=Hf49+VGnP4xbhr7zAsndyjD=P1+f-g@mail.gmail.com>
Message-ID: <CAK7LNARK4p=kOZE5V6q=Hf49+VGnP4xbhr7zAsndyjD=P1+f-g@mail.gmail.com>
Subject: Re: Re: [PATCH 1/1] kbuild: Only build dtc if needed
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Rob Herring <robh@kernel.org>, linux-kbuild@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Simon Glass <sjg@chromium.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 11:20=E2=80=AFAM TIAN Yuanhao <tianyuanhao3@163.com=
> wrote:
>
> At 2024-08-16 09:52:57, "Masahiro Yamada" <masahiroy@kernel.org> wrote:
> >On Fri, Aug 16, 2024 at 7:41=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >>
> >> +Masahiro
> >>
> >> (use get_maintainers.pl in the future)
> >>
> >> On Thu, Aug 15, 2024 at 5:01=E2=80=AFAM TIAN Yuanhao <tianyuanhao3@163=
.com> wrote:
> >> >
> >> > At present Linux always builds dtc if CONFIG_DTC is defined, even wh=
en
> >> > DTC is provided. The built dtc is not actually used, so this is a wa=
ste
> >> > of time.
> >>
> >> That's kind of a edge usecase, so I'm not sure it is worth the
> >> complexity.
> >
> >
> >Indeed. Not worth the complexity.
> >
> >
> >Overriding DTC is not a general use.
> >It is a knob so that someone can test the latest
> >dtc from upstream.
> >
> Some meta distributions such as Yocto and Buildroot compile a common host=
 dtc, while ATF, U-Boot, and Linux can share the same host dtc.


If distro's dtc works for the kernel, we should remove scripts/dtc/.

Instead, we need to start caring about the minimal supported dtc version.
And, it will make it difficult to add a new warning flag.

We can use external dtc only when it is the same version or newer than
the internal one.

If you use an older external dtc, some of the dtc warning options may not b=
e
supported.





> >> We could also just make CONFIG_DTC visible so it can be
> >> disabled. Or make it a path defaulting to the built-in one. Maybe
> >> Masahiro has some ideas.
> >
> >
> >Let's not do anything.
> >
> >
> >This patch is NACK.
> >
> >
> If you think there is still room for discussion on this topic, I can spli=
t this patch into two as Rob suggested.


No, splitting the patch does not help anything.


> >
> >
> >
> >>
> >> > Update the Makefile logic to build dtc and fdtoverlay only if DTC or
> >> > FDTOVERLAY is not provided.
> >>
> >> Overriding fdtoverlay is not even supported currently. Adding support
> >> for that should be a separate patch.
> >>
> >> > Also, add an fdtoverlay wrapper to hide the actual path differences =
of
> >> > fdtoverlay from the make_fit.py script.
> >>
> >> That's ugly.
> >>
> >> Rob
> >
> >
> >
> >--
> >Best Regards
> >
> >Masahiro Yamada
> --
> Best Regards
> TIAN Yuanhao
>


--=20
Best Regards
Masahiro Yamada

