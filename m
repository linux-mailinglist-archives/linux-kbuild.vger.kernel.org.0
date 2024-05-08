Return-Path: <linux-kbuild+bounces-1811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5A8BF51B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 May 2024 06:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11E01C225ED
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 May 2024 04:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC2BA50;
	Wed,  8 May 2024 04:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzqnewzX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AC372
	for <linux-kbuild@vger.kernel.org>; Wed,  8 May 2024 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715140898; cv=none; b=EJKtYikVCD3E9UU7uEPOYf1xZkvPz6xs58dSbAVkqbRLugcdtKOqcCkS5bM/4ImMEj6IoUKX+0oeGXojWFwMqqDLNXWVXsJzjAaZYojOs/PEY0kWrIft3yDd9EF/IcqXv0YjLRGQncatjT0V8rPM3EnVVYAqU8obbxGug9qBV9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715140898; c=relaxed/simple;
	bh=IO7Uf14J7v9rQWMFiU9k0CPPDQlVGCYm5Sk279Laty0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPw0RTzUfVjlV32/BE+vjJn3eOohOtdXtZIuo7LhwBeGnFPBg3H/l5ZrAeTgR4d5X63SDyBuZRNIIyCdkFSyWB+bvbLeajOlkqnf38PoS9EX7kAzw4AzPDRJ/9DFUKH2q6s6eiXcIBY/eNILZicYmc8EC8HKZ84Sb4V+h4P/hXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzqnewzX; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-23fb052ca41so1785575fac.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2024 21:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715140896; x=1715745696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+w9bVyptRG2mM4nJ0QEwgO6GkJB8d7uOJxZbUEs7ko=;
        b=CzqnewzXo7xDym3mHAj5QCarhe2IjbaVEfCSSFUq3n3igbbPmkrVPE/vwWgOHxRBMb
         sNn2Hw2+JxoNCN7yPYgH4eDF6igvT2j21FrW7Hb6QBhsxYCqzhKE2rc+HvdlyI1gRDHQ
         bJJ+qam39FOsfZDNzC0l1axepjMZNdnIwKn5RoKVlBJL6lbEwCv29HWicm+ArZbymSOP
         aw4pMf8PLSuW7DHmc/a8Xuw4pct3xONdvpgd2NqsqvoHWgmHG28eSe5wXAbYkyweiCZT
         WRi3ORHXUIz+FoCxTlRkAaGgb9PNRLPqpXUtNrSazNxslLzGBt8g1XHXBPQD//ufW32S
         GO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715140896; x=1715745696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+w9bVyptRG2mM4nJ0QEwgO6GkJB8d7uOJxZbUEs7ko=;
        b=oKwCBIi2mqpN6v6dAQAed2dzVCWym3ek+Xurg/6vi0HVOPd3a2NTXQ2iNHa200fj6d
         x43U8U2MVPZ+E4gZom7bvSHxpjQi9iYjye5mGf4er3bfVr4RwN/ZclPyrXElGdkEod1p
         UFao+ycsx+jZKgva1PnpH5Wk7g1gOFzhUZa5SNoBXo/j+2LLdazteHQtLYMGo/1lC3Qd
         t3BIbeChWTRFqJlfcXgWhkFMrS0VINSp5Umf+ri/8CHLWgrkNJMRWts5xIxAjzLKsO+d
         gLI+aHt1aglmYXMjS6mQKn9MzfRMaqmM+lCnoXOZbT2m58wKE5BlQZsCJ1iK+YAD17NF
         Lm8A==
X-Gm-Message-State: AOJu0YzLwHiRbN75McbC9CY60yxLc+vs4StiKA8L8zyEaBWQ3DpGmk6v
	AFVHNWXKQvDDSR4kl3+OwoUjPW3mnh5xZ9UShoRoIWPljbCX8aBJ7lZGhV1S4DoyxhzES1lYIlB
	Ew2p7oiB2/GJSZ2tx8CYAHT9F3hA=
X-Google-Smtp-Source: AGHT+IGMDf0985XPYpt4J5Ziij8dVEoK6JA1ElAz93ID/0BoC1njZ05XHJE475s3bs5/u1QhOU8EFba5ffWzK5xuHUg=
X-Received: by 2002:a05:6870:8552:b0:23c:bbe9:858 with SMTP id
 586e51a60fabf-2409809af32mr1749273fac.16.1715140896182; Tue, 07 May 2024
 21:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
 <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
In-Reply-To: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
From: Henry Wu <triangletrap12@gmail.com>
Date: Wed, 8 May 2024 12:01:22 +0800
Message-ID: <CAG-UpRQQU4ksYGZUM0kZPK0C02VWKqnA_Jokxb_208RRXMhDRQ@mail.gmail.com>
Subject: Re: A link error related to DRM and fbdev
To: dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your reply. I will communicate with member of dri-devel further.

I tried to reproduce this issue on master branch and there was no link erro=
r:

...
  CC      arch/x86/boot/compressed/efi.o
  AS      arch/x86/boot/compressed/efi_mixed.o
  CC      arch/x86/boot/compressed/misc.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
$ cat .config | grep 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
CONFIG_DRM_KMS_HELPER=3Dy
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_FB=3Dm
$

In the attachments you can find two ".config".
kernel_config_515y_failed is used on branch 5.15.y (tag 5.15.157) and
kernel_config_master_succeed is what I used for master branch.

Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=BA=8C 23:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Fw: DRM list
>
> On Mon, May 6, 2024 at 2:53=E2=80=AFPM Henry Wu <triangletrap12@gmail.com=
> wrote:
> >
> > Hi, all.
> >
> > I found a link error related to DRM and fbdev on branch linux-5.15.y
> > (tag v5.15.157). It has same phenomenon with
> > https://lore.kernel.org/all/202303150232.MBonYhiv-lkp@intel.com/.
> >
> > I tried to investigate this issue and found that build will fail if
> > CONFIG_FB=3Dm and it will succeed if CONFIG_FB=3Dy.
> >
> > [user@localhost linux]$ cat .config | grep
> > 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_FB=3Dm
> > [user@localhost linux]$
> >
> > I'm not familiar with kbuild. Can anyone troubleshoot it further? You
> > can find .config from attachment.
>
>
> I do not have time to take a look at every build error,
> but somebody in the DRM list may help you.
>
>
>
> --
> Best Regards
> Masahiro Yamada

