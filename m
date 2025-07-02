Return-Path: <linux-kbuild+bounces-7840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB48AF597A
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BC7F7B5A40
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345872D3A77;
	Wed,  2 Jul 2025 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/hgumhc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1532D3A72;
	Wed,  2 Jul 2025 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462642; cv=none; b=Ap38AswWC4twPBdmIL6z+L/OOMQKUZl7AxC1RkOibAs2sro3P1pJ4ypi6b5fchi+hyzjSec4NZuaGN2qDppc6w6fDiL+rW+3bdpTAXqa6KN337kzzt0pv7n5SxIslL9hY6ZwC+ZjNLZUhUotVNyCQHXsVDFMQGOcaz1zk5cSVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462642; c=relaxed/simple;
	bh=uBfXUdrW1hpLXfIR0aGIbcnqYvtXDq4jqr7rWsFf3uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRWYfly+G3anljJw5RmdljPpIQE2NnmrKIXq6uaAUrLAHhdmEmClClPIDA4h3bYV4Erbh3SezLEsJY+3MHXpfbL0r89npI5E/haHZJKT4lllyksLouc0bG/8t2tty1wN6WgS1PviNUDiR/f3UHZy+yxbzz7+/Kaq432VKfAnMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/hgumhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91718C4CEEF;
	Wed,  2 Jul 2025 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462641;
	bh=uBfXUdrW1hpLXfIR0aGIbcnqYvtXDq4jqr7rWsFf3uU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P/hgumhczY8JSRsinu/UpSDiGLSetO4Dh1X7AjAFnDrh3bMPOdmG1XhUKF/klP2BV
	 XLDIB2giBjsWtWftprXQv3W+6y48t/5SpXAE/v8o9/9Vn3/tNE4TeV6aolSXkMXUVr
	 /e5C9qpFGxRq8+JIAG9t0m1b0lF8meEOeqwH3Rsy+M8j6gPgm0rx3tPAzDv+2xlBp/
	 n0Hwj8lZupl2HlVdt6yQ9sEnVjjqlfSJkO6M8fJD1p0noV4tMzmRqih8ZIrbrfq00D
	 sDBg0TpXpsiz0ZJrOQM8b291iVzVwG7a1yjztWkPiD5avlqUAaDUj386R2SgMzsD2S
	 +4ZBLQfLqK9wg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b165c80cso6965070e87.2;
        Wed, 02 Jul 2025 06:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0i5mkKzyR3kCTNzmV3Fa+ir07xOy/CrElKPPcdw+V/bm8o6oKeCwBotlHsYl5OpF8QjErK0zgotBcO+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiBwp6xWSBt5K49ajEP1w8Oly4Mbpas7urlnQPhlo1AgoC6/V
	lMNoGTKU5OTbSPgRdBGnIzsvxGGQv72Ld6Mr1S/c3n3i6o94mZSO2blDxk0eVxwM/DXEiVpSwX4
	6CKlfbhFO7AWXl4BUtuiVJZhXAGZI5xs=
X-Google-Smtp-Source: AGHT+IFIX0rmQ5HWhDN0BrvcL+9eGDrmWk2w0n/Dk9eX8N0TAUG2zzcj1oGi74PmAdl+FneDvoXFX/9Zcp3PGzPoQHY=
X-Received: by 2002:a05:6512:3ba7:b0:553:5135:69fb with SMTP id
 2adb3069b0e04-5562829dd0dmr1116168e87.10.1751462640111; Wed, 02 Jul 2025
 06:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-2-masahiroy@kernel.org> <85d530f3-0c27-48e0-b09b-470c16e08004@infradead.org>
In-Reply-To: <85d530f3-0c27-48e0-b09b-470c16e08004@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Jul 2025 22:23:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASsM-1Gsw85=G3KU7x6hBAmBSn4vSHcMdoEVaaFymVeyw@mail.gmail.com>
X-Gm-Features: Ac12FXzrKh4zkjLBrJ0X7vhr05oe2kWgBXv3rKEbcuBp8YR-b8kGZJwbrI3_qVw
Message-ID: <CAK7LNASsM-1Gsw85=G3KU7x6hBAmBSn4vSHcMdoEVaaFymVeyw@mail.gmail.com>
Subject: Re: [PATCH 01/66] kconfig: set MENU_CHANGED to choice when the
 selected member is changed
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:34=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> > In gconf, choice entries display the selected symbol in the 'Value'
> > column, but it is not updated when the selected symbol is changed.
> >
> > Set the MENU_CHANGED flag, so it is updated.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Probably not related to this change (AFAICT), but I was trying to
> reproduce this problem and I cannot do it.

You can try this simple test code.

choice
        prompt "choose"

config A
        bool "A"

config B
        bool "B"

endchoice

In Full mode, open the tree and double-clock the two
radio buttons alternatively. (select A or B back-and-forth)
In the main line code, the Value column of "choose" remains "B".

After this commit, it starts to react to the change, but the fix is not per=
fect.

In the gconfig-v3 branch, this should work perfectly.




> To enable an option (any options, choice or not), I have to double-click
> on it or (sometimes, not for choice) I can use Y / N / M on the keyboard.
> When I do either of those, the value (including a choice value) is change=
d.
>
> I mention double-click only because the Help text (Information) says that
> clicking will cycle thru Y/M/N.

Presumably, this should be double-click in gconfig.
(So, the help message should be fixed.)

A single click in the "option" column is used for other functionality.
(open/close the tree item in Split and Full views).



>
> The Information also says that "dot indicates that it is to be compiled a=
s a module".
> I see more of a Dash or Hyphen or just a horizontal bar.

Right. The help message should be fixed.



>
> Thanks for reading...
>
> > ---
> >
> >  scripts/kconfig/symbol.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index d57f8cbba291..26ab10c0fd76 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -195,6 +195,10 @@ static void sym_set_changed(struct symbol *sym)
> >
> >       list_for_each_entry(menu, &sym->menus, link)
> >               menu->flags |=3D MENU_CHANGED;
> > +
> > +     menu =3D sym_get_choice_menu(sym);
> > +     if (menu)
> > +             menu->flags |=3D MENU_CHANGED;
> >  }
> >
> >  static void sym_set_all_changed(void)
>
> --
> ~Randy
>


--
Best Regards

Masahiro Yamada

