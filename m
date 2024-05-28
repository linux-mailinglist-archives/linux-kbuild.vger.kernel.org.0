Return-Path: <linux-kbuild+bounces-1944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E24798D1E41
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 16:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119681C225BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5881416E895;
	Tue, 28 May 2024 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Whohw+07"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486716F829
	for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905676; cv=none; b=slPl40kUEE/T392yGBz9ayo59nkyEaRhFL0ZPacmTYGp+OUUsllrBLvSowPMfr1ykmbSDWrdRGb08suLy83D+SReD66VBaKxWvEZm4UEZxTIL5X5TNJLe4EA3LYjcuC7XiYTW5ydVlqt59kG2DDZvHDUN1DOB8iHpab6BhsFFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905676; c=relaxed/simple;
	bh=gknVVZDrcAnrDDzqKNaNI9z03xkLRzYl9GLjv9HkC1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqOf6eAFGLInEktgGtggCXPZ/8T2Sj6B3uMUM5I6kJGEAGV7fCkZtJLJ+pNJ/vw6CbZuttrCnLpBtHMB/zEKi5QCIOsLkbTiKAxWWBGD4XURu3WqgK2pwhjbUag2nszV/1wtdUzm1fEmxC/ntXkwK85HtRluOjHExhYu/m7qVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Whohw+07; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ab9d406101so4834096d6.3
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716905673; x=1717510473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gu3wKWOoXrILYJvRJgKFCPnUxXEiCQVkjQKAjWWpZY=;
        b=Whohw+07bdbAEtUd/cRCTAeQSqPWU4AQwo16yrzElashvKacVJZEUYaRb3r16MjKtu
         xs/w75d4RH749KNLT4WLlw0P28lGninhuztGbrWwBtmmmsuEL/EKYwCSOvSm3o8Xucvk
         ylZgjQOAq+1b+KYI3/cevB/U7HxdmKeR+Jt48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716905673; x=1717510473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gu3wKWOoXrILYJvRJgKFCPnUxXEiCQVkjQKAjWWpZY=;
        b=L07azcf3ijGVYMS3ZG/rJ056W3hKaxyOEMD7udgQJ07Vg2TbvjZElX5EPZ+2vJjMFD
         XUeGzYZCPsAm7HdsxlIQ6mfm0V9QSG4Lr/wZX1yH35gM0IGKl1K78cAI5peJrlPkpnAr
         LWBRItK9GkVPhm625PtMrSv7Dd1ois9q8EknN3BsW9IcXvGJx7PVPnAnm7u7DzSlfexR
         1nZwf3oQIlkgesHupty257e7rqdetFZXdcDCye1gNQYNBSSGJQUSOhnCol6AzMNZvNS2
         dYtXc/2DdEuuWlb0azc4Omef0DERh7JerO1MNXq7sFm6DayBt6y1bkIgrJfkvYjguP+j
         DKNA==
X-Forwarded-Encrypted: i=1; AJvYcCUYd/duQ9ge+qqc3t8ypbaaP0m9zdre96z4b4bqRyEMa9UmGAfuuyNzIMJzlPcixjcUZgG/S0kgdzfFL9xxox7JpXKmOUquX8HyOit/
X-Gm-Message-State: AOJu0Yxt05SCUI0D9gwaqoRXadnv5FjF6cZyi3NYYkOdnJLG2ZcSVkYq
	5JyjMWdjUhKsgrWnRK7ylyhCxedpO19HM5sqY7PDe/bfn/TePnf4TuOlRPpGcxx0WWYOPlV6rHB
	eEuf2GdKzu7uGOsXF/g14cMaKrpwnzW0xh9Ct
X-Google-Smtp-Source: AGHT+IEI+dzgZP8zd/diyeNDZtgq2X5P9KOmX2YoJ6AodFPQYgDfDjDrZMHRZvdxdwMmwyC27IUCqIDPCEnzmESbtLk=
X-Received: by 2002:a05:6214:5990:b0:6ad:78f2:fcd2 with SMTP id
 6a1803df08f44-6ad78f2fe73mr79564096d6.29.1716905673414; Tue, 28 May 2024
 07:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
 <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com>
 <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
 <CAFLszTh5M+4Vp8oR3t-=6vsROgVJa0NU4egfJu2QuugjAfbrsw@mail.gmail.com>
 <CAGXv+5Eajy55kAcNzyZtsp9MJhD7EnNONW-JYsoadctaTjnxgA@mail.gmail.com>
 <CAFLszTjeQdwEp1AgL8geK7AZFwQqDfTkdzj4V2JkYqU4F7Em4Q@mail.gmail.com> <CAGXv+5HhwBx0qGSB=V6O1gXjrTDjhwMRsWe5a4VSP6+suwwU3g@mail.gmail.com>
