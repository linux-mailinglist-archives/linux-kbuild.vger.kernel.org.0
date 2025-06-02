Return-Path: <linux-kbuild+bounces-7354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA53ACBB4E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 21:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF66175EE1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 19:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECA321C177;
	Mon,  2 Jun 2025 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azkYICkZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523F19B3EE;
	Mon,  2 Jun 2025 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748890868; cv=none; b=lsfWlzns2OvPnmb54nGKm/K+Xanfk4b181UR2xa3dgCN8PUQk7wyhSLeI3KYo/+utOyfp1PT1uB/gXfcegZ+oX7scWcXTXXxiTmPUqLj6/PsbNAhaiRR5CdVuAl4QKq2aoe9NrFb6FYJzmHzRgjRCEo4Oi07nB0KRpyfmgCVXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748890868; c=relaxed/simple;
	bh=YxAIIEqrvalJpraYDwrR/Jv08dcEQhmUG4FTOhbLtvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX/n8xrQbYSz9RdRiUskSBYNIffJVoKjjhVck4dUmQP2Ohx0m5Lyqe6hFRq6j7nYKW3cBajOcrer/7as7zwU4ZmrxP+K+din9urf/FfozIhngJRPfFjJJuFsT6MYIXWjxPwiasDsRXZ+n+KUdHJHUAzsj+fIwqOetDxy/2/H8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azkYICkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AA0C4CEF4;
	Mon,  2 Jun 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748890868;
	bh=YxAIIEqrvalJpraYDwrR/Jv08dcEQhmUG4FTOhbLtvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=azkYICkZlQ5ql7NykpA+R78old0/NerqQNfG8LRiB9X/ZgddrvbuoZOcQvZCYQ4Op
	 Wu++QpGyok4B4WoNOfYugmcWnr0ZtQ+gWmrukxzFhFlGyNqtL2V6BvAyTMxYddT8p0
	 1jdxnxLpEN3BfizlufMyFHONIH0N9UyrXx5aTpRP8yYVSdTxy2MOFkHQz70RFAVufL
	 Ct3Wjtj/jLazs0lV2y7vF7cDX3cvM1hohk1p+eVfNYELHkS9HtBjbALnxVVz1aB5Ow
	 0RXEY142WSimh9c8ftaJJ+GiavkOFZ5q+UeGmIpzR9iK30wLTxM1vhwwUw1zcYIIhk
	 RZCKawqQpr5sQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5532f9ac219so5464672e87.1;
        Mon, 02 Jun 2025 12:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq6Kekdz/tdlJcvutT9WiEeSWh8C7BuAcRvNJm0ImRytVjn8CYC/b79r2pTmE/gr0NHzxDFR5wsPZKqtlz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5n92+aEsoHwMqe4ihP89kMiXzsy5rr/0wnbV0kQ/QK9Xg4xCv
	jCwIQ/MkL+loCDTK2Kxeul7T3awm3l1uAfkBtKeZ2kwZV/PnpLQ6ZaRFWQFJOJUX/OCnmMM6T5A
	77DkAiZxgTAVkqa3/YyFz1Lc+Ud695e8=
X-Google-Smtp-Source: AGHT+IEP9e7Bpuwqds9sFw3Aiv2WxrKc7K+TA6TYOkLWb3q58bdth2n5EggvyYF7ux3Zm6WAnpfFKnO9m6KzrByFzek=
X-Received: by 2002:a05:6512:1051:b0:553:2ef3:f72d with SMTP id
 2adb3069b0e04-5533b9080bamr4311815e87.28.1748890866590; Mon, 02 Jun 2025
 12:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602130609.402581-1-masahiroy@kernel.org>
