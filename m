Return-Path: <linux-kbuild+bounces-1903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5B8CA0EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 18:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3D01F2194A
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 16:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ADC137C24;
	Mon, 20 May 2024 16:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI8x2fJH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E259137930;
	Mon, 20 May 2024 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716224046; cv=none; b=Z0thmUKoUgb7gaSjvCO6zQW64HNfnDSxDb7L2+Nz5REeztgvx1wxi6aHQ9997PWTcQGV/b2umR3oASu2x+JFLwHyklQkMh8C376Lo/fXrAaac8j2Qh+ZWhn88AnubcFtoZUwkhnMfvp/w/2mIGHBF5fRJi+9tiDFzcrlrGfbmg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716224046; c=relaxed/simple;
	bh=BSuhiVL15vSe8qVXn6kr5snqkwJnG/vYlakcO+WqUTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+cU8QEpcCtVv61iEUT8xFfFyAUkHVhxvYcds7l4os+7KfNjZeiJf9NLymj8GDjXaxNkw0Oe0YifeRM2ns56/kbqmp2orbZVNpcOXzqJDr0x+l1F5lRwUSrQWVjSxXbwFYMUhYLjS0gUQkkGYKFb3l5bekTgSesS4uVZnXNNFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI8x2fJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8996AC4AF09;
	Mon, 20 May 2024 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716224045;
	bh=BSuhiVL15vSe8qVXn6kr5snqkwJnG/vYlakcO+WqUTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cI8x2fJHH+O30CgRycO0oZIpbKsT0M8rvRea3B2divhatuR2eEbeRnCif9B8KyK6K
	 FajAvbieqQqggiFwVPVu0NT7Xq6hcj5gmpWaqicMHpjAizYZ9atNBIocbHGlr7x4aR
	 GaNRQH+haDSYJ/Jm+vUonNed6Pu5RZYHeCtmvxqbe0EeqQYwkGw5Y+oTyikahpRNmg
	 Ur5K4lIGvdRl0JhxUoQ7HpbcL0TBELgWArVhhoZAXvCZdzKcqcsUzqb5AqGIfJ9ge5
	 cROzW3I+RMnUJyAwCgfXg2gusjicIgBUFZKzSWqN5b2qVFklb81auIwCyaB6QtflL4
	 xezTMIVpsXsMw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e271acb015so57996301fa.1;
        Mon, 20 May 2024 09:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkoScQ5Sknf7JMfZ4W6oLhC01KrDVbhq952zhzqs0xAkK114S5/ZGAOx/hB5/f9+6gzlgyKTt5f0j9tgt+bPCG8wBBznc5yJ6rj6z10gVSVMkdkWsFHimSo14+e+njk2rfprZBC5Nke0RxeENnnIFK7kyRMTcmqFH5YJf2jPOTQL5yOzr1kQvioUwF9bSkRg==
X-Gm-Message-State: AOJu0YwlBizdLG1yZuncI58rB668vUzN9jXvi5CmVzY3tWh2buEy0dUP
	bOM0LYAXKiaCc1J9HTicjP3SxDobaX1Z53Qqvxd8cKDNuXtMSUJathUSKFLuULiHkvQMMSKKTw5
	timgaN7ro8kRMgFGirMfmW8AuIdQ=
X-Google-Smtp-Source: AGHT+IGrMZcM7yIjtEJsy8/6USzbyCaBXwftuyFzEd745o0InmjeWKjbKmb4FR6RM1EZDyI0Ua1JCtSZZwF3Ieso3lM=
X-Received: by 2002:ac2:5f48:0:b0:51d:abb3:d701 with SMTP id
 2adb3069b0e04-5220fa7191amr18042603e87.5.1716224044132; Mon, 20 May 2024
 09:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517042839.544650-1-kris.van.hees@oracle.com> <20240517042839.544650-5-kris.van.hees@oracle.com>
In-Reply-To: <20240517042839.544650-5-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 May 2024 01:53:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARymQg37LYbxoNB_nm+uPPN1thKC7PqAORh-5=fXpsv6A@mail.gmail.com>
Message-ID: <CAK7LNARymQg37LYbxoNB_nm+uPPN1thKC7PqAORh-5=fXpsv6A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] module: script to generate offset ranges for
 builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 1:31=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> The offset range data for builtin modules is generated using:
>  - modules.builtin.modinfo: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first membe=
r
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
>
> The generated data will look like:
>
> .text 00000000-00000000 =3D _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 008e6660-008e9630 snd_soc_wcd_mbhc
> .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> .text 008ea610-008ea780 snd_soc_wcd9335
> ...
> .data 00000000-00000000 =3D _sdata
> .data 0000f020-0000f680 amd_uncore
>
> For each ELF section, it lists the offset of the first symbol.  This can
> be used to determine the base address of the section at runtime.
>
> Next, it lists (in strict ascending order) offset ranges in that section
> that cover the symbols of one or more builtin modules.  Multiple ranges
> can apply to a single module, and ranges can be shared between modules.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> ---
> Changes since v2:
>  - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
>  - Switched from using modules.builtin.objs to parsing .*.cmd files
>  - Parse data from .*.cmd in generate_builtin_ranges.awk
> ---
>  scripts/generate_builtin_ranges.awk | 232 ++++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100755 scripts/generate_builtin_ranges.awk
>
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_built=
in_ranges.awk
> new file mode 100755
> index 0000000000000..6975a9c7266d9
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,232 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin m=
odules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin.modinfo vmlinux.map=
 \
> +#              vmlinux.o.map > modules.builtin.ranges
> +#
> +
> +BEGIN {
> +       # modules.builtin.modinfo uses \0 as record separator
> +       # All other files use \n.
> +       RS =3D "[\n\0]";
> +}


Why do you want to parse modules.builtin.modinfo
instead of modules.builtin?

modules.builtin uses \n separator.






> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, mfn, s) {


There are 5 arguments, while the caller passes only 1 argument
( get_module_info($4) )







> +       if (fn in omod)
> +               return omod[fn];
> +
> +       if (match(fn, /\/[^/]+$/) =3D=3D 0)
> +               return "";
> +
> +       obj =3D fn;
> +       mod =3D "";
> +       mfn =3D "";
> +       fn =3D substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +       if (getline s <fn =3D=3D 1) {
> +               if (match(s, /DKBUILD_MODNAME=3D[^ ]+/) > 0) {
> +                       mod =3D substr(s, RSTART + 17, RLENGTH - 17);
> +                       gsub(/['"]/, "", mod);
> +                       gsub(/:/, " ", mod);
> +               }
> +
> +               if (match(s, /DKBUILD_MODFILE=3D[^ ]+/) > 0) {
> +                       mfn =3D substr(s, RSTART + 17, RLENGTH - 17);
> +                       gsub(/['"]/, "", mfn);
> +                       gsub(/:/, " ", mfn);
> +               }
> +       }
> +       close(fn);
> +
> +# tmp =3D $0;
> +# $0 =3D s;
> +# print mod " " mfn " " obj " " $NF;
> +# $0 =3D tmp;
> +
> +       # A single module (common case) also reflects objects that are no=
t part
> +       # of a module.  Some of those objects have names that are also a =
module
> +       # name (e.g. core).  We check the associated module file name, an=
d if
> +       # they do not match, the object is not part of a module.


You do not need to use KBUILD_MODNAME.

Just use KBUILD_MODFILE only.
If the same path is found in modules.builtin,
it is a built-in module.

Its basename is modname.




One more question in a corner case.

How does your code work when an object is shared
by multiple modules?


For example, set
  CONFIG_EDAC_SKX=3Dy
  CONFIG_EDAC_I10NM=3Dy

How is the address range of drivers/edac/skx_common.o handled?

There are 4 possibilities.

 - included in skx_edac
 - included in i10nm_edac
 - included in both of them
 - not included in any of them

The correct behavior should be "included in both of them".

How does your code work?









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
> +
> +FNR =3D=3D 1 {
> +       FC++;
> +}
> +
> +# (1-old) Build a mapping to associate object files with built-in module=
 names.
> +#
> +# The first file argument is used as input (modules.builtin.objs).
> +#
> +FC =3D=3D 1 && old_behaviour {
> +       sub(/:/, "");
> +       mod =3D $1;
> +       sub(/([^/]*\/)+/, "", mod);
> +       sub(/\.o$/, "", mod);
> +       gsub(/-/, "_", mod);
> +
> +       if (NF > 1) {
> +               for (i =3D 2; i <=3D NF; i++) {
> +                       if ($i in mods)
> +                               mods[$i] =3D mods[$i] " " mod;
> +                       else
> +                               mods[$i] =3D mod;
> +               }
> +       } else
> +               mods[$1] =3D mod;
> +
> +       next;
> +}


Please remove the old code.





> +# (1) Build a lookup map of built-in module names.
> +#
> +# The first file argument is used as input (modules.builtin.modinfo).
> +#
> +# We are interested in lines that follow the format
> +#     <modname>.file=3D<path>
> +# and use them to record <modname>
> +#
> +FC =3D=3D 1 && /^[^\.]+.file=3D/ {
> +       gsub(/[\.=3D]/, " ");
> +# print $1 " -> " $3;
> +       mods[$1] =3D $3;
> +       next;
> +}


I guess parsing module.builtin will be simpler.






> +
> +# (2) Determine the load address for each section.
> +#
> +# The second file argument is used as input (vmlinux.map).
> +#
> +# Since some AWK implementations cannot handle large integers, we strip =
of the
> +# first 4 hex digits from the address.  This is safe because the kernel =
space
> +# is not large enough for addresses to extend into those digits.
> +#
> +FC =3D=3D 2 && /^\./ && NF > 2 {
> +       if (type)
> +               delete sect_addend[type];
> +
> +       if ($1 ~ /percpu/)
> +               next;
> +
> +       raw_addr =3D $2;
> +       addr_prefix =3D "^" substr($2, 1, 6);
> +       sub(addr_prefix, "0x", $2);
> +       base =3D strtonum($2);
> +       type =3D $1;
> +       anchor =3D 0;
> +       sect_base[type] =3D base;
> +
> +       next;
> +}
> +
> +!type {
> +       next;
> +}
> +
> +# (3) We need to determine the base address of the section so that range=
s can
> +# be expressed based on offsets from the base address.  This accommodate=
s the
> +# kernel sections getting loaded at different addresses than what is rec=
orded
> +# in vmlinux.map.
> +#
> +# At runtime, we will need to determine the base address of each section=
 we are
> +# interested in.  We do that by recording the offset of the first symbol=
 in the
> +# section.  Once we know the address of this symbol in the running kerne=
l, we
> +# can calculate the base address of the section.
> +#
> +# If possible, we use an explicit anchor symbol (sym =3D .) listed at th=
e base
> +# address (offset 0).
> +#
> +# If there is no such symbol, we record the first symbol in the section =
along
> +# with its offset.
> +#
> +# We also determine the offset of the first member in the section in cas=
e the
> +# final linking inserts some content between the start of the section an=
d the
> +# first member.  I.e. in that case, vmlinux.map will list the first memb=
er at
> +# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We =
record
> +# the addend so we can apply it when processing vmlinux.o.map (next).
> +#
> +FC =3D=3D 2 && !anchor && raw_addr =3D=3D $1 && $3 =3D=3D "=3D" && $4 =
=3D=3D "." {
> +       anchor =3D sprintf("%s %08x-%08x =3D %s", type, 0, 0, $2);
> +       sect_anchor[type] =3D anchor;
> +
> +       next;
> +}
> +
> +FC =3D=3D 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <=3D 4 {
> +       sub(addr_prefix, "0x", $1);
> +       addr =3D strtonum($1) - base;
> +       anchor =3D sprintf("%s %08x-%08x =3D %s", type, addr, addr, $2);
> +       sect_anchor[type] =3D anchor;
> +
> +       next;
> +}
> +
> +FC =3D=3D 2 && base && /^ \./ && $1 =3D=3D type && NF =3D=3D 4 {
> +       sub(addr_prefix, "0x", $2);
> +       addr =3D strtonum($2);
> +       sect_addend[type] =3D addr - base;
> +
> +       if (anchor) {
> +               base =3D 0;
> +               type =3D 0;
> +       }
> +
> +       next;
> +}
> +
> +# (4) Collect offset ranges (relative to the section base address) for b=
uilt-in
> +# modules.
> +#
> +FC =3D=3D 3 && /^ \./ && NF =3D=3D 4 && $3 !=3D "0x0" {
> +       type =3D $1;
> +       if (!(type in sect_addend))
> +               next;


This assumes sections are 1:1 mapping
between vmlinux.o and vmlinux.

How far does this assumption work?


CONFIG_LD_DEAD_CODE_DATA_ELIMINATION will not work
at least.



As I said in the previous review,
gawk is not documented in Documentation/process/changes.rst

Please add it if you go with gawk.






> +
> +       sub(addr_prefix, "0x", $2);
> +       addr =3D strtonum($2) + sect_addend[type];
> +
> +       mod =3D get_module_info($4);
> +# printf "[%s, %08x] %s [%s] %08x\n", mod_name, mod_start, $4, mod, addr=
;
> +       if (mod =3D=3D mod_name)
> +               next;
> +
> +       if (mod_name) {
> +               idx =3D mod_start + sect_base[type] + sect_addend[type];
> +               entries[idx] =3D sprintf("%s %08x-%08x %s", type, mod_sta=
rt, addr, mod_name);
> +               count[type]++;
> +       }
> +# if (mod =3D=3D "")
> +# printf "ENTRY WITHOUT MOD - MODULE MAY END AT %08x\n", addr
> +
> +       mod_name =3D mod;
> +       mod_start =3D addr;
> +}
> +
> +END {
> +       for (type in count) {
> +               if (type in sect_anchor)
> +                       entries[sect_base[type]] =3D sect_anchor[type];
> +       }
> +
> +       n =3D asorti(entries, indices);
> +       for (i =3D 1; i <=3D n; i++)
> +               print entries[indices[i]];
> +}
> --
> 2.43.0
>


--
Best Regards

Masahiro Yamada

