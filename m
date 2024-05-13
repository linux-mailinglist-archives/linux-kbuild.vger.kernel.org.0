Return-Path: <linux-kbuild+bounces-1837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD28C3AF0
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 07:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AE6BB20C39
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 05:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39AA146015;
	Mon, 13 May 2024 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p06hU1cK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6F84A2E;
	Mon, 13 May 2024 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577769; cv=none; b=pCGplSlNHiFt7tzyX4wPd4IkfzNIZgCU4qM/+mxdYdSbA6oBgAO7Br4qxeuBtPjaVdV0NI/cbD6hfnlhhoArijHc6JnPK7uy+9yloUHLqa+hjU+NJiBy3U7DWUF68NZHuLJyMUc7nH8EHIaPwSR/vzSjCU5fgRs0WMjb4w4t/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577769; c=relaxed/simple;
	bh=R5edv3eTItWTaOLwF4r18UMlBImuuSZKl+iELr5SbFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+NXTmCs168gKmHEhYo+pIDGTlwHaSvr5gQfkw5eEthLyqQxJ/0a5Y91704BYzlQZ/fnuFm0nAbvdC1q4Pq/xoCWiREcTKIEtH/w96faCi/eghh7DeqLHxzihGY//bcg2E31NtcaP2lk8nSe9jYFzLDpolLaDV2lyHU2lL8Hfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p06hU1cK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EA0C113CC;
	Mon, 13 May 2024 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715577769;
	bh=R5edv3eTItWTaOLwF4r18UMlBImuuSZKl+iELr5SbFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p06hU1cKczs1w9WQUuXhHvfqS8BQpzyYpI6RVpLu/xjeYm87lmvKgC2IK1cHUjzhk
	 CyeaI7QCTqOw15obLBu/Z/xyT3MuGwG5bGGPc+uz67a5WR2dDu/j8C2k9aLd8aSjZD
	 7AZEwcTWK/MVCkhY56eDyX0dNbSYEBKXxtwG1KKMF8t8dfJwxWs0rZLAKnEGMcf++K
	 mgdBDrdqNIY1yifcawMCrYgn0iL38+5EBIvrE4xkWUtr20SlayPq5kW2d2KB3e5t9M
	 iyN3qwS6rqZs2+taVFiaWH0I7nq92Es/Jj2y1zeOTHwaVs+Q3j40IJQZD+fMYH61qz
	 8qh9srqXxGAKg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so4139163e87.2;
        Sun, 12 May 2024 22:22:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbz6bRkv5kFxsM1UuEaU9nH5r4rqDlBjzBKhfXhZaDEoBzn9swA3TK6XlF8EC8xGl/6kXI4+pdM9THhzIskmLYeYYqHNqJEk6B7h+kVlpDQ6PufLdP0CazMICdnZbUIl2ym3Sx945Zf4HgB6fZKfvn2SSV5rFlcYMeHqUcMrvX0KhL8zG48nLhkH9gQsYYlw==
X-Gm-Message-State: AOJu0Yxnjb5Ozp/5sryqTjD2H0lLItWKruIIYDAoNDwJFZx9YgAPh4GP
	ID+XPNEEvgtgIYCpXrIT//5A/5tL7HqS3wri0tR7wlXmsfKLWb9wHvdyy3eqs0bbMXslO/DG4Jc
	ieUsmalU6wa9QxwT8ZFviVrTpBWU=
X-Google-Smtp-Source: AGHT+IGNMeTGUj9gmCtDxj73uN5QYb/AJKDUlwqeAjp/0ePXKzFdRpHtutaPh2boetYym1A6BbCNzJLt6CooSG207qQ=
X-Received: by 2002:a05:6512:3b08:b0:522:2c9b:63b7 with SMTP id
 2adb3069b0e04-5222c9b648bmr5282900e87.14.1715577767722; Sun, 12 May 2024
 22:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511224035.27775-1-kris.van.hees@oracle.com> <20240511224035.27775-7-kris.van.hees@oracle.com>
In-Reply-To: <20240511224035.27775-7-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 May 2024 14:22:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFx=iJHH=LDPOJBdYo47r5OOMKhnnzTTROedVBWZ5hzA@mail.gmail.com>
Message-ID: <CAK7LNATFx=iJHH=LDPOJBdYo47r5OOMKhnnzTTROedVBWZ5hzA@mail.gmail.com>
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

On Sun, May 12, 2024 at 7:59=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
> file should be installed in the module install location.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> ---
> Changes since v1:
>  - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
> ---
>  scripts/Makefile.modinst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index b45586aa1de49..e185dacae892a 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -36,6 +36,11 @@ install-y +=3D $(addprefix $(MODLIB)/, modules.builtin=
 modules.builtin.modinfo mod
>  $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.=
builtin.objs): $(MODLIB)/%: % FORCE
>         $(call cmd,install)
>
> +install-$(CONFIG_BUILTIN_MODULE_RANGES) +=3D $(MODLIB)/modules.builtin.r=
anges
> +
> +$(MODLIB)/modules.builtin.ranges: modules.builtin.ranges FORCE
> +       $(call cmd,install)
> +

Why add this to $(addprefix ...) part?




>  endif
>
>  modules :=3D $(call read-file, $(MODORDER))
> --
> 2.43.0
>
>


--
Best Regards
Masahiro Yamada

