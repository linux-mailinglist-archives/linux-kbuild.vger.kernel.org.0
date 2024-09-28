Return-Path: <linux-kbuild+bounces-3821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F035988E0C
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 08:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA361C20E4E
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 06:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BC618BB97;
	Sat, 28 Sep 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C54qUm3m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21A800;
	Sat, 28 Sep 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727506242; cv=none; b=L2v7yV7dXxdYx03wHsMMbnWMpCphG9LuzaLUok+DdbC/z2eABzXnj4Lp1vk/r9J3/yrY4tvOd2bw6XYz3iS4WctnseiPgwhxHhUGkd4/Md/n+DJyEEwVAZDXJaogG2vaKDNuTY3w5iptHX1j+vhP649U5t3JbJQJd+iHzdWhoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727506242; c=relaxed/simple;
	bh=QH+t3MerDvmzRG9sFgWzJ77drNpMYqtI1XrfxZrhfdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzwuGnBji14C5ma0MrBH2ap2TA8BOlSknxbhokJuWJaGelidfljYa+mzpsv6VCR+PVU4cooufiR93KKh8T5mlBg9J+agELEr3OqxEzYu8Hu0zmykbKn74ICrD2xxfLygQN3WjIwbqBBLrN9/QFcSpdi9SXg2D+ujz7r+q6b2p/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C54qUm3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1965DC4CECE;
	Sat, 28 Sep 2024 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727506242;
	bh=QH+t3MerDvmzRG9sFgWzJ77drNpMYqtI1XrfxZrhfdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C54qUm3m/aDnZl834J/2oJNu57OB3jvn/HwaMmwJ0YYYAj9mVaKGHWqxoCL2CrlWM
	 XlBd8TiSCDZ8/Bylh5wOlQgCY36eKUtISwEJJPjRTazWfXPT1K8sqNZzE9i3pZ+qV9
	 OZytqDFQ1monWfG8rNFQ3psIHxI8mMpDmwWLhSZ4YV+k/TUMw1v0puZnaIiHZQ4Ksu
	 aBN+rD0fxp7kCVdVDF18KASkfc+wibKCw53Liwyq3O/fb7hR48fiE7s6QLjm7iZQfC
	 md30uiJvghTecU/ev0dIB/TVODnx66RYhX+SEFN6EedUjXHrObS9J6U18jKdD4rIBc
	 IAhkxTp8zEQGQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso142081fa.0;
        Fri, 27 Sep 2024 23:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0o0C+tb2W17f5Ky8AafGd8SjkHZQ+rqGVHqKubokTWl7clsbj+RwDMtZ7ND12JnpjMPlxin8xqh+N3Y79qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8NbrAlBT/UwSX7T5t2lJfyO6KAPzHrEHGSrwTn6khryfBL7z
	Hqr08QA7XN120gid6UA9zhBknJVgO0bWBYSjd3++aF7BzPGG0PkEV9B4+dk3d1+g6KQWNUD1MFy
	ExuMJIglgrCdSFnSLDeL0Q0qzMMY=
X-Google-Smtp-Source: AGHT+IEqwnWCLVXEtWkbCpAIZlYYF51Xp5KoGIX4UzbwFFf7LVvcN3x7ZoySdwlJuaa4FJhpiilvPkNk491jcPrfpXU=
X-Received: by 2002:a2e:b88b:0:b0:2f7:7f76:994b with SMTP id
 38308e7fff4ca-2f9d3e6bee1mr33536181fa.24.1727506240671; Fri, 27 Sep 2024
 23:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org>
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 28 Sep 2024 15:50:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDcpk3k+SKZ61dPW_D=pqfekEcnu2c+00MynpomE2RNw@mail.gmail.com>
Message-ID: <CAK7LNASDcpk3k+SKZ61dPW_D=pqfekEcnu2c+00MynpomE2RNw@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: support building external modules in a
 separate build directory
To: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 11:17=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
>
> There has been a long-standing request to support building external
> modules in a separate build directory.
>
> The first half is cleanups of documents and Makefiles.
>
> The last part adds KBUILD_EXTMOD_OUTPUT (MO=3D).
> This is too big changes, and too late for the current MW.
> (I did not test kselftest at all.)
> I hope people test this and may uncover some issues.
>
>
>
> Masahiro Yamada (23):
>   kbuild: doc: update the description about Kbuild/Makefile split
>   kbuild: doc: remove description about grepping CONFIG options
>   kbuild: doc: remove outdated description of the limitation on -I usage
>   kbuild: doc: remove the description about shipped files
>   kbuild: doc: describe the -C option precisely for external module
>     builds
>   kbuild: doc: replace "gcc" in external module description
>   kbuild: remove unnecessary prune of rust/alloc for rustfmt
>   kbuild: simplify find command for rustfmt
>   speakup: use SPKDIR=3D$(src) to specify the source directory
>   kbuild: refactor the check for missing config files
>   kbuild: check the presence of include/generated/rustc_cfg
>   scripts/nsdeps: use VPATH as src_prefix
>   kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
>   kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
>   kbuild: rename abs_objtree to abs_output
>   kbuild: use 'output' variable to create the output directory
>   kbuild: build external modules in their directory
>   kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
>   kbuild: support building external modules in a separate build
>     directory
>   kbuild: support -fmacro-prefix-map for external modules
>   kbuild: use absolute path in the generated wrapper Makefile
>   kbuild: make wrapper Makefile more convenient for external modules
>   kbuild: allow to start building external module in any directory



I CC'ed rust ML because Ack for the following patches are appreciated.


[07/23] kbuild: remove unnecessary prune of rust/alloc for rustfmt
[08/23] kbuild: simplify find command for rustfmt
[11/23] kbuild: check the presence of include/generated/rustc_cfg







--=20
Best Regards
Masahiro Yamada

