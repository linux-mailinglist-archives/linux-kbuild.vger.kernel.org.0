Return-Path: <linux-kbuild+bounces-3206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDE95E010
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEDA2B2179F
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 21:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481FE12C499;
	Sat, 24 Aug 2024 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLUxzlZA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552C43AB4;
	Sat, 24 Aug 2024 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724536332; cv=none; b=kXA9Xc4xNCj1VKPyH47wuTZc58r8poQbq2MoTsSFqQJzqFznTpepK09qnKDFggQgnZGQGxmz/erdNd0cka2ambucd/v6gkjxkxyKcyNvJk8bBxuBA1MqANvOaBIeZBE3YwAXX0Mf3MLCWpRLG/CLwkA7URUuHut3SK+Kmmd126g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724536332; c=relaxed/simple;
	bh=rvDzF29UIGiwwwtsliOTp1lOdDgtKPnDQ3FxxCtih8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP6lhqRe5B4aig99ZgIqFv7+HdbR4yWLOYGmG47LjUxlXdgYXFdk0tMtsTrsuHRZpSbmltFNrV+yfUemBwJJgjA/gxiEcLaPqNOFZ7u2FxQZ9Hh/oyPcnZOcbnt7imrvT2CmdJUTuiD36Z2iphqfiZsKG7hQG3Q7RFTGLVgn2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLUxzlZA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-533488ffaf7so4302776e87.0;
        Sat, 24 Aug 2024 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724536327; x=1725141127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LvkMonHnwTvwh84VPYufq+0UgxpaA0cAQiMXUhpE8AU=;
        b=SLUxzlZAHxswD+Wy1KA1j4xRpjb9TwAc3tFUl3DpJuRjVbd7oTl2Ms7cF4rJFyxGSZ
         uIha/XkfYmquGlksJj53mHjlIjQwlBiVp9ZdBWel3ihIYqjZAYzX3tIKyfjSZkYHCHUv
         U2U+w1Z2eGggQo+QCc8zOTiT3agaArrhDmo9Q7+UilAaNcbRHVrTBNMewm/ZTuzHaEwC
         rMxpF7k+XoAb6tDZPI2eDccJ8+eBadyObVfudR6xhwMS8SAZOYUZMx38j5n3/as94dy0
         KoGbEIoQ/k6NWjbm6Cr4jEjwR0krPkXHdgeQQsnu85fpb76UHx9GqeHDd3+0ioe7oIAu
         8J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724536327; x=1725141127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvkMonHnwTvwh84VPYufq+0UgxpaA0cAQiMXUhpE8AU=;
        b=Hlwuymw3QekA3ajeqDPoGd/L8KD2ruXYP9Ypu4gRm6EqWpSwY+Mjgn7nzmh9kKNlCC
         bb1DYieDXt+ggmhNLe90DVIMh4R0Fa/Ikqm7lq1tjs9ndLTg3d2jZKB6RtHPTvlqpkTN
         Qu0KZmkgKpFTvYQaz15pF97+Av2JBfkmOxKJFEbWs93UqAaF9WNtsXHFyWJPKR6RTHWT
         5C0dPBvCG6Me+4hcwnCr3e8svv+z51EC2cbP/UkFZ459EKS4LrmWHRL9jedo+RqpduKo
         jWaKtULkrV2k9u787z+UXPTb9XMFHWGrHLjVpmr32oR9RxpblVPmThqDXmCzEJsbZyMt
         cIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVSEpmk1zO6+8mnq52uXBbP1b2rw0PEtIviSI/aiklsydmPmUis7NGB21S24RjyLherGRgiHlsYowYZpOM=@vger.kernel.org, AJvYcCXAKmFIenjp9nvS6eSJjPjzu7NEfW52j0wctDjlaVc8vOVWLugAQgQW54/yjJFHwydXF9ciev7cSHCDtPXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/VuB0nnzHPpf2espavuQ4RT1QH10mQukNZ2W+nNknVrIiVLD
	nR6M7mZ7cFrxbDQnTTrnnryLjfbdejqGtO8kkpxBMvn3g9lhpCrC7YikvNKa1V5aOhy7VQuhd1z
	o8bD9vcAzloxQVA71sA1GIPpOPksQGw==
X-Google-Smtp-Source: AGHT+IEQ3zFvRBUWFq1f84htGmI0rZ9jbXCzr4fcjF3L5HRehu2nOoc479xO44GOCbT8NTn5xN1TjkdMTyZ37FpCv+Q=
X-Received: by 2002:a05:6512:1193:b0:52c:e0e1:9ae3 with SMTP id
 2adb3069b0e04-534387bdff7mr4770603e87.57.1724536326970; Sat, 24 Aug 2024
 14:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804033309.890181-1-masahiroy@kernel.org> <20240806-macho-uber-chipmunk-5ffd3e@lindesnes>
In-Reply-To: <20240806-macho-uber-chipmunk-5ffd3e@lindesnes>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 24 Aug 2024 23:51:30 +0200
Message-ID: <CA+icZUXvrnX=z45F+w+S02hzSs4PWRcjX+0FcMW4XnEC8rPE7A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modinst: remove the multithread option from zstd compression
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 1:02=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Sun, Aug 04, 2024 at 12:33:07PM +0900, Masahiro Yamada wrote:
> > Parallel execution is supported by GNU Make:
> >
> >   $ make -j<N> modules_install
> >
> > It is questionable to enable multithreading within each zstd process
> > by default.
> >
> > If you still want to do it, you can use the environment variable:
> >
> >   $ ZSTD_NBTHREADS=3D<N> make modules_install
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index 0afd75472679..04f5229efa6b 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> >  quiet_cmd_xz =3D XZ      $@
> >        cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> >  quiet_cmd_zstd =3D ZSTD    $@
> > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > +      cmd_zstd =3D $(ZSTD) --rm -f -q $<
> >
> >  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> >       $(call cmd,gzip)
> > --
> > 2.43.0
> >
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # Linux v6.11-rc4+ on x86-64

-Sedat-

