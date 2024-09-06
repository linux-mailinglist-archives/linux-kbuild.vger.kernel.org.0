Return-Path: <linux-kbuild+bounces-3447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB596F899
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA22B2870FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3131D31A1;
	Fri,  6 Sep 2024 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BforSi7k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06BE1CEAB1
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725637677; cv=none; b=d/gsqcHUfclbxl8aweCQ6ZMEk0WZNtVsJ6HUvYTw1/p3QpQ8+ddtos3+YZeVsRSidmbBgzaCpZMoV3rkTuZ/aoDyORfjn3r2LIfeLhpQHJO1OJa/rJky/5xiv5+Ko7bKsQ1uNwU120gOHep9HmuN33WIMzKTdhMmIaw1T8uzJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725637677; c=relaxed/simple;
	bh=zp+DRchAoSH6nEhGn8NigH/AGNYz0sJ/vBoXvNGXq6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwZCr/l6hkvghEO6XSm2EFFz6+pNFL8EMelL2cu54cH1tjIYcdJc7vAXH7cOLVlClKYvri47Iwl7Cv6RRMLX3lEz1nVb3cwIv+wOmF4RFSLq5s93Ppq1HDB4F11lILGk6DmqAzTS73vYIjOAhOfTqBwyU+QKvXpG9Q4YMXsrKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BforSi7k; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-846c59979efso589246241.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725637674; x=1726242474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhSj9nfZOKGx2oI8Vgr1Z2YFtbWDQo0OdEcOMXGBUVQ=;
        b=BforSi7k9socR64Te/cpapTn6yC0bYcbN3Sfzw/xTTMSFDrrNJOrW3NKVtJDXi3VfC
         Zdp4DusPrRw4KlUACysbWt/CCNZ6TjMUPnYa1x12BMyTMm/M0e7Im6erF9YMbIO2IA13
         +zBR3l7GHLCtnPQ/ySbCofJUlFWf9djWDIELjC4emJTJq+2ihklhinrQF+lYuRyQ11sl
         yBfVTnMQ5ffdww5Gf1sAL1NXeKHUZwBkFNHQg6jHXO0kXNNeiOko2Faw6mBoao3LXvWZ
         PaPWPN8fzjtffqPymGsZ2aanuDpdSkR2i+aF9dkP0WrJVt6qKJUDEWwAzBO/1bBgtT7N
         Nl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725637674; x=1726242474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhSj9nfZOKGx2oI8Vgr1Z2YFtbWDQo0OdEcOMXGBUVQ=;
        b=gEnLa/0DoiexIznB5aiW/kLiNsDM853j79jT4N5Si+AEfrZ/V84spZp+/5+HtdSCXW
         kChk55dAoq6UwYrrQaEJr56VghEVU98hTlJmteTlDm5ST5XLIAGORunUMjGzrz+SVKHO
         drzRMvStK/jVn2GWgmTbP39jCeFNVI/c5VP3I27ItRt0EgDMdD9AWxHxctUfFPcRgU16
         fPXC1bCfu5E6QqrQCS1dT2XWynBrVzvPZ0llFLkgzFO0LDi6n4xOvQuZpoy0cmoDI40A
         BLidgm9pgSyl0bJoJMwXhJM1eWPm5MlrKVQEkp1R0Nu8Dn+L4h5wdVsMZVSL5xFJIaiv
         mTQA==
X-Forwarded-Encrypted: i=1; AJvYcCWxxQz6RJaAU3iuGxR8J77Y6O6MU2vIlIx292MboDo3kY/n58C0Sy64UsdZpJaiSHgb5CKMHyonup9NZm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKB1qA4JOSSiUOzL24GYLKbzfYBhHUQBNZgaQ6Yzun7AkbejVh
	aqQyFeNakYhdfOxLEK47foFbO9wCA8z6z5F+1dYe+v+B1XH+Sm7dmDkLjCypM2/twZg8yRBI/z2
	mMHoEPGPbr8xrUZJw35zjvDdkphcFo1ajWQ4M
X-Google-Smtp-Source: AGHT+IF7X3uC600GKPCYXtrk3rXSJ/jRYK/ecUEv0Py5v9ieqTUOC1FYqsUcW+C1Bf7xEBaWosXwVByWGbyAX14C8rg=
X-Received: by 2002:a05:6122:1e16:b0:501:2a26:8ccf with SMTP id
 71dfb90a1353d-502141df589mr3197102e0c.6.1725637673925; Fri, 06 Sep 2024
 08:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
 <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com> <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 11:47:43 -0400
Message-ID: <CAHC9VhS19s9+F2LhagbpxTR6DZPu_A8FADmBw7+BdaFQ6vx=LQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
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
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 11:37=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Sep 6, 2024 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Masahiro Yamada <masahiroy@kernel.org>
> > >
> > > This tool is only used in security/selinux/Makefile.
> > >
> > > There is no reason to keep it under scripts/.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >  scripts/remove-stale-files                                    | 3 ++=
+
> > >  scripts/selinux/Makefile                                      | 2 +-
> > >  scripts/selinux/genheaders/.gitignore                         | 2 --
> > >  scripts/selinux/genheaders/Makefile                           | 3 --=
-
> > >  security/selinux/.gitignore                                   | 1 +
> > >  security/selinux/Makefile                                     | 7 ++=
+++--
> > >  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
> > >  7 files changed, 10 insertions(+), 8 deletions(-)
> >
> > Did you read my comments on your previous posting of this patch?  Here
> > is a lore link in case you missed it or it was swallowed by your
> > inbox:
> >
> > https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-m=
oore.com
> >
> > Unless there is an serious need for this relocation, and I don't see
> > one explicitly documented either in this patchset or the previous, I
> > don't want to see this patch go upstream.
>
>
> I commented on the previous thread.

I already responded there.

--=20
paul-moore.com

