Return-Path: <linux-kbuild+bounces-229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C574800525
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Dec 2023 09:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9F628168F
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Dec 2023 08:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D5F15E92;
	Fri,  1 Dec 2023 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwzPIypo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CADE10F8;
	Fri,  1 Dec 2023 00:04:42 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9b88cf626so24355261fa.3;
        Fri, 01 Dec 2023 00:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701417880; x=1702022680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qTjlCC+GslsWJzNLyZ4ti8FIX5Ayf6BUta7nxCdgfSg=;
        b=DwzPIypo/sFgCsngfWwO/Vd8QifwTn6cGoj2XZodMqmLgwhprTNpEeIjnpJP8dTf5E
         cQIzLpq9NKZNnMvpvLiQRFE5V3m2r0b8SbCI752uWWXBQ5oQtbv1LofvJzRywdb73Qlx
         /hdTbStMtaCRZynT44Lhe4vspNwrY4QEtW4ai5avhWkUlX28jWLGHLfAKGi4bEf4WReI
         dHSb8tZtn4WOsBVR/Ka2OOHxwBw8CAm31eoPQW5KuXAJoAUsbECIThC98jUv9XjUp8d8
         khQ8mrkKzTK+ixxhVkrcdWKLQx/fGIajUZEQ+1y0YbOi4uBBerFCBD/xz4YIYJuGWVUl
         mHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701417880; x=1702022680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTjlCC+GslsWJzNLyZ4ti8FIX5Ayf6BUta7nxCdgfSg=;
        b=jKCaW1P02LEnZ8l0iLA8/PHIxegVKmoClpa0Diq6onj5xm63HcxTFZcfHKTun9ZjU1
         IJEW7mhuXa7ZgZ6oNy3fYI2wQxl0v8P6cYlBpSWI/UWLRxW1sOixj94vCz/ScIgPBe2j
         YnLiLzVAhsTc8IdUCZUSGyqlGUfTJdVz9KPASk1j9WtuUb0aVM3Iyuv3oseunTPm8nMW
         efCDudNptaHa6McgsIJAF5CiBXxoy+dKAamYjCTUiRuUnnIBq0nE+mLxA0C5ROCSihxQ
         90cgmWFLa6WwUZ+zBpc70DXIaODkQFCItkbzKFJeZbO3Y2PafVOD1zOEryOBTwrmn5T1
         UrWg==
X-Gm-Message-State: AOJu0YyVVOXI9h00Vm33mVtG49w+75bT2n/mpuOQ7Dzlynej5eRgzrzj
	pJHKG8+2DjCA5bwLphIO8j+BH1ONBz3Tc9pcFlg=
X-Google-Smtp-Source: AGHT+IFEuuxko1Q2PpI2q5cy8/izJael5ks2bFo9rN1ePwh31sc7O83FYc/61iNEILFM6s+xu0ERR56KQAymMM0pPL4=
X-Received: by 2002:a2e:80da:0:b0:2c9:d872:e795 with SMTP id
 r26-20020a2e80da000000b002c9d872e795mr434172ljg.76.1701417879899; Fri, 01 Dec
 2023 00:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
In-Reply-To: <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 1 Dec 2023 09:04:03 +0100
Message-ID: <CA+icZUUOFVOe7Z4q4F6nasQ--8v9wvZs9vZtLpR-p3o4UZ0HPQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: Kees Cook <keescook@chromium.org>
Cc: ndesaulniers@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 1:34=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, 17 Nov 2023 11:24:02 -0800, ndesaulniers@google.com wrote:
> > As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux P=
lumbers
> > Conf '23), I'll be taking a step back from kernel work to focus on my g=
rowing
> > family and helping Google figure out its libc story. So I think it's ti=
me to
> > formally hand over the reigns to my co-maintainer Nathan.
> >
> > As such, remove myself from reviewer for:
> > - CLANG CONTROL FLOW INTEGRITY SUPPORT
> > - COMPILER ATTRIBUTES
> > - KERNEL BUILD
> >
> > [...]
>
> Applied to for-linus/hardening, thanks!
>
> [1/1] MAINTAINERS: refresh LLVM support
>       https://git.kernel.org/kees/c/9099184dec26
>
> Take care,
>

Jetzt amtlich (Now official):

https://git.kernel.org/linus/994d5c58e50e91bb02c7be4a91d5186292a895c8

-sed@-

