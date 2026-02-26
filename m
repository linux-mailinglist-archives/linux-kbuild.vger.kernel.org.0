Return-Path: <linux-kbuild+bounces-11443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG2rMCKhn2lFdAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11443-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 02:25:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569319FC9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 02:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7206E304B589
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 01:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67D436EAAC;
	Thu, 26 Feb 2026 01:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULkUKTpw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593833C513
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772069143; cv=pass; b=XYhx2JjqeMPe4K3IagxHxAI+Z6vuSs5xnROBhiy1qqr23z1RsrT3MWphIDzX8VQc9CNsJub5+FAvaG3fXwiP1+yOuVzBlyeMG/GdDrCZT8dVFHipbveHzMAjGPK8vz2eD9qd7neoLaIhv+kWmHj5gxGP95f15yOlWvydp63Ysfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772069143; c=relaxed/simple;
	bh=+lb8FFL2Nz0U+jAh74gcMmNm/+0HmVt0rV/QGTu3YLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgHDsfQ8wQBBP7w0tR4zxEornCKSjZlv+yamhdpMg7mlepYsrz0Izez2psk8Aympasqy1nCyngzlH18KlRvTablBStlSirNJkK5iZ3PGVDa1ayNDZG4/ARjTxg3nTGykoO+ykSMfwKAqO+As8OhrsGziU7evMzMlK0djYbrYZNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULkUKTpw; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436e87589e8so259845f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 17:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772069140; cv=none;
        d=google.com; s=arc-20240605;
        b=abNXiO9IJW/0AVagmg053pR3iNPu/vLuvj5/bMuxLu+AZKnFjWKsXQINWXhucCepUw
         QRHb1xzGMWlauc4ThLBGvZZWsHW2pxaojpDveVGKaM8GLA4pXXeL/9ejAQG4Et2G5kpy
         Gwcf5my+vDzXjImOdHJjHw22U+3QS4x4GlyuU9Dap5MzciRbaIL3CSn0sC2a1vor9gcH
         M+KC0mJnIMKfkH1p4xthN8TGr/rFHaoIMOpKA7fQQEk0VcyRhC71uk+32GR4R8SwRWsQ
         rH5RDQZNR8YUm+9lFJbWKJ/D/608cxl3tpq9QyhhdJ0cwZ7NQvb6mR5OfMSv409nSLMm
         ccyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3yPyH0pQFPvp9rX8kbo9NsfPDsbSlBJhvKE53aJL9Vw=;
        fh=EDTmQUCBULiHRmUyVPVstsW1USjdnNUAmh5jhqF4QiQ=;
        b=E6Z9QnDH8LEllgC/UgMpbz1j/0ON1C6eRFH+666ccoalw7RpWb+9j2ExF4YXKQp3MM
         rpOe7Yz4WByQ+yrWzWkUCoHHqWSNpHoFeezl4fBiyrL2vsJHUTVKu5tScgnnbWmkU5Gb
         lKAYHIkzn93Lid/HSBZhN0d8zf/H27Fjum8HFoYQDwt5GIM3/ETTkhsGEmlkqoCYwd1l
         sKFqFgwVaUvP4QxN/OK9UigocQWeq+BuiBrTxFagV9RuHemBq1p+nkcmv6Bnrl6VYmv5
         cetwpe5A1B7XrWbs+uBm2Iirym9j+Dlr/8nugUPZxNK7wp+KjsWN5675hDMGsShqJ3N3
         UkHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772069140; x=1772673940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3yPyH0pQFPvp9rX8kbo9NsfPDsbSlBJhvKE53aJL9Vw=;
        b=ULkUKTpw1YgfXWoNvLMGKZ43icS6PO+xw+yqZqTNQlHHp35xsCZ8eqItv79YAyGq6g
         nMCjPsnI7dfJNAK5Nj8ywP/TzNB1A1q9Ct1x8bzXv/jmD18zv1TpyIkN6T6J3s+U3fOm
         XOO1YiFIemN+aKp2IlBPgksCZOaF3fAmwFdFFScB9dsPXu7Cevq09g43/a7hcJCiY+4Z
         noTZueOPC5ET1wX+Tut1Er3J6ttXcnhhrUZiVabVjoXOPy6kygp8Q5H0X5+UFTe+3/QR
         e2tPOeKPJCtVKwaCKJ5jgvhjMMiXcgbz9C1BGW9gm8uboj+rSFOClkAqLsuRv7ka1nig
         JSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772069140; x=1772673940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yPyH0pQFPvp9rX8kbo9NsfPDsbSlBJhvKE53aJL9Vw=;
        b=gJ8Z/fHewtzpjKFj3WX09dukFtzDItFXJsK+Dyu8LHC2sZy3jrMUHhgy1ElPqipJ+5
         Dq7cBNhPlB6ZBqUCz+dnp1wEhEyZ8N/hY8B5hhx3BdqDIN59SN5imgD16gPMwPgbsFNL
         qbXuLn3GoXFt7f/kSOqp6tD4KwI9dPOzxph6e9TW615bl4tHCkiPKM+xFeypD2eaUNer
         yr42eLVgDEy4zq7wNblGn5nyl4uqdO9qkYWrfzk23aWtAHq/GZzruxjmkRpjUhhF3xCQ
         XrMMj6wdsGxUBJ+U6GnYyV3LLjdfHkudlG6nJIqGgoMaa51PvEv0vwqUL6YFK3ZJRi2w
         oQGg==
