Return-Path: <linux-kbuild+bounces-1931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBD8CE101
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 May 2024 08:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3398B21395
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 May 2024 06:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25F782D94;
	Fri, 24 May 2024 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EMaqoDX1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349C381DF
	for <linux-kbuild@vger.kernel.org>; Fri, 24 May 2024 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716532207; cv=none; b=U7Q1KVY8GK124NQLfgCpV8TKkYLA9gV0mKaY8QFFxoVEy97/bxiGVdJnh2ePjkNwtI2po04XlnejYDlknGsisUvf0srsVxdife4YOfMELTG8b5ujjrWtNn64AhbZRgGK2Tbi4Eirx1RzipKqrrSvfJOYnUGuu9fy8MssRibivcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716532207; c=relaxed/simple;
	bh=adRMVZFOo8n4Lp8qXFwp7T0+eBAt1CyOUUEMa8+WtOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcpLv0zmghRl58ozrdhN4/Dj56uziB9wvd5pdRG3ZgfpvmE6P/6JVzSiKCHiG8gaU2MHU2wRtNw4mLjNgtdRXM6Nt1DJ5nMs9rOG9R+PeIR92pfIfxnjkrh3Wojep82uwip6Lu/NBTGUpqFJCOO9enHQFEInRAsSc24LYnrTq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EMaqoDX1; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so8455941fa.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 23:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716532204; x=1717137004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjZCA4a/oaOIu2JpjOcwxpVrFRIIv9mWByhFL++utuc=;
        b=EMaqoDX11p4cKH4gCU3Z749DdDiG9Rtmm8wNCpjak/AXaNb2RmlA8W0NacxF1Hnksb
         SEs7uzvxjjZwaMLmEnACFTe6/wOtfvo+zZrAWgiw8y1XCM+cXpy+D2/QXLqwpWn/IYZA
         0JK2fsHGF+6/NuL/cMAQ2RnOMJxNiYpOuPbl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716532204; x=1717137004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjZCA4a/oaOIu2JpjOcwxpVrFRIIv9mWByhFL++utuc=;
        b=GAY68canF2PTFW4TFdVIoiTpjWsHbVr0TY6fzSiNvBoooPaWtvjLwa5NDKkvFl93Ct
         mIX5So+kVKYEEce+RKmkf73NoAhD0Q5AQSmDuo8ZxYMd5XHBxqoCR0vV+ztPZs1Cm2YV
         XRHn8kGeiphmbkj2H85rSV/c19f5ZUG0SNNzslbASIQBY33/laXm4PqcMQBSuHWQ/XN6
         xKXTAZtQg+CNsluRM3oxSD83yWHR7oyGD51zBG9ty34ZQ34DcEdFBdoATJbcsbGl1ZVJ
         l8doMrki7gYozD9BEDqZzzk2/j5gCka4QDRtQ+Z4Q4TYLU+euiIwFTy5e/OxEoIqEjCr
         6c7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhgkqKpm5xyJsahU7SsEewerHXbTPMXhzGVv0HN07CNl+hflwzXAfGMVZ11BhvQmjL2g3lyZuWPhhm3baNFVjkNuVxwjaYjgAhP+Fy
X-Gm-Message-State: AOJu0YwnpnMCFLuz/fWrZ8CYo0wP0QKf+M2kk8cS6KbIoi8553OXz+Wk
	tsu2fXh9MV7ZrkVTdnjYsqcONJPNjrqKTXlNe2G8RXrNlGJzaiKklqdHdDdnR8NuwdRnqYWPi7F
	RpseCeVhWxOwGWJp0kdNdNeFfCP06Cknh9I/U
X-Google-Smtp-Source: AGHT+IF+6rmRYb97rGwJVuORX2APcqE3qIg4kXcmn4i7nMa9W7TFzVGEVxmlOgqVBWdEE/x+JQH6TsGv+PuCNf5WDcc=
X-Received: by 2002:ac2:5a09:0:b0:51d:9f10:71b7 with SMTP id
 2adb3069b0e04-52965c2f877mr816173e87.28.1716532204095; Thu, 23 May 2024
 23:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
 <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
 <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com> <CAFLszTh5M+4Vp8oR3t-=6vsROgVJa0NU4egfJu2QuugjAfbrsw@mail.gmail.com>
In-Reply-To: <CAFLszTh5M+4Vp8oR3t-=6vsROgVJa0NU4egfJu2QuugjAfbrsw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 May 2024 14:29:53 +0800
Message-ID: <CAGXv+5Eajy55kAcNzyZtsp9MJhD7EnNONW-JYsoadctaTjnxgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: Simon Glass <sjg@chromium.org>
Cc: wens@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, May 24, 2024 at 1:38=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi ChenYu,
>
> On Thu, 23 May 2024 at 11:30, Chen-Yu Tsai <wens@kernel.org> wrote:
> >
> > On Fri, May 24, 2024 at 1:19=E2=80=AFAM Simon Glass <sjg@chromium.org> =
wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org> wrote=
:
> > > >
> > > > According to the FIT image spec, the compatible string in the fdt i=
mage
> > >
> > > Can you please add a link to where it says this in the spec? I cannot
> > > find it after a short search.
> >
> > (Quick reply from my other email before I forget.)
> >
> > From the FIT source file format document, found in U-boot source
> > "doc/usage/fit/source_file_format.rst", or on the website:
> > https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
> >
> > Under "'/images' node" -> "Conditionally mandatory property", the
> > "compatible" property is described as "compatible method for loading im=
age."
> >
> > I'll add the reference in the next version.
>
> OK thank you.
>
> There is also a spec version at [1] - it might be worth adding mention
> of this explicitly for the fdt nodes.

It seems that this is already mentioned?

See https://github.com/open-source-firmware/flat-image-tree/blob/main/sourc=
e/chapter2-source-file-format.rst?plain=3D1#L343

It looks like it was copied from U-boot directly.


Regards,
ChenYu

> Regards,
> Simon
>
> [1] https://github.com/open-source-firmware/flat-image-tree/
>
> >
> >
> > ChenYu
> >
> > > I believe this patch is correct. Since the information is in the
> > > configuration node it does not need to be in the FDT.
> > >
> > > > node or any image node specifies the method to load the image, not =
the
> > > > compatible string embedded in the FDT or used for matching.
> > > >
> > > > Drop the compatible string from the fdt image entry node.
> > > >
> > > > While at it also fix up a typo in the document section of output_dt=
b.
> > > >
> > > > Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  scripts/make_fit.py | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > > > index 3de90c5a094b..263147df80a4 100755
> > > > --- a/scripts/make_fit.py
> > > > +++ b/scripts/make_fit.py
> > > > @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress)=
:
> > > >      Args:
> > > >          fsw (libfdt.FdtSw): Object to use for writing
> > > >          seq (int): Sequence number (1 for first)
> > > > -        fmame (str): Filename containing the DTB
> > > > +        fname (str): Filename containing the DTB
> > > >          arch: FIT architecture, e.g. 'arm64'
> > > >          compress (str): Compressed algorithm, e.g. 'gzip'
> > > >
> > > > @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress)=
:
> > > >          fsw.property_string('type', 'flat_dt')
> > > >          fsw.property_string('arch', arch)
> > > >          fsw.property_string('compression', compress)
> > > > -        fsw.property('compatible', bytes(compat))
> > > >
> > > >          with open(fname, 'rb') as inf:
> > > >              compressed =3D compress_data(inf, compress)
> > > > --
> > > > 2.45.0.215.g3402c0e53f-goog
> > > >
> > >
> > > Regards,
> > > Simon
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

