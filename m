Return-Path: <linux-kbuild+bounces-3044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB738954B4A
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 15:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776D71F2322C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 13:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91331B9B2A;
	Fri, 16 Aug 2024 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7laNA1X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94F1E505;
	Fri, 16 Aug 2024 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723815881; cv=none; b=QMYvTLuOiLtxxCe72PRs00ftAvXg8AJZFm8tt59RXYNcLqNet7WxU4YT19GG5B3t7hnBkb5yfudAbSMqPiT/yMNTN8JNOuS88u2c5Bg2M0ZgxE/j9zIzgdeEG54YAoA7ASNL2GxNbL0izx9X9jLU9pZ1m3KdiswjTeRwFQUFwq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723815881; c=relaxed/simple;
	bh=roAxAutJoDM1gQ/YJzPTuf+rYoecpVbPHr4RzCImtxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPmcNewZeR8TIMD8gl3A4EDJQumc5nNlAjQph94w9VnlG9UQbuJsJFUyZbuLALOJ3pVepoOqXts4yIH9CWKDcfbT8+jy8NqX+pzz8vFOnw06RXKJLVp7lOw81WTFM/qoNuTF2dKNRNSVdaq4+MvAbhGKG9CGNRXRMkEf5XKXbv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7laNA1X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3674DC4AF0D;
	Fri, 16 Aug 2024 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723815881;
	bh=roAxAutJoDM1gQ/YJzPTuf+rYoecpVbPHr4RzCImtxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M7laNA1XA0aW9bw7dGpAYd+l4sv4Y5QWCLNYsUVraZkNlaSgwg6YFbUz8FYFLnjzd
	 TkK62kJ6BvQwIhF9AyY5jMUukvDCnRrH7yH3XOGZeHiF/W/6uYAMfJHwkJJz24kfb+
	 fAO8Siv3Otjjb8iVOdxQEZP/CJTPKhqNFvHoGcrc28NlqPq51tUx1YXVyv0hCMR0Ip
	 3uUgqxrIZ6TyYaQ/iPu4NSN0AFNva07JPAPT8Pc2ITSs8EEkrQu3BY6N2xOFEIv0+Y
	 OV2WH+YQ8V+huQ7acsehJl45+cwTddX5KJrzEZ4O+v2vVsFLOzXTsCyaa/IW0XPeVu
	 wDbeazRdoB1OQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so4455678e87.0;
        Fri, 16 Aug 2024 06:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoqQWTOxfoX0Qz6Q6fmpkrClgSBMyFoj4q9jawN41IWPz0qnjNl1B6HMQ4E+KZlMNKegJO4ojxIMC6lWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXYNaq1FpHWrdMsI0vgNZxMuOwHauMfk1WkZgxt2s9r9GzjzQ
	TzJMbYR18Vpdr/b77/dtq60PR36J2gNMt+BV4sSSarp/788zKGxWyJ1v0PniL/sYa6dC+q1rO3t
	kYyTXqJ1mzcoPu/keyV1HNhawDJQ=
X-Google-Smtp-Source: AGHT+IE9wrXCU6SfYZ9XXSShwmTR0vNvB0WwCqxOTVnaL5B5PesPOFCLVcCiOTn13fhuugeJ+fgstLS2DWNdxrtNd0E=
X-Received: by 2002:a05:6512:1081:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-5331c61c94dmr2910922e87.0.1723815879518; Fri, 16 Aug 2024
 06:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812144542.2121342-1-masahiroy@kernel.org> <20240812212256.GA3675407@thelio-3990X>
