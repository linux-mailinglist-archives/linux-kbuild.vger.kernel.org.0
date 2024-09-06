Return-Path: <linux-kbuild+bounces-3440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF996F7CE
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A8B284710
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C06C1D1F77;
	Fri,  6 Sep 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="pT9LGt6H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB11D1739
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635214; cv=none; b=MLmQdLX+4X/cGtNYpJKp922IwtSsgwvMtnlJG4p2fxGukOVpunvl0+ORmR7fiawlGGbpwLEOUKzDD9ZwfkrgOYQtwiqkYRA0WLvrh8CqlLvXjfGZc897FQt6reQPNb7hENpawamzMod3QhpbQpVje2oafe4KxC6feXHkr2IjKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635214; c=relaxed/simple;
	bh=aQLKfK6IyeVlvPZdEpJhpjuD9yzE9AaUJBwaw3oLa4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srzt6vJ+ySZb2oOjAUgwNDntsoYrjZlz1QjMgJ5y2G60LuooL9WuPl/812Q9AsPJOTdK5M+UhMrkX7rwH2aHXg+7jftMMfw5rBrujkxRelfxJxeZ0Ms+cM2+wLlAKXlsdrGVSpwW8eDcHFsBDU4ZME57mVfx/ARA0w44isF7zWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=pT9LGt6H; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso40167566b.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725635209; x=1726240009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9ZAlMwEyYD75XfvfcvFROEESwWLuQ5Z/p2zffJIs9s=;
        b=pT9LGt6HoMXbBN6Jb11wMUrNNRszdLRxKwZK2np3gYd6xtdWx554OI2X6ryv7x9sj9
         egV7RxfVPXlVEjVEwOV6azELU6NUOQaQNtn2aVi+XPx+YdBiWBYOg9Lkhjh6JrumSZEW
         k/zixBuf4n/9A48lPNSgALlpPuXeiQnbBj/byCznMYchDb89+DpEC+nE4hdiZ/kKn6tu
         5fKVm8pN72HP+YyC1eAEk9GUuNaEAB+h1qBYMAmyu5CymxP/sTv8BRWh2XO2OZgODq+U
         EHJ+4rGLO2kBF6JQEOWkfsuIk4st0Uq6uoyK++ASAT6H6TDKRIVkKm+uBy9kvt2vPtZ/
         78nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635209; x=1726240009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9ZAlMwEyYD75XfvfcvFROEESwWLuQ5Z/p2zffJIs9s=;
        b=gFNiahMtDTZ8Ivjm+Ndc6Wi55gISAWh0KwERI9VrvIpNjk0Ik/9oMi6fnj7xOlwGfj
         PcPVGIRAdkuMJ0e9Llx8iK2YvExmf3qUjOrecSl2mwnaZIzZ9EHkD5V7VOVy5BFWyxXm
         Yzi1bi9B4XonK5WWjgOVUhHGnPHj8QxdRnNgF/nAzexX/m/xANDJEIl4YIbAwQV22I6O
         +s/XmBiwMxxJQOZjdFT+IIJQmcoLKX8oW55tGqPvuV5d8w4ri01wjBIGBcstFfrYuqpy
         1owSuNhW7qFfUQ45XvvBDZpRZdKDvRLM+smJRCaCRHaphs6+HC8XEhRqcAgAYPKrTgSn
         5xxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlNlVzIAJ26rAYGM/IK0dcvGpTlpRYK2OlRNtHKLww5LcNM7IDRJwP9kLaJpC9jIeOBOH3NYUQnnd2zRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXQcY6Nr02Cg/irBCfFzw53ujpIC6JvrQSVhimSsUhdgTF8Ai
	/0KupMjFTq1PbKLStH+nZQrrb2a92icfZjuNlGZXSP0kNnc6h2Vks5ozAD2p5nniJppI1mPtzZW
	N2veyY01CaJdlfU+6uZgBLO83AIVJZi1s33vxfA==
X-Google-Smtp-Source: AGHT+IE5oYDSfTzIe6hHUgUBH7wdkZoXXSF0xeHeSRG+IYdoi10a74SFm4+xUjHqeOxdrh5qK7III9nawL/szJxa908=
X-Received: by 2002:a17:906:c141:b0:a8b:ddf4:46f1 with SMTP id
 a640c23a62f3a-a8bddf45606mr100660666b.63.1725635208952; Fri, 06 Sep 2024
 08:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com> <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
In-Reply-To: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 6 Sep 2024 17:06:22 +0200
Message-ID: <CABj0suCtCfd58+i0s5LzsTUwwd=1o1nMRvmqsxsraJcTiX2mSQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	speakup@linux-speakup.org, selinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > This tool is only used in security/selinux/Makefile.
> >
> > There is no reason to keep it under scripts/.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/remove-stale-files                                    | 3 +++
> >  scripts/selinux/Makefile                                      | 2 +-
> >  scripts/selinux/genheaders/.gitignore                         | 2 --
> >  scripts/selinux/genheaders/Makefile                           | 3 ---
> >  security/selinux/.gitignore                                   | 1 +
> >  security/selinux/Makefile                                     | 7 ++++=
+--
> >  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
> >  7 files changed, 10 insertions(+), 8 deletions(-)
>
> Did you read my comments on your previous posting of this patch?  Here
> is a lore link in case you missed it or it was swallowed by your
> inbox:
>
> https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moo=
re.com

Apologies for the unnecessary noise. I=E2=80=99ll review your feedback and
revisit the patch accordingly.

Daniel

>
> Unless there is an serious need for this relocation, and I don't see
> one explicitly documented either in this patchset or the previous, I
> don't want to see this patch go upstream.
>
> --
> paul-moore.com

