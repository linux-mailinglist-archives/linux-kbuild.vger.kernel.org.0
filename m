Return-Path: <linux-kbuild+bounces-4023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB09980E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4FF282BEA
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 08:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648FE1A08BC;
	Thu, 10 Oct 2024 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7W8ri9x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5B1C5788;
	Thu, 10 Oct 2024 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549777; cv=none; b=bbr8qMf5BSs6t1E/GAVkJxAPZseyvG6AJTcQIcsy/ASib53EIcrdsvKIcfZDeqAC3ZI4ZVk+6IlMjcTnTTNlEnk8MItsPkrsVAxu3pwE5/IwiThv6+Z9VUFOzdIe6Kjqz1U9HWn6Rr/GBOB0YJ2g2bwMqRTSfmA087PzmaBtOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549777; c=relaxed/simple;
	bh=a34kcFxostkueTxdcwzocBX4KkDyeicIwGGszAUsXVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ns0La7WHMcFqJW+X+txN5dRoVJ2FeJmrZqdGHZH3M4YcRTVssAQFbFl+lgL4DJQK9swD/5k+zdpgiNJk5xPv2kYWhYH6gsXp6T/nKij+k/XSFfTnHw4iAAVuNhu+tbMV02gsnwB97bfqxX6bJ4MdUgHIqYy1VwMmL7LmyRcsXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7W8ri9x; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2facf48166bso6602891fa.0;
        Thu, 10 Oct 2024 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728549774; x=1729154574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SuQqirHcDrQuEfC3wF3p4rwf9Gbk7mpdsSZMeOvS7y4=;
        b=f7W8ri9xjB73iOLUv0YzbSko43paKHPAaAFt2Q8NVM+xj+gcimh+MGvt73krSryQKK
         cT0JT8x6lP6Cd63Ds57bks5CPFo+U0cFZguRJRIpDSAC3OJwHGaV3kEzgIyradcVVjcr
         P5o7HIqRDupezi8YJKGPDwb0O8lcHSyyG9VEvdf02hlUPWGnlOdU5r4PmhilWDio34dz
         nc1pWB0GaJSn/x+9HFs6gF30gF4nS8pi7Ie54PhVxk+qY00Iec2wHnIper8Hb7xtEGNj
         2dXLhT1s5DYlgINF79iEJ4rwNPkJQibR6UOhAcMocwxz/FREuRzokMe8zwyvurDUd9ZP
         eq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549774; x=1729154574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuQqirHcDrQuEfC3wF3p4rwf9Gbk7mpdsSZMeOvS7y4=;
        b=tfyBS+RvuNSMlGKrMRPvNREoTrNUSTk8eVfkOIphenL4b32256bcz1ZGdjPAUskjHs
         3hyQqxUC07vS5ctCA47AGCcvph2g6UqqdM2n6M5xy64VDrCgWk7rOPHoDIKPZqlsRUac
         0kSGhRaq1cQiF/BU4LYQERhdooa09Ho3g0ez37SWFln+4gYtleJMoNu2EgXeYHQ0ZtHT
         qrJXZ55sP07R5QrK20uTTFS+dN60Sstqces+3TdvtJZJVVLOaqgdzVYAvNZLG5oeqtHG
         lvJlqzL69ypgtPmKYBD0/T+wSsBGo/rZa20LmsnfDpvX72uJwoHo+6CxVfiTlIHDEKQr
         FxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/88f/P0MtsXeI/v+IX8MYXsAVUE44jF9WrfzQS0ntXvBP49OIZspWVOMjDcUDE7ANr6qXt7zRkx/s8vDVSQ==@vger.kernel.org, AJvYcCUBoSrkqu5oVmCMKHIp+2lm9V3SA346VBOMQfG8oN+z7vJBQV1nsZg1QnttGbLzZv9w92uCAyu4LVu2ZfQ=@vger.kernel.org, AJvYcCXB7+qCLkdCZJdqjJ8BylAxWq5jfAClxVaURBtZD8BaTscU5p/tOjHpbSU7n65TWh1FaGgdNm2P0zldMLdd@vger.kernel.org
X-Gm-Message-State: AOJu0YxD/zR2V/7t/aZzfhGSjj0WEkc6MZtsBlHIae59UlR/9VKJFPqK
	2VIaImmsSCj5uJorb63vwb2QnaEZd1pt2sZZXy08+vdq8TpL0yZBEV7NtY9fafcXGgh0CuK9BsC
	BPuMftdZym2yt36z9hKKl6ksNi1Q=
X-Google-Smtp-Source: AGHT+IGDB2Aou82tfA7O4f6WnOhf+lZplO+ToDvhW+8nlNeCZmPT1U4sLKS2+8ubiuEVpTsflqG/p+FWkPfTFgln4gs=
X-Received: by 2002:a05:6512:4019:b0:530:ae99:c7fa with SMTP id
 2adb3069b0e04-539c4892ab6mr3456508e87.10.1728549773381; Thu, 10 Oct 2024
 01:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info> <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
In-Reply-To: <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 10 Oct 2024 10:42:17 +0200
Message-ID: <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:29=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> On Thu, Oct 10, 2024 at 10:19=E2=80=AFAM Thorsten Leemhuis <linux@leemhui=
s.info> wrote:
> >
> > On 10.10.24 09:00, Thorsten Leemhuis wrote:
> > > Avoid build errors with allmodconfig on Fedora Linux 41+ by reorderin=
g
> > > the Kconfig choices so modules are signed with sha512 by default. Tha=
t
> > > way sha1 will be avoided, which beforehand was chosen by default on
> > > x86_64 when running allmodconfig -- which on the latest Fedora leads =
to
> > > the following build error when building the certs/ directory:
> > > [...]
> > > Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVe=
r [1]
> >
> > Sorry, one search-and-replace went to far, this is meant to be:
> > https://fedoraproject.org/wiki/Changes/OpenSSLDistrustSHA1SigVer
> >
> > Ciao, Thorsten
> >
>
> Hi Thorsten,
>
> That was wrong in the original code which you moved:
>
> +config MODULE_SIG_SHA384
> +       bool "SHA-384"
> +       select CRYPTO_SHA512 <--- SHA*384*
>
> BR,
> -sed@-

Thorsten, please fix it!

-sed@-

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ker=
nel/module/Kconfig#n249
https://git.kernel.org/linus/ea0b6dcf71d216dc11733ac19b26df0f5d0fd6c2

