Return-Path: <linux-kbuild+bounces-8241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE1B14E8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D278A4E5606
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571F6199934;
	Tue, 29 Jul 2025 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhZWEm11"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1B288CC;
	Tue, 29 Jul 2025 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796461; cv=none; b=o66SfdLb+KoPhD6imS/Y7W8cBf1OCgN0cn7Is29k3IrYetP3POa0NE16resAcYNyxNmZMonvszuDHleKPJ+VZbXFia2SajRXxYCMmZ44cNeviYtNzkvvPYSJ3Py8udX4b6euBfCzb3kdyR/dojLNYIhrLph/ClvhLWGIhKjoZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796461; c=relaxed/simple;
	bh=ob0LmPTH3U6CFRPsZtkAASoRcO08ztzyJp1n8QEpOjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPS4+SJEZqRdsOf9tbwTftvIaVmKMxfh9E+yBQd37I+e/7xRR9sg1NI0v78HzV5wMPpl7CNtuWuUkG1gEOXk8Zi2uUN3l63Tmc4dvygGiIuLEoqjVQeRvkKPcqhaK1BFshYVFhzVWSDkTVyx0wRSAfDhhhMZhBUVT2dzbcJsuyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhZWEm11; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D7EC4CEF9;
	Tue, 29 Jul 2025 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753796460;
	bh=ob0LmPTH3U6CFRPsZtkAASoRcO08ztzyJp1n8QEpOjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mhZWEm11M9RhF3CJeSoMngXgk1GjxEfDV+bei91e2ua8vIpzGHDGmXXg1J9DkIKvv
	 YITVIjrysmd1UmWOsJ6HfZk13Iw8Q5CGmln9P5q782H/UTMLt3BCIQPkmgCBtNhd06
	 aNmFDIiFfqSW9p/SQBsz/d+0Sq9+8+g+2yrRtkdiALr37BfvXtHbsus4GnbLCoX3TS
	 HyOhb/AvxCrnoa5WvU9pHIhzS8hEqoOLwpUy30MkRbUk8fT1iXsG7nkxXi7qCCacqU
	 kn8VOUulH2wbYRYyDIg7g08e0Raj3IR6v5L7Lfa0C1HiqtgENYSSwLPMQI/wJV4e8i
	 PjF0WX1d0qu8g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-555163cd09aso4767697e87.3;
        Tue, 29 Jul 2025 06:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwn9TNTp99WsZTxRB+VV1eEErPMignlx1+D+pvGy1EUzPPVWsrUPFa4knKsDz1x7W46E2itkxPDitGThw=@vger.kernel.org, AJvYcCX8UMSqOyCaWZJQTudslhmQj1g3p7GGFia50rtNeIB81ymCSNLTPGzSiNjpSmVyAETPi9OS2dcK/OEh6Rpx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ZnlhlZIXX+sLQO5nYWJ+LlohSvtbNJCe3MQcyY14rCpASmRZ
	lLx+QUmFmdDRuKr5YpL4xYT/vT7n9DKdVzDRnT+jqSSMPpbRgEpexHmRF35wcLU15uU0AAYJ88U
	js/uxEpMu75uwq/3lRmp4BvD6T0EGJ48=
X-Google-Smtp-Source: AGHT+IGXvDD6+HE+n6KcA5hrIEq9JCrAGhFeonVHxDMZsACrl6lzsMudWBV6SZoqc4ZPDFUI8EegsOK5pSV2AF56Pqs=
X-Received: by 2002:a05:6512:1392:b0:54e:81ec:2c83 with SMTP id
 2adb3069b0e04-55b5f3ec63fmr3713126e87.18.1753796459386; Tue, 29 Jul 2025
 06:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com> <2025072842-require-smokeless-f98f@gregkh>
In-Reply-To: <2025072842-require-smokeless-f98f@gregkh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:40:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_e0xXb2Uyupo4U5PUtbVBf9_dZO6qkSG0HNxWVEBeFw@mail.gmail.com>
X-Gm-Features: Ac12FXzaTJhx6-ERGwf60fRPnl9YGsOcabamn8mnBHm8jXreHlRlmuEP3bIGe1E
Message-ID: <CAK7LNAQ_e0xXb2Uyupo4U5PUtbVBf9_dZO6qkSG0HNxWVEBeFw@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suchit Karunakaran <suchitkarunakaran@gmail.com>, nicolas.schier@linux.dev, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 1:29=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Jul 27, 2025 at 10:14:33PM +0530, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows i=
f
> > the input string exceeds the destination buffer size. This patch replac=
es
> > it with strncpy(), and null terminates the input string.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdi=
alog/inputbox.c
> > index 3c6e24b20f5b..5e4a131724f2 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *p=
rompt, int height, int width
> >
> >       if (!init)
> >               instr[0] =3D '\0';
> > -     else
> > -             strcpy(instr, init);
> > +     else {
> > +             strncpy(instr, init, sizeof(dialog_input_result) - 1);
> > +             instr[sizeof(dialog_input_result) - 1] =3D '\0';
>
> As this is a userspace tool, why is this change needed at all?  How can
> this overflow and if it does, what happens?

The buffer size (2049 byte) is large enough, and
buffer overflow is unlikely to happen in practical use cases.
If it does, I think the program will crash.





--=20
Best Regards
Masahiro Yamada

