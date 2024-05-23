Return-Path: <linux-kbuild+bounces-1929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF88CD933
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 19:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19ABB1C20BA6
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 17:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6587E2746F;
	Thu, 23 May 2024 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C8+1TTu2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDD12E75
	for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 17:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716485925; cv=none; b=J6QhInuV4tCCQs7p9V7jrwT7D0kU3kW9c5w8F1SLjWUdHcKxelR8sUM05qIuDbvx0KUPjTeDYA4o7xm+Cw5AjksVSF30th+oPz93oG0qPXf2y8dFpfh6umr/6F/Hc5SBnVx3ohi64xr+Gw8NzoTGhH0rIa/Mgyof7ZzysFscPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716485925; c=relaxed/simple;
	bh=pnw9VeQPGfJdSLKumcNoyt5s/XJHQHU8QW0nMsUL9ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pajqn6MxkAV1Grxdzyr/GJDlDTX+93OeiPkHvBaIfvDbqouDvlSW2oHaOkorO9Yy16Y3znkHKdR/q37mU441d1wW2ruakBgjWNEQwfaciSt01Ih1tZ6iRhcmJTHpXh4mqiBaW0PwUvud3XbUR1lOPXxpdKgnn8v8mntIZ2dLRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C8+1TTu2; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43fa6d4d731so10967111cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716485922; x=1717090722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V7pd3riIwcFxlFCmDZlVupOcyB0VJETE06xBJZgKWg=;
        b=C8+1TTu25RP6qCQoMsz8BmmuXlLHXiCoTwUenKCZVTtarHdH0s+D0DgRKd14drgnoc
         fg1qNRwq7uVjWyXq+Yo9s1Q0r+qd/4i+ujh6I1hh1SQ/ZjQo/GWhMjDv1QFbqf/K7GNb
         71XO61yEBm0jGcmTdR1YFwIaBYZ1FXDQKxfOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716485922; x=1717090722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V7pd3riIwcFxlFCmDZlVupOcyB0VJETE06xBJZgKWg=;
        b=RAoRxdBJ0WpU60P4YKjDuOAsKRr3dWFbRZiVRwXLJgjYOyslkjXbvmWAEPCblSlc9n
         AGXqVlxAHFitbyuCvZVBQCZu3iC7F0L0BWYK5AHZse8h8TLxyep15Bo1BugkMEj45Tan
         PzpNHfE+dN1pvtKOHtULbazxo7/o0MxDuscvdLhr6G+dT728HSC///Sk32XDmpKAJouq
         falBMDZHs9tLRFX2/xnOUONRSy5cfetGfgfaxO4QzP/TQBWoyCtM9ntqPi2t2T2hp0Jy
         olzO3PPlXbqotzWgjt9HcTknsEtOxtEZEBFIire8S1IEd8heKb/Fl/9o2/pkf0C/Rzo0
         cszg==
X-Forwarded-Encrypted: i=1; AJvYcCVNwVkowjERJ5M5MqDVGkFhVUzbGXuRLKT8T7iypu3AZKvgWXjA8K1UfmU/X9JNN24Xllz1oX88ifV5Ld97VRXl2ZvGAQb1rcf8gHx1
X-Gm-Message-State: AOJu0YydNuf4r4EnSn3ZdJ8stSLC4zsiisWdZKh/F510yldelWX83qrP
	dL/6lvdW2YJBuXpktl1oVVy98O+lfKdDgtCHt48wy2rb1q0wRzIZHKM1PcENjpRv2qxxYCR3A6y
	j+VkyhsarEgllevqc5Il0Ssl8GUPKKH1b5NwD
X-Google-Smtp-Source: AGHT+IHQgR2gc3LizfC2ko6q8LeiuyYMUEWsyT2fSihHx5KYglA8Ke5ClBuzgiE2YuOwbWhrCtTujkxGm22gnzfgME0=
X-Received: by 2002:a05:6214:519a:b0:6ab:8b8c:61ef with SMTP id
 6a1803df08f44-6ab8f5faedbmr47040786d6.31.1716485922659; Thu, 23 May 2024
 10:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org> <20240521065107.30371-2-wenst@chromium.org>
 <CAFLszTgJpaWzJneZ-uReEGrE85MgGYOjJKxOL7jGCYMuVMPKUg@mail.gmail.com> <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
In-Reply-To: <CAGb2v67MQDep8gfPWgeQoew8URAZyPw6ocGEMxMnwzYYRa0PYg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 23 May 2024 11:38:31 -0600
Message-ID: <CAFLszTh5M+4Vp8oR3t-=6vsROgVJa0NU4egfJu2QuugjAfbrsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
To: wens@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ChenYu,

On Thu, 23 May 2024 at 11:30, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Fri, May 24, 2024 at 1:19=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Hi Chen-Yu,
> >
> > On Tue, 21 May 2024 at 00:51, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > According to the FIT image spec, the compatible string in the fdt ima=
ge
> >
> > Can you please add a link to where it says this in the spec? I cannot
> > find it after a short search.
>
> (Quick reply from my other email before I forget.)
>
> From the FIT source file format document, found in U-boot source
> "doc/usage/fit/source_file_format.rst", or on the website:
> https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
>
> Under "'/images' node" -> "Conditionally mandatory property", the
> "compatible" property is described as "compatible method for loading imag=
e."
>
> I'll add the reference in the next version.

OK thank you.

There is also a spec version at [1] - it might be worth adding mention
of this explicitly for the fdt nodes.

Regards,
Simon

[1] https://github.com/open-source-firmware/flat-image-tree/

>
>
> ChenYu
>
> > I believe this patch is correct. Since the information is in the
> > configuration node it does not need to be in the FDT.
> >
> > > node or any image node specifies the method to load the image, not th=
e
> > > compatible string embedded in the FDT or used for matching.
> > >
> > > Drop the compatible string from the fdt image entry node.
> > >
> > > While at it also fix up a typo in the document section of output_dtb.
> > >
> > > Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  scripts/make_fit.py | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > > index 3de90c5a094b..263147df80a4 100755
> > > --- a/scripts/make_fit.py
> > > +++ b/scripts/make_fit.py
> > > @@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress):
> > >      Args:
> > >          fsw (libfdt.FdtSw): Object to use for writing
> > >          seq (int): Sequence number (1 for first)
> > > -        fmame (str): Filename containing the DTB
> > > +        fname (str): Filename containing the DTB
> > >          arch: FIT architecture, e.g. 'arm64'
> > >          compress (str): Compressed algorithm, e.g. 'gzip'
> > >
> > > @@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
> > >          fsw.property_string('type', 'flat_dt')
> > >          fsw.property_string('arch', arch)
> > >          fsw.property_string('compression', compress)
> > > -        fsw.property('compatible', bytes(compat))
> > >
> > >          with open(fname, 'rb') as inf:
> > >              compressed =3D compress_data(inf, compress)
> > > --
> > > 2.45.0.215.g3402c0e53f-goog
> > >
> >
> > Regards,
> > Simon
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

