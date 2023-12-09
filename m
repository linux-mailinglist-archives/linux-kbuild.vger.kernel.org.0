Return-Path: <linux-kbuild+bounces-306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5280B5FD
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Dec 2023 20:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426651C20835
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Dec 2023 19:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AAC19BCA;
	Sat,  9 Dec 2023 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCI488Fq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31441804D
	for <linux-kbuild@vger.kernel.org>; Sat,  9 Dec 2023 19:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A931C433C9;
	Sat,  9 Dec 2023 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702149272;
	bh=o0ozzHhu+CZMfnQcW6TqO/dFGDY8qG0C8est7GCCFDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JCI488Fq0ln6JmyHv7+rNmX4aj6PqwAma4ZC1HkdfCeJ411b7f1TwryI3E3y4o4O6
	 cpTnrIuym6c8bpeGB40Apf9m4SLrw4rXnsuePFCmBuwnTJcQLQcUodmnx8sKNcpuHx
	 W8vWKn3o/AdxLb2JH83nmuOFBbqAPfO1vjltnhRf0LNViL8qPYPMGxLqZatOmLWp0N
	 mhyC4FNJspIwlt5JQnmi8o3+TLK/M6UtfqCkRou3u4V2arqQz1oL5cFW+vdY+Jg8+F
	 Ncx8XsEebz62F2KbQBp5WiIu7/f6N91+8p7a+zmOcNd3VKBZR1MZdb4e9gA05BNUoK
	 4O+uQfN6rqxyg==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fa37df6da8so2149601fac.2;
        Sat, 09 Dec 2023 11:14:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yxn93rsluT7nZW91Z1Qc6vbagg0tCiN/LwoD0U+OPoom2GjQN4o
	zvK+kXY7vmk+gbekHMl8O7crgEQzSo81vz53wM0=
X-Google-Smtp-Source: AGHT+IGMn+tD3vZ91vtSx2t/y3jD8Hg8fcLiZNFbNmHI5L2jf7XjGF30LghUtlCJbqm0SruLd6vCUhNfILxHLS9hBAk=
X-Received: by 2002:a05:6870:638b:b0:1fa:f625:e23d with SMTP id
 t11-20020a056870638b00b001faf625e23dmr2688256oap.28.1702149271595; Sat, 09
 Dec 2023 11:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208181802.88528-3-leobras@redhat.com>
In-Reply-To: <20231208181802.88528-3-leobras@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Dec 2023 04:13:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
Message-ID: <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
To: Leonardo Bras <leobras@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 3:19=E2=80=AFAM Leonardo Bras <leobras@redhat.com> w=
rote:
>
> When reviewing patches, it looks much nicer to have some changes shown
> before others, which allow better understanding of the patch before the
> the .c files reviewing.
>
> Introduce a default git.orderFile, in order to help developers getting th=
e
> best ordering easier.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> ---
> Changes since RFCv4:
> - Added scripts/* into "build system" section
> - Added "git-specific" section with this script and .gitignore
> - Thanks for this feedback Nicolas!
>
> Changes since RFCv3:
> - Added "*types.h" matching so type headers appear before regular headers
> - Removed line ends ($) in patterns: they previously provided a
>   false-positive
> - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
>   in any subdirectory
>
> Changes since RFCv2:
> - Fixed licence comment to from /**/ to #
> - Fixed filename in how-to comment
> - Fix build order: Kconfig -> Kbuild -> Makefile
> - Add *.mk extension
> - Add line-ends ($) to make sure and get the correct extensions
> - Thanks Masahiro Yamada for above suggestions!
> - 1 Ack, thanks Randy!
>
> Changes since RFCv1:
> - Added Kconfig* (thanks Randy Dunlap!)
> - Changed Kbuild to Kbuild* (improve matching)
>
>
>  scripts/git.orderFile | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 scripts/git.orderFile
>
> diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> new file mode 100644
> index 0000000000000..31649ff53d22c
> --- /dev/null
> +++ b/scripts/git.orderFile
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# order file for git, to produce patches which are easier to review
> +# by diffing the important stuff like header changes first.
> +#
> +# one-off usage:
> +#   git diff -O scripts/git.orderFile ...
> +#
> +# add to git config:
> +#   git config diff.orderFile scripts/git.orderFile
> +#
> +
> +MAINTAINERS
> +
> +# Documentation
> +Documentation/*
> +*.rst
> +
> +# git-specific
> +.gitignore
> +scripts/git.orderFile



I think scripts/git.orderFile should be part of
"scripts/*" below.






> +
> +# build system
> +*Kconfig*
> +*Kbuild*
> +*Makefile*

I do not like this because "foo-Makefile-bar"
is not a Makefile, but would match "*Makefile*".


If you do not use wildcard at all, 'Makefile'
will match to the root-dir and sub-directories.


Kconfig
*/Kconfig*
Kbuild
Makefile
*.mak
*.mk
scripts/*


may satisfy your needs mostly.




















> +*.mak
> +*.mk
> +scripts/*
> +
> +# semantic patches
> +*.cocci
> +
> +# headers
> +*types.h
> +*.h
> +
> +# code
> +*.c
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

