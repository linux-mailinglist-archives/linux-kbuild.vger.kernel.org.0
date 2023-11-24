Return-Path: <linux-kbuild+bounces-157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CC7F75DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 14:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FDB4282891
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6BF286BF;
	Fri, 24 Nov 2023 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4UtB8Cf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC52C848
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 13:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B982C433C8;
	Fri, 24 Nov 2023 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700834362;
	bh=w+pZjx530yebhvAwFKbHD87u+OTv1iKAXiCI8JTUN6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c4UtB8Cfr92y1Z5CgSQvDKUxGYzxN8AQjtpL9RvQUhlqjpKCdf5XlZS9xvjT3GtNj
	 8mQuKh9DXuTGRDTg3+qc3jT9B5JSZz53kfaaZbeP0QwuQQxH6pd44Q/j9vaduhkjKP
	 a1tgnZpsouMW/jwktzjAM3KQyOHQsHVbMREo20M7TDnD33DUPbf0GgHCuD6/sq15zM
	 TPOnY7XbMUx5WMZxT+zJ4svlALObwLrcEArwZIMLu/65peU/HGuTql6E7lWEZG+38d
	 Ukh+pWBUdYMgKY4GSWKp37u5EldXLcI9RUZj6u9JYlVgpWhNOQ7pRDMMFFHfMZeJOt
	 jRCpSaMwYIUig==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1efabc436e4so1161055fac.1;
        Fri, 24 Nov 2023 05:59:22 -0800 (PST)
X-Gm-Message-State: AOJu0YzltE3fYnWpGLUs04+Ann3hi8xZF+fcyhd0UsnE9W4iSGNCO+T5
	Aq7HPDBzJ4t2ZpvmeIXsCXXoa+m+S4CyCa7u0Ws=
X-Google-Smtp-Source: AGHT+IHRbaJc711sJX0h6gUNFEN7PPKFCVvFynZywCLe7jLEeHOxZCowdxXdBVjzoDtRsmeXNnaWfaytSrCcVWDjTJg=
X-Received: by 2002:a05:6871:b24:b0:1f5:2b0c:706b with SMTP id
 fq36-20020a0568710b2400b001f52b0c706bmr3513022oab.28.1700834361905; Fri, 24
 Nov 2023 05:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQE=ankopXh_6q=Rw+JA+MVus5jjyuS3YBoJVz4YPDB1A@mail.gmail.com>
 <20231105215622.17493-1-dmitrii.bundin.a@gmail.com>
In-Reply-To: <20231105215622.17493-1-dmitrii.bundin.a@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 24 Nov 2023 22:58:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARS8a-BjxXAQubU8dkJ3D2UCCusjFCHuk4YstkyfL8OpA@mail.gmail.com>
Message-ID: <CAK7LNARS8a-BjxXAQubU8dkJ3D2UCCusjFCHuk4YstkyfL8OpA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg: apply short -R and -j options
To: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 6:56=E2=80=AFAM Dmitrii Bundin
<dmitrii.bundin.a@gmail.com> wrote:
>
> The long version --rules-file and --jobs are available since 1.18.8
> while their short analogues -R and -j have been added since 1.14.7.
>
> The option --rules-file the way it works currently was introduced in the
> commit 5cd52673aabdf5eaa58181972119a41041fc85f2 of dpkg dated 23.07.18
> with the following changelog entry:
>
> * Fix dpkg-buildpackage option --rules-file parsing. It was trying to par=
se
>   it as --rules-target, which due to the ordering was a no-op.
>
> The current behavior of the long version --rules-file is guaranteed to
> be in use starting 1.19.1 and might cause build failures for some
> versions newer than 1.18.8 even in spite of being documented that way.
>
> Signed-off-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/Makefile.package | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 2bcab02da965..af96319be98e 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -148,7 +148,7 @@ deb-pkg srcdeb-pkg bindeb-pkg:
>         $(if $(findstring source, $(build-type)), \
>                 --unsigned-source --compression=3D$(KDEB_SOURCE_COMPRESS)=
) \
>         $(if $(findstring binary, $(build-type)), \
> -               --rules-file=3D'$(MAKE) -f debian/rules' --jobs=3D1 -r$(K=
BUILD_PKG_ROOTCMD) -a$$(cat debian/arch), \
> +               -R'$(MAKE) -f debian/rules' -j1 -r$(KBUILD_PKG_ROOTCMD) -=
a$$(cat debian/arch), \
>                 --no-check-builddeps) \
>         $(DPKG_FLAGS))
>
> --
> 2.17.1
>


--=20
Best Regards
Masahiro Yamada

