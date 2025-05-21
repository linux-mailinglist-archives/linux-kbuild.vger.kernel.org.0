Return-Path: <linux-kbuild+bounces-7204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7EFABF3C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 14:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C498E5E03
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 12:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA9E263C6A;
	Wed, 21 May 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKUN5jzZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E979CF;
	Wed, 21 May 2025 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829376; cv=none; b=PsnV9ffIxpG05oYGOYwCDy5d6+ZhX2w+ziw0L3tBS1YoRj605GSeTvfajuHtJbwTyVLVu8SEZVgTF5EQmq6NMNIB40wUatPi3CiHyfth5ismfKSNTdRPtJtg7WR2LtqH+wdE7XABKXb1usr8j0TmWTEAkyVLve3Hg19Xd7WsVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829376; c=relaxed/simple;
	bh=QbBFInRhrTN4KDhywq/vnOvp9a2LY9RftYFum+CHSXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw39G8edN4xcyulSUpQTs8BiASWo+HidWAf1v5536j02Y+CKpuYXtEj7+mKvttd4plTk6vf8rrrbnpfyLnLTLyegystQUxwpnDdmId5Qm7jKtuEO/rhsbvEOU17rUZRRKcxBzeeyGsLe9CMVZ7i3jOr192wc59o8Qr9ftFgu9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKUN5jzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81B7C4CEED;
	Wed, 21 May 2025 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747829374;
	bh=QbBFInRhrTN4KDhywq/vnOvp9a2LY9RftYFum+CHSXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iKUN5jzZGfOcKcKOcno8V02aRoH7HXn1QFnaVJFs3HguUCiSIACY7NR8jt7kyveSC
	 iwS+f2tNANhyKN4RUWDqvgM89rbbUr0HyxhMf6Zq6yWF8RBty05Qlkqn27FEgTC1l4
	 DrSStlQWHXBsu3jAHTwfECOMxEGxlZ/dpDmxKV7goCl/s7zmdGJSqVM8Tb9oW+fJd/
	 vP7nwfVQMt/EIpGf2HagnLfXQlPRj9NhzCxZgoMhFxeLhaey35atEFz5CtxMafoMfq
	 kKju2brWElM06F9gEOzJzeySwRGiBusub1U+yqS1CwLMT8b0+/AJrpmksUGgY+oVsq
	 b6j3ymnL7JUWw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551f14dc30dso3417123e87.1;
        Wed, 21 May 2025 05:09:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGSJSl/ouN8leWQP00iKPMVSRT8rGZx+a2XIJPTCNh7odsA+FzMABScAgkbWjQxGgJC0db+wKSaNAD2ftKtA==@vger.kernel.org, AJvYcCX+SMutUj0Qx4A/s/SXZSXiNjwQBpltWcCFHFMMCZYKjPF089trzsQyLe/liA7hJvVhaQGnVn5ymxUwy2o=@vger.kernel.org, AJvYcCXW3A/YZ6zQHsw1eyoom9qXj1GmGK+ho5Osmpqz+Eu0XzTl1LtXqlNrKONhZT6LsPl60eewE1oWtnBl7OPw@vger.kernel.org
X-Gm-Message-State: AOJu0YwfquQnZpmFa/ZOGVoTzgL0D2IcB7s11+3A/iyEsgeR6C/7QZ/z
	jPycJe3Pm9tQOGi8onZa7a52tX0vo/RUjkB7sKmxFYCVWsyNH+kgj9XXH1ouxqhJAxu6ZNRZdq+
	p76dsxJGNBHNGbs9hYnX1raB0VnGEjfc=
X-Google-Smtp-Source: AGHT+IE4K6APqfjUeSvRb94BF0tZHVC6iMoFKV3E8RE2KbgSVe5eWa5g7ZmD5QlzTBATnVWBmwAss+FAt4XJMLgvLBE=
X-Received: by 2002:a05:6512:6703:b0:550:ecb4:94e with SMTP id
 2adb3069b0e04-550ecb409b5mr4393437e87.9.1747829373491; Wed, 21 May 2025
 05:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.154517322@infradead.org>
