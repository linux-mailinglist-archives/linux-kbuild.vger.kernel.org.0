Return-Path: <linux-kbuild+bounces-6907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C418DAA7FAB
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 11:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D9701BA2494
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D7A1DB12E;
	Sat,  3 May 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7+HXzBL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD91A00FA;
	Sat,  3 May 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265207; cv=none; b=OJLGVuTLMMKmyITUUD7y6DHs/ZD++5WliYdK6YVoSW2lVHbRwD1pc+fr0clidTKMS5goeGw0GmpABC8REjA0k97EGtgtrYaojQ4mJRaIz7HKYMYrVJSTYbzM1D/Ye2Xgn2hMsnShm3e6Cb4kBhHGBzUUTlyPZgRnuhDhYZni+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265207; c=relaxed/simple;
	bh=0d1jkdjxOeJfB6xqzQFiAHc4uIjGHruLnU9XnCJoIgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nelqlezjIERoAsYgi1qlutpYVZLyT33fUagfnuhELn8I4hOiyIa6SAI6xjuzoccbKAWnBE+IFrRPX/xiEUON18HD6KDMI+QEIBthfBLRLNgerVlWylm15/e+tp0JMeFMwK86fvgNYYHAcTlUW+30LcftU8Z1PSPeIb7ThcQ00N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7+HXzBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5B7C4CEEB;
	Sat,  3 May 2025 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746265206;
	bh=0d1jkdjxOeJfB6xqzQFiAHc4uIjGHruLnU9XnCJoIgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i7+HXzBLYfTveb8gNBVJiQsWVMjVEdhDeiJra3G+F0xbDD64Rpv6zgcNlLYTTaPQD
	 c8ojFlapEcFdcF3XLx9hFh+3VOd/LH1EIAiGosqGJkxy7B1/i3ldWsubKERPiFkSWR
	 qRKrZklKke+fE8i8G9oAhhBJxkOXDhY2G/QJLyjsnNJxV5GXlzLJxJEcM4EM+l8cZV
	 2bvombdLB1ldtUYVmhf3G5SfOyX582v7iSJSEJhrMzGu5rBhgHj/Jkb1ISyG5UIAcs
	 432pNOVG51llFQjdYCI3jsy43kKsADRyVncZtcMrjE1UyeVWm6EtiIb3JFxu61E65B
	 6HwkT6h1qsxYg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso29412171fa.1;
        Sat, 03 May 2025 02:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3I6gWrmccwAJYdQY14kjLULPVSvOGZPFZFIpzQLtfstYnknMLMIYLfDaE9J2V4qj/KTssEH2kkiNi2rCs@vger.kernel.org, AJvYcCX7onRE3ern+dnm7IYT4tL2NVPrCarUAC6XAidkKjRqvcxmYGJVsL07T5EqrBRMvMmrWD1002kJbIlBNJhS@vger.kernel.org, AJvYcCXwWdLl/MzbuhwlXYUh1xnHgv9C5WN6tY4i7QVsBLEbMR6tIqbPMfH0pNZQ61UYqtpFeOPP9Tfy+tUc+9WuBuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEHGrJEOpZLu1stdZY1pbcDaw0+UBZpqOsHdRV2Ln2nkjb3Ri
	SdLJ4OdQq/Q48M1HSBUuL1VNXT5gjH17iYdHmydthuT/UVYO/2Chch6D1AjBKyzxtcU0UKuIW9I
	sVlwmaQQecogSFV8FYVCMq+wSl/8=
X-Google-Smtp-Source: AGHT+IE9EAiuUYo6KvN+ARqicpo4aM/gSPHQAiIJeqb+afi6OOpGnh/TXW54tKHBxiQX1e7w742MKNCXNjXTXGxERYw=
X-Received: by 2002:a2e:b8cb:0:b0:30b:f0fd:5136 with SMTP id
 38308e7fff4ca-31fbd521738mr25333291fa.18.1746265205431; Sat, 03 May 2025
 02:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502224512.it.706-kees@kernel.org>
In-Reply-To: <20250502224512.it.706-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 May 2025 18:39:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
X-Gm-Features: ATxdqUHjgwA3zgCEhsY5zu77ZvtX7H9zd8h92syMTrpI0NC3HWoo72zkjE5p6x4
Message-ID: <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Detect changed compiler dependencies for full rebuild
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 7:54=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
>  v2:
>   - switch from -include to -I with a -D gated include compiler-version.h
>  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org=
/


What do you think of my patch as a prerequisite?
https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-masahiroy@ker=
nel.org/T/#u
Perhaps, can you implement this series more simply?

My idea is to touch a single include/generated/global-rebuild.h
rather than multiple files such as gcc-plugins-deps.h, integer-wrap.h, etc.

When the file is touched, the entire kernel source tree will be rebuilt.
This may rebuild more than needed (e.g. vdso) but I do not think
it is a big deal.




--=20
Best Regards
Masahiro Yamada

