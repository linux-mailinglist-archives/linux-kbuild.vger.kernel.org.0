Return-Path: <linux-kbuild+bounces-3076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D7955B75
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 08:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5843B20A6E
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 06:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED31DF44;
	Sun, 18 Aug 2024 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTRuItXG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0994A10940;
	Sun, 18 Aug 2024 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723963275; cv=none; b=o4yWnolIn0SMU40oiEebQMdWR26WBdvoZiHCLuWewFU/msUVb98W/BmzyJ9VS7c7kpy+kD103A8juo4bZh6PLuewNAKWS7CmSaaa1Y4PuQyE7vl/fB6Jv6cXjF4k+2SDhzR41Qwxe3cOkd988Rbh4xdir/XG/ZvO/TvjLAZmj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723963275; c=relaxed/simple;
	bh=EHkiK0JzhHYSXiqWsANRhL5kO97JQKAqAlYC59Sk2ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWm1vn+SfFxW7zrGyOKvLKCSpFkFM2W/Y4ba13l/8TGPlsR2mec/fzit1Qchlhw0YpIOT3urk0cVNVh371cud6tn8HFhneJ4EQt2ssrT34UnRoxG7X54B8qbDuR8Ra+lzmFo0+pRANPiVAuoENZ2/a/6VlvuLab7onmPY1tID0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTRuItXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E449C4AF0C;
	Sun, 18 Aug 2024 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723963274;
	bh=EHkiK0JzhHYSXiqWsANRhL5kO97JQKAqAlYC59Sk2ic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HTRuItXGVfwL9ZoCifYshte73IgJ2k09r+tG1bq6q6dQh8fPxyaq94Eu8dgFJl2ae
	 04/TC0yAf77EMp0t1pF1ZSdh9G7nK2AR56AO8kR4YsbWr85Usudy/w14nwKi9HTxC9
	 tTFxE3Mx67NMWtA7sIMQGutm7Og/EpkEhXCrHuSFSXW+C9qitNcjUB2uhx9jfucaTn
	 a50t8atX9wFsSXZaxIv717ZbXhVDAc3EidKOWdeBJZdnjugtv9jMRBkcIibNNq3G8j
	 GBdHbr9jLIZ7DGFMDtCcW/wmUjFxTQNKjv5EhvD7Hg1iBky69OS26ying2+I14Eadm
	 VAg0SjG9ULH2w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-530d0882370so3420658e87.3;
        Sat, 17 Aug 2024 23:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo0LEWP8UEgkM/6xMQLjFScQ4FNP/LdtbR64kg34724e4SQpv58933vVqjQSoRoRYyV8PXjIIg53aa/7B3DZlyiB+6h625v2i4V65bcYiM85eP1eVTZXBK39LJyYFpmiPyDs/UiAhPsfCW+g6ASBNd7qH3WLTgPAtLNUGI1vAAntbeqOSao/sKROmL0+E0Yw==
X-Gm-Message-State: AOJu0Yzm5aRHsL5MJ5u2ZN6ZjakYKALuM2aYaMiEQxnDmBz/5SMK/ywc
	TbztOphaey/DsVXbnszzwvJPVchEZBpAbBmBuBe5ll/YOPdyVwFGlbS/G9mTcAl9dWshCvn7Ejc
	qil8JUHmMcOU2kY7GNhq8uiTfecE=
X-Google-Smtp-Source: AGHT+IHVLeK6t7JmurWjF5DT2h5QaqOSnI/aNxVqi6L9gi1tqE9G6NCTZANMZkto1NcImMHNpe8rQVEIMGaz1HNBn3U=
X-Received: by 2002:a05:6512:2386:b0:533:97b:e272 with SMTP id
 2adb3069b0e04-5331c6dc80bmr5676026e87.41.1723963273195; Sat, 17 Aug 2024
 23:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815150339.1564769-1-kris.van.hees@oracle.com> <20240815150339.1564769-4-kris.van.hees@oracle.com>
In-Reply-To: <20240815150339.1564769-4-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 18 Aug 2024 15:40:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjR=1S_H+r=QEX5DbkQ4MJ4-MMtB-UQWAvCeSbhbMOqA@mail.gmail.com>
Message-ID: <CAK7LNASjR=1S_H+r=QEX5DbkQ4MJ4-MMtB-UQWAvCeSbhbMOqA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] scripts: add verifier script for builtin module
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

On Fri, Aug 16, 2024 at 12:04=E2=80=AFAM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:
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
>     Changes since v5:
>      - Added optional 6th argument to specify kernel build directory.
>      - Report error and exit if .*.o.cmd files cannot be read.
>
>     Changes since v4:
>      - New patch in the series
> ---
>  scripts/verify_builtin_ranges.awk | 365 ++++++++++++++++++++++++++++++
>  1 file changed, 365 insertions(+)
>  create mode 100755 scripts/verify_builtin_ranges.awk
>
> diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_r=
anges.awk
> new file mode 100755
> index 000000000000..b82cf0a0fbeb
> --- /dev/null
> +++ b/scripts/verify_builtin_ranges.awk
> @@ -0,0 +1,365 @@
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
> +function get_module_info(fn, mod, obj, mfn, s) {
> +       if (fn in omod)
> +               return omod[fn];
> +
> +       if (match(fn, /\/[^/]+$/) =3D=3D 0)
> +               return "";
> +
> +       obj =3D fn;
> +       mod =3D "";
> +       mfn =3D "";
> +       fn =3D kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) =
".cmd";
> +       if (getline s <fn =3D=3D 1) {
> +               if (match(s, /DKBUILD_MODFILE=3D['"]+[^'"]+/) > 0) {
> +                       mfn =3D substr(s, RSTART + 16, RLENGTH - 16);
> +                       gsub(/['"]/, "", mfn);
> +
> +                       mod =3D mfn;
> +                       gsub(/([^/ ]*\/)+/, "", mod);
> +                       gsub(/-/, "_", mod);
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
> +                       return "";
> +               if (mods[mod] !=3D mfn)
> +                       return "";
> +       }
> +
> +       # At this point, mod is a single (valid) module name, or a list o=
f
> +       # module names (that do not need validation).
> +       omod[obj] =3D mod;
> +       close(fn);
> +
> +       return mod;
> +}
>



This code is copy-paste from scripts/generate_builtin_ranges.awk
So, my comments in 2/4 can apply to this patch, too.


Instead of adding a separate script,
we could add a "verify mode" option.


 scripts/generate_builtin_ranges.awk --verify ...


But, I do not know how much cleaner it will become.

I am not good at reviewing AWK code, but this
is how you go.




If this script were written in Python,
it would be easy and readable to
split logically-related code chunks into functions,
as follows:


def parse_module_builtin():
    ...


def parse_vmlinux_map_lld():
    ...


def parse_vmlinux_map_bfd():
    ...


def parse_vmlinux_o_map():
    ...



--
Best Regards
Masahiro Yamada