In-Reply-To: <20250602130609.402581-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Jun 2025 04:00:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBCmhf_yT+1nkULwRZgQ3QJ6PDbUSWAPOvYZT478M07A@mail.gmail.com>
X-Gm-Features: AX0GCFtsggFfXeaX3Ol5SttNYUFE9YlQfIaR15VSe7V-T65Ig-aR4_3I6582Pqg
Message-ID: <CAK7LNATBCmhf_yT+1nkULwRZgQ3QJ6PDbUSWAPOvYZT478M07A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: stop module name mangling
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 10:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> In the old days, KBUILD_MODNAME was passed to C without double quotes,
> and then handled by __stringify() on the C side. This was the reason
> why KBUILD_MODNAME was mangled: characters such as commas (,) and
> hyphens (-) are not allowed in C identifiers, so they were replaced
> with underscores (_) in Kbuild.
>
> Since commit f83b5e323f57 ("kbuild: set correct KBUILD_MODNAME when
> using well known kernel symbols as module names"), KBUILD_MODNAME has
> been passed to C as a string literal, which allows any characters.
>
> Aside from this historical behavior in the build system, there is no
> longer a reason for mangling. In fact, it is rather annoying, as we
> now need to convert between hyphens and underscores in some places,
> but not in others. See commit 0267cbf297bf ("module: Account for the
> build time module name mangling").
>
> This commit eliminates that oddity, so the module name will now match
> the filename. For example, the module name of "foo-bar.ko" will be
> "foo-bar", not "foo_bar".
>
> However, this oddity persisted for so long and also affected the
> userspace. To adapt to this behavior, when a user runs "rmmod foo-bar",
> kmod converts hyphens to underscores, and passes "foo_bar" to the
> delete_module syscall.

Hmm. That was modprobe/rmmod from busybox.

kmod tries to open /sys/module/*, and
hyphen/underscore conversion happens everywhere.

libkmod: ERROR ../libkmod/libkmod-module.c:2039
kmod_module_get_holders: could not open '/sys/module/fo_o/holders': No
such file or directory

So, we may need to carry this forever...



>
> Therefore, the mod_strncmp() needs to remain in find_module_all(),
> otherwise, we cannot unload modules.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  kernel/module/main.c | 8 ++++++--
>  scripts/Makefile.lib | 4 ++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index b8440b0887e3..1fa90a95e0c5 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -410,7 +410,11 @@ struct module *find_module_all(const char *name, siz=
e_t len,
>                                 lockdep_is_held(&module_mutex)) {
>                 if (!even_unformed && mod->state =3D=3D MODULE_STATE_UNFO=
RMED)
>                         continue;
> -               if (strlen(mod->name) =3D=3D len && !memcmp(mod->name, na=
me, len))
> +               /*
> +                * For historical reasons, kmod passes a module name with
> +                * a hyphen replaced with an underscore.
> +                */
> +               if (!mod_strncmp(mod->name, name, len))
>                         return mod;
>         }
>         return NULL;
> @@ -1135,7 +1139,7 @@ static bool module_match(const char *modname, const=
 char *patterns)
>                 if (*sep)
>                         sep++;
>
> -               if (mod_strncmp(patterns, modname, len) =3D=3D 0 && (glob=
 || len =3D=3D modlen))
> +               if (strncmp(patterns, modname, len) =3D=3D 0 && (glob || =
len =3D=3D modlen))
>                         return true;
>         }
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 336fb0d763c7..e37e2db5f528 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -18,8 +18,8 @@ target-stem =3D $(basename $(patsubst $(obj)/%,%,$@))
>  # end up in (or would, if it gets compiled in)
>  name-fix-token =3D $(subst $(comma),_,$(subst -,_,$1))
>  name-fix =3D $(call stringify,$(call name-fix-token,$1))
> -basename_flags =3D -DKBUILD_BASENAME=3D$(call name-fix,$(basetarget))
> -modname_flags  =3D -DKBUILD_MODNAME=3D$(call name-fix,$(modname)) \
> +basename_flags =3D -DKBUILD_BASENAME=3D$(call stringify,$(basetarget))
> +modname_flags  =3D -DKBUILD_MODNAME=3D$(call stringify,$(modname)) \
>                  -D__KBUILD_MODNAME=3Dkmod_$(call name-fix-token,$(modnam=
e))
>  modfile_flags  =3D -DKBUILD_MODFILE=3D$(call stringify,$(modfile))
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

