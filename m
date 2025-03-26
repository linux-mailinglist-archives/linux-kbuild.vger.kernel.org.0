Return-Path: <linux-kbuild+bounces-6359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C5A72591
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Mar 2025 23:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAFED1897724
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Mar 2025 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11F9263F2F;
	Wed, 26 Mar 2025 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ogqu1Y9n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0170263F2B
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Mar 2025 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028864; cv=none; b=OTo2F2wJNbd9dVZXYhKpLAp2KnmkyWNe4yvc0RV/TFrFp25gKr60JckCRmdGiynUNj4VEb+Hz4k1HSqJuWWDdsYrsqwDszrk0sEEh1IhWJGq76uyyJB8aUJn7wyy45XP6vBcYiKQklbUc3tK30KOdfCo0B0W+Gm5meNU5UJ+f9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028864; c=relaxed/simple;
	bh=QTPpgTyCOHd4BJPeY2buBn0sbwn91/ympFJZZ9fXfVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HefBtsClM+wip99NRF2PfJZ8srnY1Fi9sJsgJuVUW67nhf8ghxdFL6gMM/ixD9hpn0MNue9FQZrtrEyuR/XKeTsILpiA3ylyodX9cTvrYrAF3KqN0SHuOJ2Yj2x+xhvj5yBmxmmJc1fxvsQVa+1oG2stxCdTlHeUxNq2WrYbn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ogqu1Y9n; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso4070a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Mar 2025 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743028861; x=1743633661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCAjqCKmDiWM+c5x9zuKEJ8IWxkQGJKcWbRaE9Ofars=;
        b=ogqu1Y9nsFZ9fmffSDe0WKbE43fOOtrNF11uJdwzrKqIzA1GGVE6NomnTbnbD7Np8w
         KGrwScRg/1rF2CAdpfpKz64tPliTyZKhaYUo7jOanZOjsdQtin60u8+7THWOaRayA7NU
         saAfndo96Z+A4ostQJ1BCxuw1lS2p3gmagyzGBTL8klz0o1uQ1AW//+Fgub0uupKVpFo
         Owj1Dg+sW7UR1hDzHKZ0APahXVsb7ZsbP5w6DamK8rq/IYEWrRF3nWqOBrWjggoR+Nc9
         4GwIr4oRsFDeCQh7oJ9LSgOhAnr2y+s+km0UwDEq6zkgp4WtRFf+Psdh94sVipQVwQpt
         VsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743028861; x=1743633661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCAjqCKmDiWM+c5x9zuKEJ8IWxkQGJKcWbRaE9Ofars=;
        b=HO/MvhpFzWm9kO92IYuzjqWtCxdULpgPPuMi1LrxcC4qEW2HfbaBmHXhRvO+wzSyc7
         8a7nfr8bFMiD608lEEDZTZZMnSpL2yPJNY8fkO/HLuu5rLInAXfgD3ppgAKlLikDlnw/
         3yLJ0ykkBFvAOBYG6VoUtfkYFTr3uvvVCC26nq4T388KLgKcO5/5voOtAyKfA4pewFlu
         Uoi1jCJzYv0vEL7TS24pYPrWku3EqeyLDTYschps2f2paWT/FeOxeqY2aiZha2TaY3EP
         yo0miyP/zaEwfctkOOWlrebRp2hBcFNYDxlM/ZEfo0+gTkJBwFDN2RXSmSzL8dO/SgSS
         QYzg==
X-Forwarded-Encrypted: i=1; AJvYcCUWaoB2L1BysitI8Mj0NDtKijUNZJTfrBAMa536FV+nU9uyPoNPoSs2y7p9xGXWkBl7ueIOTSv1Oz9WVfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VYRO3uHH0RXXzEvy7/rPchebW+PC10KraZnJZafqFMRV2vvZ
	HqvizzE+UEq1wCFBM66KW1gcz3ArCzDBH6Agdwyt4dkcSkHRVQY+UGjNa06bFMKFpZeg7JYmv1e
	SEPNg6tNyvarBPGWJVT2B8SFk9YWuCc+JQil6
X-Gm-Gg: ASbGncueb/7FuPbAWSDsoAYwiod9lr4kf/9qOoLTdh55O5DJmOH4rgdFfMB/rNAVl+Q
	6qA9KDO+sbhJWj1HgB1XB6nZMWGgQXj7jDOw+v1fxLsSMzBeI4midfP58ooV5wyFKXlI+1E/43R
	hErWI6y0vdR44vV5kLImvnAKpWimNsI0bOfg==
X-Google-Smtp-Source: AGHT+IE21vOhXCZ+0e+Y62cuSV2yJue8B99CFKpOojbrdWLK6qi64Al8ktq+5pMyclA7qwzF8RL5mFM6DvPZizL4J8Q=
X-Received: by 2002:a50:99d9:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5edac33de81mr17286a12.7.1743028860754; Wed, 26 Mar 2025
 15:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
In-Reply-To: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 26 Mar 2025 15:40:24 -0700
X-Gm-Features: AQ5f1Jp0Jo48hdofqbBlQASQBtWdmyqysx7wSPwMT5oCtUtcj5ZzxpqGYEV4jb8
Message-ID: <CABCJKue38PPo8LXSuBN1xyJqSey6Wxe6_+jL=tx7c0R4btNV7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	petr.pavlu@suse.com, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 26, 2025 at 11:06=E2=80=AFAM WangYuli <wangyuli@uniontech.com> =
wrote:
>
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
>
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
>
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
>
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file=
 not found
>       6 | #iIn file included from nscripts/gendwarfksyms/symbols.cc:lude6=
 :
>   <dwarf.hscripts/gendwarfksyms/gendwarfksyms.h>:6

I think something went wrong when copying the error message?

>   :      10| :          ^~~~~~~~~
>   fatal error: 'dwarf.h' file not found
>     6 | #include <dwarf.h>
>       |          ^~~~~~~~~
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 0178000197fe..25edee97fff7 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -209,7 +209,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (=3D 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/

But the change looks correct to me. Thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

