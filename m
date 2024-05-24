Return-Path: <linux-kbuild+bounces-1932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC588CE591
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 May 2024 15:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7591F218C6
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 May 2024 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C21785C79;
	Fri, 24 May 2024 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SaX4pnE8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20284FB1
	for <linux-kbuild@vger.kernel.org>; Fri, 24 May 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716555681; cv=none; b=XUMwbqjx6soI7GnygQ3NZWSq6sc2QJLdB23wY5BlLnOpsLQRJSRZHMWTkoSFNfJkgeIDTIk4aeW8kNE5WllGDS+ZefsCS3IrSt2bL+qDKKExAw84sSFGodw08cPsJAcaWq+Cf5VFFVt/Uug7SUDH8ogkRX10wfugLzxq0L/jFgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716555681; c=relaxed/simple;
	bh=tN6XxBkDWgoF2UquDxuqkyQ0zebhpcacvCM6gy5DfEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyfCToHYkR+hB9zofFAzxhPtQLq+SxonTrb4xxWyZJWHciACSeLyLXqqhZcgnLSR5bTEYdtMuTKi6rTHbBte0s0S4IFXBSzQONFnxAagUHEgzIsjhdzUPMwe+4VyaUqofmoWeX3t4bBVRemyRO+APANqnycsLGR7xfFEpuUwNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SaX4pnE8; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b970e90ab8so363034eaf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 24 May 2024 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716555679; x=1717160479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om5PFd0wycPy9DndNUp2OMWfvO1kKpP8J8RtZYLYNRE=;
        b=SaX4pnE89X5NRKekc5Ie4k6dGdZ5qgF7Kd8AWNcI8HWnfdK/l9jbBM9a2KE0PTTDl4
         WRSv0btLJhhfCKyioWN+kra0bUxwf7KA7OSMyMHFWFqWlz6InA0zMs2UL59sf9eDR1tk
         QeQSGtPC4Ct7dHlSpEi9/Owq7tDhhUH0udyWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555679; x=1717160479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Om5PFd0wycPy9DndNUp2OMWfvO1kKpP8J8RtZYLYNRE=;
        b=MKpJYYmPqOBt9ZnLnuMrw8YuNfvSUFd+Sx6B13/HW5Fw78qgOhIwOrH4xdKspSACD+
         qUrC1HoRvdXiZq30pUjPq8u/RyMmzTy3S6tEw7YSSjvsy9xR6Io4DOjCbCILd99akcui
         Wbk3lTBYVh4ObcxTYQWCwa+sWo0Co+UiiAPZPg3ausA8QJdenbc8WAeufgfM+6HHi8Av
         F3SNaaLhbpbtp8/zqFyuegyxUeph2cVz9p08kFxR2rKY3LYW7S9mOeLu0iL7ISd1SSZc
         26PHGBvBNfSBBOMAEXqK9ZXUePAJrryzm6Jol6ZjrWeaAHptBKSEOZMQjUg14nYZWsHh
         t5+w==
X-Forwarded-Encrypted: i=1; AJvYcCVYJH77JHOp75U+jGkw3HznCrBE2SNU80cVZuN+p7QRQFSBe0YeRbhl4iRVwsli0jTu+o37T/s/P0UCFTyVKZUkmvhHVcYo18OFJdMK
X-Gm-Message-State: AOJu0Yx/YXnEMl5ooREA/4a4nbYsdfaJobrkVHogDQVNU/Z5BTeeyQXh
	axo8rLz8gu9hkrZNlcRKAoHWivZmJDNS4dq13TZZnG9vZngX9LDI1qw8gUhWZaCNpYtmURYcoEq
	hk6k7sfxmZco7gqgfVGTK3WCWMFxO52d8zO3K
X-Google-Smtp-Source: AGHT+IGVfrTU7zewsgA4NrCb8hon5XFyEh1hQSBkElhbm4S4rtlA5NVITA9tGeDRdzgvtX7FYig1l3xEhLMmhRMn4h4=
X-Received: by 2002:a05:6358:5328:b0:186:27ce:639c with SMTP id
 e5c5f4694b2df-197e50cb1efmr304204955d.18.1716555678560; Fri, 24 May 2024
 06:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
 <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
 <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
 <CAFLszTh5M+4Vp8oR3t-=6vsROgVJa0NU4egfJu2QuugjAfbrsw@mail.gmail.com> <CAGXv+5Eajy55kAcNzyZtsp9MJhD7EnNONW-JYsoadctaTjnxgA@mail.gmail.com>
