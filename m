Return-Path: <linux-kbuild+bounces-6430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B1A7BFBD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEEB1189F1E7
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537C61F417C;
	Fri,  4 Apr 2025 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiyrM54B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA11F417E;
	Fri,  4 Apr 2025 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777467; cv=none; b=Q/2knKbskCUm2k0HeAeapN3OzRaO9CChFJvRRI6eAel04tNggZsblMOO+wWG0M381CsCj3BKt8Xyb3nFrZ37KtuaqtbihPL/hXX+bFnhjHVlJqJJGe1ppkFhkuUeVJSIbNpvAWcjlQdSVRHkM4O4kzChPw1+t9dygMpbgDT/bYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777467; c=relaxed/simple;
	bh=YqDMor6o9KI305eh6RadR+0TcbnGSJ3Ae01+cgP/Mds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdhVAdvSLS+lyOoDFKm1ggs1FPzkEjHa6k/OZxNZNKmHAVFcKpI0xkg9bWtTw0H/O3wtQD50mPRsk8YPA7OyK03SlWkOWagUaGHdwpsqQH9QUfO5OSwd+oPppbOBXWdyrbKU0tHPjLChS+xmTaQ1at3DzBzyrf3qiBQ1Lf9KeVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiyrM54B; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so2574970e87.1;
        Fri, 04 Apr 2025 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743777463; x=1744382263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ansAIEqHOdqhr/BlqzHJj/9+MuifCE4y7FGwh31nks=;
        b=FiyrM54B4CgsjYVzKqWCFPEohgLYnmNE7dGCVLY1MA8ykQcAOLq2NjeRAyIo1E0nt5
         DCYpIzIC6o2XZ0IqEilHOqCBf7wOu8+325Ai4yq6pwGtM3Lf6Dy9/0Vg7uFiaVzRKyio
         Cs7F6jtQlIifcskn2li3q+Amx4h1/dcq90uNcVkQGsh8YYlHKdmcChGh+xeau+p9wABe
         BoScC/44l3sr9V1jODv2JUuwc+dpAuNgpNLo09yaFkBlXPrUzsvhIiMOiocjVt87W+Ox
         E9zHSDiLAuTks/BMvfJWUdLo//XXnurGD7LCadg9Qi3Q+kKhdVKpbU+w/oi6oAwRTw6z
         0Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777463; x=1744382263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ansAIEqHOdqhr/BlqzHJj/9+MuifCE4y7FGwh31nks=;
        b=lD6NVk40W8XtflE67J2f6Bh/CEflSm67PwUGEta2m8OVIrUGov2KmXEBGSxAdfPA/f
         fwWQ1xt97Ed9MwwUZtoF0RWA938hOSvEPuZ/f+/QF6PGF2b7C3LkA04GV4R2yL+1/drj
         YQHqN8mw0Zg3LCIjjW2KaQHl+397U27rx0tl5x+6CqM+D62/faWNUSx8cgGU//QUKet2
         T4h0H+Moji+2VzQc6IoAJNvLlQwdPWlrigTXiXy6Ew+syp+DkBwlDkZI+xD79DLE2JTK
         bfPA53YwjOzlbYBtXvQRH0JetHkf1Qs1G/Ewhgh3UueNlcXBMx87vVSosbADAIPWPmyc
         apJA==
X-Forwarded-Encrypted: i=1; AJvYcCUgidjl4FOn9SDmP8zHidp8nN/K8Vq4mbwmFZLPbNpbFuo18y1DgrXHF+dS+9igDXp7D29ukVFeQx4LJcw0@vger.kernel.org, AJvYcCX7E3ZsUtEuD+Yi7AOzAHR72tBi462BqCzWlP2oPypwULw4op4WAlS4Ax1pgQxQV1bFgMc9pp6L13MwDdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVUrzH71qehumt6xA+6VNQ78jDxr6z1IU+qeceJJv0QEfpeaU
	4/2grXaJlT8e7Bv3FTYC/4lJiB+bZ6FYbGrJjC89kzs5d9cNork/Pm4wHW9FW+4BNZtB3exUJ+S
	J1UK3/Ad27Z0tWaQzFCO0N88A/X0=
X-Gm-Gg: ASbGncvDhJK8EqaQl7XkfOD33MiWr/xwEDA+gcDy/poDDbtm/YTgbR0InMIB8lQrkd7
	Geo8rbVb9WE776jMlXtpCzP819+dk0cre3HNwG7VYJaU3CAQ3HfsoSSU8xuEjeEfEbPrf2jqtDX
	UHAPxG0uRyZulNxEwG+bTEPyR1IQ==
X-Google-Smtp-Source: AGHT+IHUwAyMXwZ7nTwa5Pdk8hBK90Mf1yR2C9DJh+uhCtwyRT12lKmJa+SPe4ZU+eO0c7owpRmkHptlUnogvP5xuLc=
X-Received: by 2002:a05:651c:908:b0:30d:e104:cb72 with SMTP id
 38308e7fff4ca-30f0a192140mr14612551fa.39.1743777463158; Fri, 04 Apr 2025
 07:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com> <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
In-Reply-To: <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Apr 2025 16:37:31 +0200
X-Gm-Features: ATxdqUHaaND3bdLnb6MftUV3OsQvLaF7fsBq2r-5LL9FyP6o3GJZsEjHZO93ysg
Message-ID: <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 4:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:

> > > > Current version of genksyms doesn't know anything about __typeof_un=
qual__()
> > > > operator.  Avoid the usage of __typeof_unqual__() with genksyms to =
prevent
> > > > errors when symbols are versioned.
> > > >
> > > > There were no problems with gendwarfksyms.
> > > >
> > > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL() macro"=
)
> > > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151=
e1c035@molgen.mpg.de/
> > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > ---
> > >
> > >
> > > Why don't you add it to the genksyms keyword table?
> >
> > It doesn't work, even if I patch it with an even more elaborate patch
> > (attached).
> >
> > I guess some more surgery will be needed, but for now a fallback works
> > as expected.
> >
> > Uros.
>
> The attached patch looks good to me.

FAOD - do you refer to the submitted one for compiler.h or to the one
for scripts/genksyms/keywords.c? (The latter doesn't fix the warning,
though).

Thanks,
Uros.

