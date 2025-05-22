Return-Path: <linux-kbuild+bounces-7214-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35777AC0407
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 612491B641C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 05:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BA1188580;
	Thu, 22 May 2025 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUPdWyGb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D864D;
	Thu, 22 May 2025 05:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892000; cv=none; b=HFQtD1bXehPLBEiG9f/y4j8Sh+bMaxAQ7IeVwwgZvVobhmj3NuUSBmgIO4dW0nLbK1sSDK/1fHaUWoM8eFPKA3oo5tdm4rit+WPpSXTH64r89rgC4K8+Q6WTUdGmeoU9cvl8CF373C8JjJUUeWyBAlaeeM6LpQrhFbb9yRVEicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892000; c=relaxed/simple;
	bh=P24lbx1zgSXstAP68/dvihvlSpdqP8saTMnnzUeHzks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbsGWxVMbTmL7yxy/WZgJ0lccyEB35rY24/YtsqjJbebfAM0fyO/F+GNJFWStqoXTIFXAi88iVy9M9UKF8a3PSQ4L2nD4lGR3I5yFU+4JuTeFalxtrHK22c7wc8yey8o2IngLLk5BlDlLuy66EP7mfTCXrBnxIkLmmvuI2KK7j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUPdWyGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC91C4AF0D;
	Thu, 22 May 2025 05:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747891999;
	bh=P24lbx1zgSXstAP68/dvihvlSpdqP8saTMnnzUeHzks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nUPdWyGb3LvlLl+r0+6L07iTbKEPBDhKmvTNTKqqInxT4D1mbnWgeOh3SMlSqswmK
	 I95SSXEkzyl6MDGk196qAES8rb+sGH3Ru7AG+5urxqr17Y7ycBxaOvIEBQyMNsKxLy
	 s/Ncgr04/cTseg4dbMeDLV8YwQV04Iz+bqj4uBZs+ANZL3nbZA84d8GSPD0YB0HPDi
	 ILzMQosQBo8TNsfKIvrXhg9E0A8M//BsSIpdaVxdZ0iBvC6TSIBnshq/7XeLn6Hmzz
	 /ezmmKFUHTcdi9G9hiFlT+vvaLD76w5hhaDGJtgfM/X1RKB8R1Abcnk6lPxQMWZ19K
	 zoQojH8WhWyFw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso9077969e87.3;
        Wed, 21 May 2025 22:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe/S3jjk3OmGMyxfgpRx9+09Q1haotKJK3tcaXalvY4+hztiiDloy6FELrn03/bShV51jkZI82Uj26wvlw7A==@vger.kernel.org, AJvYcCVZcuZ+QUX8OqDY8aePd9wlOwinP+PyWX77DvI7meNumoGunlAJpSK7DsKT8AOQW9jl2/Q4sV/faT6sMZ+j@vger.kernel.org, AJvYcCX+qGhibwdelQPg0Y08HMHFSw8cHU9BO1A6MbEt5Kp5GiE+gGe0qFEuurKFFJHDbM1mQ3Kpz0KSBdKtAb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS3sz28PvYivgPHr+iLzWg3IM56GjuQuTatQzlgKdAA5N9cK9+
	ocYtdrxryvgFrqGz+EPKMC3kZfpVseGacHlTRkC8UBbUXS2MYvNeWT94cJjvCYF4ESp/NNo86hY
	8ssmKN51B6TDxJLpajiCcLwr+EkUP+fI=
X-Google-Smtp-Source: AGHT+IHZDqyLJOXkrXwS8eZ8I6oDLQP+Gs406Hx8xuUtIdab/wBLCO38obO2SVga2NYSJ4Jj8SVv+RPFCufccVL6kAs=
X-Received: by 2002:a05:6512:22d3:b0:551:fe53:3c8b with SMTP id
 2adb3069b0e04-551fe533f05mr2659636e87.31.1747891998020; Wed, 21 May 2025
 22:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.154517322@infradead.org>
 <CAK7LNATHQ2b3mA0rYM2vX0-6BwOEj4tU_MBQ9FNa_uZ9_q17zg@mail.gmail.com>