X-Forwarded-Encrypted: i=1; AJvYcCVkKbF3z5fPOQ9D4Cs2S9egGmISLmKK9jJGA3NYpm6IJ9CB8LSapHTOFcXeOfRr+Hy+jlTRKVb6zLNiJTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHg8EPACsf+IxxIz7pISHnTqWTWkXMIPk25+6q+yddj70a3nj2
	PpA9FM1pAcDoWiANTavrGHNMxyR8HtZ6uuUHQxcqGSE8sqGvyNKP10PbiVz9qLtWB0ueCipYahR
	IiU931O6B24zjxf5yaUDo17vbafhLhqE=
X-Gm-Gg: ATEYQzxdSBeGKqDStqzEgL4BUZ3FIwZdMvoC63IFL7OZ1jd1wX25hAA03WNqUxXyVJf
	BSbclYPQQIod14+I/+TgosHNrz50bN/IWFBHw6UL5Oz+5iN5xE0ApGLoZs+XcJET9/HtlAyagVb
	GwEjnvTHiGyzc4u43tdMD2VW4UzNEHo3vwyeEatcG6mzveeJiaCPPKKbJf3WLIFzzc4ASuzMnkE
	j9r7OpMSR6FK37A4WB1zgqXCOqzd5b2jaKllF2KzZ+nZnDkWqj4ysDmVMvm/K91OelbjAPUw07s
	j2aQXcLW
X-Received: by 2002:a05:6000:186b:b0:439:909f:c599 with SMTP id
 ffacd0b85a97d-439909fc877mr6396428f8f.46.1772069139574; Wed, 25 Feb 2026
 17:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225072246.3475275-1-micro6947@gmail.com> <20260225194404.GD2755225@ax162>
In-Reply-To: <20260225194404.GD2755225@ax162>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Thu, 26 Feb 2026 09:25:28 +0800
X-Gm-Features: AaiRm526-nDAFPzZ8ogbsuh8DCWjl0lGj0flLK4NvBHjfLYXDWNuPtnwbx0xw8I
Message-ID: <CAK+ZN9pkjJGD4h7jzQiMZGCr6kC4OFBVC4P9Y9zzm8orUjTp-Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix potential NULL pointer dereference in conf_askvalue
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11443-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[micro6947@gmail.com]
X-Rspamd-Queue-Id: 2569319FC9E
X-Rspamd-Action: no action

Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2026=E5=B9=B42=E6=9C=8826=E6=
=97=A5=E5=91=A8=E5=9B=9B 03:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 25, 2026 at 07:22:46AM +0000, Xingjing Deng wrote:
> > In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_va=
lue)
> > can be NULL. When the symbol is not changeable, the code calls
> > printf("%s\n", def), which leads to a segmentation fault on certain
> > systems/libc implementations when passing a NULL pointer to %s.
>
> How do you reproduce this segmentation fault? Surely someone would have
> hit this if it were a real problem given the Fixes tag? Or is this a
> corner case?

I tested printing NULL with printf locally and confirmed that it does
cause issues. In my opinion, this problem is more of a corner case=E2=80=94=
I
identified it through static program analysis and have not yet
reproduced it in practice.

>
> > This patch adds a check to ensure 'def' is not NULL before printing.
> > Additionally, it removes the redundant re-initialization of the 'line'
> > buffer inside the !sym_is_changeable(sym) block, as it is already
> > initialized at the beginning of the function.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Xingjing Deng <micro6947@gmail.com>
> > ---
> >  scripts/kconfig/conf.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> > index a7b44cd8a..2771bc84e 100644
> > --- a/scripts/kconfig/conf.c
> > +++ b/scripts/kconfig/conf.c
> > @@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const =
char *def)
> >       line[1] =3D 0;
> >
> >       if (!sym_is_changeable(sym)) {
> > -             printf("%s\n", def);
> > -             line[0] =3D '\n';
> > -             line[1] =3D 0;
> > +             printf("%s\n", def ? def : "");
> >               return 0;
> >       }
> >
> > @@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const =
char *def)
> >       case oldconfig:
> >       case syncconfig:
> >               if (sym_has_value(sym)) {
> > -                     printf("%s\n", def);
> > +                     printf("%s\n", def ? def : "");
> >                       return 0;
> >               }
> >               /* fall through */
> > --
> > 2.25.1
> >

