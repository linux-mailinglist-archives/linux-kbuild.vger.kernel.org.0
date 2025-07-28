Return-Path: <linux-kbuild+bounces-8219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7AB133C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 06:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7BE172810
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 04:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC015278E;
	Mon, 28 Jul 2025 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZFXQVnu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B442A96;
	Mon, 28 Jul 2025 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753678129; cv=none; b=fykKmcf6x4/ADY/TTspQFDRZ7j0WbV4DWnwPUl2NC/uiBP0XiaAZRqY8aBe1tjU1kdnsJSgSNKhA2vkCvEIpHBMKb16X+odrlPo6oq9dazTArAPv76DlhcM4rXAqDOHgQomBEPMwZIGMXwcfkEtKJG0TbpFinCTG9OHdNRdsSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753678129; c=relaxed/simple;
	bh=gUKMXU17IwJOI7LCLH6V8bkBVbIZTvkpLS/KBg8tk4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K093InnFYLydNONtgGhRlqOPRr2pbX1hwFZri3MxnLm2xE4jKYfurCD8C9Fh0+p6N8IwWG5OtESr7pe721z3vR6ylNB/Kc11pg4XoE+Xo0B+lwJgDNPG+TowEiiUKaGiEVpT6rOSo/GjgYTshKl+s4bVD3GoCT3JJKeJORrH4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZFXQVnu; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2fef7f6d776so1479062fac.2;
        Sun, 27 Jul 2025 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753678126; x=1754282926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQMLoqWQhQ5MNTIX9+9V8B8tt15mA7M1bW5OJ2Q/PHA=;
        b=XZFXQVnuplrW286ZA/Dg0m2C9Nflu9EhH2M8S0AcHI0J8pMyVRxBuI2c43PgSp/M8N
         yu6sz6LKB0yQjM1lVpwxLTJyd1un7LdDRopaICZ4Z1p2bWbNjh9lqaH2omKDZsmZ1CFS
         GGIKS/SKSTAwvStQhTmGzFAfFoQL0TZV3O4LcMvAlh0hUroIXUdk/6U7JfcJB1qSninF
         9FTIt35foprwoBzBSTAME+/t/YKfdqG3mxd/sXPkn2hl9hEmFE/L9LX0CvEOBKtEGh2v
         tOOrhIw24H+sGZqtudg6KjsS2T2VPdoT5vhyg7pfbMaMLcGyh15QUWPb0O0U6iSwGs1C
         3UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753678126; x=1754282926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQMLoqWQhQ5MNTIX9+9V8B8tt15mA7M1bW5OJ2Q/PHA=;
        b=XWUWIaKvODsoklASNYV0ZJzzf0j5QViPDfnF/1r27RuS0oYqN31jQtzG86o2cv6fL0
         o8IubSAVAh/ERX5YCyVh6zcjPrY6O1Sic07nXvGHNidj76Z5oHuGDc6ZXzLmt3hC08++
         rjnTxxK5bxm8nmVk1PBRTFcntPlRj2FUbAcOOt8oTnsEi3f+APf7Ul/p+TEu/pyXdn2i
         xhOwAucnYm3yaLSfEv+bBgNdv9c2Fujv9XJw3wV88++/6dmxw7TY4kAMEwWec5KzIq5s
         Hsdi9bEizEj/oZ3iyM4EWR62h5vmu2gSFw/ckfFA8gnBnKp3Wm1q9iuBvqzwqyv0jqgT
         CI2g==
X-Forwarded-Encrypted: i=1; AJvYcCWWcKDPRyOkoPGlfcEW8pv3YrAz47B0BALBcgX26QUyMMmlGcRfddX+InrRqWLoKvtyE7vWtH1nDyZ+Rmfq@vger.kernel.org, AJvYcCWeCk2L5dQsrKL2B2NX6Js8Z4rZP3EnhMjquysg+Us/nzI73mnJZg8X+nHEjboo8RXoHRwnorh6l9nqyyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRYJwms1ZOfsVf0QHI7XfJPMFsC2lZvbKGQENhExlHnCTUgxh
	Au4y1FgJaCOvdKP8wWGguQlbiLtb2/DWuqz2i4c3hLbL3vCT7UNj1uWJH7jAGuXX/dSv7Vj9lwJ
	TijRPlNiAAY2TklxhtRzWvCKqGbma6Kg=
X-Gm-Gg: ASbGnct6I7M03ZGxWNMb89yyW9D1cLHNnRTOn9yBMzLqTFgFqg2L56YleIRIp7Br8qL
	GIKktlgmgw9AscPqzhwXXIzZeGYFlULQEkeA7qXAhTiznvfPw2C02upmnRZT+an4+oeLjE998yk
	A1/He+CXauratrESeQycsEuQibRg6xLpDfsWs17dhI8YsEot3AK0xSv1sxlbG6yYUiMVL+QKEcy
	Ghbg6cV
X-Google-Smtp-Source: AGHT+IGSxCyhnHvN6/28pvM0FDfrpKnpP/wq1q/RwfMrs5WaSpldSMS8SGI4S1gQDkicnIvjlu/EJ3PcXpZug29E4Ss=
X-Received: by 2002:a05:6870:440c:b0:2d5:1232:b081 with SMTP id
 586e51a60fabf-30702030ca5mr6854179fac.29.1753678126581; Sun, 27 Jul 2025
 21:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com> <2025072842-require-smokeless-f98f@gregkh>
In-Reply-To: <2025072842-require-smokeless-f98f@gregkh>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 10:18:35 +0530
X-Gm-Features: Ac12FXw-f8gcLikleOTRRqdRgl4oefUVUcPHLUw7NrAA789EqirUTXN736CWEE0
Message-ID: <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 09:59, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jul 27, 2025 at 10:14:33PM +0530, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strncpy(), and null terminates the input string.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > index 3c6e24b20f5b..5e4a131724f2 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> >
> >       if (!init)
> >               instr[0] = '\0';
> > -     else
> > -             strcpy(instr, init);
> > +     else {
> > +             strncpy(instr, init, sizeof(dialog_input_result) - 1);
> > +             instr[sizeof(dialog_input_result) - 1] = '\0';
>
> As this is a userspace tool, why is this change needed at all?  How can
> this overflow and if it does, what happens?
>

Hi Greg. The primary motivation for this patch was the deprecation of
strcpy(). Additionally, I believed there was a possibility of a buffer
overflow if the initial string accidentally exceeded the length of
instr, although the chances might be low.

