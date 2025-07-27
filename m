Return-Path: <linux-kbuild+bounces-8213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB6B13064
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 18:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0065F1896A1A
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 16:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5695421A428;
	Sun, 27 Jul 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsV2T3Ar"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC22EEC3;
	Sun, 27 Jul 2025 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633474; cv=none; b=EcOAQPYjYnEiBZ8PumqMFQxxAnf0AWjU5GRkz37dxdVH42Pg0QgqzdXwkj9Y2K7SQpetNnz7k3QJ/iiSe6uY70FSkHW+PXtrJ2XTFQDgb497mbyOZJydwNoFxB+ZDVMmIkSDuhbsSWgi3c3I1nRoH2itvNSl2IlNtq52Nnn+cLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633474; c=relaxed/simple;
	bh=rpRWUHNyg1JY1vO7MjL9uEYpu9PHGuMnac8UiEIVPgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzUSmrmmIPoaEBowaKhA/AKchWa93HFnah5nPNrXkuC1PrfzkXMaltYrh4G0p/kgFlCMtd2QQhaMNuGtzfKQR2q83D1l5L3c8X30KhrhpfYsa3xPbsbwt7goT8meuqm2wNXMUXEptV7qxaexW1mmv/9Bh20LR8qFZYPk+0Lo2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsV2T3Ar; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-61914ab3c66so956215eaf.1;
        Sun, 27 Jul 2025 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753633471; x=1754238271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5M0ltdv2beQVV3gmmKUq4n3fQKkCt9o4jB/0j8O45E=;
        b=WsV2T3Ardf/6RDjOHH8gR71qoHrOO7ANiK/J+np0GQ+jzcCogEp1HZcsTRx6yTsGoP
         HA3m8t+yKJ9CjJdpUWX8wHWFMSwHVrYAZvKfu+c3Y3GPpJ/3EUqzTiz2rAFuwI9H2oY1
         ooOuZR4ptoPuFdFqwKQ/eyD8Zix2ej51w/8uTxYK17c00V3hCb/jFOzt0oh84G9ncIiP
         Jg+oCDqd87Zj+hBIxmlwSjjDdL3m8IebdsSOSPXH+8zVjMhuSIJyb3lwMGrsmPSvWNH5
         8zwh2p2bJbdoMOtpMsNi+12JO3N1Z8Gs31d7fNzKzC1vh0ksZ5Vaz5Uod8KyERTyimHv
         vvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633471; x=1754238271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5M0ltdv2beQVV3gmmKUq4n3fQKkCt9o4jB/0j8O45E=;
        b=YKzz/kdroKNQVX4BK/BXYB1wKM4vdVh8c0mE2zGap+2nsKyqPceLE7xaVkh3ckkQna
         0UCtpFrxRdcm+sMF5cWiSbVfCVcOIVI7y+JEZp7O6MrMss88X17kMlabw4jTcNpru6ny
         aS//OP8wmsay/rdLfMuyIMuyv9y9rDhU/nBM+NvTDosF2Za4lEggyTtGvxuWgkI4aAAy
         ThWDDxc65m1M+uXbvMgnFQL1A0kleXf7UACiA3pWEY8DASqlcyuqmw/OdCVZToDCw0Kr
         DZmjbSnm1rM2EAd+M8mtWNdQq4v2DtCdCSA5NyyFHgQ80Z8ISJwbGopzAF9n8QuRZISQ
         616Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt7PiekYpVeGJ+lGjgm9e6Ho3yGBf+dQj08N7OtwUkgOo1eSkbiO89jbDANomvnR4qM4IWczkwLF/uYpo=@vger.kernel.org, AJvYcCWaImBIoxQzs0zpZfwIBz9F2dbn79Rve9se2Pv11cDlfvnYUkYMgdeV6eJeJBd0RgoyyHIUeHebUxnnWUci@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5aSvrtssvyrdWAmZ65Q52HloOiqaiQ5EB36PpcQCYrjZxiBL
	7wKwog5rnQfdlTh4zxTR0yIPMWDIEO1YoOR/8cgMQMqPC3pt18HP9EQsqWQ0xXXSJ4MS+E9/cuL
	3yEFX+mhBHdQpE/w9D+YLGMk5S/xVXijlTdaEcvQejw==
X-Gm-Gg: ASbGncuEkuHdSQ1KNhDIZ/HcHO3U1DBqfgRgnaS5t+oIPoCnnv6007YeG+jyaTqk22D
	wqwhv84qS/YvlDGcshg9RLKQLb8HjU4awZV8DIJyLixi0bXaMCxq8MKA/qKvBtqGAZqUn/d43j2
	vPJ9g024akXvy/96laprj4lLPYsiwaU8WxvWCdf9TS+ECKhjtf7mls/NpeGZjhj/RBN+YnVBEYq
	RCf3ZIyjQ==
X-Google-Smtp-Source: AGHT+IFx87y7GH7qHhjSoMH7hs3QC1LF5QirQljS1IUo+EbqYc4zfCHQG3fXOD+43u1VKcMia9PYWVTW/7rVmpbKmKs=
X-Received: by 2002:a05:6820:1888:b0:615:8277:d5ee with SMTP id
 006d021491bc7-6190c950780mr5579210eaf.5.1753633470766; Sun, 27 Jul 2025
 09:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726175524.146459-1-suchitkarunakaran@gmail.com> <20250727-fortunate-jackrabbit-of-dew-4efe3a@lindesnes>
In-Reply-To: <20250727-fortunate-jackrabbit-of-dew-4efe3a@lindesnes>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 27 Jul 2025 21:54:19 +0530
X-Gm-Features: Ac12FXxcJOjlaVaFEVSJ1f6CYSw2BQmsOQPFP5ZA-6vUOgUY1E3KmiSo3bQT0SM
Message-ID: <CAO9wTFiJquC88n_UTKtiU4ETzuio-=YCgfj=omMYYnN=bB5XOQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/lxdialog: replace strcpy() with strlcpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Jul 2025 at 21:49, Nicolas Schier <nicolas.schier@linux.dev> wrote:
>
> On Sat, Jul 26, 2025 at 11:25:24PM +0530, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strlcpy(), which ensures the input is always NULL-terminated,
> > prevents overflows, following kernel coding guidelines.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > Changes since v1:
> > - Replace strscpy with strlcpy
> >
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > index 3c6e24b20f5b..ca778e270346 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> >       if (!init)
> >               instr[0] = '\0';
> >       else
> > -             strcpy(instr, init);
> > +             strlcpy(instr, init, MAX_LEN + 1);
>
> oh, I am sorry for the bad recommendation.  On my Debian bookworm arm64
> machine (w/o libbsd0), this does not compile as strlcpy() is not
> available (same as reported by kernel test robot [1]).  As libbsd0 it
> not a documented dependency, strlcpy() should then probably not be used
> either (and Documentation/process/deprecated.rst also argues against
> it).
>
> So, keeping close to Masahiros mail [2] a few weeks ago, what about
> this?
>
>         else {
>                 strncpy(instr, init, sizeof(dialog_input_result)-1);
>                 instr[sizeof(dialog_input_result)-1) = '\0';
>         }
>

Yeah even I faced the same error. I initially tested it on Arch Linux
and it worked somehow. However, it didn't work on Debian. I'll send v3
with the changes as you suggested. Thanks for reviewing.

