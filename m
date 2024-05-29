Return-Path: <linux-kbuild+bounces-1949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C88D337B
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 11:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 211931C21E39
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 09:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F72E16EC08;
	Wed, 29 May 2024 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRG18PHs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3B16EBF5;
	Wed, 29 May 2024 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975761; cv=none; b=PG9ia/8iSBWSmGJamR8cXtKgFD/1ghjonq700jH7kw4fEu8UpFqRF9O3tbdRrw89c7ffvGg8k4PL4N2CmFBEnfu5UEx4f1SZHIP33GAq+obcKXLM0ZjBcEuaM4Kax1QoPAaUYfgi3E6Jt08xIdApb1WuLp0blJL+V5JRjRiLtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975761; c=relaxed/simple;
	bh=Vy70+CTL7OOqjzsr317++Apk/PTfDzXzYE7uDGK3xB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neRzEV2fj/bOho+i0i52vWXVdRyoGs7yAjfXn9Jgg9pzdp6kY8i92FomtNIw3HlThNfxrpUJ0u3wfK4PBsFnPJYIg+mYmQUttbH2PjcdxHCuPavSRHrwNPfjl7nZYwssFFRPyXNL5IcVv4CSQVT9lf9CNHy5jacNWmFsvpdXNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRG18PHs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969C6C32789;
	Wed, 29 May 2024 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716975760;
	bh=Vy70+CTL7OOqjzsr317++Apk/PTfDzXzYE7uDGK3xB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YRG18PHsZ9KMS7WtWGU1+QUYmL5eLEWKSnlK7rtKl81e9sMaDGWWfVZSKshNKrCAl
	 yJtrFsqZ9LD9mHkxg5T9XbR8Gg3+BmQtoGOpZHCgRRgkOfQhrM47BLYqBy19DozhG1
	 wjjJ1VA7TjrPVOQb30aMUb19DqSwPxE4HBMfwN7SBB7xdnB8//NNor3ybpeKH6DGP3
	 7IPweRpWPswxx2YCAZWTv0gVM+wrkgtae152VVEKY4CbVkWZfmYGcV3AcNOcuWivfn
	 GLzcmRBY/6lh0Pmpu+fRcRy/qHsN3Oh5cHn39HCbM9xbUaQyho8NOnShyQYRrdzBRv
	 0WDSCqq5YBXhg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e96f298fbdso18030841fa.1;
        Wed, 29 May 2024 02:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBs0fykij7tTQhnso6juhrRrvCucjKk4Jkr/+Fl4xQ5uW7QQ670vOvvEZH+4YYefAPpkfQcwRjn0um9Y2XRBTl9AAgiVYqvoWPWBkbgtWAFgt71iTcoDZXYWvyXUkC7bVEjP3jH3coBwMg
X-Gm-Message-State: AOJu0YwMRwL3MyvFGaz8xnxsItkBmFv9pjWFsSj/D+lipQD9XtJLhYM5
	ovPnx400UzAjhxUjwnrvvji4inmK8dWM3ZQxpx9mqS6v2FwCr8LcvMIG4GwDroFvMJi6dyvs5nH
	RaaM1vP8hGtaaYJyLMHRFmUVxYzk=
X-Google-Smtp-Source: AGHT+IGN/KsYOrGLvG0TdO3KxfZ4/EPftpLwrew3QpQ5vfb+ZPGBjlABdo7mq0eRqdvZm1M14CekhNeMOKaMAyFe8TQ=
X-Received: by 2002:a05:651c:1986:b0:2df:d071:76ed with SMTP id
 38308e7fff4ca-2e95b0959a5mr116201551fa.10.1716975759303; Wed, 29 May 2024
 02:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528163150.410706-1-ojeda@kernel.org>
In-Reply-To: <20240528163150.410706-1-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 May 2024 18:42:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZ=_QEqUQDdnGvksjvxJMwYF0L8MdoGjHqMD4-iLQZJA@mail.gmail.com>
Message-ID: <CAK7LNASZ=_QEqUQDdnGvksjvxJMwYF0L8MdoGjHqMD4-iLQZJA@mail.gmail.com>
Subject: Re: [PATCH] kheaders: use `command -v` to test for existence of `cpio`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 1:32=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Commit 13e1df09284d ("kheaders: explicitly validate existence of cpio
> command") added an explicit check for `cpio` using `type`.
>
> However, `type` in `dash` (which is used in some popular distributions
> and base images as the shell script runner) prints the missing message
> to standard output, and thus no error is printed:
>
>     $ bash -c 'type missing >/dev/null'
>     bash: line 1: type: missing: not found
>     $ dash -c 'type missing >/dev/null'
>     $
>
> For instance, this issue may be seen by loongarch builders, given its
> defconfig enables CONFIG_IKHEADERS since commit 9cc1df421f00 ("LoongArch:
> Update Loongson-3 default config file").
>
> Therefore, use `command -v` instead to have consistent behavior, and
> take the chance to provide a more explicit error.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  kernel/gen_kheaders.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index 6d443ea22bb7..4ba5fd3d73ae 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -14,7 +14,12 @@ include/
>  arch/$SRCARCH/include/
>  "
>
> -type cpio > /dev/null
> +if ! command -v cpio >/dev/null; then
> +       echo >&2 "***"
> +       echo >&2 "*** 'cpio' could not be found."
> +       echo >&2 "***"
> +       exit 1
> +fi
>
>  # Support incremental builds by skipping archive generation
>  # if timestamps of files being archived are not changed.
>
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> --
> 2.45.1
>

Ah, right.
'command -v' is more portable.

Applied to linux-kbuild.
Thanks!




--=20
Best Regards
Masahiro Yamada

