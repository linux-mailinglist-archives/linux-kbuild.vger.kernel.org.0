Return-Path: <linux-kbuild+bounces-1413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AA892E10
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Mar 2024 00:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402841F21AA5
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Mar 2024 23:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544481C0DE0;
	Sat, 30 Mar 2024 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQhmRZUf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D51DFF7
	for <linux-kbuild@vger.kernel.org>; Sat, 30 Mar 2024 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711840260; cv=none; b=cFiASYpwGIJvFpr9xeX4mPL8LYbCFjx8yhIOwf5PA+ouUv4KTB5ryoe4nQEjEEvMcYgRNpy8Sz1P/SlpzTUOsSSWkJFJxOjBZBv3JGZIpbP7ZHku11LfhnbGJfBnKdbDBZeXhASNmPDCYQewpHR6HwEXV5QUUBmevPCxaJF3tjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711840260; c=relaxed/simple;
	bh=YioU1uNCC4Wi5AJtg0BOQcJrR3vb3C8agPRiPVOuYOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go9/rH9IwWW3jPKicRoI2laZD5cv/0Kihn92VMxQWg3dP7wQGIoxylrX2o7yWVdFy5c9kqAYmjy3yqjtO4lRJU8kAWVXMUdnTMwLL46y268sNsOE2kL+fDQ3EyNq9lNmMIU3nxjza8GzgizuGBg/YFuJN3A9i3sqw8qm/VU24r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQhmRZUf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8013C43394
	for <linux-kbuild@vger.kernel.org>; Sat, 30 Mar 2024 23:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711840259;
	bh=YioU1uNCC4Wi5AJtg0BOQcJrR3vb3C8agPRiPVOuYOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rQhmRZUf9vBGKAIkx3pHHatns0/nyzfW+hYRwX2w09/XgHevp2cfgfvnCpRUwYn/A
	 hNrRvmMO3Fm9nuSXEfgltD3u5XyhNz0suNnKDIxVv7TxHiYTgajGgy9t54TRzRGbRF
	 OoLlJLwTKxMNbihzgv5eKTCSkX6yd3ZzLLrPcrp9C7RRGAaFiRnvIwhKUZEcXvPR5R
	 Bz7Wz1lWcXOSGExeMDoBXbWO3drDsvJZJt9AWySLWzBoJxRUKy49PW/o1xOHUir/mo
	 dr03fgmkVREHOrlqScjPEMVAVQhZ14b1//8tlqrTc7vPNYY5Rt0y/rTVr/SEQlCFow
	 3ZFZFPOArn6eA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d715638540so23710401fa.3
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Mar 2024 16:10:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJUYtA0GO2QIozAuIe6Qz6x26zjUNEdiXnKM7bvGqfEkkNSS3pL0aDjNhbZqqc5e/iTs2BeR5t5mVY9fKveVwjw9oTUvDO3RtRcvM2
X-Gm-Message-State: AOJu0YwMPHTVr+6R+f7tLCtJtp0S+9Z2uhFBp9QIpaRrybCx4OQvIdnd
	IQ2PkhKqkmRUkgqdPdvNQIbvzfwrewr/hqCm7ZCk/H5CD7QV5svELyFe88kWmwcRSFdb5ZDCEwd
	EpkRGLjaZf21heSXEB8ID8QKHZBs=
X-Google-Smtp-Source: AGHT+IGobxx3qZcJl50WFhCOimy+I83nz8Qs/W5LDvAPqapqrxW0Mq44/cJ0g5039QB/UyiLihWbYMTqz8Fp1wfps+Q=
X-Received: by 2002:a2e:a7c8:0:b0:2d4:77c0:d61c with SMTP id
 x8-20020a2ea7c8000000b002d477c0d61cmr3790786ljp.35.1711840257437; Sat, 30 Mar
 2024 16:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZfodWv+E6Ekqr7fl@goliath> <CAK7LNATUFzG9jTfFB831vZr7t-8w6UWfX85Jn2tEvypkmhcs4A@mail.gmail.com>
 <ZgRL/GHwgV16+yTb@goliath>
In-Reply-To: <ZgRL/GHwgV16+yTb@goliath>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 31 Mar 2024 08:10:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLYR2roSSwz+3bQnyXaLyR5EEms97jwcZrFfzn6NFtdw@mail.gmail.com>
Message-ID: <CAK7LNARLYR2roSSwz+3bQnyXaLyR5EEms97jwcZrFfzn6NFtdw@mail.gmail.com>
Subject: Re: M= modules build w/ objects in different directory
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc: Jing Leng <jleng@ambarella.com>, 
	"Valerii Chernous -X (vchernou - GLOBALLOGIC INC at Cisco)" <vchernou@cisco.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 1:41=E2=80=AFAM Daniel Walker (danielwa)
<danielwa@cisco.com> wrote:
>
> On Thu, Mar 21, 2024 at 12:01:23AM +0900, Masahiro Yamada wrote:
> > On Wed, Mar 20, 2024 at 8:20=E2=80=AFAM Daniel Walker (danielwa)
> > <danielwa@cisco.com> wrote:
> > >
> > >
> > > Masahiro,
> > >
> > > I found this commit,
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D23a0cb8e3225122496bfa79172005c587c2d64bf
> > >
> > > It had this note,
> > >
> > > [masahiro: I do not think "M=3D$(OUT_DIR) src=3D$(PWD)" is the offici=
al way,
> > > but this patch is a nice clean up anyway.]
> > >
> > > Is there an official way or recommended way to build objects in a dir=
ectory
> > > outside the external modules source directory and outside the origina=
l kernel
> > > source directory ?
> > >
> > > Daniel
> >
> >
> > There is no official way.
> > One known tip is to use a relative path for M=3D.
> >
> > For example, the relative path from your kernel source
> > to your external module directory is  ../path/to/module
> >
> >  $ make O=3Dpath/to/output  M=3D../path/to/module
> >
> >
> > The module objects will be output into
> > path/to/output/../path/to/module/.
>
> It seems that this does place objects into the output directory, but ther=
e is an
> issue where the build system expects include files to exist inside the ou=
tput
> directory as well. For example if the modules includes linux/module.h thi=
s file
> exists and is found, but module.h also includes asm/rwonce.h which is not=
 found.
> I think it's located in include/asm-generic/rwonce.h . I think these asm =
location
> are linked or added as special -I additions during the build but using O=
=3D
> results in these asm directories not appearing to exist correctly.
>
> Daniel


To use this workaround, you need to build the kernel
with O=3D first.

asm/rwonce.h is a generated header, and exists in
the output directory specified with O=3D.



  # configure and build the kernel
  $ make O=3Dpath/to/output defconfig
  $ make O=3Dpath/to/output

  # build the module
  $ make O=3Dpath/to/output  M=3D../path/to/module





--=20
Best Regards
Masahiro Yamada

