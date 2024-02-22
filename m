Return-Path: <linux-kbuild+bounces-1036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00585F07B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 05:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FBCFB220C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 04:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB20710E6;
	Thu, 22 Feb 2024 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCoQnQit"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7514382
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708576754; cv=none; b=HeR6h6Az1mjzFBOZVMsRJl+GNAO7/Tm6WlvOurn5lpGH+0i7bymXdhKGH+dBNJI6xkLotn2Sw3jyu99CXavwvX5er22xl5O0N4DI/wVPSfvSVhOTywmydTKqT51prafVyg0ZKeDwLRk1VNSjoEtXx4+065KiENUMW2b6B1TeVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708576754; c=relaxed/simple;
	bh=7RJikY0sbyu6DQrBct4QIEfBfIOa5W4cxthSsDO6oOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3/ETl9PHdseDhF51NsM+sVHuyiZfnw3sajvKbC3m1E3V+TEkpRIKIS0livVNPrCcZhWKuRkynzZA1phxZq+5sDFm5lAryzK2wMnulSoYsrTBjWbWDZ4XmT4jpM9+nvmaulOSEV2X1WwQ2xvKlAYg6EKi1JSKZXPeE0n9Hgmiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCoQnQit; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AA6C43390
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 04:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708576754;
	bh=7RJikY0sbyu6DQrBct4QIEfBfIOa5W4cxthSsDO6oOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BCoQnQitw7Np5aL4RfvVpUuzjR5l5WJu/yRdLbzWlcpRRjEZHp3qr2F6Bj1lePGA5
	 YaeROvUIgyd4aL2jro95NZ5wDA1DEn6w1cEC1q8dqNmCuTkqnyIUi5rxoSL/nKSLI+
	 Cn7QLuBs/7+7XWz0NXhG+iF5eB1PiwDh3zU94vQ7r6cjtib8kvvJeGtXNxQ1js05lL
	 Nd/DmD3LsrWoYaUGHOvwFJz9nFk5BKv7ptj15j1y+cVS1RAnVTwPFVkmcKG7GI3qeX
	 JKigeubBoUhg+uVGfs1YLakQnERTSHAkyL+REdtmegIu/ZyIiTiGy5V5hW3oFOSAdi
	 9GuMJaKczil0A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512b700c8ebso5217916e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 20:39:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGrcONxO7lvlIlM3tN//NuDXpCNXzWAQsSrhiOF0+HAwwwBlhyORqANoNLaOqJJXH7BoE/JyuXXfZYIFw5SWJ/Z5dgKL20zrykjA7c
X-Gm-Message-State: AOJu0YwToxYl/dy33joXAa2F0Qxdof7vm3e3QASHywaGQ8IJ+a30Z1o6
	BFBU7vgyyZkHlzwgl1n6Kbe9RlA+j4pQvLfOzwnKSapcKcS+Aha5Tyv/KaXZ3DRWIDHRP/JnXEW
	RoZTdp12cNy0FL5x/SjF8ZPor+yc=
X-Google-Smtp-Source: AGHT+IH+6UDFqC+wjj/nvhaM3fv6mApCpmpDlVqVp/TOA0p2PMiFC1i8wvuSZdN1nOf3OBv2Wk5w02wOz1O6TeCRimI=
X-Received: by 2002:ac2:43ac:0:b0:512:a4ce:abaa with SMTP id
 t12-20020ac243ac000000b00512a4ceabaamr7751679lfl.48.1708576752905; Wed, 21
 Feb 2024 20:39:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1708478591.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1708478591.git.ehem+linux@m5p.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 Feb 2024 13:38:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARcv=iYRb_Qoq=tB3avbjQLpye9bCeqjmJUn6OyP6bZkg@mail.gmail.com>
Message-ID: <CAK7LNARcv=iYRb_Qoq=tB3avbjQLpye9bCeqjmJUn6OyP6bZkg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] Adding trailing slash to $(srctree)
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 8:16=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p.co=
m> wrote:
>
> The subject states exactly what I'm suggesting.
>
> The reason is the fallback value for $(srctree) of "." doesn't work
> properly in several places under some conditions.  In particular in
> several places a pattern of "$(srctree)/$(src)" is used.  If $(srctree)
> ends up with the value "." and $(src) ends up with the value `pwd`, the
> build breaks.  This can be triggered via in-tree/out-of-tree build
> mechanisms.


I really do not understand what you are trying to achieve,
but this is just about
"Do not try to build upstream drivers with M=3D".


If you hack it, it is what you should do locally.









> As such, assuming $(srctree) includes the trailing slash and setting
> the fallback for $(srctree) to "" fixes things.  This is untested, I'm
> proposing this since I wanted to use a build approach which triggers
> this.  This is really a single patch, but it has been split into 3 to
> emphasize where the real work is done.
>
> I'm suspicious of the fallback settings of $(srctree) found in several
> Makefiles.  This might be a distinct workaround for the same situation.
> I was wondering about adjusting some of those comments too.  I think
> $(src) needs similar treatment, but that is rather messier.
>
> Note, this is basically untested.  I'm hopeful this actually works, but
> if it breaks then this was mostly to alert the maintainers of this
> troublesome condition.
>
>
> Elliott Mitchell (3):
>   build: add trailing slash to $(srctree)
>   build: modify uses of $(srctree) to assume trailing slash
>   build: change $(srctree) to empty for current directory
>

--
Best Regards
Masahiro Yamada

