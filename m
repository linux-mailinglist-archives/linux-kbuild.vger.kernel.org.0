Return-Path: <linux-kbuild+bounces-2810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5E947515
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 08:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74981F216CA
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 06:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5EC38385;
	Mon,  5 Aug 2024 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="embsmbPo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EAA1428E3;
	Mon,  5 Aug 2024 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722838483; cv=none; b=o/HNHtCZkcSgmBlcr/nJC3jYC2gnMd0PRDZEtqZ/QCQq5Q9LXOk3Zh8zo75iO3tMQGLFWPuo74QJWvVROUgpjkz2lukwSLBC8TwjUY3AhMLHWqEFJ2v+WIy35hKancQTFgjMuWUEiXXH0j61pedxy1N5zQVCpI9eFzv6ngk54RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722838483; c=relaxed/simple;
	bh=s61fEfIr4lfvT/pj2w8PUtzOsigVlA4yxBSZ3Bv4o9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5Xa/AklMqEe6o0w3rssYXo9xrwM0lUBwteCkdl5rpIw9fq+9v/X5CNx1oUW0wkpWmT6suvH8LhKXsfyBBeiB/RaNhy3h+SwgLE6Bf9HPZ9ObQnLjRD6C7PTAMSpP6P83SKLC3L7l+ouvT3s5V2caLI17q5iR/of+SrGDIwCA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=embsmbPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34EDC32782;
	Mon,  5 Aug 2024 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722838482;
	bh=s61fEfIr4lfvT/pj2w8PUtzOsigVlA4yxBSZ3Bv4o9M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=embsmbPoN8xpR+LgMTQsFpnk8rBNXolrmx6sqAZa6S4CdwCqiQ2lqJW4RTUNPm0Lq
	 hd1SoqR2PM0/e2HL/A02vjql9rWrKHgejilHAYCmdtcY5igPvXDJzgqJpv77iR574c
	 nNXCK1sh3vaXbCodUttM8OtgfeT1akTd/2ZWVQw/XIUhrGAT8EVsu7wdZJ2AudIHkh
	 uBnwjzVf2wDDASzjAfNANfWv3QvklliIhOCm4+OUpSf2BBGqq2+iGWwsK4cPjjjgcG
	 /EtOcSUDrBu54llqqE0xHijOsG7MFC/KqsA6pGFsE2chWmsok/wJx8VqlwFLRkka8y
	 8IZIKQwZgbEmQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530ad969360so6775128e87.0;
        Sun, 04 Aug 2024 23:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+31qdeb/IiUQOaKblqSoCf8wScu2y9JXrCCP8tz9YLDpQaJ3E1ZVDF2txnwUTY1ysjmoc2x7KeUccjeLcJNE85G4nDO6SkEcXRUtYyWcFSObG/j+MfCMFKZYfk/SSXsnm67xc0F+8J+OQ
X-Gm-Message-State: AOJu0YxTK7QJlYKh9fQW5luwo2DtVS4hJSgGUEYi2R33YdGv89E3KPoK
	cor/zWS0lqmwH1zJkeQPLR5qqk/wVRf+3P1sltqGwXRl41+p4MQWbtnfwC6yzBYc+86pQZ1PpiU
	d4I5BrfRrwvGuPee40kfZHorcZvQ=
X-Google-Smtp-Source: AGHT+IElReks+hSvd/gGIoGuFEPv7/5KXxIcEB4ojmuBL83qFpU0VV1t5l96Sp1RA3CX23F7alZ9MNa9kAWjxwhAAdc=
X-Received: by 2002:a05:6512:6c8:b0:52c:dc6f:75a3 with SMTP id
 2adb3069b0e04-530bb3d42d4mr7934627e87.40.1722838481350; Sun, 04 Aug 2024
 23:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240803125153.216030-1-gnurou@gmail.com> <CAK7LNAS83xr+MUMjQXj7LE1b1ZbRUOd4c+FYHUQv=y97O4Ymqg@mail.gmail.com>
 <CAAVeFu+mH_PrUHm=i+iSr8Fz14C18D+4A9eq+FPSieLNsqa+PA@mail.gmail.com>
In-Reply-To: <CAAVeFu+mH_PrUHm=i+iSr8Fz14C18D+4A9eq+FPSieLNsqa+PA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Aug 2024 15:14:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQu8a3RUmcAx2qT7Vb5FZVCwrVswvG9ybnUqc4BaUgmJQ@mail.gmail.com>
Message-ID: <CAK7LNAQu8a3RUmcAx2qT7Vb5FZVCwrVswvG9ybnUqc4BaUgmJQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 2:51=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>
> On Sat, Aug 3, 2024 at 10:47=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sat, Aug 3, 2024 at 9:52=E2=80=AFPM Alexandre Courbot <gnurou@gmail.=
com> wrote:
> > >
> > > When trying to build the compile_commands.json target from an externa=
l
> > > module's directory, the following error is displayed:
> > >
> > >         make[1]: *** No rule to make target 'scripts/clang-tools/gen_=
compile_commands.py',
> > >         needed by 'compile_commands.json'. Stop.
> >
> >
> > Good catch.
> >
> > But, to reproduce this, O=3D option is also needed, right?
> >
> > e.g.
> >
> >   $ make O=3Dpath/to/build/dir M=3Dpath/to/external/module/dir
>
> I am building the module as follows:
>
> $ make -C ../linux/build M=3D$PWD modules compile_commands.json


OK, this is equivalent to the command I gave.
You are building your external module
against the kernel built in a separate output directory.






--=20
Best Regards
Masahiro Yamada

