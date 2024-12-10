Return-Path: <linux-kbuild+bounces-5055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CE9EADB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8BB1885BAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB3278F24;
	Tue, 10 Dec 2024 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPT0kTJ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FD23DEBA;
	Tue, 10 Dec 2024 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825642; cv=none; b=GN/jOfulYPZl8dtfJnNpv5B9KMxnimIKDGOI1wdYkInpafNRtA5hlQCzUiL0+VaSariU7Y7zInf+TPXjFb4AZxcPFf7FSjVI84Yw0gfXM9Tc8sFV4Wl8qO5eRhEpEAPpofc8aSbLz76VR57BlzyCcRgDLJVsa4dE7ZnEDQPeadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825642; c=relaxed/simple;
	bh=uM78Fee6MDITdbkXhG/QTjdUmZK3+qbgXKmP8Y5eHt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9qxcplZ7ixQn/G6HCEG4v3nL4zrsDwputojfWQ0QXzV4CelHif+Z2UubW1YqPgWO9fR+T0DLtfSBc+SzclXcYF9qKqX7uxWxyJhvQbxhh4TvVA2m0RQqqoNgQDEnuZYt+rEuh+xjWPlw1113LSH/ss7PuwbL+QimjD8I7D7ZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPT0kTJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0523DC4CED6;
	Tue, 10 Dec 2024 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733825642;
	bh=uM78Fee6MDITdbkXhG/QTjdUmZK3+qbgXKmP8Y5eHt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oPT0kTJ/+wef7R4zQ3QnKqoFB1lAXhNBMVC+VJk7DWZtK5Q0Z0YGQZdPmJpZUetwZ
	 WbcMTrmZ1TBCGQFdmkogwuwe2kt6GhgLy3xBsbf+gynE8kvtTNmQC0kPPY5f9AYgvJ
	 zACgClJ8DTEZoXJhMSjtHiIRUyuEECe2lhPFPpH3MeL7k7v9EeXrdXnR18Dm7WT7V+
	 rAgjF8BVnnkLvJrSDab7L0Xqar2rBRdiKnGz55fLpdHojJaViTYVv1451Bg71cVGpX
	 AsX3u4wVAl1gm66OweMPz2SarRQW9kPjVdnjv67Sw+JVc9WYKHfw9ddwKSZhZvm8mj
	 iuRPLqojjCmnw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54024aa9febso1031276e87.1;
        Tue, 10 Dec 2024 02:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb5AkKGbT77Om2wdqwFzEWKysN1Iz/dsHx7vVccRauGQjgq9o23gQVgaM22eyoyxuyOLhlb95Tu20kBffK@vger.kernel.org, AJvYcCXyf1rTi8s5yzLLEZz2HIS4a3+cNOyCYX8DR0f5itzGyYWUCVXE9o8jtSy9UOMb15zloT3BixcaGYVCfhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovIufbFyJosYREOmd0HZ69ZQ3B7b63vRQkkBpz05Ip/7snTI7
	/Rw57rTjtRQV/1kfEq97wValRLhtsCpQtP+WYJd7/9rQnlrRnzES8kf1wvqP4QRntTsw5TUgQH3
	xciGwtmKJHQk2ZOJ4KMGRgMMkCcg=
X-Google-Smtp-Source: AGHT+IGGF3JC4ufgVyXLTrRakAfW2ICWmUO6jufw1sFgNBH6mV4KxN/2slWSks172u7MWlcHh1LHq3z6Oi1izqGMcHg=
X-Received: by 2002:a05:6512:3a91:b0:540:1fd6:4e4f with SMTP id
 2adb3069b0e04-5401fd64ecdmr2543931e87.22.1733825640677; Tue, 10 Dec 2024
 02:14:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
In-Reply-To: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2024 19:13:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8dy-=EcsZFb-tjXSk2sK7sHrV0WSSV4E8dzRh5Veceg@mail.gmail.com>
Message-ID: <CAK7LNAR8dy-=EcsZFb-tjXSk2sK7sHrV0WSSV4E8dzRh5Veceg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Drop architecture argument from headers_check.pl
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 5:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Since commit 7ff0fd4a9e20cf73 ("kbuild: drop support for

This is not a fixed commit hash because Andrew Morton
does not use 'git request-pull'

I will squash this to the original patch.


> include/asm-<arch> in headers_check.pl"), the second argument $arch is
> no longer used, hence drop it.
>
> Reported-by: Masahiro Yamada <masahiroy@kernel.org>
> Closes: https://lore.kernel.org/CAK7LNARNa3NPSeRAUgMaEqWiA+C6-s1PxRe1bCUJ=
g6zLyOtDkA@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit 7ff0fd4a9e20cf73 is part of the mm tree.
>
>  usr/include/Makefile         | 2 +-
>  usr/include/headers_check.pl | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 771e32872b2ab12d..6c6de1b1622b1a69 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -78,7 +78,7 @@ quiet_cmd_hdrtest =3D HDRTEST $<
>        cmd_hdrtest =3D \
>                 $(CC) $(c_flags) -fsyntax-only -x c /dev/null \
>                         $(if $(filter-out $(no-header-test), $*.h), -incl=
ude $< -include $<); \
> -               $(PERL) $(src)/headers_check.pl $(obj) $(SRCARCH) $<; \
> +               $(PERL) $(src)/headers_check.pl $(obj) $<; \
>                 touch $@
>
>  $(obj)/%.hdrtest: $(obj)/%.h FORCE
> diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> index 7070c891ea294b4d..2b70bfa5558e6451 100755
> --- a/usr/include/headers_check.pl
> +++ b/usr/include/headers_check.pl
> @@ -3,9 +3,8 @@
>  #
>  # headers_check.pl execute a number of trivial consistency checks
>  #
> -# Usage: headers_check.pl dir arch [files...]
> +# Usage: headers_check.pl dir [files...]
>  # dir:   dir to look for included files
> -# arch:  architecture
>  # files: list of files to check
>  #
>  # The script reads the supplied files line by line and:
> @@ -23,7 +22,7 @@ use warnings;
>  use strict;
>  use File::Basename;
>
> -my ($dir, $arch, @files) =3D @ARGV;
> +my ($dir, @files) =3D @ARGV;
>
>  my $ret =3D 0;
>  my $line;
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

