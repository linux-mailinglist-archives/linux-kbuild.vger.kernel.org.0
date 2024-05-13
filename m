Return-Path: <linux-kbuild+bounces-1835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FB8C3AC6
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 06:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9307028131E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 04:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E51146002;
	Mon, 13 May 2024 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnRZnZBi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4482110F;
	Mon, 13 May 2024 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715575434; cv=none; b=uzrfgjD9Lr0rdDiE7knO9tj4YK/qDDTNanhMEEaJeQLxx1wchOQByhCsWi/iuzu9qTvJoAYEjwi7PpMuJQcc9wITbA7eBgPKrSyKzTD5lTvDfmZIKXaOYtN++Fhszmjvuq5ZJ3VdBsmuW9wRySZaS4CXlkbZozhd2IYxAXp4o00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715575434; c=relaxed/simple;
	bh=f2hRnqnMpqjqK9xq/EnAefNcHhujuWO4M7G+A9jFyxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOpj+D8y9dsHwLSqKyU3cEIy/Jc8YbNjHWAQsuPhkucI9ntoZBt7xaNBNLcpOLNQsvmdX+YN2OWRXVh9sxj7MkwLoL8Jr/LpwcIvI7s/L7nwhj6t5oNW83WxMibhHIfEcTQTxkooWo8WqwZvjRs9ODAC6LRFQOczeH0+HMZXKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnRZnZBi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7674C113CC;
	Mon, 13 May 2024 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715575433;
	bh=f2hRnqnMpqjqK9xq/EnAefNcHhujuWO4M7G+A9jFyxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KnRZnZBiCEqHPjRBiDJXkGZFxA1MD81ZDlBN5aBceUv6w5WovzbrMuIS2jq89htjC
	 DZvnUrdk7G2/YEgAyihzMtxLbxO2wBe4jebtf15zGRufSFrUGarGmsCmyjR5gRYPME
	 WmRNOJbVd+Blh3Uze7GhhmyHje0ZPkUbSQaNPScCJWPuJjE3MaOgJEy41c0FPEzvDp
	 06mGN7dd4PE3VeNXfzEhVupnlVy+GmM9b4fFL9R4gPllx4Ow9SWVLzZ+xUEUhaTjfu
	 a/8MUk4FGDPph0AjhACmoeEwnLHqd5pUqrT5a+9cVNDnBOOdUmBEXZa/TK1FlE6P64
	 yMOMc1JBLS5lA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e27277d2c1so51096711fa.2;
        Sun, 12 May 2024 21:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrKvMwzeclU1JkQEmRcukiTplMcVBkMVLDETqAjLMWM/WaiOZlMSXZxLRZ2pFB3aiM3w36LT8ZEfAxDif6CzeWZMCSn0/zGl2gwtCip4WsEO1E/tprx+sjGFw80f9AMz5q3UJ2VWOc93MDFuFmpgqskEO9+XfyD2u3GfP0el9sAjfCEITddhpYkjMGNRtHjA==
X-Gm-Message-State: AOJu0Yx1ijkBwJ/QZVjAvHUUI9IBo/dodBez4JqkPa291jI+c/JjKwxd
	jvEI/+ClxW0LANBGYygWeO/6nYRmH3UefvwzT6Fk8hz1GbRxCKd9hXqtojCSwtb8Ck3YHeA0/dc
	lIm3Yh/+EL/9+eUKfyOp7kbo70eQ=
X-Google-Smtp-Source: AGHT+IH+GcVG/AnLQ4PfEDzfNh+gYR0Re2MrA/t7vDkubHmAlPo1YCWxRHlsnnEHrBsYZiZlxNkPGxwJHeJT8BqoqJQ=
X-Received: by 2002:a2e:1309:0:b0:2e6:a87e:6df9 with SMTP id
 38308e7fff4ca-2e6ac4bb517mr3086031fa.20.1715575432301; Sun, 12 May 2024
 21:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 May 2024 13:43:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwSDyAWR2FqccF5RFLpw5CYFyndR0N814nC7G7EaL2Tw@mail.gmail.com>