In-Reply-To: <CAGXv+5Eajy55kAcNzyZtsp9MJhD7EnNONW-JYsoadctaTjnxgA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 24 May 2024 07:01:06 -0600
Message-ID: <CAFLszTjeQdwEp1AgL8geK7AZFwQqDfTkdzj4V2JkYqU4F7Em4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: wens@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ChenYu,

On Fri, 24 May 2024 at 00:30, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi Simon,
>
> On Fri, May 24, 2024 at 1:38=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Hi ChenYu,
> >
> > On Thu, 23 May 2024 at 11:30, Chen-Yu Tsai <wens@kernel.org> wrote:
> > >
> > > On Fri, May 24, 2024 at 1:19=E2=80=AFAM Simon Glass <sjg@chromium.org=
> wrote:
> > > >
> > > > Hi Chen-Yu,
> > > >
> > > > On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org> wro=
te:
> > > > >
> > > > > According to the FIT image spec, the compatible string in the fdt=
 image
> > > >
> > > > Can you please add a link to where it says this in the spec? I cann=
ot
> > > > find it after a short search.
> > >
> > > (Quick reply from my other email before I forget.)
> > >
> > > From the FIT source file format document, found in U-boot source
> > > "doc/usage/fit/source_file_format.rst", or on the website:
> > > https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
> > >
> > > Under "'/images' node" -> "Conditionally mandatory property", the
> > > "compatible" property is described as "compatible method for loading =
image."
> > >
> > > I'll add the reference in the next version.
> >
> > OK thank you.
> >
> > There is also a spec version at [1] - it might be worth adding mention
> > of this explicitly for the fdt nodes.
>
> It seems that this is already mentioned?
>
> See https://github.com/open-source-firmware/flat-image-tree/blob/main/sou=
rce/chapter2-source-file-format.rst?plain=3D1#L343

I see that but I am suggesting that it could explicitly mention that
the FDT should not have a compatible string for the model...that
should only be in the configuration node.

>
> It looks like it was copied from U-boot directly.

Yes mostly it is the same, but there were some changes. It has evolved
slowly over the years but the bones of it is stable.

Regards,
Simon

>
>
> Regards,
> ChenYu
>
> > Regards,
> > Simon
> >
> > [1] https://github.com/open-source-firmware/flat-image-tree/
> >
> > >
> > >
> > > ChenYu
> > >
> > > > I believe this patch is correct. Since the information is in the
> > > > configuration node it does not need to be in the FDT.
> > > >
> > > > > node or any image node specifies the method to load the image, no=
t the
> > > > > compatible string embedded in the FDT or used for matching.
> > > > >
> > > > > Drop the compatible string from the fdt image entry node.
> > > > >
> > > > > While at it also fix up a typo in the document section of output_=
dtb.
> > > > >
> > > > > Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> > > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > ---
> > > > >  scripts/make_fit.py | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > > > > index 3de90c5a094b..263147df80a4 100755
> > > > > --- a/scripts/make_fit.py
> > > > > +++ b/scripts/make_fit.py
> > > > > @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compres=
s):
> > > > >      Args:
> > > > >          fsw (libfdt.FdtSw): Object to use for writing
> > > > >          seq (int): Sequence number (1 for first)
> > > > > -        fmame (str): Filename containing the DTB
> > > > > +        fname (str): Filename containing the DTB
> > > > >          arch: FIT architecture, e.g. 'arm64'
> > > > >          compress (str): Compressed algorithm, e.g. 'gzip'
> > > > >
> > > > > @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compres=
s):
> > > > >          fsw.property_string('type', 'flat_dt')
> > > > >          fsw.property_string('arch', arch)
> > > > >          fsw.property_string('compression', compress)
> > > > > -        fsw.property('compatible', bytes(compat))
> > > > >
> > > > >          with open(fname, 'rb') as inf:
> > > > >              compressed =3D compress_data(inf, compress)
> > > > > --
> > > > > 2.45.0.215.g3402c0e53f-goog
> > > > >
> > > >
> > > > Regards,
> > > > Simon
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