In-Reply-To: <20240812212256.GA3675407@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Aug 2024 22:44:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARscy9jcJwnxFEqYFkKekzkN1Sw8d7XMkT1y3a3EGpjHg@mail.gmail.com>
Message-ID: <CAK7LNARscy9jcJwnxFEqYFkKekzkN1Sw8d7XMkT1y3a3EGpjHg@mail.gmail.com>
Subject: Re: [PATCH] modpost: simplify modpost_log()
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 6:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Masahiro,
>
> On Mon, Aug 12, 2024 at 11:45:39PM +0900, Masahiro Yamada wrote:
> > With commit cda5f94e88b4 ("modpost: avoid using the alias attribute"),
> > only two log levels remain: LOG_WARN and LOG_ERROR. Simplify this by
> > making it a boolean variable.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/mod/modpost.c | 17 ++++++-----------
> >  scripts/mod/modpost.h | 11 +++--------
> >  2 files changed, 9 insertions(+), 19 deletions(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index d0f138803207..c896872862dc 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -67,20 +67,15 @@ static unsigned int nr_unresolved;
> >
> >  #define MODULE_NAME_LEN (64 - sizeof(Elf_Addr))
> >
> > -void modpost_log(enum loglevel loglevel, const char *fmt, ...)
> > +void modpost_log(bool is_error, const char *fmt, ...)
> >  {
> >       va_list arglist;
> >
> > -     switch (loglevel) {
> > -     case LOG_WARN:
> > -             fprintf(stderr, "WARNING: ");
> > -             break;
> > -     case LOG_ERROR:
> > +     if (is_error) {
> >               fprintf(stderr, "ERROR: ");
> >               error_occurred =3D true;
> > -             break;
> > -     default: /* invalid loglevel, ignore */
> > -             break;
> > +     } else {
> > +             fprintf(stderr, "WARNING: ");
> >       }
> >
> >       fprintf(stderr, "modpost: ");
> > @@ -1692,7 +1687,7 @@ static void check_exports(struct module *mod)
> >               exp =3D find_symbol(s->name);
> >               if (!exp) {
> >                       if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_=
REPORTS)
> > -                             modpost_log(warn_unresolved ? LOG_WARN : =
LOG_ERROR,
> > +                             modpost_log(warn_unresolved,
>
> I think the logic is reversed here? If warn_unresolved was true before,
> LOG_WARN would be used but I think warn_unresolved being true with this
> change would trigger the behavior of LOG_ERROR. Should it be
> '!warn_unresolved'?


Thanks, I will fix this in v2.




>
> >                                           "\"%s\" [%s.ko] undefined!\n"=
,
> >                                           s->name, mod->name);
> >                       continue;
> > @@ -1715,7 +1710,7 @@ static void check_exports(struct module *mod)
> >                       basename =3D mod->name;
> >
> >               if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
> > -                     modpost_log(allow_missing_ns_imports ? LOG_WARN :=
 LOG_ERROR,
> > +                     modpost_log(allow_missing_ns_imports,
>
> Same thing here?
>
> Alternatively, I suppose the logic could be reversed in modpost_log()
> and is_error could be turned into no_error or something?
>
> >                                   "module %s uses symbol %s from namesp=
ace %s, but does not import it.\n",
> >                                   basename, exp->name, exp->namespace);
> >                       add_namespace(&mod->missing_namespaces, exp->name=
space);
> > diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> > index f756e6578b9e..6f418f0afd04 100644
> > --- a/scripts/mod/modpost.h
> > +++ b/scripts/mod/modpost.h
> > @@ -184,13 +184,8 @@ char *read_text_file(const char *filename);
> >  char *get_line(char **stringp);
> >  void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
> >
> > -enum loglevel {
> > -     LOG_WARN,
> > -     LOG_ERROR,
> > -};
> > -
> >  void __attribute__((format(printf, 2, 3)))
> > -modpost_log(enum loglevel loglevel, const char *fmt, ...);
> > +modpost_log(bool is_error, const char *fmt, ...);
> >
> >  /*
> >   * warn - show the given message, then let modpost continue running, s=
till
> > @@ -205,6 +200,6 @@ modpost_log(enum loglevel loglevel, const char *fmt=
, ...);
> >   * fatal - show the given message, and bail out immediately. This shou=
ld be
> >   *         used when there is no point to continue running modpost.
> >   */
> > -#define warn(fmt, args...)   modpost_log(LOG_WARN, fmt, ##args)
> > -#define error(fmt, args...)  modpost_log(LOG_ERROR, fmt, ##args)
> > +#define warn(fmt, args...)   modpost_log(false, fmt, ##args)
> > +#define error(fmt, args...)  modpost_log(true, fmt, ##args)
>
> I suppose the declaration of modpost_log() is close enough to see what
> the true/false argument means but maybe something like
>
>   modpost_log(/* is_error =3D */ false, ...)
>
> could be nice? No strong opinion here though, feel free to just ignore
> this whole comment entirely if you disagree!
>
> >  #define fatal(fmt, args...)  do { error(fmt, ##args); exit(1); } while=
 (1)
> > --
> > 2.43.0
> >



--=20
Best Regards
Masahiro Yamada