In-Reply-To: <CAK7LNATHQ2b3mA0rYM2vX0-6BwOEj4tU_MBQ9FNa_uZ9_q17zg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 May 2025 14:32:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASykmj0h3Tvf-XFjZYj33X0M_Wnr4ZLdtom5G5dKt8inw@mail.gmail.com>
X-Gm-Features: AX0GCFvvDrMlFoBVlFW-M_iEI03ghj4UNiRPVdSKqaRJc2Ze7WRSHeRousCmMoU
Message-ID: <CAK7LNASykmj0h3Tvf-XFjZYj33X0M_Wnr4ZLdtom5G5dKt8inw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] module: Extend the MODULE_ namespace parsing
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:08=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I think the patch subject is stale.
>
> MODULE_ was the prefix in the previous v2 series.
>
> Now, the prefix part is module:


I will apply with the subject fixed, as "MODULE_" prefix does not make
sense any more.


"module: Extend the module namespace parsing"




>
>
> On Fri, May 2, 2025 at 11:25=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > Instead of only accepting "module:${name}", extend it with a comma
> > separated list of module names and add tail glob support.
> >
> > That is, something like: "module:foo-*,bar" is now possible.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/module/main.c  |   36 ++++++++++++++++++++++++++++++++++--
> >  scripts/mod/modpost.c |   36 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 68 insertions(+), 4 deletions(-)
> >
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1083,12 +1083,44 @@ static char *get_modinfo(const struct lo
> >         return get_next_modinfo(info, tag, NULL);
> >  }
> >
> > +/**
> > + * verify_module_namespace() - does @modname have access to this symbo=
l's @namespace
> > + * @namespace: export symbol namespace
> > + * @modname: module name
> > + *
> > + * If @namespace is prefixed with "module:" to indicate it is a module=
 namespace
> > + * then test if @modname matches any of the comma separated patterns.
> > + *
> > + * The patterns only support tail-glob.
> > + */
> >  static bool verify_module_namespace(const char *namespace, const char =
*modname)
> >  {
> > +       size_t len, modlen =3D strlen(modname);
> >         const char *prefix =3D "module:";
> > +       const char *sep;
> > +       bool glob;
> >
> > -       return strstarts(namespace, prefix) &&
> > -              !strsmp(namespace + strlen(prefix), modname);
> > +       if (!strstarts(namespace, prefix))
> > +               return false;
> > +
> > +       for (namespace +=3D strlen(prefix); *namespace; namespace =3D s=
ep) {
> > +               sep =3D strchrnul(namespace, ',');
> > +               len =3D sep - namespace;
> > +
> > +               glob =3D false;
> > +               if (sep[-1] =3D=3D '*') {
> > +                       len--;
> > +                       glob =3D true;
> > +               }
> > +
> > +               if (*sep)
> > +                       sep++;
> > +
> > +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob =
|| len =3D=3D modlen))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> >  }
> >
> >  static int verify_namespace_is_imported(const struct load_info *info,
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1682,12 +1682,44 @@ void buf_write(struct buffer *buf, const
> >         buf->pos +=3D len;
> >  }
> >
> > +/**
> > + * verify_module_namespace() - does @modname have access to this symbo=
l's @namespace
> > + * @namespace: export symbol namespace
> > + * @modname: module name
> > + *
> > + * If @namespace is prefixed with "module:" to indicate it is a module=
 namespace
> > + * then test if @modname matches any of the comma separated patterns.
> > + *
> > + * The patterns only support tail-glob.
> > + */
> >  static bool verify_module_namespace(const char *namespace, const char =
*modname)
> >  {
> > +       size_t len, modlen =3D strlen(modname);
> >         const char *prefix =3D "module:";
> > +       const char *sep;
> > +       bool glob;
> >
> > -       return strstarts(namespace, prefix) &&
> > -              !strcmp(namespace + strlen(prefix), modname);
> > +       if (!strstarts(namespace, prefix))
> > +               return false;
> > +
> > +       for (namespace +=3D strlen(prefix); *namespace; namespace =3D s=
ep) {
> > +               sep =3D strchrnul(namespace, ',');
> > +               len =3D sep - namespace;
> > +
> > +               glob =3D false;
> > +               if (sep[-1] =3D=3D '*') {
> > +                       len--;
> > +                       glob =3D true;
> > +               }
> > +
> > +               if (*sep)
> > +                       sep++;
> > +
> > +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob =
|| len =3D=3D modlen))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> >  }
> >
> >  static void check_exports(struct module *mod)
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Best Regards
Masahiro Yamada

