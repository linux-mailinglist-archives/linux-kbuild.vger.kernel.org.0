Return-Path: <linux-kbuild+bounces-2894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852494ADEB
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8AA1C21750
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 16:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081C8136671;
	Wed,  7 Aug 2024 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KiY3H1CL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1A82877
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Aug 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047664; cv=none; b=UuByCawWe3eYv36Ez2N3FFOkCbUIhgZHhBfzDxe8kAqHUXBkW/JCrdqmVNrsqCBoC/bqZHNn7AcWYQ6SE16qc2wMKvHdv1gRCDcKQ0NqY63gBhQBFEXS5Upr+hJ7/BwaIhx7eSVYBGtwoJss/r1e5i8TjuQ1yfdltkkwNFmbJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047664; c=relaxed/simple;
	bh=bnQHhyxtaLGDQyQRpgbmjXhmrP9N64R0hZVoFnzGj0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4EubZ9p4Gll2EKbYvRDKmFirF8ejF/R1JzeELt8ivTtXRqHuNvw4kz7K3ZFLyZe+cHZiTd86GtMKcvh+waTuBH1JrWnQrV9nuLl7A4Tfc/HyBTIYvm26f04vJHO+yOjGQOkeN7agPdPyVchYg3T+Cg0HPSBfXgCEQHu6055hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KiY3H1CL; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-699ac6dbf24so119927b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Aug 2024 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1723047661; x=1723652461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
        b=KiY3H1CLxa5WjqdPU4uhbnkm5BmlRyy0AJ8/BZ5hqNaVYeZbI6FlaBwSh1ajulDsjL
         /WNhuvm/KDvIFa3UC7RjgQ5RbY2otryVwlwqpYJOcP7EHipYzDKH5sfTWdLAuI0O5qO5
         A5cg8ASxhKu9FsLQgDBDekK+d7kZz1y8BZ2pSmrUkV7AU2YCTUVlI6MXjcBz+Jb0gThv
         T/39xm1Ygd4cDFCOiP4jSPuU8SY/xuh16wUOI2XNrvUUfTkAqNROO+W6dfUVt16cTgZf
         EqS3W62ENFtsd5ZDBCkSbQQpmmXl+vgLdfrfOqbeLpnHUcczEvneZAnvVdGqJ6W5WcW8
         tuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723047661; x=1723652461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
        b=D9vE2MT3S8uOCkSfK7boD2UUMmyh+auL1yHGTpHW4hUKydfRYwo6mUYShE/lxPVZFM
         lPJiElrQXIKIp54etIiszacxXvDuFvY+DTFVwvliMfHlnw4mDNkosJ+zhOPXStn1SjsK
         /ntPp8kzGU+5vcr7NMNMTX2j1IU5Z373e3piHFMKhDZ5kmmOBZBxZSkzE7sWxH+QtI/Z
         MJXGWIDCnx954ZlrklpIr5TNsZNBBkkTfVCwbIXEaSUJPh/7yiRuuL0MEsEP8rXZXiSH
         xSmpyzaoW2Y6r6nSGW2L8NKv1nA6gmlELR4qVP9duMyTcOK/DCwYD2Kb6oGjjH+s7QPz
         S/hA==
X-Forwarded-Encrypted: i=1; AJvYcCW8f9Qy9P2UDTf4Y1/bJOtY4dLqsMzYkaFLNQLpN0WVvRL50ep2/vIZROdbXfjgdwN3pGB4DYkrcELXE0gJdbDxYL7NedXdeSlIITjt
X-Gm-Message-State: AOJu0YwxPJlgRIyab7qkD7oiV8p1X7umREOKV602O0MVMN24yFAgep+N
	3PUAKfr59XjeOQFw2QTkmCpUkY6a07H1+Q65ggJpRH+MVDKes8biTAU4RVToBBqWl5sMMfpeCcN
	VCr+SeXgmu9LW/U6HZxHgh4nsPeprz2OZKzCG
X-Google-Smtp-Source: AGHT+IFlMQZM11eMhKYm88nwqqB//YSwgE91qY+0p4KKcANp0MWW6pOsqJvjDDmdPT/npZIBCFW4JUe0qIrb5ggxQJM=
X-Received: by 2002:a05:6902:1506:b0:e08:631a:742c with SMTP id
 3f1490d57ef6-e0bde2cf614mr20513586276.16.1723047660711; Wed, 07 Aug 2024
 09:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes> <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2024 12:20:49 -0400
Message-ID: <CAHC9VhS5e4=CK=svEPz=3zGm_FxDXdMoS4M7BUKj8z4sUf17Bw@mail.gmail.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
To: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 11:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Aug 8, 2024 at 12:39=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wro=
te:
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > The genheaders requires the bitsperlong.h and posix_types.h headers.
> > > To ensure these headers are found during compilation on macOS hosts,
> > > add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> > > adjustment allows the compiler to locate all necessary headers when t=
hey
> > > are not available by default on macOS.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/selinux/genheaders/Makefile | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/ge=
nheaders/Makefile
> > > index 1faf7f07e8db..017149c90f8e 100644
> > > --- a/scripts/selinux/genheaders/Makefile
> > > +++ b/scripts/selinux/genheaders/Makefile
> > > @@ -2,4 +2,5 @@
> > >  hostprogs-always-y +=3D genheaders
> > >  HOST_EXTRACFLAGS +=3D \
> > >       -I$(srctree)/include/uapi -I$(srctree)/include \
> > > -     -I$(srctree)/security/selinux/include
> > > +     -I$(srctree)/security/selinux/include \
> > > +     -I$(srctree)/usr/include
> >
> > 'make headers' composes the UAPI header tree in $(objtree)/usr/include.
> > So, if you build out-of-source, -I$(srctree)/usr/include will not match=
.
> > Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.
>
> Right.
>
> > But I am suspecting that this break cross-building.
>
> Right.
>
> We cannot do this.

Thanks for the review and catching this :)

--=20
paul-moore.com

