Return-Path: <linux-kbuild+bounces-2514-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55470930B9C
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 22:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43F51F22994
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 20:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFEF13CFA8;
	Sun, 14 Jul 2024 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSiDqXNe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE02572;
	Sun, 14 Jul 2024 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720988987; cv=none; b=blUDQvcLq65Zzs+ccxAflV6bW34CXZY7Nk5gNvcz2FHTvOMQBp7EIt3wcUh18hUPHJj/El/k79kktooKAigOPd3r2fT9XXg8vJlAdq5EDvFq5cyYrrQtYkM6c7ZvxfVPn4vetQJuO8sqvuaKFwCGGL8TdTBaOokE7zsd7CU4AWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720988987; c=relaxed/simple;
	bh=5DVwmaldh9pZpfQf1ibzCyt8OiuavasfVrvgW9AuWuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbACkG7c0pPsp1qz6p9XVeft8Vrygo2geVg1cd9bNQWl/n97erURBDMBrGl3VnwoLrtPDZahhO1oy1W9aQpw+TVBkfQy51M1mSdz6vxJaW4A23geNu7eAMe9lN2gtMGcfHkgfTweqIT1u8H2WbQKMvPXcmetlytz5rUAIwNzJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSiDqXNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B079FC116B1;
	Sun, 14 Jul 2024 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720988986;
	bh=5DVwmaldh9pZpfQf1ibzCyt8OiuavasfVrvgW9AuWuw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VSiDqXNecagrWkU2UYU9HajQJyOrX00qnJps0+mkSc2cZcICgBt9eIwB69ebqz5w3
	 a7GEYJWtCBWoNir3NSUxG/pHQiu8wtj6/3CYmFZkRKup8G7M6LlzPTa/SaEBGef54D
	 wAPfF+fy6MrlriZeJ4CEnVFtbdLpMfcurped+DBSOH2g09bWcyhWvv74l3b3tyNjoI
	 jGvALOskz/iAUIXNv4s0byxMWpQTNKH9X/X2PI47xDlVn3UxcpD+dyUS0LQki1ofNR
	 CLE/KGWPZKbAGhHZdnZQIEeKGGdq3K43v73sGWw7YuIZw1r6ZngTnse6BLgkGmPqgF
	 NuLSvFagrVsdw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea79e6979so4081628e87.2;
        Sun, 14 Jul 2024 13:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5b2rkFbYqpp+1DkqaooP3ynffoLpEVYQ/QvfRshbuI26VLKsLlfc6XH4fxMAPIJU21Z/gVTGp+c2R1zx3asGtlXAfC9UHsP0oWclGyOn0
X-Gm-Message-State: AOJu0Yyvu56rThvYJ785QYlAm3gkPByYz4Q++Yb6mOWZ64K9IgAoBxc4
	x4GmwDOOrgsfiKh2VCMkX9Bu71SEr5HAF1+aXin/jLorYnhkTQEn2u4OvcZxkLaclPbL4zHFYq+
	FJ+xMHr9fOorfYgobOXbkJUS8dFQ=
X-Google-Smtp-Source: AGHT+IF5y4JeSYqwgybmh/WOWO1ndQ9XLRi2c/vGw5BOoDRt+yZINKcqClyoXMDYVGtfpoJzvhCuPLqvGiUEnZFWxGE=
X-Received: by 2002:ac2:518f:0:b0:52c:d9c6:68c8 with SMTP id
 2adb3069b0e04-52eb99da282mr9809181e87.65.1720988985400; Sun, 14 Jul 2024
 13:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714170847.2029108-1-masahiroy@kernel.org>
In-Reply-To: <20240714170847.2029108-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 05:29:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFuge+3T7uwNjgg8pnzVr=T0PaJ4LT10-zUdhZ5UZ-EA@mail.gmail.com>
Message-ID: <CAK7LNAQFuge+3T7uwNjgg8pnzVr=T0PaJ4LT10-zUdhZ5UZ-EA@mail.gmail.com>
Subject: Re: [PATCH] fortify: fix warnings in fortify tests with KASAN
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 2:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> When a software KASAN mode is enabled, the fortify tests emit warnings
> on some architectures.
>
> For example, for ARCH=3Darm, the combination of CONFIG_FORTIFY_SOURCE=3Dy
> and CONFIG_KASAN=3Dy produces the following warnings:
>
>     TEST    lib/test_fortify/read_overflow-memchr.log
>   warning: unsafe memchr() usage lacked '__read_overflow' warning in lib/=
test_fortify/read_overflow-memchr.c
>     TEST    lib/test_fortify/read_overflow-memchr_inv.log
>   warning: unsafe memchr_inv() usage lacked '__read_overflow' symbol in l=
ib/test_fortify/read_overflow-memchr_inv.c
>     TEST    lib/test_fortify/read_overflow-memcmp.log
>   warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/=
test_fortify/read_overflow-memcmp.c
>     TEST    lib/test_fortify/read_overflow-memscan.log
>   warning: unsafe memscan() usage lacked '__read_overflow' symbol in lib/=
test_fortify/read_overflow-memscan.c
>     TEST    lib/test_fortify/read_overflow2-memcmp.log
>   warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib=
/test_fortify/read_overflow2-memcmp.c
>      [ more and more similar warnings... ]
>
> Commit 9c2d1328f88a ("kbuild: provide reasonable defaults for tool
> coverage") removed KASAN flags from non-kernel objects by default.
> It was an intended behavior because lib/test_fortify/*.c are unit
> tests that are not linked to the kernel.
>
> As it turns out, some architectures require -fsanitize=3Dkernel-(hw)addre=
ss
> to define __SANITIZE_ADDRESS__ for the fortify tests.
>
> Without __SANITIZE_ADDRESS__ defined, arch/arm/include/asm/string.h
> defines __NO_FORTIFY, thus excluding <linux/fortify-string.h>.
>
> This issue does not occur on x86 thanks to commit 4ec4190be4cf
> ("kasan, x86: don't rename memintrinsics in uninstrumented files"),
> but there are still some architectures that define __NO_FORTIFY
> in such a situation.
>
> Set KASAN_SANITIZE=3Dy explicitly to the fortify tests.
>
> Fixes: 9c2d1328f88a ("kbuild: provide reasonable defaults for tool covera=
ge")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: https://lore.kernel.org/all/0e8dee26-41cc-41ae-9493-10cd1a8e3268@=
app.fastmail.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



--=20
Best Regards
Masahiro Yamada

