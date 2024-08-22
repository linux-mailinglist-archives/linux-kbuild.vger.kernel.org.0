Return-Path: <linux-kbuild+bounces-3157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D361895BD67
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 19:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA63284E44
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EC61CEADA;
	Thu, 22 Aug 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZD8erRH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53ED487AE;
	Thu, 22 Aug 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348189; cv=none; b=Qgk1V4aO+sjQza8N6nkrBpD7mDQi4/jEjf2n/IGoyH+C3CNeWMQV2QPym6qaagARBYPDFRRh8F8Y6iOM04B/C+jjQBhHB4pVvmKNRwkXNVM1s+gw9gRV4l2VTtMsdHoRtthy5PAkhvkXYYnIrb9dL6aRAo2mut5THZQAdbWIjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348189; c=relaxed/simple;
	bh=ALLrNEBz2lBvoCSYyf3SnpzNRa2dr0JSZGzm5i/Z76k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyLsT2Q/k/JpcoVb6kH2O1b3flT89P25vGL7m26AQxHXPG/PqCd97TDS1rUWRkSm0gVksYhzylNboOt9SFOycPIUANgapdvqASbv/0Zlh8klo+bCSbmoFyemcqoS+m3X2rpehL2/b4z0cZKUecuZE6N+5TovJ/rtsNeDZJCM0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZD8erRH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733C7C4AF12;
	Thu, 22 Aug 2024 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724348188;
	bh=ALLrNEBz2lBvoCSYyf3SnpzNRa2dr0JSZGzm5i/Z76k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aZD8erRHGDh2nsjbCAbpiKFU4MOXC9oNfSIo6ZKseA4+ou0A+f0ZtcCH1INMc43ZT
	 Wr1HW9ygEpnPX0pOoRH3XQVWzWxnJSrH5ibPiWBwBFs9j25kp9PdrNVOyFVyzcTYew
	 Pzafe7Nq8MN8kacxxBd3bTf8uhgyxKqfoE3+pY661X2C2QhIqyEHsbIyHBv77TADip
	 1BFyTIQudGsdtaJuIfQdc4+3Ugr8mAseZ9VKvKlLai6wNi7ZJ1ZYvK0QCJcSczIsrC
	 f8xHPce9Xc+zn7IMXX0Fi3NlyrFNKLUbaCj4ndWDdvo4EH+hOS2fzl/+dygXG0K7ER
	 Q6WsBD9aQXEDg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343617fdddso769391e87.0;
        Thu, 22 Aug 2024 10:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ7mAN2XA50aKSW4GTF6YnkvrcdwA1Ta5lqsq4BUlbVTs8OOFnFqMvmLi0Bg5XP9mQGPP5BB/ewDRHEi4FGyh/swsZ@vger.kernel.org, AJvYcCVqzYKI2tx1luqGb4n0Ab80Bnh3r6Gsx4pa45o9f7GIk+SH4V0ItaUuOkBUv7eENAyz/fjqkZlauiHBPxs=@vger.kernel.org, AJvYcCVwnkpBANgRRAVm79xNL6WWLLKVgHLW0MZmluWn6hd0hHut6/CKwonLrC5TMCINhsE5n+ITOWeGDObRIA9OEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI2mZlipsXQCH/TQ+T40xfEbjQWYK7OoT8XQ0q4Tt+0KYAVHPL
	kwUBj2boe1A/F17ukumVMoPf/MsRsZNaUtg4Yj3ESc5u1JRES0uMjebQKpEk7zd0qE8GF2QBUu3
	3lX+SY+npwRBWj/oKXRN+iYjeS2w=
X-Google-Smtp-Source: AGHT+IHjEo7S6pVlNBC7rLTzZt9ouBtvu4VbscK/zAkryHKCVDTjtRFouTb6icvjUG0NC9wW6KL1KWWdDDUarh5FSRg=
X-Received: by 2002:a05:6512:1111:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-5334fd4cdd0mr2460609e87.39.1724348187091; Thu, 22 Aug 2024
 10:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821040700.1919317-1-kris.van.hees@oracle.com> <20240821040700.1919317-3-kris.van.hees@oracle.com>
