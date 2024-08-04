Return-Path: <linux-kbuild+bounces-2808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25E946FFB
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 19:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36D98B20E0C
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 17:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3548174E;
	Sun,  4 Aug 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUpPzfsW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756CA953;
	Sun,  4 Aug 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722791563; cv=none; b=BH00cmD8m06Rcjo2d1bNQkLYEKy+R+bXB4tRew36EmZGZi6gabaCSb02PVwRrnguTX4ussMQMsLJA6L3svaq/3egY6HGaJ0KHKIm0kFVS1rp1sfSoPzmUjUvtUUDotnEUgYNMHTy+FI6SQnSxmMagbpN3qIDOcGI6GiQlzhDqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722791563; c=relaxed/simple;
	bh=Uzrlv8zq+haa0MpkkWqTgdXs4kY12SIn3JXRFM1ld10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVw71GhPn+t7RJCdUpr6xX3LJB0ohVws1ySzQXIGWokNuTt6vZfP7vUdWmhU+lq+ZyjXcmxauEp7meqc/Uy/AofjR0+5/vaKtf2XLxQevgakI4wRoDqBw2UAkOXEEqn9U/1r8NYK4KZ1Hfefc4WoDeJMY0Vey0jlWOACOLs44kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUpPzfsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B08C4AF11;
	Sun,  4 Aug 2024 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722791562;
	bh=Uzrlv8zq+haa0MpkkWqTgdXs4kY12SIn3JXRFM1ld10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dUpPzfsWhT8fsb8oLq0XRCnQ9aDJo+o2zB2MjfEDlBI37PEeVJVwNKs+leOddil2X
	 Nnj7v6PHZPgKQNMsFbO01tiSHAHIE9GCMS1I95Qh6p4jL9ivxj6IgJ/9xZgVauEdDl
	 FTc4bOC+8dsO+nT+SJDxDuK1BLSWZXlkQQ2xFtsawqQf0H+jU229cQGhquhtOiicFu
	 coXwvIh9KXMDPtWQm/rJ8EcNdWQcCWSWiN7GW3nPBZKXPflX1IlUpVN+8onHcDbH4G
	 zpn+SuIptpALG34NZrtlTMkkdjfbh9xrCa17h25SvEQ12CM9xYBaA9BqNnf/FlVINI
	 udKYHGOm3d6aw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f04150796so15149995e87.3;
        Sun, 04 Aug 2024 10:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa2Tnj9BfCdlcy8R4HIPhVbvTjqL4B8cN8VZe22auEJF5LbGDGnUZT5XA/id0SG3Tsq6s+3GTi/2CgBxLX2DWK9ZAr4GamTIi3DOaT
X-Gm-Message-State: AOJu0YxwPP5hRTNiVRe4+3Qu0jFg2ScPyyaTRWz1bpqX+Ui87GeHV0LE
	Po8jxm1dsb3JhH1Scj+eiKZ+aWdLhLceRT2Y2wmQ9ppe2Vmmh47fLyvAHsaLQFMscL/CDtXGfvy
	fqINyf+9z37qt0XWbPjM9pTV9G5I=
X-Google-Smtp-Source: AGHT+IHtLqMDvxlpCdfhrO2NDr0HowjhdrZySRvfDY+lz772AgdGW6K2/JoGJ2zau5UiRCsuIS3Px8IudFRmjJrUhz0=
X-Received: by 2002:a05:6512:b1f:b0:52e:9d6c:4462 with SMTP id
 2adb3069b0e04-530bb3797d6mr6409197e87.23.1722791561425; Sun, 04 Aug 2024
 10:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804033309.890181-1-masahiroy@kernel.org> <CA+icZUWpeZF-PGQJLR1tt0u7sFVZ+MANX4hE-DUCEt=PhXGs3w@mail.gmail.com>
In-Reply-To: <CA+icZUWpeZF-PGQJLR1tt0u7sFVZ+MANX4hE-DUCEt=PhXGs3w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Aug 2024 02:12:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASB1qFv1GdxTHvLpcJu1NbWrze5VsfFRYbFMeiFv_JPhQ@mail.gmail.com>
Message-ID: <CAK7LNASB1qFv1GdxTHvLpcJu1NbWrze5VsfFRYbFMeiFv_JPhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modinst: remove the multithread option from zstd compression
To: sedat.dilek@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 3:36=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com> =
wrote:
>
> On Sun, Aug 4, 2024 at 5:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
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
>
> Hi Masahiro,
>
> I have some understanding problems.
>
> [ start-build.txt ]
> dileks     24225   24217  0 17:55 tty2     00:00:00 /usr/bin/perf stat
> make V=3D1 -k -j4 ARCH=3Dx86_64 LLVM=3D1 LLVM=3D/opt/llvm/bin/
> PAHOLE=3D/opt/pahole/bin/pahole KBUILD_BUILD_HOST=3Diniza
> KBUILD_BUILD_USER=3Dsedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=3D2024-08-03
> KDEB_PKGVERSION=3D6.10.3-1~trixie+dileks1
> LOCALVERSION=3D-1-amd64-clang18-kcfi olddefconfig bindeb-pkg
>
> ^^ How shall someone pass so that ... ZSTD_NBTHREADS=3D<N> make
> modules_install ... is used?


Option 1

$ export ZSTD_NBTHREADS=3D<N>
$ make V=3D1 -k  [snip] olddefconfig bindeb-pkg



Option 2

$ ZSTD_NBTHREADS=3D<N> make V=3D1 -k [snip] olddefconfig bindeb-pkg




>
> As far as I understood, each kernel-module file is taken - in the
> Debian build-process - sequentially file for file - ZSTD compressed
> and afterwards deleted.
> Is there a benefit when 'make -j<N>' is used?



zstd --rm -f -q foo.ko
zstd --rm -f -q bar.ko
zstd --rm -f -q baz.ko

will run in parallel with Make's -j<N> option.








--=20
Best Regards
Masahiro Yamada

