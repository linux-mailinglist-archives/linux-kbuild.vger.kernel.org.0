Return-Path: <linux-kbuild+bounces-1839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AA8C3FF5
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 13:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB201C2295C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 11:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659EF14D28E;
	Mon, 13 May 2024 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/lTEuvD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EC2E3E0;
	Mon, 13 May 2024 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600366; cv=none; b=fZqohm9BVsiaSZsxTBs3OtMombDQkPKzQeR3g6JhYKAQfiZBU9XwYs7WDnWhDsQmuTSZmBsumShc+u4gi5geeHxDh2Fw2q73aOayzsJyVxkN+Cykp710vr5vYGjgJuitSuqOLJSOnA82CpJFWsk6h6bf2bptDSEfki32RDX7fok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600366; c=relaxed/simple;
	bh=ON82PcOIJ17yAE+if6E90kpxCqFKRm2qSDV0U9CSHU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOyBb1mef++blVPMOU4Gpp2Xg78AHARrQgfIjoCShtNw5m9R1kCD+DzpAHcQR6fA/Zgr0uFHG3ieHwAw8j2r2i3nZA8yIYdv0n1o9LobwLjYDs6lBlQ2MX1kze+NpnzsC1QBcQmkqcoxxOd3GP8GP623NJP1hGpN4QFe/66suFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/lTEuvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BDBC113CC;
	Mon, 13 May 2024 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715600365;
	bh=ON82PcOIJ17yAE+if6E90kpxCqFKRm2qSDV0U9CSHU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U/lTEuvDd5+4MGu/pjy5sV+RuxIkPABba4eA3eXP5hfE0e3G/3uoP2D2HiPw3GRc8
	 yJ5XRB0mG9wP+Fesu8wBlrrbDxwIoJTHSM8HP3lLcryKXTQxJrXAu/o5t4W1LSbc00
	 77S7T6h80GvK/8kvfxR9g9zqh03GRmCf+9hw+oK6ggCa3k0K6IVXee/Sgjo3PikWY5
	 Dv+lo3VSUU3xYDMIjeHGpjhWuy2dpkgYjsyzy2OaJkW+eUCim3uB8C6nNBLa2VaqQ4
	 righvX+sxKUwIlTp6YA60DU8uvQL7qKYvQ93ou35Wy1DUiW0rM0obMX4R9NOaIdg+L
	 jte4f0soRxqsA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f12ccff5eso5775989e87.1;
        Mon, 13 May 2024 04:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfk6zyB3Puv9DDlxSSx7aqP/V/qDS0zuisWPHa2MgsVd79l7ioMqmUcYOatg9SRuZxvyjABYaTiLvnRxMGHGZgCAW4r6LqL2OucYV/7b5kKxvGHEJtMCweHFowTWo/tqI4ddn7Y+gBjegv8SIFb402U4AFpB4yYgeERHI0ipJDtvNvUP5dGRq5iW9SjB0c8A==
X-Gm-Message-State: AOJu0Yzi5A7FbK2oezql9ipfH7xk5bc9dsgG84MK59PIIiZ/I6dvFAqt
	rbUWAf2HV9GynuFl9+MHIO/vucg3oxMhQy5DBfknBzzIrB3ZfdGpMesZMedJEDrwzoQwqrf/dhw
	sVk5kzTW51JKXZgmJUw+WThdN2BE=
X-Google-Smtp-Source: AGHT+IHRBvVSXUmpIhtBu+KS2rLxAsXnEq0xpczjBPmn3Adz7IitLwoCbrBvsJJywoMxWgerm1TWuN7si0tRvxzuqBc=
X-Received: by 2002:ac2:46ec:0:b0:516:d259:245e with SMTP id
 2adb3069b0e04-5220ff72105mr6636636e87.9.1715600364501; Mon, 13 May 2024
 04:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
 <20240511224035.27775-7-kris.van.hees@oracle.com> <CAK7LNATFx=iJHH=LDPOJBdYo47r5OOMKhnnzTTROedVBWZ5hzA@mail.gmail.com>
In-Reply-To: <CAK7LNATFx=iJHH=LDPOJBdYo47r5OOMKhnnzTTROedVBWZ5hzA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 May 2024 20:38:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_vJfodvnhAA9O72sTWY_z+QZoeNPy8Gkfs7k5sKkN9A@mail.gmail.com>
Message-ID: <CAK7LNAR_vJfodvnhAA9O72sTWY_z+QZoeNPy8Gkfs7k5sKkN9A@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] module: add install target for modules.builtin.ranges
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 2:22=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sun, May 12, 2024 at 7:59=E2=80=AFAM Kris Van Hees <kris.van.hees@orac=
le.com> wrote:
> >
> > When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.range=
s
> > file should be installed in the module install location.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > ---
> > Changes since v1:
> >  - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
> > ---
> >  scripts/Makefile.modinst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index b45586aa1de49..e185dacae892a 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -36,6 +36,11 @@ install-y +=3D $(addprefix $(MODLIB)/, modules.built=
in modules.builtin.modinfo mod
> >  $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo module=
s.builtin.objs): $(MODLIB)/%: % FORCE
> >         $(call cmd,install)
> >
> > +install-$(CONFIG_BUILTIN_MODULE_RANGES) +=3D $(MODLIB)/modules.builtin=
.ranges
> > +
> > +$(MODLIB)/modules.builtin.ranges: modules.builtin.ranges FORCE
> > +       $(call cmd,install)
> > +
>
> Why add this to $(addprefix ...) part?


I meant, why don't you add this to $(addprefix ...)



Like this:


$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo
modules.builtin.ranges): $(MODLIB)/%: % FORCE
        $(call cmd,install)






--=20
Best Regards
Masahiro Yamada

