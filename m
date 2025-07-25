Return-Path: <linux-kbuild+bounces-8163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581FB11C04
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 12:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540585A5B16
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 10:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2052D1F44;
	Fri, 25 Jul 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKtQTykI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0502E62B2;
	Fri, 25 Jul 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438331; cv=none; b=cG44P1Uc2xCoxS96qVY3sf7qJuLJvIP2G5lJcftYbCmVpYn1QZu1N2NJlPOVdCzg8GdazsUm91X/H6geJ36RycMBn00qi5G3yl7x7ZKnijGAIex6VzraNlu9fjt7L7ErfTKtwVv51MfeuC5QSSr70Xfp7MhssKwavq22QZOC8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438331; c=relaxed/simple;
	bh=XCCZTAuVv6rM5KqAiymcvEOfSpnqAYJ05ZeeCfAeMD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szK/vHsWKuUiu/KWL1TPoKeRsm0AA4jIfc9Pi7JR/xdFPxbxVRZ7yP2Y+2jqu/U13YDa28R+aICH9WK5Ny9NEdItmH9qasSX5n01myKs9bV2Od3gV+mNBxlfP1WQPHOdG7BN+bn3cNW/nBJb1ydQkmn5sFCrfcty4bLpMC1Iybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKtQTykI; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-41eaf97416eso1299120b6e.0;
        Fri, 25 Jul 2025 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753438329; x=1754043129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li8Q1/8bXeawqWYN0f/7F76ImwBBFl72CHl1v4y+PLY=;
        b=PKtQTykI7MJLn2f39R7k6tcldK+iyPClqQUcFdzt70ZafVvgY5cdAx2K6WeXabLVTQ
         uWwRpOYFxA4lNZu/Dm65KnWzZlxiamZjpTyJ0oMN+NWFqFiCGO9eWfv3NVViHzdLPIlV
         SEQfJOXwKQCnSUwLsXB1JwZaoDzc4lxlb7s0mYsvgTgQj0Qsjk5l732J3iDQ/nNnClWU
         NW2WRyVDeReq5jrGIQz5jv3RPLnjltw9BUSv6dX067o9OpuY61T+hkHgRa9zd3B76QEG
         WeoJigRWnOK9yedXlOWzNq0+p/Vp2wguFNukgZKtMI93T1Y0R74okmKSb8Nftk9oX34Z
         8kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438329; x=1754043129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li8Q1/8bXeawqWYN0f/7F76ImwBBFl72CHl1v4y+PLY=;
        b=ADcVt/apsSSj55yGfjz+90cruWqCVlLPyTl4cHDoaevMU9A16GTGRsl3cpPNXsxTfm
         x4hcTZCE4VKZT0IuPrcwhf8WfLBkx8pHBVCm9ix+44nYN7tKHULI7UZ7L9mLEhxhR0G1
         9n3tL0gHeqCEB0jwCUDQv1UF69fsFpWIm+uIaITkIeF7zBAJVhRxWGKkWQ3HwKGTfVZf
         zu/tIbcK4twO61RXGTsdhCrUkGqGX6rQA5PJYmgc0TU1YOacr70I1H5kdTDlA+LENzsd
         A9Y0RAFyBsuYrGjjiOEvne6DMQJayUBAV6VXKmCp1G5ziAZ/zD/avlQ7osgAUUTLS9Cw
         9sIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJk4YCgM/ppveUg3+CKIg8DCVu2fkHnQJnDr06hlGvUKC6xIUVrnC3unJ1kh/dkx9lCCsARDSs2LTXjjk=@vger.kernel.org, AJvYcCXrf6icup83Wpy6Yy9DgHWpbZc1fjQkUBKvWMSQMg0gN4m7K08fO+xihgci0Z5LuB7gQDk5zslPYKX9Sozk@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZTHcV0WM2vEOyfFc/O87/PteiB424zTJw/fwdaYXyqKbzXn/
	JWa6/gxO3TYxIY388e/M44p5ZRpp1JqQM4bhSKnYAp77IYPqx8fRjER5nRo7BOgAt3QFgXFnnQe
	8GkARNMBeU5boZawEcsXepZf40IxQvLU=
X-Gm-Gg: ASbGncu7ckNdZBynQPPIP3LqdC3hoyZ8MSEjX/Jus8CGkG9WhrOEFeLzsCs6KW7my7n
	GfTKFX7BaeMXsgaSAOsDr0sJO5Gg6MBQ7Tm6nLPgEfEg+pcGOvJzc3/xQQcDoPMgTOxvGgebP2b
	7iTr/vxOeLISdNChMvTvcVgW6xD65RxklU8IjMnvq+Dwjn/jTd43TZ591EiM8kOo0SRG6Tv/uTQ
	NSynfug2vvYdH5b2vY=
X-Google-Smtp-Source: AGHT+IGHB83pYzy5pyfm99vaRBBCdZk4KX+KT5ViJGvx8qXjZCmgLd679d9uosj/HkweSM/0GXEa6THJnnUWuwPv08o=
X-Received: by 2002:a05:6808:170c:b0:40b:711:377d with SMTP id
 5614622812f47-42bba0ed70amr483979b6e.18.1753438328742; Fri, 25 Jul 2025
 03:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com> <f020e62b-5186-4461-8fe9-de64d35de488@gmail.com>
In-Reply-To: <f020e62b-5186-4461-8fe9-de64d35de488@gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 15:41:56 +0530
X-Gm-Features: Ac12FXyGeL9MCePha8mADnZZ3s0Yd1cw-jApyUYA_m3RLyXBbVTSAsTj9dYMESA
Message-ID: <CAO9wTFi9xEB_G-CwMxDxWbNcNCRHp9ps5sGj2U9w7YZgBzV1rg@mail.gmail.com>
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in inputbox.c
To: Franco Martelli <martellif67@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Jul 2025 at 15:23, Franco Martelli <martellif67@gmail.com> wrote=
:
>
> On 25/07/25 at 07:59, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows i=
f
> > the input string exceeds the destination buffer size. Replace it with
> > strscpy(), which ensures the input is always NULL-terminated and
> > prevents overflows.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >   scripts/kconfig/lxdialog/inputbox.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdi=
alog/inputbox.c
> > index 3c6e24b20f5b..8880ccaffa0b 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *pr=
ompt, int height, int width
> >       if (!init)
> >               instr[0] =3D '\0';
> >       else
> > -             strcpy(instr, init);
> > +             strscpy(instr, init, MAX_LEN + 1);
> >
> >   do_resize:
> >       if (getmaxy(stdscr) <=3D (height - INPUTBOX_HEIGHT_MIN))
>
> perhaps it's better to sanitize the whole code in
> script/kconfig not only in lxdialog/inputbox.c
>
> $ grep -Rn strcpy scripts/kconfig/*
> scripts/kconfig/confdata.c:143: strcpy(depfile_path +
> depfile_prefix_len, name);
> scripts/kconfig/lxdialog/util.c:348:    strcpy(tempstr, prompt);
> scripts/kconfig/lxdialog/inputbox.c:43:         strcpy(instr, init);
> scripts/kconfig/symbol.c:764:   strcpy(val, newval);
> scripts/kconfig/util.c:55:      strcpy(gs.s, "\0");
>
> because the script "checkpatch.pl" emits a warning
> whether strcpy() function is used:
>
> WARNING: Prefer strscpy over strcpy - see:
> https://github.com/KSPP/linux/issues/88
>

Hi Franco, I wanted to get feedback on this first before proceeding
further. If the code change looks good to you, I=E2=80=99ll go ahead and
submit patches for the other places as well. Thanks!

