Return-Path: <linux-kbuild+bounces-6407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82487A7BD09
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46221887C7E
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 12:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896101E1DEE;
	Fri,  4 Apr 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afy9mEVT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E52E62B6;
	Fri,  4 Apr 2025 12:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771378; cv=none; b=Sc+4+YA5HU10K1zF6Zy5Uyzr79OPBwxgWduTOUfd9rvh08rZWirUwmOLuwHXzBfvtPXaz9KO0xI7zAP8PcCF7BjZjnC7aMd1+n5ArPhsxOWjWhSVLnLQdEQremlEgBSM0PnsBG1UUNi2sviun8lGLA94RO30IWgBxaVtFcLcCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771378; c=relaxed/simple;
	bh=yWmWSKvCkVDqwMJt8fOWjKGejnFB5xdZvxUlov2u7Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXq8M1w+68MEvdriV5JWD9x8Zg/nUDSCE911Eu3q7FDQcNzwkfh3yr86/Cy1ei1HM3F8NXhs7RcsFKrKYpbpt8EIjstT2BCcAFAYdvSlIgQiL50OXwD3LCAuseLJzYGSYvOOxRIt8Y+jgJ/DuxWr7nd9kC7V5Gh/GQq9dDl7z10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afy9mEVT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7836C4CEEA;
	Fri,  4 Apr 2025 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743771376;
	bh=yWmWSKvCkVDqwMJt8fOWjKGejnFB5xdZvxUlov2u7Fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=afy9mEVThT7rykLmDBs+vrKD10DZo4FddfFQaRnn9zsQDRb26JrctU99IW0zBTwVH
	 ak3ERQuLgwjc3d7PusuSMpUwIz/hsDoXHhaGDy7qhaLJl5tp8lCSarKkPQOxn6youw
	 ttOp5MgOMy4iV/w8Q2UcXPv8SKXf8aBEBNWiP6aNqSafqX5MOVh1TfHd/b24Pdpfpa
	 epBYjp0ZaIwmuIy7wacYIesr6oqTJMr3qvg1wypevlBfF8fwtwiDzD3DT6GosaJsnS
	 0V7nmmJ6EMwCUOMJcRwK2WwaiYHNIucE8iR+tS3KOI/0mKUH5m5HIVepU3yh4CsvgM
	 pQHRNEtUJjE8g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2136521e87.0;
        Fri, 04 Apr 2025 05:56:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4ZR8Z1DWtNWfTG5q0Wr9pJH9BIPjZnxAh25bapkNjo8VT74Kp+v3GabgGdPky8YT7Sxx6ZlSjSAgFTr0=@vger.kernel.org, AJvYcCVKqXJrKsYmngDXYvNPO5F4EDETS4guSLiaJKGKJdXNigFmz3TwOgd7oXhjYL5liiGmBz/7g22Cd30CGM6d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/M2SCAhi2x2GAB1Q+YLTbMYvj3/E1TgEiC83Z8r426iWcKu+
	SOxeBfEIlUtw302/66QcceA9rHZCqhqzvvCLb32nFWc6NHulggnNMsLxdGzq6z7tZI6h5Ru+NGW
	IkXXLvj2NK8021nWg7SMnURn6wE0=
X-Google-Smtp-Source: AGHT+IGWZ2KQ6RGegADZhXoZyqRnIm6k4Z0hbxrDaxJ1XGncP2EGYs9EI4Rpzb7UKgS4uKNskWSnUgmaP8fh6T/OYj8=
X-Received: by 2002:a05:6512:224f:b0:549:7c13:e88f with SMTP id
 2adb3069b0e04-54c232fb89cmr681005e87.30.1743771375372; Fri, 04 Apr 2025
 05:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com>
In-Reply-To: <20250404102535.705090-1-ubizjak@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 21:55:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
X-Gm-Features: ATxdqUFVHv9_meyIYTai6ja747eC0V8wBRIBoDeHve1E31B7rvOALDCMCdaluaM
Message-ID: <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:25=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> Current version of genksyms doesn't know anything about __typeof_unqual__=
()
> operator.  Avoid the usage of __typeof_unqual__() with genksyms to preven=
t
> errors when symbols are versioned.
>
> There were no problems with gendwarfksyms.
>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035=
@molgen.mpg.de/
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---


Why don't you add it to the genksyms keyword table?


diff --git a/scripts/genksyms/keywords.c b/scripts/genksyms/keywords.c
index b85e0979a00c..901baf632ed2 100644
--- a/scripts/genksyms/keywords.c
+++ b/scripts/genksyms/keywords.c
@@ -17,6 +17,7 @@ static struct resword {
        { "__signed__", SIGNED_KEYW },
        { "__typeof", TYPEOF_KEYW },
        { "__typeof__", TYPEOF_KEYW },
+       { "__typeof_unqual__", TYPEOF_KEYW },
        { "__volatile", VOLATILE_KEYW },
        { "__volatile__", VOLATILE_KEYW },
        { "__builtin_va_list", VA_LIST_KEYW },






>  include/linux/compiler.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 27725f1ab5ab..98057f93938c 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -229,10 +229,10 @@ void ftrace_likely_update(struct ftrace_likely_data=
 *f, int val,
>  /*
>   * Use __typeof_unqual__() when available.
>   *
> - * XXX: Remove test for __CHECKER__ once
> - * sparse learns about __typeof_unqual__().
> + * XXX: Remove test for __GENKSYMS__ once "genksyms" handles
> + * __typeof_unqual__(), and test for __CHECKER__ once "sparse" handles i=
t.
>   */
> -#if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
> +#if CC_HAS_TYPEOF_UNQUAL && !defined(__GENKSYMS__) && !defined(__CHECKER=
__)
>  # define USE_TYPEOF_UNQUAL 1
>  #endif
>
> --
> 2.49.0
>
>


--=20
Best Regards
Masahiro Yamada

