Return-Path: <linux-kbuild+bounces-3182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2095D47B
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3C21F24105
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 17:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3E219046E;
	Fri, 23 Aug 2024 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbMA0N5D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15818CBE4;
	Fri, 23 Aug 2024 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724434677; cv=none; b=kr20gwt3ZtXLe/lqObq1BGb6Xalq2/DSC7jrySk8ZM5CZ6Sk7duB2QXlwRadzrftVdZRCobfQNv9qHqRqPxBY15ghIcb3CvarCbMkh+wsr5pVnl5Zd7puqll5ouadh2E9dE3RkA6S4Xa0euoZbC11jVtjK9JwBY/f9FooR92j+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724434677; c=relaxed/simple;
	bh=6oD8VPCVcONbDxn5sPhpPyTmY2Raf9rNjY/H3VQKCvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzPWD+Qvake3FGYrnhvnvMQQO04Z2s5CINxclsGYsMogNmnjNQy9IrRfQ2gQVpBdh6hlhawrlwY03XeFKcWqMo1zCFONApAkeZA6ranHzfwGPaamEOejQudnzHkJrA4e61HLqqWo2yfJ04u4beUAHOqB35prbgv8xRhO3Y2HOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbMA0N5D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC79DC4AF09;
	Fri, 23 Aug 2024 17:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724434676;
	bh=6oD8VPCVcONbDxn5sPhpPyTmY2Raf9rNjY/H3VQKCvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rbMA0N5DDdRy8IWLKihqCDCfE/c5AHPR513kcdUeFehwew+f18vxWNjqg9lC7qiR4
	 Et8OEJbtShNyODYVxvYWS7Zuq1w19hb/ajRaxFiZuUKbtTLrNCDtul5oWQdIE3xQ8e
	 c7smzdB0GGh8ewaCeTAp0ya/6ztd/v6ScKg0jyl1+Jl6A7NTII7UrgqR4oNd78gnac
	 x53ee/sL1l0B3TdlX8FzvJRIPBMGmzFCH/DbuLvya2aC+8hLI6bpko6i5OyB9BoqXQ
	 tcp1AA0/oKS4iSUYjGmp2j3d1xSCWQqtj5u9yRnDGLvanp6T3LK3NMVROH+oTdU8A6
	 Hl9UiewGo1qcA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so2947761e87.1;
        Fri, 23 Aug 2024 10:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMVnpiFydRVyPlZ56HDJ4rgO4VVCQ4ygpC7tAvdwAYUhHs7004ohf28gRzJKe4284FWTP3qf/l9Yjs2bjmYnsX7+KD@vger.kernel.org, AJvYcCVe4CmcX9TnheZmypV0Lv9arL9xwqQY+iI1CNDAvuoYUHKFA6YPVgbykI3AYYF6IrKfkOfhNmCQ/bWWxn5dJw==@vger.kernel.org, AJvYcCVrKac8n92jFkhV+s+a9h2HGxJz7PRZJZa3621L3hxSIP39eabYC/1ghLcG2rQ5eFKF6KFIb612cAHP2tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzZlowyQIRev2YUjdzCRV6y5qzjFC7I7vX6m/dgLO6FannaE4
	cK6FyI9h4Xn80UW2aWI+q8Q6xCdEd8SVNorsFEh1kK7A8603xZFGLYk5kxNyqEljdZiivPT0wVz
	hYDiXTIhDB0LumFJCsSqgzZJdl4Y=
X-Google-Smtp-Source: AGHT+IHb678oo4FzQStwGuSq6xYtd7MNQHGi4fBI7dSe3/2MAw1YrY8lt09yV3eo9YZfJfTYS4wQcIAfnNCz/iqJ7EU=
X-Received: by 2002:a05:6512:ad2:b0:52c:e3bd:c70b with SMTP id
 2adb3069b0e04-5343882e2ecmr1569179e87.1.1724434675552; Fri, 23 Aug 2024
 10:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com> <20240822181942.2626536-2-kris.van.hees@oracle.com>
In-Reply-To: <20240822181942.2626536-2-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Aug 2024 02:37:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrCQb23mnc4nHQ3OEWRf+6gB_32+3x84BtYmV6xTRHyQ@mail.gmail.com>
Message-ID: <CAK7LNATrCQb23mnc4nHQ3OEWRf+6gB_32+3x84BtYmV6xTRHyQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 3:21=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> In order to create the file at build time, modules.builtin.ranges, that
> contains the range of addresses for all built-in modules, there needs to
> be a way to identify what code is compiled into modules.
>
> To identify what code is compiled into modules during a kernel build,
> one can look for the presence of the -DKBUILD_MODFILE and -DKBUILD_MODNAM=
E
> options in the compile command lines.  A simple grep in .*.cmd files for
> those options is sufficient for this.
>
> Unfortunately, these options are only passed when compiling C source file=
s.
> Various modules also include objects built from assembler source, and the=
se
> options are not passed in that case.
>
> Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), an=
d


modkern_cflahs  ->  modkern_cflags


> adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
> to identify which objects are compiled into modules for both C and
> assembler soure files.

soure  -> source



Strictly speaking, only KBUILD_MODFILE was used in 2/4 or 3/4.

KBUILD_MODNAME was unneeded, but If you want to add KBUILD_MODNAME
for consistency, it is fine too.


RUST_MODFILE exists, but RUST_MODNAME does not.



>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index fe3668dc4954..170f462537a8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -238,7 +238,7 @@ modkern_rustflags =3D                                =
              \
>
>  modkern_aflags =3D $(if $(part-of-module),                              =
 \
>                         $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
> -                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> +                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfil=
e_flags))
>
>  c_flags        =3D -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)=
     \
>                  -include $(srctree)/include/linux/compiler_types.h      =
 \
> @@ -248,7 +248,7 @@ c_flags        =3D -Wp,-MMD,$(depfile) $(NOSTDINC_FLA=
GS) $(LINUXINCLUDE)     \
>  rust_flags     =3D $(_rust_flags) $(modkern_rustflags) @$(objtree)/inclu=
de/generated/rustc_cfg
>
>  a_flags        =3D -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)=
     \
> -                $(_a_flags) $(modkern_aflags)
> +                $(_a_flags) $(modkern_aflags) $(modname_flags)
>
>  cpp_flags      =3D -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)=
     \
>                  $(_cpp_flags)
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada

