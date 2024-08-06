Return-Path: <linux-kbuild+bounces-2828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493B9488FD
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 07:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F03481F23C9C
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C366E42AA0;
	Tue,  6 Aug 2024 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHro/5P/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890F4A0F;
	Tue,  6 Aug 2024 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722922520; cv=none; b=atOevxWURPP0GpnbbqmEuN8ka3SnAf4tT/G4Vq78My7v5gaysozkDpbEWhn2zhahMgdeFQk7e0y9LUWZDC2FoKzVapnvY5eyiH56Zj5XSezmZpN92OgyLBhL2SkF54nMgc4Ih/b8ohZwqIPF9cI3Y70c/Ro+mqseHmiz432bhnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722922520; c=relaxed/simple;
	bh=S74NFkkCdNRUA5nZPS/PkjzuzSAXeP4WgUQqHe4JBn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lORzosY4/ph2WhWQMydU+CDO9JTzCXVIwgzbcKNbib7l5SpMzt47msPIcUDX61QnbcGo/kULzjw/3v3p3hS8zCww5TQv8JRS2+CaYQ70ShmckQrJ0sg3/lsaxBeFz0gyTr5Y8MxITkhajxokKlFwFHRF+jH02SncUHuBsZIZdp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHro/5P/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B38BC4AF09;
	Tue,  6 Aug 2024 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722922520;
	bh=S74NFkkCdNRUA5nZPS/PkjzuzSAXeP4WgUQqHe4JBn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IHro/5P/LLeLnnz74M5FPEr57KrsB0YG3DR66wzIbvei1xBHRTMDF9PlWmUCmN+dI
	 Wwy9snyTw9fvMck0weFY61knSp/xcgpHesVuCBq7qqsbkZItoM+luAfK1Gq8zdUcQS
	 lfRtLbVt3cc0eC5M/nkxpgSZ0V5/w21RuzvZ4m8qePqn2+g7mKxsD7mvloTucwzSBi
	 SwuH8vWAjxX72O4r8MOSNMLMwq6FsS99eVNL4KoWob8Zp2Td9w4CRSlxyzhPUGUfaC
	 /YQogf3SD6DfyLU3PXJKkAuuuYuoner6xR+Vr2ew+pCuTMhIIsKA6ZzmxTyVByvNw2
	 EiiYFd0B4kSdg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efabf5d7bso400235e87.1;
        Mon, 05 Aug 2024 22:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxFCfu7iwXFJHKc2qy01nKrcM1s10MuAmRQk0hHeYzrIa+hOYA8EB/RIc0i+4wpN1m4emBJ02BcHKamfj4FNDhCeTLn+A5BG8bQwxQfxTlSTqyUYfURNHQkDkmMAntsEU/hT7QrbfAZfjD
X-Gm-Message-State: AOJu0YyJSYgM7X694afrVFdkO9uz9Qsb7e96nG4r2aCwRSW/nTqtxhmU
	OQdBVI1aS5DYQmC68+jZKy2AO76gL+hAxAinFL5ZtgiOIW+DeJoOOmbVhqSOxZJ23KDgnULobjf
	qFX+23CXjv6C+yfVHEAzDit5tzcE=
X-Google-Smtp-Source: AGHT+IGX8NbCyHfd3vp7IzBNjbMe69BQfv/tydY0dqTmvpC3MreK/PNKyoMuShlSWu9SI40dH/KDfH3AeOzmD5NHdFA=
X-Received: by 2002:a05:6512:3a6:b0:530:d088:2348 with SMTP id
 2adb3069b0e04-530d09aac9dmr2319012e87.54.1722922518741; Mon, 05 Aug 2024
 22:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804055057.262682-1-gnurou@gmail.com> <CAK7LNARHRjP0E-5GLJCWqyQHRURrJBgZO174thdokb5taW+qiQ@mail.gmail.com>
 <CAAVeFuJ8ruqSGbqLTG3d31tTy6p22af7yt6C59mYhS2p0goa-Q@mail.gmail.com>
In-Reply-To: <CAAVeFuJ8ruqSGbqLTG3d31tTy6p22af7yt6C59mYhS2p0goa-Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 14:34:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZoMFdZZ809otGrxi7PGY5PP_JFa9p-vO0DDrV7P2kUQ@mail.gmail.com>
Message-ID: <CAK7LNARZoMFdZZ809otGrxi7PGY5PP_JFa9p-vO0DDrV7P2kUQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 4:34=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>
> On Mon, Aug 5, 2024 at 3:20=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Sun, Aug 4, 2024 at 2:51=E2=80=AFPM Alexandre Courbot <gnurou@gmail.=
com> wrote:
> > >
> > > When trying to build the compile_commands.json target from an externa=
l
> > > module's directory, the following error is displayed:
> >
> >
> > As I mentioned in v1, this issue only happens when using the kernel
> > directory built in a separate output directory (O=3D).
> >
> > Unless you have a opposition, I will reword this sentence as follows:
> >
> > When trying to build compile_commands.json for an external module
> > against the kernel built in a separate output directory, the following
> > error is displayed:
>
> Sounds perfect! Thank you.
> Alex.
>


Applied to linux-kbuild/fixes.
Thanks.


--=20
Best Regards
Masahiro Yamada

