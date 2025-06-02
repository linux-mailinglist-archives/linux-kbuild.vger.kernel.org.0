Return-Path: <linux-kbuild+bounces-7335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A4CACAA15
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 09:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1459189C05D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 07:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590E19DF9A;
	Mon,  2 Jun 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="addjUGgl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9B5BAF0;
	Mon,  2 Jun 2025 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850602; cv=none; b=Lueqa7JWL+BzGVbgN2ckp1OEN7E1x3V5lqLjBpneOyS10oVOTgOGule1Ve29TM7+knUmQvq2eGspzuCErd69myR+4cXNb5J/CD5INoOWV5mQ8jMfFJF7ssUB33rhmIneVwfSJ3o2VLikYRhr4GotSRL+5bwsq3rn7SRH/XYpclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850602; c=relaxed/simple;
	bh=d//H++7exyPSMnan9RFSD5d4qCZ3guc6sNey20DU/Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+26ssMJJkUyrSTwcdwzGABThazi2TWw6W8hR93+DDFD5ZRtQfb7HpQNG1h+P+WxuwP1UJohxDCuhjsBjoIcShhvU6PaH7HmCFDijdDmNUnYtf3/OvhRoJ+XIbc+G4sl8ZR7hrNDizhDpU/caugH+tr1iwzZry2/NgnDq0gL81Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=addjUGgl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9378DC4CEF2;
	Mon,  2 Jun 2025 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850601;
	bh=d//H++7exyPSMnan9RFSD5d4qCZ3guc6sNey20DU/Vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=addjUGglBObnNhJ3bwF6Vf5Anv4ro7WHgsy2aP4N5DuIaSjQwBtNfUCT/Qm6NJ8aK
	 6J9Zhg+Mje76MQliTHidkqSkOfq21WA2qXQTY0M/pUlIdUk+MKqluAFjmQFOrgEAOm
	 C8tWXhK27WMQS6AdYq7GRzoDfqirk8o6seCNUrZAT0Tceo/+EimqWqqYHjq/ndqRRT
	 FR68lfR6+2cYwqfKmKO1o0PFl2eLzN0Nu3sVa4R4ue4Oj6K2MK0cMBo246J39F2ia4
	 15Ws+4CfCYaOCZHiz7ZJluBkQHLSX0GnTRzDWYuP/4yJB65ovgFZMZ+ZmPLwicDaIC
	 mEundkBMpRDZQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so4415562e87.0;
        Mon, 02 Jun 2025 00:50:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8C34bCTTo2cVvVzC/SE6fjetLrdT8gsZd5F00KZLmWW4xT/TzPnMV0SxWk2BE0uqgDZR+NnjbN8Forj7I@vger.kernel.org, AJvYcCVM+1uSPdf16BEODg3iMq8yFGR3x0wR46wndggA+O5l/inURTfRzn4etkKGrTFOBtfdiPV7AAOIYywbzHE=@vger.kernel.org, AJvYcCVWhCLrSpovpYGcZoiFCmR9FLJRK7F9voORjNIeLUdQ81BsUARmk5+lNwbQTOiv05eqoBTrUBul81aYJh9u4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2S7/VoUbTEP3kj+YcJ8TdaxWq9iUnLkhtxbJr3IZBsNdflSq
	VdZiXwYs0jT8qIW+7Lft24d/3WG5J7jXoevmaJE84EW3Q0++TzKXgfWh5tA3F+/25MzUlPaLYyK
	2SglVvHbDroFsPdnk2UGWEYyMr1nKpQg=
X-Google-Smtp-Source: AGHT+IF8Nko2uHYBlEL64F66tffstcYvHgSRxaUtDS97nJZSz0JSG4C5pVGrWM1kkKBDzoqBWqi/8RO5FTC7kPVVtwQ=
X-Received: by 2002:a05:6512:3e17:b0:553:3332:b66e with SMTP id
 2adb3069b0e04-5533d1ad781mr3020135e87.27.1748850600268; Mon, 02 Jun 2025
 00:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <5cd53f6a4bca5186d3c9c47c070883131826c5eb.1748335606.git.legion@kernel.org>
In-Reply-To: <5cd53f6a4bca5186d3c9c47c070883131826c5eb.1748335606.git.legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Jun 2025 16:49:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkXFqKLPcHFg-WDynRrVy3BRs6twvcyo2YJQqZBy9xsQ@mail.gmail.com>
X-Gm-Features: AX0GCFtJsTSjthJfEE6WIU8nSJsrUwshIVZhUEe_rb8vx5p3qrPJT1BCpoYEH_E
Message-ID: <CAK7LNATkXFqKLPcHFg-WDynRrVy3BRs6twvcyo2YJQqZBy9xsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] modules: Add macros to specify modinfo prefix
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> The __MODULE_INFO macros always use __MODULE_INFO_PREFIX. The only way
> to use a different prefix is to override __MODULE_INFO_PREFIX, which is
> not very useful.

Not necessarily.
This would be a very special case only used in modpost,
and modpost can use MODULE_INFO() instead.


        list_for_each_entry_safe(alias, next, &mod->aliases, node) {
-               buf_printf(&buf, "MODULE_ALIAS_MODNAME(\"%s\", \"%s\");\n",
+               buf_printf(&buf, "MODULE_INFO(\"%s\".alias, \"%s\");\n",
                           alias->builtin_modname, alias->str);
                list_del(&alias->node);
                free(alias->builtin_modname);





> The new macro will be used in file2alias.c to generate modalias for
> builtin modules.
>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  include/linux/module.h      | 3 +++
>  include/linux/moduleparam.h | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 8050f77c3b64..88048561360f 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -170,6 +170,9 @@ struct module_kobject *lookup_or_create_module_kobjec=
t(const char *name);
>  /* For userspace: you can also call me... */
>  #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
>
> +#define MODULE_ALIAS_MODNAME(_modname, _alias) \
> +       __MODULE_INFO_WITH_PREFIX(_modname ".", alias, alias, _alias)
> +
>  /* Soft module dependencies. See man modprobe.d for details.
>   * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module-baz"=
)
>   */
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index bfb85fd13e1f..3f819fc67c43 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -20,10 +20,13 @@
>  /* Chosen so that structs with an unsigned long line up. */
>  #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
>
> -#define __MODULE_INFO(tag, name, info)                                  =
 \
> +#define __MODULE_INFO_WITH_PREFIX(prefix, tag, name, info)              =
 \
>         static const char __UNIQUE_ID(name)[]                            =
 \
>                 __used __section(".modinfo") __aligned(1)                =
 \
> -               =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
> +               =3D prefix __stringify(tag) "=3D" info
> +
> +#define __MODULE_INFO(tag, name, info)                                  =
 \
> +       __MODULE_INFO_WITH_PREFIX(__MODULE_INFO_PREFIX, tag, name, info)
>
>  #define __MODULE_PARM_TYPE(name, _type)                                 =
         \
>         __MODULE_INFO(parmtype, name##type, #name ":" _type)
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

