Return-Path: <linux-kbuild+bounces-10406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF27CEE499
	for <lists+linux-kbuild@lfdr.de>; Fri, 02 Jan 2026 12:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4724300C377
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Jan 2026 11:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA602E8DE3;
	Fri,  2 Jan 2026 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E+DJ2rP6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE882D8DCF
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Jan 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352425; cv=none; b=Aaos480hX0ACIwu6Wa74QVQhn21/AqnQ+KB90F7uaYF+7+p5HD2xWcn1hQhAIyNkJqQRDq1JVhn0wC8uPG5WFJE9J0M0pBTi7gz3nbGHIRYy5+lj4ssGngXuLm9WZ8asXPpvH3C9m0U0WcXGP4TCVgpH5m60M3PZD9c3JP9Dieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352425; c=relaxed/simple;
	bh=nXFZwZZBKquh8LmMNfYlo2E6H3yvO66kM3Z2AGIucRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8RFpWOgSQplzM87UZx3cnlrcGPTN8w+sPIzkTb70naMy6gEHaDdun1yw5gJQ2pE3OxRuaXo/+QWa91g1TB9zeumgQaZIw3AnCTRr5qoAeTTofesDIE55D2c+ptyUmifmCjmaKgWWNMGMBsGJ4IqyJytPI21ndxleMM7Qcnk/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E+DJ2rP6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59a10df8027so15497336e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2026 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767352420; x=1767957220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsSijJtpaI/oDSTtzaUkeXToSyfCr4FMo1aTrP8qZaU=;
        b=E+DJ2rP6MxVUCdmBqZoI8P0tCI2IXXRTYgVdh+t0wtuN5qhCvwC8gsXod6vw7KkFDh
         FX0G8uZKwAKwhcZpD9fB0YcUqH7AYcatZ0IVw7+OSkhch+6ID6Y0kLwrn/R+CRqgVOyD
         tpN3Dc2+4KHitrxseeIxY9cratYQyTnVB13uoPBYdWVGsqBSkVZ3vCa6OkigVNmpp3fv
         5m7yPUiqflkZGIPCNgqdLBbFxbNi5+APmnzvs+69Ca5UOHYui3zP27LzMpqQDjSXaz0l
         +le3YqGnrtn5GgRi2URtYCVep5lwkpa3u3/8tI+TAFBALnLY32FvPFm/rDNuKieBMvCj
         Ee4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352420; x=1767957220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsSijJtpaI/oDSTtzaUkeXToSyfCr4FMo1aTrP8qZaU=;
        b=NyTDZ9gm8lpIkg5uy1ToHvE+q6Oi9AcaZi4XDOVh6/2uCCsheaH1YsbRY5MMDXqzox
         xIs4x7nie7vNd9GhoC5Oe4MmOpzG/5trnKnv9GkAf4vc3DpSf65PF0jXkc0a66F7DmZX
         PIc0UyESiUPQvzXeKiqLJjnzCfT3K075oBvIv5E7ryLq4TEfgaOMA3DesGhT9pmOC36x
         rpLhpCxy+iz5HBz5Qde4wsqK1GJIYkm32yHHKtTQJ4WBzNdlCkXLH4v7C6VrnUzQ8kx2
         GqoHNC34S6yb4kyGRGWkZ86gbB+TYeAeGeQFn66tDtgOys0T02w5tV2OYMjGHDK4Ahai
         bCGg==
X-Forwarded-Encrypted: i=1; AJvYcCWzXTKi3TRW+hxiHZggktRzHs07ddsLD1FbGG4y62ahWafdNeQv1jvuxGS4dgFxI0R570NBvabG6K/lHHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNm/EklDPJbZHCgwSpMmqN63gq/iXVNj514atLD4p34WzliRH
	Gc6A5W+1ZKBe0cRjsyHJ1mfXnkVTEW4w2T9PnIe0OhuXS4K6blM54CJ1DDDPE00sSiC4Svvs4P1
	O5F+AuVip4bNh/q7ZLoVnerWnM5ON6p5opLzS4jVSiw==
X-Gm-Gg: AY/fxX5vR6Vn8rpKwJPtBrUSEhinZKNTHmI/nDUS4vHqxqsaqo2NcgHk5YhkVAmKjb7
	w7rDP9YFEUDprJQYby9la7v9ZRzWcz520XsuFkBJk8EGa+FXPhqK8Fbc2K1+cmip0xAD3CClK7k
	Th81cDjN3rPWzaDrOmKIc3T0UFiwCBkUxE0QiJZvOyUFpodnjBLd8al78TS1C3Hq8rI3udO8Zfc
	Qw8wrjL6+RmdHIWFGL73rFhwPNOGE8U+zso5o1xKTRBa/nIJxRCI98AkcHVzFDqBnL1D/ICo+20
	PLxwSPueWYxgeLnmIQRxHOzAy1c=
