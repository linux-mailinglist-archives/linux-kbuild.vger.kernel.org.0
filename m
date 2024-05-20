Return-Path: <linux-kbuild+bounces-1892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F518C9A27
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D40280F2A
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6501BC57;
	Mon, 20 May 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jxya2naQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022A225A2;
	Mon, 20 May 2024 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716196253; cv=none; b=oIgk2VQkm82xL/7+EnJwHw3akjm5L6GVPEDx56QV7R/SFbxFzLMKLH2i20LFHxWPcLAWBjAJBMVoK2+d/jkTjlJ1GrFd5sl4yQp79h9qQTn/ttlDvBHJvCzeCER27Sq8fLneqeqZOBqJa/lVSkGGRefhklZ+T2E80oDGc4v+1qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716196253; c=relaxed/simple;
	bh=Q6sy/yqBnxAOXD0xKfmyxs8rg9J9ax7DDH/hoUyv8dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuYZm5cecs9rhmJqYvIQaqNwEaJpiTe9XsZ0t7Glh+cMO1AU3Cb0IjoxL49JGjI1VJ91+2xq8zrUyXmCW+g3mrHpbG+wUo2i1Lrae5F5PM24y1tpHju7IAy0st9wmbMkvh/cOJb8LLG/czJd3JsU+2SXDk8JImhQjyQbao9TH24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jxya2naQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1B5C2BD11;
	Mon, 20 May 2024 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716196252;
	bh=Q6sy/yqBnxAOXD0xKfmyxs8rg9J9ax7DDH/hoUyv8dE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jxya2naQ4Xwkob+emV7Cr87GqmvNOzNljndPvUvyYazmmjsbdZFraHzpp9BTBULST
	 zHJfrWf+QMuA9Au83I4g3WZ08z09yMEo/rIujDs/5qdMDuGymr/iWOQphOytFkl4i2
	 v6LP8Noyttmal7gDKJWkNywY8MJX2jk1wYoq1zqxsdZnK+fo1xv/P+bJy7sUtoAXvy
	 EiZNxx4edm55w5xfVPh0XMdVbnOFxnh7yI+Lx1t44N9B5mVUEkRUQRC/E7SDssp/YV
	 7daXNwJs2aWfijHMAHGFTXUBPSwHJ8eEG2QQQsWsr2vDow2D65qczQysrskQz3NNS1
	 WI54i+SOHBOag==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso4352316e87.1;
        Mon, 20 May 2024 02:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw2PVJFPrL/umE2XUbPL/zN+1l3Q/XP7JF+qUr9thJGt6qRtcDZy1RS3GYoEMsSffZkptgG0o9jd58Jem8OFXMhrsjuZQCsSkAkGvCo8s93uVGteG6LgmqW9xF0OF8vvkJWRXyzuVbw6LA5sdGTlXFM6gGBe5Nm96v52HYp6EJFpEiQHW6BG/w9JSXBGicdw==
X-Gm-Message-State: AOJu0Yzx4r26wUfoKAu2ohx2qgbtBUaMx1xtg6gNKmGRLNm0SAwV6tn6
	pthG3a9ujA4PSCMjgdpn9Le2MG3pTbeUqE1cKpxOZrU/JWz/sR5+j94R1tt6rRzc0y8zEw+yD1V
	v8V6k8k8RcBdO3WuG54fDaUQ9kNk=
X-Google-Smtp-Source: AGHT+IEKE4eyaPfrutTX+d/MXvf7QvyTt/qFeBHwJCBN7jwuSH6tb83TRukvAJxG5rCDz3nkfHwne6d8il/jkzqejrA=
X-Received: by 2002:a05:6512:10cb:b0:521:b333:743d with SMTP id
 2adb3069b0e04-52331e202b9mr25479235e87.14.1716196251138; Mon, 20 May 2024
 02:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517042839.544650-1-kris.van.hees@oracle.com> <20240517042839.544650-7-kris.van.hees@oracle.com>
In-Reply-To: <20240517042839.544650-7-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 May 2024 18:10:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPN34CK0co+nX83e84fcK_JrSyEJAdwEJZ5uVBvTKUyg@mail.gmail.com>
Message-ID: <CAK7LNAQPN34CK0co+nX83e84fcK_JrSyEJAdwEJZ5uVBvTKUyg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] module: add install target for modules.builtin.ranges
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 1:32=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
> file should be installed in the module install location.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> ---
> Changes since v2:
>  - Include modules.builtin.ranges in modules install target
> ---
>  scripts/Makefile.modinst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0afd75472679f..f5160ddd74239 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -30,10 +30,10 @@ $(MODLIB)/modules.order: modules.order FORCE
>  quiet_cmd_install_modorder =3D INSTALL $@
>        cmd_install_modorder =3D sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $=
@
>
> -# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled=
.
> -install-y +=3D $(addprefix $(MODLIB)/, modules.builtin modules.builtin.m=
odinfo)
> +# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is =
disabled.
> +install-y +=3D $(addprefix $(MODLIB)/, modules.builtin modules.builtin.m=
odinfo modules.builtin.ranges)


This will break modules_install when CONFIG_BUILTIN_MODULE_RANGES
is disabled.

modules.builtin.ranges should be added to install-y conditionally,
like this:




# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
install-y +=3D $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modi=
nfo)

install-$(CONFIG_BUILTIN_MODULE_RANGES) +=3D $(MODLIB)/modules.builtin.rang=
es





> -$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODL=
IB)/%: % FORCE
> +$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.=
builtin.ranges): $(MODLIB)/%: % FORCE
>         $(call cmd,install)
>
>  endif
> --
> 2.43.0
>


--
Best Regards
Masahiro Yamada

