Return-Path: <linux-kbuild+bounces-9006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBBBBDDA5
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 13:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1DAB64E8C90
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 11:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62634233155;
	Mon,  6 Oct 2025 11:22:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8C26A1B5
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759749737; cv=none; b=Db+44dJyEHPjFV5ev1A5BkzNVl/YRZJC2JHgUGSUM3bUVfO24LiY8VBGzeZUtwyqOIwTt5dYDpnV+0ZMRrAihKi0OEEfHkIOiBPhtMsV4rcTXp+v37NLjZrQQyJtTeZYXS2JLiwF8sZmVU6qcL9cq5PJihqZTAbqCm8ekDWrA4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759749737; c=relaxed/simple;
	bh=Y3Atn65xFGH/0e1A2PaPhs3F2p+GKPI48e94fdpGas4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkEdFkH1WFmYycH5itEk48HJqD7Y1PAjcErD+4uvQ1RYzhajMOywFhZVpZ/saBM2yKM6Qp8YQp7keoOf+VwakwXczWoa146mOb9RIzOQ2+N3rIeK55I9QrUfq+mSo4joGE5OddWMWkdInsjfPKgYQB+H4Fwg1SwjeRLSBszlLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1359593241.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 04:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749734; x=1760354534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5v6YXX9bgIrUD9M85TqnlXajae/PoAZkbY3xvYAmEY=;
        b=ZvbGdwfgJI0YHmyGMwjfsr8i9YcExWhmlF1Ozh3CsQ3n0v7P4qsr/Vp1htgYScEKgN
         cZ920xD9WlpCXkNYRGfot7Gfpif6o9AxpN5AufqqyZHsQftxtz/+J7r+qSruFphPyodq
         HN+AH+BJ5+jFTime1Uj4k6VyTCh2KmIdy5Durgxu+WYirnitb8JCV9l51cmvll7Hk9BZ
         hOK3oBlYbtzep0pNDg5y9ldI2eKh+YBwvClvB38mfEXyxVrS/aMeChAWhchPMjm7uea3
         9ZcLt7JQNIW0HqirTK3fY1QGVTXu8kYqB1BQeCZJQSG6Vg22iwnI0JaEPnhhwDsP5hC7
         L68w==
X-Forwarded-Encrypted: i=1; AJvYcCX/HxGUF4402nAkh8yt/pxHqsOaSKDATgmFDtvuydNj8Vpa72SIjIUdGEOG8ciGuwbgO5F7NWANIW1z1TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/UbJCkP1xv9RFsM6EXmOWY1olAxHWeUIUI/kUU6aHSw/Hj5d
	hIp7H49p8h5I/eAE38C2LaNzOFCozhL+3vpocezIarFLfqvOy2IUlJ0pKCVm9b8+
X-Gm-Gg: ASbGncst+IKVPZRj/a5pKyLJIE2nkpzjyUoLv4kVZuLulxqutchzNYGC6p+Ofw+oskv
	cV3CGXr6Z5vkMrjqjTxaTzdoRiwXxAz9mscj5xru1b1bH9kgmk7dy+YEOl+zSTgoBTcK79bIB0W
	FZgk4Typ+dCxmoiMK72NymU1+calixHqBOWUwkm/DogvdbYEbnZGZ+LCnmtlZnZc6NVHrz5WZx7
	Kpq2fz5rlwW63pCaTO8ATCE/pjO86q7ajPlZqQMU/JVLhdSsC9WgOj9fzMTNUd0/HaGe4HGWF5I
	fWyvMXPFO2dHzD9y36feT3maabM61ZZuItzKa1Xtjq7yxGNliY+vQYEufFlTSHX5NQCIi8Gav3Q
	TEFnwCBG57vTSGCsxVy+UH2B395mXQ1dajMJzjCLvm5nKqll9YOPig3ChjOqMECtak7QTX7w94W
	xdavy1lM3BWBC06KZYdM4=
X-Google-Smtp-Source: AGHT+IFHi10RA5DIS27Gs5cVqf5ueaH+/mkkkH0kOCLdcHCs747InpHFhMyMebPZy5ta2j8S1QWKnA==
X-Received: by 2002:a05:6102:2922:b0:537:f1db:7695 with SMTP id ada2fe7eead31-5d41d10c1f2mr3972910137.26.1759749734053;
        Mon, 06 Oct 2025 04:22:14 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce64af0sm2881129e0c.8.2025.10.06.04.22.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:22:13 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5d128733742so2055025137.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 04:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXV5XfB96YGimHT0+sXpAOZpnEaIRoZuhXSA8bp2Tsc68gYyV5UyHg7YNyuTgF0hG0jDddNKPX52q/Fgs=@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-5d41d10c1e6mr3769193137.25.1759749732995; Mon, 06 Oct 2025
 04:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>
 <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
In-Reply-To: <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:22:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>
X-Gm-Features: AS18NWCyOXitXU3rGEXUiPmnEZfW-xN2u5xkzC9-zt4O_5XgyELmHdg8FqqTPME
Message-ID: <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: uapi: Strip comments before size type check
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 6 Oct 2025 at 12:31, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
> On Mon, Oct 06, 2025 at 10:49:28AM +0200, Geert Uytterhoeven wrote:
> > On m68k, check_sizetypes in headers_check reports:
> >
> >     ./usr/include/asm/bootinfo-amiga.h:17: found __[us]{8,16,32,64} typ=
e without #include <linux/types.h>
> >
> > This header file does not use any of the Linux-specific integer types,
> > but merely refers to them from comments, so this is a false positive.
> > As of commit c3a9d74ee413bdb3 ("kbuild: uapi: upgrade check_sizetypes()
> > warning to error"), this check was promoted to an error, breaking m68k
> > all{mod,yes}config builds.
>
> This commit has been in -next for some time. Any idea why the issue did
> not show up there?

No idea. Looks like the build bots that are still running don't exercise m6=
8k
builds on linux-next?
Perhaps this is just collateral damage of the loss of the kisskb build serv=
ice?

> > Fix this by stripping simple comments before looking for Linux-specific
> > integer types.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Thanks!

>
> > ---
> >  usr/include/headers_check.pl | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.p=
l
> > index 21c2fb9520e6af2d..75dfdce39e7f4610 100755
> > --- a/usr/include/headers_check.pl
> > +++ b/usr/include/headers_check.pl
> > @@ -155,6 +155,9 @@ sub check_sizetypes
> >       if (my $included =3D ($line =3D~ /^\s*#\s*include\s+[<"](\S+)[>"]=
/)[0]) {
> >               check_include_typesh($included);
> >       }
> > +     # strip comments (single-line and C99 only)
> > +     $line =3D~ s@\/\*.*?\*\/@@;
> > +     $line =3D~ s@\/\/.*$@@;
>
> C99/C++ comments are rejected in UAPI headers, so this line can be droppe=
d.

'git grep "//" -- "*uapi*.h"' disagrees...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

