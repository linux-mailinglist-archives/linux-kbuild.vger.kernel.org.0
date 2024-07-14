Return-Path: <linux-kbuild+bounces-2511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D26C930B2D
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 20:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9DB21F21254
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 18:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA86D13CF86;
	Sun, 14 Jul 2024 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7xkjT45"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6734131736
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Jul 2024 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720980596; cv=none; b=JbAYS4ZZeXdGQsShMrajsiLvx9LE9qqHDsRPdiVlnqnZBKX5AHyi+HgJisACBfdW+URz4CmVWehI3/TJdKEDd8EZMs6ZTpii6TVkHqJsrkmrB58VQzwV4ibTDjKUwTZVMMqgGhTmnti8eWlUqG6EGFp0wXhcaVa/28wmc5Jyjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720980596; c=relaxed/simple;
	bh=Dl5jmsuCn3rUPbU1p56YwE5+B5i/ZUzLYhvRRqPoSSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EL7JF9EfrnILuKFfWAEZzayhwe4FGsunWpn/6REsqKgnokp4FLzJcd+PGEGP+m9aCrubtBlrNbBKKuX+xRAXQlHHrgZbYYp+7R/eP3nF5fEAUNJ6le8AXTVy2swvD5d6mNrrd4PaqIQToeEPKArVGOakDvhYwKzULolMtA3/mag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7xkjT45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DDAC4AF0A
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Jul 2024 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720980596;
	bh=Dl5jmsuCn3rUPbU1p56YwE5+B5i/ZUzLYhvRRqPoSSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y7xkjT45wa5JM5Q1pBPemg7tNyhms3PYmQmofKI8NRB+9pvrv5Zpy8VmzSj2SiF+M
	 DxmcLeIB6z7Cr8wH+DQDipZwgYw/LoxEMu9gBH27sWcESrLsOs1G4TCah9cIGrTAUc
	 svUukny6l1pQazjjUFwyJn3hXdKz5VCONzc1+feHpPsnb2UbTp2KB8MoDyLQh3d/KW
	 PgMi8blPlqhR1FQv7ypMS86zDxNl6nuWXls5MdJVWx6VYkiJD04knZFX6cnRsOSqfw
	 dRECU9fh8l/uBpzLSBdHmWCfJAej1+J/92l25G7vNVaDKc4hlLSkQPU9XoPgrpxjOH
	 3pvHDBjMWLCfw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso46935191fa.1
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Jul 2024 11:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK62ZxIk1Sbdr3uCydq2+WM6VUMfI0BZP30ZIlOC3iGZ6bzA3uRG6nieURtJ1j2q35D5Be0o1V7rLp0Bl46vTVBRDfZ1blsZORM7NM
X-Gm-Message-State: AOJu0YwE+zBB79G0TsoUNinGUcLDV32pBLSjzlgHpLpWMnAcun3omStv
	EmawPZGEDUHQpPgLkCDhh30JaxQfGYsX+9fOChaHOHrblA6N/dVyf/wovENhRUHsT6BoloapaMY
	RQBVDun/innxjkc1If11CbFmiGXY=
X-Google-Smtp-Source: AGHT+IGeZcuJVP7EOm/o8e0bQMno/dlmDA75/UxNbxs4oEk8XH/LCKLSxfQC707gOisym50e3n5ioj3JvDZCo9S0tps=
X-Received: by 2002:a05:6512:3d8a:b0:52c:8aa6:4e9d with SMTP id
 2adb3069b0e04-52eb99a2b76mr12559665e87.29.1720980595209; Sun, 14 Jul 2024
 11:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
In-Reply-To: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 03:09:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmV0BxgpOc29=-b0uPNtn2CPRW+ODvOKim=YmiO63b-g@mail.gmail.com>
Message-ID: <CAK7LNARmV0BxgpOc29=-b0uPNtn2CPRW+ODvOKim=YmiO63b-g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Make ld-version.sh more robust against version
 string changes
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Fangrui Song <maskray@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 2:07=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> After [1] in upstream LLVM, ld.lld's version output became slightly
> different when the cmake configuration option LLVM_APPEND_VC_REV is
> disabled.
>
> Before:
>
>   Debian LLD 19.0.0 (compatible with GNU linkers)
>
> After:
>
>   Debian LLD 19.0.0, compatible with GNU linkers
>
> This results in ld-version.sh failing with
>
>   scripts/ld-version.sh: 18: arithmetic expression: expecting EOF: "10000=
 * 19 + 100 * 0 + 0,"
>
> because the trailing comma is included in the patch level part of the
> expression. While [1] has been partially reverted in [2] to avoid this
> breakage (as it impacts the configuration stage and it is present in all
> LTS branches), it would be good to make ld-version.sh more robust
> against such miniscule changes like this one.
>
> Use POSIX shell parameter expansion [3] to remove the largest suffix
> after just numbers and periods, replacing of the current removal of
> everything after a hyphen. ld-version.sh continues to work for a number
> of distributions (Arch Linux, Debian, and Fedora) and the kernel.org
> toolchains and no longer errors on a version of ld.lld with [1].
>
> Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig=
")
> Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2=
ebef622c9716f8dbb [1]
> Link: https://github.com/llvm/llvm-project/commit/649cdfc4b6781a350dfc87d=
9b2a4b5a4c3395909 [2]
> Link: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap0=
2.html [3]
> Suggested-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to linux-kbuild.
THanks!

