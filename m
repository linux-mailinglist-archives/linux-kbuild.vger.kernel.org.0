Return-Path: <linux-kbuild+bounces-4494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6C9BA62B
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 16:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C411F21315
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 15:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2A2170A16;
	Sun,  3 Nov 2024 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZt/M1bD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56819155308;
	Sun,  3 Nov 2024 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646089; cv=none; b=VuLIafinUWVgZS9Y9z573kj4cnoXi3762vqBa2o+OXtgot5IvEj5E9RrhCKHlLAAckJlArGDi6UvlAeW/+o9qwY+5qr8cAntGDJeL/azvlM7eYcBMc6sczGb5kkzhM/P3tcEIvXHBLx4dQQ9L4jVTV5H/UhblyhqmGLyUgaWuOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646089; c=relaxed/simple;
	bh=bgmGhqGPvs7CqZVRU3JCIzdDjTHPRquI+lH3DmJGO10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ccg4cHGHvCLN3wPM6ltF0DKh70BEFfIAaWXLCz3cK+/g8vOFXsrzltlL9r5ivC5eHK9+Zc329gqvREx20FKWgUpjBvELglb+RSb4Rc7VglPiJEKVe8RqjUBDuLpcdizxidmo0TXixh1ZzMTrOe0onjUSdIVUSWcZGK7BWpBEFkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZt/M1bD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0224C4CED3;
	Sun,  3 Nov 2024 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730646086;
	bh=bgmGhqGPvs7CqZVRU3JCIzdDjTHPRquI+lH3DmJGO10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hZt/M1bDxWnHS/GYK+cXq8aX4EVmv3zWM9rZ1zXPtkKagGcgttTDUKMAtO8KJyifB
	 WbmvHdRIb3yim7qMl6mNKuqu73eCGhMiWK34QaARLZ/7euXmBfeexIktJehLFEdNuG
	 RuOoAlcGoZcyOPpWeMnuIwGJ3ID5JMAOFUM04tqnQECkUMbbqZ129/oacCdnVYPRLd
	 dVcApYa7g68JOTtJ0umTyYsTPnrMmOHq+Mr2R4rfO+QZlQ1Cix/o1Gw2ymCz3SS4mp
	 65XLemePJHjJkM1yi1tSa8sMoqkFgHMUfkQl8OwezxLa712aykpLccRtz7iTrTzXkx
	 t+eH3rMeTQiIw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso30205541fa.0;
        Sun, 03 Nov 2024 07:01:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD7IBr26XwKHJYpikqHj70umepYa84oXDVnwPrAFtmyfpMuyapYIgWsj8Chp95jaTUTDrOoUz42FF/qR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uVEOFW3nt32ZSOz0PN4KOGiwRTTCPVULBM0Jp7ZVF0zL7IoO
	3NIH6y28qB/95dZsBhh2aK0gAqfuxqyAyorb5jvBhyEUjDJryFZJyURrXw5lGzL+BiIiLpTFmyY
	ofCXrPji8hVWDo9GL0cs63CbQe1o=
X-Google-Smtp-Source: AGHT+IE4UVRstaVHKfhn9sMUSCD5vqBta9RbxafckXBpagzomVd9RUVsPl4hvHtvQNwzngUaa5WfrzRoSyPv9PrqzwI=
X-Received: by 2002:a2e:a989:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-2fdec47a266mr59248051fa.2.1730646085318; Sun, 03 Nov 2024
 07:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103125259.944399-1-masahiroy@kernel.org>
In-Reply-To: <20241103125259.944399-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 4 Nov 2024 00:00:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMrt5F36b8ekdAOB=7U+AXXdVYKYQ4Hhbyzis2db6wdQ@mail.gmail.com>
Message-ID: <CAK7LNASMrt5F36b8ekdAOB=7U+AXXdVYKYQ4Hhbyzis2db6wdQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit
 on 32-bit host
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Hans de Goede <j.w.r.degoede@hhs.nl>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 3, 2024 at 9:53=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> When building a 64-bit kernel on a 32-bit build host, incorrect
> input MODULE_ALIAS() entries may be generated.
>
> For example, when compiling a 64-bit kernel with CONFIG_INPUT_MOUSEDEV=3D=
m
> on a 64-bit build machine, you will get the correct output:
>
>   $ grep MODULE_ALIAS drivers/input/mousedev.mod.c
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*110,*r*0,*1,*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*r*8,*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*14A,*r*a*0,*1,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*145,*r*a*0,*1,*18,*1C,*m*l*s*f*w=
*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*110,*r*a*0,*1,*m*l*s*f*w*");
>
> However, building the same kernel on a 32-bit machine results in
> incorrect output:
>
>   $ grep MODULE_ALIAS drivers/input/mousedev.mod.c
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*110,*130,*r*0,*1,*a*m*l*s*f*w*")=
;
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*r*8,*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*14A,*16A,*r*a*0,*1,*20,*21,*m*l*=
s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*145,*165,*r*a*0,*1,*18,*1C,*20,*=
21,*38,*3C,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*110,*130,*r*a*0,*1,*20,*21,*m*l*=
s*f*w*");
>
> A similar issue occurs with CONFIG_INPUT_JOYDEV=3Dm. On a 64-bit build
> machine, the output is:
>
>   $ grep MODULE_ALIAS drivers/input/joydev.mod.c
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*0,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*2,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*8,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*6,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*120,*r*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*130,*r*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*2C0,*r*a*m*l*s*f*w*");
>
> However, on a 32-bit machine, the output is incorrect:
>
>   $ grep MODULE_ALIAS drivers/input/joydev.mod.c
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*0,*20,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*2,*22,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*8,*28,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*6,*26,*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*11F,*13F,*r*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*11F,*13F,*r*a*m*l*s*f*w*");
>   MODULE_ALIAS("input:b*v*p*e*-e*1,*k*2C0,*2E0,*r*a*m*l*s*f*w*");
>
> When building a 64-bit kernel, BITS_PER_LONG is defined as 64. However,
> on a 32-bit build machine, the constant, 1L, has a 32-bit width.
> Left-shifting this constant beyond 32 bits causes wraparound.
>
> The fix in commit e0e92632715f ("[PATCH] PATCH: 1 line 2.6.18 bugfix:
> modpost-64bit-fix.patch") is incorrect; it only addresses cases where
> a 64-bit kernel is built on a 64-bit build machine, overlooking cases
> on a 32-bit build machine.
>
> Using 1ULL ensures a 64-bit width on both 32-bit and 64-bit machines,
> avoiding the wraparound issue.
>
> Fixes: e0e92632715f ("[PATCH] PATCH: 1 line 2.6.18 bugfix: modpost-64bit-=
fix.patch")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild/fixes.


--=20
Best Regards
Masahiro Yamada