In-Reply-To: <CAGXv+5HhwBx0qGSB=V6O1gXjrTDjhwMRsWe5a4VSP6+suwwU3g@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 May 2024 08:14:22 -0600
Message-ID: <CAFLszThkZuif9s3CFBUh9Mj==unSMCDP4z6rWHbFToKfck8T8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: wens@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Tue, 28 May 2024 at 02:31, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Fri, May 24, 2024 at 9:01=E2=80=AFPM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Hi ChenYu,
> >
> > On Fri, 24 May 2024 at 00:30, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > Hi Simon,
> > >
> > > On Fri, May 24, 2024 at 1:38=E2=80=AFAM Simon Glass <sjg@chromium.org=
> wrote:
> > > >
> > > > Hi ChenYu,
> > > >
> > > > On Thu, 23 May 2024 at 11:30, Chen-Yu Tsai <wens@kernel.org> wrote:
> > > > >
> > > > > On Fri, May 24, 2024 at 1:19=E2=80=AFAM Simon Glass <sjg@chromium=
.org> wrote:
> > > > > >
> > > > > > Hi Chen-Yu,
> > > > > >
> > > > > > On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> > > > > > >
> > > > > > > According to the FIT image spec, the compatible string in the=
 fdt image
> > > > > >
> > > > > > Can you please add a link to where it says this in the spec? I =
cannot
> > > > > > find it after a short search.
> > > > >
> > > > > (Quick reply from my other email before I forget.)
> > > > >
> > > > > From the FIT source file format document, found in U-boot source
> > > > > "doc/usage/fit/source_file_format.rst", or on the website:
> > > > > https://docs.u-boot.org/en/latest/usage/fit/source_file_format.ht=
ml
> > > > >
> > > > > Under "'/images' node" -> "Conditionally mandatory property", the
> > > > > "compatible" property is described as "compatible method for load=
ing image."
> > > > >
> > > > > I'll add the reference in the next version.
> > > >
> > > > OK thank you.
> > > >
> > > > There is also a spec version at [1] - it might be worth adding ment=
ion
> > > > of this explicitly for the fdt nodes.
> > >
> > > It seems that this is already mentioned?
> > >
> > > See https://github.com/open-source-firmware/flat-image-tree/blob/main=
/source/chapter2-source-file-format.rst?plain=3D1#L343
> >
> > I see that but I am suggesting that it could explicitly mention that
> > the FDT should not have a compatible string for the model...that
> > should only be in the configuration node.
>
> I sent a pull request on GitHub. The mailing list seemed very empty.

Yes it is fairly new and the spec is pretty stable.

Your PR is merged.

Regards,
Simon

>
> ChenYu
>
> > >
> > > It looks like it was copied from U-boot directly.
> >
> > Yes mostly it is the same, but there were some changes. It has evolved
> > slowly over the years but the bones of it is stable.
> >
> > Regards,
> > Simon
> >
> > >
> > >
> > > Regards,
> > > ChenYu
> > >
> > > > Regards,
> > > > Simon
> > > >
> > > > [1] https://github.com/open-source-firmware/flat-image-tree/
> > > >
> > > > >
> > > > >
> > > > > ChenYu
> > > > >
> > > > > > I believe this patch is correct. Since the information is in th=
e
> > > > > > configuration node it does not need to be in the FDT.
> > > > > >
> > > > > > > node or any image node specifies the method to load the image=
, not the
> > > > > > > compatible string embedded in the FDT or used for matching.
> > > > > > >
> > > > > > > Drop the compatible string from the fdt image entry node.
> > > > > > >
> > > > > > > While at it also fix up a typo in the document section of out=
put_dtb.
> > > > > > >
> > > > > > > Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> > > > > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > > ---
> > > > > > >  scripts/make_fit.py | 3 +--
> > > > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > > > > > > index 3de90c5a094b..263147df80a4 100755
> > > > > > > --- a/scripts/make_fit.py
> > > > > > > +++ b/scripts/make_fit.py
> > > > > > > @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, com=
press):
> > > > > > >      Args:
> > > > > > >          fsw (libfdt.FdtSw): Object to use for writing
> > > > > > >          seq (int): Sequence number (1 for first)
> > > > > > > -        fmame (str): Filename containing the DTB
> > > > > > > +        fname (str): Filename containing the DTB
> > > > > > >          arch: FIT architecture, e.g. 'arm64'
> > > > > > >          compress (str): Compressed algorithm, e.g. 'gzip'
> > > > > > >
> > > > > > > @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, com=
press):
> > > > > > >          fsw.property_string('type', 'flat_dt')
> > > > > > >          fsw.property_string('arch', arch)
> > > > > > >          fsw.property_string('compression', compress)
> > > > > > > -        fsw.property('compatible', bytes(compat))
> > > > > > >
> > > > > > >          with open(fname, 'rb') as inf:
> > > > > > >              compressed =3D compress_data(inf, compress)
> > > > > > > --
> > > > > > > 2.45.0.215.g3402c0e53f-goog
> > > > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Simon
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-arm-kernel mailing list
> > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

