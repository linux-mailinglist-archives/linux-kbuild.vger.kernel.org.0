Return-Path: <linux-kbuild+bounces-8068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED9B0B046
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 15:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74EF51AA549B
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 13:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A6314883F;
	Sat, 19 Jul 2025 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfz50PJ4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E61EB39;
	Sat, 19 Jul 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752931864; cv=none; b=MR63+pcDDJpbmIrO6okefmLHZXdwS7AodsJ0WA58HgjEF0VgTf1lcgpP4Q7eKNYWfexKCEGlPZb4IoI9FaQ0/tXNLdQpbP0UNBDSnsdPcFNxPVRbhObBOnSdeEpkYjvD1CbmYhHoahbgifY81yuoi4B0rqKYgsYNj8WPOuq87xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752931864; c=relaxed/simple;
	bh=z2JR3HkcpJBDNgayovbHLmEgj7dd5sLh6yvpSXE4KZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JST/IS31WmhBABMJvjGxNCmXwEI3Jrt6mA7UXM+c/bhlc+LlWbCK87gi3/O0ygSTJ3qWZQAQjeAyK12txuS1RpmM5L2GXDNk1RDcdbJJVqIovtEY5+/Rvvd+aaCUuQCGydbjEPjVn46zSxLcqyyhvEjDL1a0izVb6bWM6hEC5DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfz50PJ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB6C4CEE7;
	Sat, 19 Jul 2025 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752931863;
	bh=z2JR3HkcpJBDNgayovbHLmEgj7dd5sLh6yvpSXE4KZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cfz50PJ4JoGmdBj5RnQ0FjFa7+Z9UDHiE4ZTaNsehYrwE7mB0VBCFs6EjzM/+44Ju
	 2T9d9dxC9lMCzRgVmTLhFWsFTRP/Zx72o53xtzf9MD9uIdOXOsgrms00kyFhjMyjF9
	 dCt5vNfkbDJ6T7xG27OUdJ6mqWPYKXRxvihnwN/cg6VuAzQ4wRd7IFCGX1IFoBZOEU
	 P6o+nNg9AmKZbaY3GE0UGG3nrK++IbauHEWhg9xK3y+AJDbVVyDdFFIW4aSyDQg4J2
	 OxU4i6SQi4Ejm4BKL8/TEvQiYvQV7QgJxqZEtcrr2yecFZ4mq1wwTA4fPD+JyFXWIa
	 P4sPhox8W8X0g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d52cb80dso3379126e87.1;
        Sat, 19 Jul 2025 06:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCYlofoc4gQpk+KTgh0lTzFVTEAVFyzCbWW9OVJJWl8mpcmH0Ow7zi5/JhFoUnJ+Spa3G8utAUpFXki0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHytO915wSg4bClGErMhDnuFclrvoeSjNNxhGUOvf+7fIXv4+s
	5f8eewddqgOtJav/Jq07EXXWm1t2XPwaotM0G1ItXv88SbBw4HB4z+ZS4wm+jxa5+FB8F5KLwHZ
	OJWB+PwIPH+uw7I+cOyNn5gXnAHTZZyw=
X-Google-Smtp-Source: AGHT+IEkD87TyBxn2cchD8cExvn8kotDaYH2D3vRnj7/THbvCknCACBFViUkNnIwXdcNdNhHMSMyQhO/euFVZbTyFD4=
X-Received: by 2002:a05:6512:318a:b0:553:268e:5011 with SMTP id
 2adb3069b0e04-55a2fe889e6mr2135208e87.26.1752931862489; Sat, 19 Jul 2025
 06:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <571ac74b-f632-44f3-ae62-730717bf4465@infradead.org>
In-Reply-To: <571ac74b-f632-44f3-ae62-730717bf4465@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 19 Jul 2025 22:30:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com>
X-Gm-Features: Ac12FXwRLYiEtbgcWcdG5ao7qP0r12HnepojmY5bZJlrfTXcBlJMcq7lToi2mOA
Message-ID: <CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com>
Subject: Re: [BUG linux-next] nconfig: uncleared lines of text on help screens
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 5:31=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
> If I revert
>   commit 1b92b18ec419
>   Author: Shankari Anand <shankari.ak0208@gmail.com>
>   Date:   Thu Jun 26 00:36:54 2025 +0530
>     kconfig: nconf: Ensure null termination where strncpy is used
>
> this problem goes away.
>
> When using F1, F2, or F3 (Help, SymInfo, or Help 2), short lines
> of text are not cleared (blanked, space-filled).

Indeed.
This is a bug introduced by the following change:


diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 4bfdf8ac2a9a..475a403ab8ba 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
                const char *line =3D get_line(text, i);
                int len =3D get_line_length(line);
                strncpy(tmp, line, min(len, x));
-               tmp[len] =3D '\0';
+               tmp[sizeof(tmp) - 1] =3D '\0';
                mvwprintw(win, i, 0, "%s", tmp);
        }
 }


The original code already null-terminates the buffer.
This part should be reverted.






