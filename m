Return-Path: <linux-kbuild+bounces-6428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E20A7BEB5
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4855E189A2A8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7271F12E8;
	Fri,  4 Apr 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pL/f2y9N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0341EDA34;
	Fri,  4 Apr 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775611; cv=none; b=tL2i7kYHVbwmvRahvLPQfr87KeVuu6xnHgiSzHsfEIb5gyZmf2EJGXugxtBLJ95W2olYYn/DHQ/ZCNvS/7pn8w9N3shm15+rs3lQcp6/sRzsnHUfWO+fojFEmdpswJEZ7mkKYwMwyJHUcFwVgTRtb9Z9HHKVOVcozBQZXdC6Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775611; c=relaxed/simple;
	bh=dlTMdTr2De1XmJ58WqL6zRxnciJjXRMN5Yowymzujsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tS+Jgx9dPuNbpQZJsN5bhuu/FkFsInsZZzUGPtGVUrEfpnukSOesEAiX6GBUqlRBpbYCE9C8Q/H6M1ghvm4k+aONiuuw23BZNEEPzE+jkaC68Z4zH+OYxHeaIv26gxs6Y9GAlSMvcW4mn6zDNgdqwadI+XLTmEUthBOPfYY1xRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pL/f2y9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D38C4CEEB;
	Fri,  4 Apr 2025 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743775610;
	bh=dlTMdTr2De1XmJ58WqL6zRxnciJjXRMN5Yowymzujsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pL/f2y9NS0JveX+yUNgzMZsq/Dw3sjV6c0L0YMEePQpJqijExu0Mcy7pw4gyIZ88Z
	 I+/7kQDj2cmLg7Xba3geV8KcFpJUJwAa+bwdLqYtoIwthH0AYySCjLQlODb6omCbNz
	 3XVjOqKIjopfxwIu52QcBjwx7uoyq87IKkLwDtYu8lykxqkKYOVk2dkv85oq7XNcot
	 g8pRnUWLbkNl7pD0FNResy0bBvd1JuOeULOEzltobE/43rnBuYwkOJfDI6C6KpjxnT
	 NkRqqBCPGzyAuQmCyxH7T/uBhwEJNA9etKiTT9aJ4/XVne9Lne3mIhPbzazkuTAjuw
	 rtCfQqHXnGuxg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54af20849adso2020050e87.1;
        Fri, 04 Apr 2025 07:06:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVybzw1F4OOCghWhGu5Lg3AA1YFrhhgxvVtZMLTg6E76lL7JrgPi2nhYIuWL0OAs6ZBQuXsB+x0+c0ZYOc=@vger.kernel.org, AJvYcCXl/dxz/VN8aCh5OxizlXpC+Rz2po2uue+EYC2o9sEtz5gZ3xCFhM66GT+imRejMXi3kevACX5QhY9CVvR9@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7OHmbEmXKP5o770MtJoSIp6rHkw/lEfz+nfqEtkPnNceXBp4
	EiCGybq9Rhyie4ibhqn/MXgY6kF5lp15/5zUQgPisvsZ0wmnJqu73uWapAAoZrHkJTUw4T4B2RE
	WcHOK6WiQntvyeggYpRvlQP2gMbE=
X-Google-Smtp-Source: AGHT+IGzHPV4Ijvg/jSgwoi9Iou6eeQJHKq9kJXztvRO6Qu67pds9mGYv2PPcXBm554NzEkkqjpbU0NmHVi5sbNEGNA=
X-Received: by 2002:a05:6512:3697:b0:549:91bd:2d86 with SMTP id
 2adb3069b0e04-54c1ca8c075mr2266422e87.26.1743775609214; Fri, 04 Apr 2025
 07:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
In-Reply-To: <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 23:06:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
X-Gm-Features: ATxdqUEgEcjlrExqyVXX21WPPkwTmuO9oioeIgrH53vKuTzP8mVQPSUDIMgFn-Y
Message-ID: <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:11=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Fri, Apr 4, 2025 at 2:56=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Apr 4, 2025 at 7:25=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> =
wrote:
> > >
> > > Current version of genksyms doesn't know anything about __typeof_unqu=
al__()
> > > operator.  Avoid the usage of __typeof_unqual__() with genksyms to pr=
event
> > > errors when symbols are versioned.
> > >
> > > There were no problems with gendwarfksyms.
> > >
> > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
> > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1=
c035@molgen.mpg.de/
> > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > ---
> >
> >
> > Why don't you add it to the genksyms keyword table?
>
> It doesn't work, even if I patch it with an even more elaborate patch
> (attached).
>
> I guess some more surgery will be needed, but for now a fallback works
> as expected.
>
> Uros.

The attached patch looks good to me.



--=20
Best Regards
Masahiro Yamada

