Return-Path: <linux-kbuild+bounces-7314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C31AC9B48
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 16:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 687687A86A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 13:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2E723C8A3;
	Sat, 31 May 2025 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9y+vgDO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F623C50F;
	Sat, 31 May 2025 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748700002; cv=none; b=qDKcMlNX5BnzDavUpL3frdSa+yf9/Gy6uLTsO4NDsAWVppzl4GkTnjv8IgOfUtOBcCudXoXGu4IB+4lNlNla6a9FkCr72D9DHI+B0ikFVHzK8vjOoLETzz4IgsqgP8y9d8U/VEhzhTIZ2+M4eMvjvTBErbSlDUymZjixvL4GChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748700002; c=relaxed/simple;
	bh=w40llQNqhsUdvYKnHf7RQNenStlQPIZxcEYBgaiNGT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfDdQDVPbYPuC6nUu0ICA3xFX4bu1wf1CqG5LwBy5LubTNMw2k7FkWelr/Hq6MMh+Qn576rCDC9God6OweVQwA8eFZatMPZJnBIuJK6SKSQSQSErqoFKM7lEPYJEKiCKG5D1T6EOPa9u2uFG+aP/CNs5oYNrd4z4l4RbB43eQPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9y+vgDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCCC4AF09;
	Sat, 31 May 2025 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748700002;
	bh=w40llQNqhsUdvYKnHf7RQNenStlQPIZxcEYBgaiNGT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c9y+vgDO3M+HaixqZ9knl1SuKVQeqlvh9hJLLO6/b585GVWD+FQ3U1gUujDPCDsxJ
	 2q7N6bmPkBFmFcgiBie3AmA/wzy0mDmz4JsILePcffCGjoZjbh1FLP3ZP1GaJ9ajTw
	 cTeYxWpP3ObfWU+sSFF2jdQblkIhEESRPGrbrgxTsvnzpeMauF8IR2ann0B8vA612y
	 HvWzSmKpPiPUG+TUdl0WDVvHbE8aLe3OeV/J54Sb4E5R9+y/1cty6v5tM+O/8OydfF
	 4yiwzlPkBu9RZyDPzR3h1G6+PWTvX1mPsAHEcBFwmLlglmwgLgYDLxR2Sw4IBxP7NQ
	 LjkTzUpqJ2A/w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b0d638e86so4462955e87.1;
        Sat, 31 May 2025 07:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2Z5jEWc2E0YY6IynVNw5mRgmpPhRhRRAGB78fb+C5J+KOET8a9i+7HqcjNJaLgV6sqPnE2FJLyjgEvzhs@vger.kernel.org, AJvYcCXBCmEzbpK5GKF/798T42Xpkpb+7FPvMuvYMcXkKT+pQEjwt84vn6xze1juYTC6HjZp0hBacxiE9JGze98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSdECdtqind/8xw7+eXVNyFapT37rs8Fi+b59FQtgGwXu646V
	XSl3lPwMNqPX12nFVzxncXqhys6GB1RxttJLGiaH75VaTSIUochrFjE7cHVTZ9xVuyEhpTFQHz6
	lX+pTZ7et9s8YHPJFTYUmj/jdlDQui5c=
X-Google-Smtp-Source: AGHT+IEizyomkzm+23rhwY3vKDd+/vm3NmPAc9IXAQOQp1ZWvNb6EzU9xDKlHySNB2sc4OMypej4gnIGzM74DTKuE7Y=
X-Received: by 2002:a05:6512:31c7:b0:553:3665:366d with SMTP id
 2adb3069b0e04-5533d15e1a0mr1717573e87.21.1748700000764; Sat, 31 May 2025
 07:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527142318.14175-1-petr.pavlu@suse.com>
In-Reply-To: <20250527142318.14175-1-petr.pavlu@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 31 May 2025 22:59:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_-2rpXDk_ago9_6au8rWZMBvkzZtS4Oq75n+8CF9_iA@mail.gmail.com>
X-Gm-Features: AX0GCFtev1wM929Q59RImdEEe0W-fcfzTqH403kvyFaFiGjZwB3L7UUerqa1nKs
Message-ID: <CAK7LNAR_-2rpXDk_ago9_6au8rWZMBvkzZtS4Oq75n+8CF9_iA@mail.gmail.com>
Subject: Re: [PATCH] genksyms: Fix enum consts from a reference affecting new values
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:23=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:

> @@ -225,6 +221,23 @@ static struct symbol *__add_symbol(const char *name,=
 enum symbol_type type,
>                         return NULL;
>         }
>
> +       return defn;
> +}
> +
> +static struct symbol *__add_symbol(const char *name, enum symbol_type ty=
pe,
> +                           struct string_list *defn, int is_extern,
> +                           int is_reference)
> +{
> +       unsigned long h;
> +       struct symbol *sym;
> +       enum symbol_status status =3D STATUS_UNCHANGED;
> +
> +       if ((type =3D=3D SYM_ENUM_CONST || type =3D=3D SYM_ENUM) && !is_r=
eference) {
> +               defn =3D process_enum(name, type, defn);


process_enum() is only called when type is SYM_ENUM_CONST
or SYM_ENUM.


process_enum()
{
        if (type =3D=3D SYM_ENUM_CONST) {
                ...
        } else if (type =3D=3D SYM_ENUM) {
                ...
        }
}


can be sampled into:



process_enum()
{
        if (type =3D=3D SYM_ENUM_CONST) {
                ...
        } else {
                ...
        }
}


The other parts look good to me.




> +               if (defn =3D=3D NULL)
> +                       return NULL;
> +       }
> +
>         h =3D crc32(name);
>         hash_for_each_possible(symbol_hashtable, sym, hnode, h) {
>                 if (map_to_ns(sym->type) !=3D map_to_ns(type) ||
>
> base-commit: 914873bc7df913db988284876c16257e6ab772c6
> --
> 2.43.0
>


--
Best Regards
Masahiro Yamada