> Example F1:
>
>   =E2=94=8C=E2=94=80=E2=94=80 Global help =E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>  =E2=94=8C=E2=94=82                                                      =
                    =E2=94=82=E2=94=90
>  =E2=94=82=E2=94=82 Help windows                                         =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 ------------                                         =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 o  Global help:  Unless in a data entry window, press=
ing <F1> will give `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82    you the global help window, which you are just rea=
ding.F1> will give `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82    you the global help window, which you are just rea=
ding.F1> will give `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 o  A short version of the global help is available by=
 pressing <F3>.ive `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 o  A short version of the global help is available by=
 pressing <F3>.ive `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 o  Local help:  To get help related to the current me=
nu entry, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82    of <?> <h>, or if in a data entry window then pres=
s <F1>.y, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82    of <?> <h>, or if in a data entry window then pres=
s <F1>.y, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82    of <?> <h>, or if in a data entry window then pres=
s <F1>.y, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 Menu entries>, or if in a data entry window then pres=
s <F1>.y, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 ------------>, or if in a data entry window then pres=
s <F1>.y, use anye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 This interface lets you select features and parameter=
s for the kernelye `=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 build.  Kernel features can either be built-in, modul=
arized, or removed.`=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 Parameters must be entered as text or decimal or hexa=
decimal numbers.ed.`=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 Parameters must be entered as text or decimal or hexa=
decimal numbers.ed.`=E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 Menu entries beginning with following braces represen=
t features that.ed.`
>
>
> Example F2:
>
>      =E2=94=8C=E2=94=80=E2=94=80 Sysfs syscall support =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>  =E2=94=8C=E2=94=80=E2=94=80 =E2=94=82                                   =
                                =E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90
>  =E2=94=82   =E2=94=82 CONFIG_SYSFS_SYSCALL:                             =
                =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82 CONFIG_SYSFS_SYSCALL:                             =
                =E2=94=82    =E2=94=82
>  =E2=94=82 [ =E2=94=82 sys_sysfs is an obsolete system call no longer sup=
ported in libc. =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82 Note that disabling this option is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82   =E2=94=82 compatibility with some systems.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [ =E2=94=82 compatibility with some systems.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82 If unsure say N here.me systems.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 < =E2=94=82 If unsure say N here.me systems.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82 Symbol: SYSFS_SYSCALL [=3Dn]stems.is more secure b=
ut might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 -*=E2=94=82 Type  : boolS_SYSCALL [=3Dn]stems.is more secure b=
ut might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 -*=E2=94=82 Defined at init/Kconfig:1600ems.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82   Prompt: Sysfs syscall support.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [ =E2=94=82   Location:ysfs syscall support.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [*=E2=94=82     -> General setupall support.is more secure but=
 might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [ =E2=94=82       -> Sysfs syscall support (SYSFS_SYSCALL [=3D=
n])might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 -*=E2=94=82       -> Sysfs syscall support (SYSFS_SYSCALL [=3D=
n])might breakbc. =E2=94=82    =E2=94=82
>  =E2=94=82 [ =E2=94=82       -> Sysfs syscall support (SYSFS_SYSCALL [=3D=
n])might breakbc.
>
>
> Example F3:
>
>  =E2=94=8C=E2=94=80=E2=94=80=E2=94=8C=E2=94=80=E2=94=80 Short help =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=E2=94=80=E2=94=80=
=E2=94=90
>  =E2=94=82  =E2=94=82                                                    =
                  =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Legend:  [*] built-in  [ ] excluded  <M> module  < =
> module capable. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Submenus are designated by a trailing "--->", empty=
 ones by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Submenus are designated by a trailing "--->", empty=
 ones by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82  =E2=94=82 Use the following keys to navigate the menus: empty=
 ones by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Move up or down with <Up> or <Down>.he menus: empty=
 ones by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Enter a submenu with <Enter> or <Right>.enus: empty=
 ones by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82 <=E2=94=82 Exit a submenu to its parent menu with <Esc> or <Le=
ft>.s by "----".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Pressing <y> includes, <n> excludes, <m> modularize=
s features.---".. =E2=94=82  =E2=94=82
>  =E2=94=82 -=E2=94=82 Pressing <Space> cycles through the available optio=
ns.eatures.---".. =E2=94=82  =E2=94=82
>  =E2=94=82 -=E2=94=82 To search for menu entries press </>.vailable optio=
ns.eatures.---".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 <Esc> always leaves the current window.ilable optio=
ns.eatures.---".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 <Esc> always leaves the current window.ilable optio=
ns.eatures.---".. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 Pressing <1> may be used instead of <F1>, <2> inste=
ad of <F2>, etc.. =E2=94=82  =E2=94=82
>  =E2=94=82 [=E2=94=82 For verbose global help press <F1>. <F1>, <2> inste=
ad of <F2>, etc.. =E2=94=82  =E2=94=82
>  =E2=94=82 -=E2=94=82 For help related to the current menu entry press <?=
> or <h>.>, etc..
>
> --
> ~Randy
>


--=20
Best Regards
Masahiro Yamada

