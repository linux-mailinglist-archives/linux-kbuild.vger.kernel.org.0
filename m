Return-Path: <linux-kbuild+bounces-7248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90BAC2BF0
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 00:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E072F4E7A24
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 22:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065947482;
	Fri, 23 May 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JX+E/04f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAE19CC28
	for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041015; cv=none; b=ZnO2hfK4Z2aJ5EaoBTCdiMYxb8pce4KAJDBqrd2fDkoI/02e29iQtZb3h06Vlcg6DoRhAVkIV5ssOfQVJzS7UpoiC+CVydpe7bZ0rrve7q3pAyB9KCZSCMcI8Tn3I7sYW0dBCkYtzwIs54+mii0Z57gEyd+jMLQ0FXaj0KqmHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041015; c=relaxed/simple;
	bh=dntSCcQiLzCRhumjJj/CO4eZXWWAP+HHfr/0SBpYju0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0ipxJO37H5lE3DpV2+yM4V0rhm7zPbHcjJfOedt8pHtBZGN58yapwf0FQWTW/TE9ey++zRfih+lM3WvHiyd3D6IlhEzHFqEHXw8CVU3ofyHlXfyMHW+GqKqPFYvqoEiAMVRxHRwksrgcpSM6TK4q3kdI9adcS5xNp7i1NuPIrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JX+E/04f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acbb85ce788so56653466b.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 May 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041012; x=1748645812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhRe9Ol2fvQjWsyXrHmDNwPTO2nfCPdRJOsATdvROa4=;
        b=JX+E/04fEHhTx0yYdujdjt5SzDJxvORUR+ITbDGwOD88GzKL7xj1Xxcec6fbIl3RgQ
         RA7KArgCzK1F7P65XFRZrfffAC/eTW7MM4EUOUUpSfn6vmhCgbD//1s0zeUtbDc/YJpd
         inIpuR7ajt+tsThn/Fr4qNfM15ojPYtMcm06L21fgJHN6BHicTVIbBWIdo0BP/bCTRxd
         YbmovqjGpvyXOaiBEcoLxTJk0zVS5efPSEznOxadSFvuaJ3oOIXWy6dzZUfKNJs8wOvq
         +UTXuOvAu5Bc282PiQ1dn9+F8uCjqXSDtZ57F2yZYhpe2VIUOopy9jtZdOWqk/g9C6ru
         S6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041012; x=1748645812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhRe9Ol2fvQjWsyXrHmDNwPTO2nfCPdRJOsATdvROa4=;
        b=AvVc9hVTu345BhuaplIIKap53oY+duMt78eMJWSJR77hvTwtD5Y+zKJLhmdyaTJw2I
         f5BDRBtV3ZeSWtruhsjbiGZttOCbceVRwi53jnZFkvfh2NVHyBtRXdy538059Oe/mzkB
         pYHyVeC89lZfLkTlCy2noRDtlZWdlH7eAfL6VCuuXPGt2hmzH5gd3ynEDMof4954XW4d
         +BTasJoP33BTb9OGRU2rV182zIiOyU7YVzw8IJbg4uMdyc6CxFSmfk8vgL9v8dOHFIkq
         ufx7MAyWO9QCk4zOnPr0d3Yvc93dfFj0LKM9MszkcYtT0K8ttFw51hmRD8hFRRMhhAQW
         qFGw==
X-Forwarded-Encrypted: i=1; AJvYcCUBMtBF7s2fByHFoCWr15qOt2+A8Vzt5VRYq7px3JUiGOLtYyjlLDEZZzen3R4rKqv5+SZxTnCZE5ASb7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOZcgi1THG+Mhmq7pGShm6kXL4XehFSsvNdtvUpeu/72YPnHr
	GmM3pUffnzFjml5r2NBXwdkMXPQUqwwQCpPiWaUVMRzl45t2SveUdaCg7iRc3g/lsHtb6K261ia
	dGLbGvOAh+lGg6AY4p8F5ukbr685oL5F9m6tOlyY=
X-Gm-Gg: ASbGncuSM59uxgLrdK4N2Afn5qiIhZ/v9VJI4Zu8O8T9X8GHjb5YtfyIdu8BAuxS7YX
	c2aM1wtkbKAVA1hGsh0RG81STujIE+eAGMc8Rf1hA0yXejnXNIvmllTF/9M0UjdAo18B0c1FXDX
	lCrt5xS35nOfwdMg9t/jPmTYvzcHFABT8f0RH/BoH6
X-Google-Smtp-Source: AGHT+IF1oqxF84vSiDek+wWYXJgJTFh3bBC2O4MVq/PYB7ozhDL5yfg2J+dKsqh1ivdx69/cg1PUCYLwhGnkdKh0RM8=
X-Received: by 2002:a17:907:c26:b0:ac7:16ee:9112 with SMTP id
 a640c23a62f3a-ad85ae09b3fmr87016266b.0.1748041012455; Fri, 23 May 2025
 15:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
In-Reply-To: <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 15:56:36 -0700
X-Gm-Features: AX0GCFu4cXD2lDKj-K_F6rPvyyDIMrdsBz0CFHo0hkeu0M6YSBsNc1WSDxFl1as
Message-ID: <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:16=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 5/22/25 5:07 PM, Bill Wendling wrote:
> > The call to 'prop_get_symbol' may return NULL in some cases. The if-the=
n
> > statement accesses the returned value without checking if it's
> > non-NULL. After inlining, the compiler may treat the conditional as
> > 'undefined behavior', which the compiler may take the opportunity to do
> > whatever it wants with the UB path. This patch simply adds a check to
> > ensure that 'def_sym' is non-NULL to avoid this behavior.
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  scripts/kconfig/symbol.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index d57f8cbba291..9c5068225328 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choi=
ce)
> >   if (prop->visible.tri =3D=3D no)
> >   continue;
> >   def_sym =3D prop_get_symbol(prop);
> > - if (def_sym->visible !=3D no)
> > + if (def_sym && def_sym->visible !=3D no)
> >   return def_sym;
> >   }
> >
>
> The patch is missing the source file's indentation.
> (spaces/tabs are lost)
>
Crud! My mailer borked. I sent v2 and it looks to have kept the whitespaces=
.

-bw