X-Google-Smtp-Source: AGHT+IFAdaCcjUwdY3Ew9NHcwLT11KRJipC8z25Ztoxl2WB+caL1mXRBHlm39ALYwigrxotmoGpHP+uwj2P6/o6YWRA=
X-Received: by 2002:a05:6512:b8b:b0:598:8f92:c33f with SMTP id
 2adb3069b0e04-59a17d77435mr14680425e87.51.1767352419706; Fri, 02 Jan 2026
 03:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com>
 <20251125-pci-m2-e-v2-2-32826de07cc5@oss.qualcomm.com> <CAMRc=Mc-WebsQZ3jt2xirioNMticiWj9PJ3fsPTXGCeJ1iTLRg@mail.gmail.com>
 <fwzmob6ez7c6xbakcd4rq2icp7mdwgdvimss3zybb4ivdds3uo@mwguaz7rekjc>
In-Reply-To: <fwzmob6ez7c6xbakcd4rq2icp7mdwgdvimss3zybb4ivdds3uo@mwguaz7rekjc>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 12:13:27 +0100
X-Gm-Features: AQt7F2rD4Vva2u72gj0duDgyvxJiVfI_tVGQktahu3E6VwiSEZFuXnq9LhXUXbk
Message-ID: <CAMRc=MdNTHtzTJ3f3qVHH=qFbK86MzUP0vvx3ogZsXG+iqMUnw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] serdev: Add serdev device based driver match support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:56=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Nov 27, 2025 at 06:32:04AM -0800, Bartosz Golaszewski wrote:
> > On Tue, 25 Nov 2025 15:45:06 +0100, Manivannan Sadhasivam via B4 Relay
> > <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > >
> > > Add support to match serdev devices with serdev drivers based on the =
serdev
> > > ID table defined in serdev_device_driver::id_table.
> > >
> > > The matching function, serdev_driver_match_device() uses the serdev d=
evice
> > > name to match against the entries in serdev_device_driver::id_table.
> > >
> > > If there is no serdev id_table for the driver, then serdev_device_mat=
ch()
> > > will fallback to ACPI and DT based matching.
> > >
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualc=
omm.com>
> > > ---
> > >  drivers/tty/serdev/core.c         | 23 ++++++++++++++++++++++-
> > >  include/linux/mod_devicetable.h   |  7 +++++++
> > >  include/linux/serdev.h            |  4 ++++
> > >  scripts/mod/devicetable-offsets.c |  3 +++
> > >  4 files changed, 36 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> > > index b33e708cb245..2b5582cd5063 100644
> > > --- a/drivers/tty/serdev/core.c
> > > +++ b/drivers/tty/serdev/core.c
> > > @@ -85,12 +85,33 @@ static const struct device_type serdev_ctrl_type =
=3D {
> > >     .release        =3D serdev_ctrl_release,
> > >  };
> > >
> > > +static int serdev_driver_match_device(struct device *dev, const stru=
ct device_driver *drv)
> > > +{
> > > +   const struct serdev_device_driver *serdev_drv =3D to_serdev_devic=
e_driver(drv);
> > > +   struct serdev_device *serdev =3D to_serdev_device(dev);
> > > +   const struct serdev_device_id *id;
> > > +
> > > +   if (!serdev_drv->id_table)
> > > +           return 0;
> > > +
> > > +   for (id =3D serdev_drv->id_table; id->name[0]; id++) {
> > > +           if (!strcmp(dev_name(dev), id->name)) {
> > > +                   serdev->id =3D id;
> > > +                   return 1;
> > > +           }
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +
> >
> > I don't know if Rob agrees with me but I would very much prefer to see
> > software-node-based approach instead of an ID table matching.
> >
> > Could you in the pwrseq driver, create a software node for the serdev d=
evice
> > you allocate, set its "compatible" to "qcom,wcn7850-bt" and match again=
st it
> > here?
> >
> > This has several benefits: if you ever need to pass more properties to =
the
> > serdev devices, you already have a medium for that and you can also lea=
ve
> > serdev_device_add() alone. You're comparing the entire name here - what=
 if
> > someone sets device's ID to some value and the name will be "WCN7850.2"=
?
> >
> > You could also drop the serdev_id field from struct serdev_device. For =
matching
> > you could even reuse the of_device_id from the device driver.
> >
>
> I tried this approach and I really liked it since it gets rid of the yet-=
another
> id_table for serdev (which I didn't like it btw). But there is one concer=
n
> though. We need a generic 'device_get_match_data' implementation for swno=
de.
> While trying to implement it, I stumbled upon this patch [1] which does t=
he same
> for other usecase, but there was a disagreement on whether swnode should =
be used
> for driver matching or not. For my usecase, I find it very useful and
> reasonable, but Dmitry Torokhov believes otherwise.
>
> Maybe I'll include this patch in the next version, CC Dmitry and see wher=
e it
> goes.

Thanks for bringing this to my attention. I think that historically
software nodes were meant to always be "secondary" but now we have all
kinds of auxiliary devices that use software nodes as their "primary"
nodes so maybe we can re-discuss this.

Bart