Message-ID: <CAK7LNATwSDyAWR2FqccF5RFLpw5CYFyndR0N814nC7G7EaL2Tw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Generate address range data for built-in modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 7:42=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> Especially for tracing applications, it is convenient to be able to
> refer to a symbol using a <module name, symbol name> pair and to be able
> to translate an address into a <nodule mname, symbol name> pair.  But
> that does not work if the module is built into the kernel because the
> object files that comprise the built-in module implementation are simply
> linked into the kernel image along with all other kernel object files.
>
> This is especially visible when providing tracing scripts for support
> purposes, where the developer of the script targets a particular kernel
> version, but does not have control over whether the target system has
> a particular module as loadable module or built-in module.  When tracing
> symbols within a module, referring them by <module name, symbol name>
> pairs is both convenient and aids symbol lookup.  But that naming will
> not work if the module name information is lost if the module is built
> into the kernel on the target system.
>
> Earlier work addressing this loss of information for built-in modules
> involved adding module name information to the kallsyms data, but that
> required more invasive code in the kernel proper.  This work never did
> get merged into the kernel tree.
>
> All that is really needed is knowing whether a given address belongs to
> a particular module (or multiple modules if they share an object file).
> Or in other words, whether that address falls within an address range
> that is associated with one or more modules.
>
> This patch series is baaed on Luis Chamberlain's patch to generate
> modules.builtin.objs, associating built-in modules with their object
> files.  Using this data, vmlinux.o.map and vmlinux.map can be parsed in
> a single pass to generate a modules.buitin.ranges file with offset range
> information (relative to the base address of the associated section) for
> built-in modules.  The file gets installed along with the other
> modules.builtin.* files.



I still do not want to see modules.builtin.objs.


During the vmlinux.o.map parse, every time an object path
is encountered, you can open the corresponding .cmd file.



Let's say, you have the following in vmlinux.o.map:

.text          0x00000000007d4fe0     0x46c8 drivers/i2c/i2c-core-base.o



You can check drivers/i2c/.i2c-core-base.o.cmd


$ cat drivers/i2c/.i2c-core-base.o.cmd | tr ' ' '\n' | grep KBUILD_MODFILE
-DKBUILD_MODFILE=3D'"drivers/i2c/i2c-core"'


Now you know this object is part of drivers/i2c/i2c-core
(that is, its modname is "i2c-core")




Next, you will get the following:

 .text          0x00000000007dc550     0x13c4 drivers/i2c/i2c-core-acpi.o


$ cat drivers/i2c/.i2c-core-acpi.o.cmd | tr ' ' '\n' | grep KBUILD_MODFILE
-DKBUILD_MODFILE=3D'"drivers/i2c/i2c-core"'


This one is also a part of drivers/i2c/i2c-core


You will get the address range of "i2c-core" without changing Makefiles.

You still need to modify scripts/Makefile.vmlinux(_o)
but you can implement everything else in your script,
although I did not fully understand the gawk script.


Now, you can use Python if you like:

  https://lore.kernel.org/lkml/20240512-python-version-v2-1-382870a1fa1d@li=
naro.org/

Presumably, python code will be more readable for many people.


GNU awk is not documented in Documentation/process/changes.rst
If you insist on using gawk, you need to add it to the doc.





Having said that, I often hope to filter traced functions
by an object path instead of a modname because modname
filtering is only useful tristate code.
For example, filter by "path:drivers/i2c/" or "path:drivers/i2c/i2c-core*"
rather than "mod:i2c-core"

<object path, symbol name> reference will be useful for always-builtin code=
.




>
> The impact on the kernel build is minimal because everything is done
> using a single-pass AWK script.  The generated data size is minimal as
> well, (depending on the exact kernel configuration) usually in the range
> of 500-700 lines, with a file size of 20-40KB.
>
> Changes since v1:
>  - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
>  - Moved the config option to the tracers section
>  - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map
>
> Kris Van Hees (5):
>   trace: add CONFIG_BUILTIN_MODULE_RANGES option
>   kbuild: generate a linker map for vmlinux.o
>   module: script to generate offset ranges for builtin modules
>   kbuild: generate modules.builtin.ranges when linking the kernel
>   module: add install target for modules.builtin.ranges
>
> Luis Chamberlain (1):
>   kbuild: add modules.builtin.objs
>
>  .gitignore                          |   2 +-
>  Documentation/dontdiff              |   2 +-
>  Documentation/kbuild/kbuild.rst     |   5 ++
>  Makefile                            |   8 +-
>  include/linux/module.h              |   4 +-
>  kernel/trace/Kconfig                |  17 ++++
>  scripts/Makefile.lib                |   5 +-
>  scripts/Makefile.modinst            |  11 ++-
>  scripts/Makefile.vmlinux            |  17 ++++
>  scripts/Makefile.vmlinux_o          |  18 ++++-
>  scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++=
++++++
>  11 files changed, 228 insertions(+), 10 deletions(-)
>  create mode 100755 scripts/generate_builtin_ranges.awk
>
>
> base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
> --
> 2.42.0
>
>


--=20
Best Regards
Masahiro Yamada