In-Reply-To: <20240821040700.1919317-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 02:35:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3Vkubuv7Rb2eeRE45Yycs9DJLRUatBb=9--VPT80aQw@mail.gmail.com>
Message-ID: <CAK7LNAR3Vkubuv7Rb2eeRE45Yycs9DJLRUatBb=9--VPT80aQw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] scripts: add verifier script for builtin module
 range data
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 1:11=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> The modules.builtin.ranges offset range data for builtin modules is
> generated at compile time based on the list of built-in modules and
> the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
> to determine whether a symbol at a particular address belongs to
> module code that was configured to be compiled into the kernel proper
> as a built-in module (rather than as a standalone module).
>
> This patch adds a script that uses the generated modules.builtin.ranges
> data to annotate the symbols in the System.map with module names if
> their address falls within a range that belongs to one or more built-in
> modules.
>
> It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
> verify the annotation:
>
>   - For each top-level section:
>      - For each object in the section:
>         - Determine whether the object is part of a built-in module
>           (using modules.builtin and the .*.cmd file used to compile
>            the object as suggested in [0])
>         - For each symbol in that object, verify that the built-in
>           module association (or lack thereof) matches the annotation
>           given to the symbol.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>     Changes since v6:
>      - Applied Masahiro Yamada's suggestions to the AWK script.
>
>     Changes since v5:
>      - Added optional 6th argument to specify kernel build directory.
>      - Report error and exit if .*.o.cmd files cannot be read.
>
>     Changes since v4:
>      - New patch in the series
> ---
>  scripts/verify_builtin_ranges.awk | 356 ++++++++++++++++++++++++++++++
>  1 file changed, 356 insertions(+)
>  create mode 100755 scripts/verify_builtin_ranges.awk
>
> diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_r=
anges.awk
> new file mode 100755
> index 000000000000..93f66e9a8802
> --- /dev/null
> +++ b/scripts/verify_builtin_ranges.awk
> @@ -0,0 +1,356 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# verify_builtin_ranges.awk: Verify address range data for builtin modul=
es
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> +#                                 modules.builtin vmlinux.map vmlinux.o.=
map \
> +#                                 [ <build-dir> ]
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, s) {
> +       if (fn in omod)
> +               return omod[fn];
> +
> +       if (match(fn, /\/[^/]+$/) =3D=3D 0)
> +               return "";
> +
> +       obj =3D fn;
> +       mod =3D "";
> +       fn =3D kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) =
".cmd";
> +       if (getline s <fn =3D=3D 1) {
> +               if (match(s, /DKBUILD_MODFILE=3D['"]+[^'"]+/) > 0) {
> +                       mod =3D substr(s, RSTART + 16, RLENGTH - 16);
> +                       gsub(/['"]/, "", mod);
> +               }
> +       } else {
> +               print "ERROR: Failed to read: " fn "\n\n" \
> +                     "  Invalid kernel build directory (" kdir ")\n" \
> +                     "  or its content does not match " ARGV[1] >"/dev/s=
tderr";
> +               close(fn);
> +               total =3D 0;
> +               exit(1);
> +       }
> +       close(fn);
> +
> +       # A single module (common case) also reflects objects that are no=
t part
> +       # of a module.  Some of those objects have names that are also a =
module
> +       # name (e.g. core).  We check the associated module file name, an=
d if
> +       # they do not match, the object is not part of a module.
> +       if (mod !~ / /) {
> +               if (!(mod in mods))
> +                       mod =3D "";
> +       }
> +
> +       gsub(/([^/ ]*\/)+/, "", mod);
> +       gsub(/-/, "_", mod);
> +
> +       # At this point, mod is a single (valid) module name, or a list o=
f
> +       # module names (that do not need validation).
> +       omod[obj] =3D mod;
> +       close(fn);


Same as 2/4.





--
Best Regards
Masahiro Yamada