In-Reply-To: <20250502141844.154517322@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 21 May 2025 21:08:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHQ2b3mA0rYM2vX0-6BwOEj4tU_MBQ9FNa_uZ9_q17zg@mail.gmail.com>
X-Gm-Features: AX0GCFv4CD8KhcOlwIlISwOo4tF1S6w4DNWVSb1VvqJGD_aVV0MK1weAJdbqQUE
Message-ID: <CAK7LNATHQ2b3mA0rYM2vX0-6BwOEj4tU_MBQ9FNa_uZ9_q17zg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] module: Extend the MODULE_ namespace parsing
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the patch subject is stale.

MODULE_ was the prefix in the previous v2 series.

Now, the prefix part is module:


On Fri, May 2, 2025 at 11:25=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Instead of only accepting "module:${name}", extend it with a comma
> separated list of module names and add tail glob support.
>
> That is, something like: "module:foo-*,bar" is now possible.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c  |   36 ++++++++++++++++++++++++++++++++++--
>  scripts/mod/modpost.c |   36 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 68 insertions(+), 4 deletions(-)
>
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1083,12 +1083,44 @@ static char *get_modinfo(const struct lo
>         return get_next_modinfo(info, tag, NULL);
>  }
>
> +/**
> + * verify_module_namespace() - does @modname have access to this symbol'=
s @namespace
> + * @namespace: export symbol namespace
> + * @modname: module name
> + *
> + * If @namespace is prefixed with "module:" to indicate it is a module n=
amespace
> + * then test if @modname matches any of the comma separated patterns.
> + *
> + * The patterns only support tail-glob.
> + */
>  static bool verify_module_namespace(const char *namespace, const char *m=
odname)
>  {
> +       size_t len, modlen =3D strlen(modname);
>         const char *prefix =3D "module:";
> +       const char *sep;
> +       bool glob;
>
> -       return strstarts(namespace, prefix) &&
> -              !strsmp(namespace + strlen(prefix), modname);
> +       if (!strstarts(namespace, prefix))
> +               return false;
> +
> +       for (namespace +=3D strlen(prefix); *namespace; namespace =3D sep=
) {
> +               sep =3D strchrnul(namespace, ',');
> +               len =3D sep - namespace;
> +
> +               glob =3D false;
> +               if (sep[-1] =3D=3D '*') {
> +                       len--;
> +                       glob =3D true;
> +               }
> +
> +               if (*sep)
> +                       sep++;
> +
> +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob ||=
 len =3D=3D modlen))
> +                       return true;
> +       }
> +
> +       return false;
>  }
>
>  static int verify_namespace_is_imported(const struct load_info *info,
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1682,12 +1682,44 @@ void buf_write(struct buffer *buf, const
>         buf->pos +=3D len;
>  }
>
> +/**
> + * verify_module_namespace() - does @modname have access to this symbol'=
s @namespace
> + * @namespace: export symbol namespace
> + * @modname: module name
> + *
> + * If @namespace is prefixed with "module:" to indicate it is a module n=
amespace
> + * then test if @modname matches any of the comma separated patterns.
> + *
> + * The patterns only support tail-glob.
> + */
>  static bool verify_module_namespace(const char *namespace, const char *m=
odname)
>  {
> +       size_t len, modlen =3D strlen(modname);
>         const char *prefix =3D "module:";
> +       const char *sep;
> +       bool glob;
>
> -       return strstarts(namespace, prefix) &&
> -              !strcmp(namespace + strlen(prefix), modname);
> +       if (!strstarts(namespace, prefix))
> +               return false;
> +
> +       for (namespace +=3D strlen(prefix); *namespace; namespace =3D sep=
) {
> +               sep =3D strchrnul(namespace, ',');
> +               len =3D sep - namespace;
> +
> +               glob =3D false;
> +               if (sep[-1] =3D=3D '*') {
> +                       len--;
> +                       glob =3D true;
> +               }
> +
> +               if (*sep)
> +                       sep++;
> +
> +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob ||=
 len =3D=3D modlen))
> +                       return true;
> +       }
> +
> +       return false;
>  }
>
>  static void check_exports(struct module *mod)
>
>


--=20
Best Regards
Masahiro Yamada

