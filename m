Return-Path: <linux-kbuild+bounces-323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AAC80C654
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 11:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A9D1C209CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98836249FF;
	Mon, 11 Dec 2023 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBdve7xW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C359791;
	Mon, 11 Dec 2023 02:24:25 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d7692542beso41161077b3.3;
        Mon, 11 Dec 2023 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702290265; x=1702895065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxjdC9gG0FASpcYRfeHrDm90rNJUB49UE6RBV0eXfa8=;
        b=mBdve7xWbRlPWlYMo43wviUIdttIA6OBkqiuM5sHVu6+jn53FTmB3UmP+AWHopRHZC
         a7z5Vq/IHDotZA1U9YLjWPm4d2eJRDO3gGoW8aSX2TYkMdTA+MCZ0kmc96F0UBR4Y+dQ
         gEF6HMMHXiiRywJTO4pJrrPHtPkYuYUvIuXL10o/jicHp6uZPnoxksdBAHyXAORnfu5y
         2WtAwCAa+D2oYp+UUEH7V1X6W0vBkmu/tZ35uEtMPtIhCjoGyfLFLt/KYsE251q2GVdC
         UTUQ8JBz3hDzYm52oBptbs7jTy2PTVjxrV62uIR927ca6oghr2EYRweIIKE9cfZWxNG1
         bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290265; x=1702895065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxjdC9gG0FASpcYRfeHrDm90rNJUB49UE6RBV0eXfa8=;
        b=slJJIFKzxWik3fbJ6P6yN/b/aBfnkJ5fpMiuyDIoB0rGN+jBAREzW767PFIVgRzngE
         bjJonFCKPvSMtqHjzriW4bvWuV2Q2Z81gQt47JY14feTq2AtMbZfm637AQc8cVzJy6NH
         uJhF/fKYGWsakZBbYx7RYBnDIjZmVy0LUdeaiDCTBK3w5W7EwS6pALhWv9tE2dekTjMi
         NOzpoOI6kLgfONLrkSngDvELbWgpp3dfg4xNaaCAjotwxkURbECC6gn0GpQgM3IcXpwP
         yfs/I0ysbx5cFft9N8Fnl/Dblbu1LvJqzgnJaQFOe7fD7GcpT48oYYzse9RrRPLMj68P
         Scng==
X-Gm-Message-State: AOJu0YygGw1MZhnoiCWO43CcY6mds8kVaXyby10ZGPECSIDf95QVn8xn
	53HGe9TySGPPsH0svBl6G0Ox/tJLesM3Ni0rhEQ=
X-Google-Smtp-Source: AGHT+IGmF7rCGzSyqKfqD2TRI9vyoiPLZLomxHRnO/Mazk7erhr/oeot7BOADdKT5S1gzsmsdTlRbMDAuhmPh48JXnE=
X-Received: by 2002:a0d:d007:0:b0:5d7:1940:53d9 with SMTP id
 s7-20020a0dd007000000b005d7194053d9mr3123865ywd.81.1702290264941; Mon, 11 Dec
 2023 02:24:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFSh4UwYYAOb0YpC=WAL6SD+8jTLuSkhgrgjh8JmogUb10V=zw@mail.gmail.com>
 <ZXMGqjm1466fQ3g2@archie.me>
In-Reply-To: <ZXMGqjm1466fQ3g2@archie.me>
From: Tom Cook <tom.k.cook@gmail.com>
Date: Mon, 11 Dec 2023 10:24:14 +0000
Message-ID: <CAFSh4Uz4jMhR8jV2xjcDg4i05neJMsBewtgcxmG_csETzYdq3A@mail.gmail.com>
Subject: Re: Building signed debs
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Linux Crypto API <linux-crypto@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 12:06=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> On Fri, Dec 08, 2023 at 11:14:35AM +0000, Tom Cook wrote:
> > Unsetting CONFIG_MODULE_COMPRESS_ZSTD is a workaround (ie disable
> > module compression).
> >
>
> Seriously? Unrelated option becomes a workaround?

"Workaround" as in "With this options set, `make deb-pkg` crashes out with =
the
reported error, while with this option unset it produces a deb package
of a signed
kernel and modules."  This looks like a defect in the build system to me an=
d the
workaround allows me to build a package in the meantime.

> > Is there a way to build a .deb of a signed kernel with compressed modul=
es?
> >
> > Thanks for any help,
> > Tom
> >
> >   INSTALL debian/linux-libc-dev/usr/include
> >   SIGN    debian/linux-image/lib/modules/6.6.0-local/kernel/arch/x86/ev=
ents/amd/amd-uncore.ko
> >   SIGN    debian/linux-image/lib/modules/6.6.0-local/kernel/arch/x86/ev=
ents/intel/intel-cstate.ko
> > At main.c:298:
> > - SSL error:FFFFFFFF80000002:system library::No such file or
> > directory: ../crypto/bio/bss_file.c:67
>
> Above means that you don't have a valid certificate/keypair set in
> CONFIG_MODULE_SIG_KEY. If you keep the option value on `certs/signing_key=
.pem`
> (which is the default), the key should be automatically generated
> (with your observation, only if `certs/x509.genkey` doesn't already exist=
).
> After building the kernel with `make all`, you should check if the certif=
icate
> pointed in CONFIG_MODULE_SIG_KEY is present or not. If it isn't the case,
> you have to generate the certificate yourself. For more information, see
> Documentation/admin-guide/module.signing.rst in the kernel sources.

Sorry for being unclear - I'm not building with `make all`, I'm
building with `make deb-pkg`.
If I had to guess, I'd say the .deb depends on the uncompressed modules
rather than the dependency depending on whether module compression is turne=
d
on or not, but it's only a guess.

Regards,
Tom

