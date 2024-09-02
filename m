Return-Path: <linux-kbuild+bounces-3312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6E96808B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 09:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D966F1C21599
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 07:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2804D1714B7;
	Mon,  2 Sep 2024 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN7dXh0R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA1A1552F6;
	Mon,  2 Sep 2024 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262047; cv=none; b=jGLrvKb3tq+XmrZrjWXyegtk36+x27TjeYIzaUAegjyva5ZnNVD32OhS9zLJ2/lwjSfVeTRMzTc9/ApMQYfNYdC7SJkXW+FWe5YLgpuByfjwDL83+kdhdcynxrAju9mimUL7BE+fRDNbGs5FGeOyjPP0JTy9ugJcVhgIiWntjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262047; c=relaxed/simple;
	bh=95BxmoKAuPtRRbgouqskzb9K+3h5LChj6mmHxeistvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMjWisOLPkfdMUOaYK9EnTxz1SvlWhAEeGYrnR9IUDau9p1udf8IvCGhY0auZVqT5X7OeA6dzkrHg5cPFcyQWn1Vtw8RwqEI8ieQUg8GAEjlABjywKsbLzJgjJTzdiLJOVt5BHGC5JzKKuBTI9pH4pOckwJGlCKnoD1Vvk3RQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN7dXh0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E526C4CEC9;
	Mon,  2 Sep 2024 07:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725262046;
	bh=95BxmoKAuPtRRbgouqskzb9K+3h5LChj6mmHxeistvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BN7dXh0Rig0sXvgwqH4krE4pG0fWiDc8NIOrZiO9TCFGnq3XRVTn525+O+t50MJG3
	 HF9ICXWtw3Vna/7Q0jxaJ9kO/z2o5Nrzlr+e8w3ZhpmQBL830O+64Nmt2F9JjKppqI
	 HEQQa9yu+TSwV07VL6lWCWckC2NCsfMcYDHO/v4rtp1kTOoWAPG/addjsXkaNiwUnZ
	 pdOEEa4AUzmckB1xNn+hIPbzuhSDhbAmAUbN07bTsV9SlKLQnNskIwEO0lQLKoR2H+
	 zxL8qv+y2RDp0fnwtdBkzhpKS44Gu0VY9VRKiKB1tIARQrCcioE5doEWbbPRWQpVKu
	 dah6aj/b7CgPw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-533488ffaebso4651721e87.0;
        Mon, 02 Sep 2024 00:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3BwNSPNusMag7cWIsc6hGaDdW/quAaBRg6mA5h/gQVE01BiMaLDS+iCcfCaobkzxttDAvT7etQ63EBEumeA==@vger.kernel.org, AJvYcCWFASPCmh0X6O7yTySO9bIPjFxiPtiG5NDjbv4F9D06Dw0UldsRweoJvcqG8JA2kr/MnyJmAJcEzJi/c60=@vger.kernel.org, AJvYcCXnRqQycHBvndsPYfelmzPaYbpgYgICk+r8Ju7bOz/c47gcGRo1q1j/CNpJA+/zeHt9Oytqy12zFsbodU5ERmNYujwO@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJ845sY+Ig+M1LPyF53Sp1mvSVFgL+epex/ksERQcjjM4atGZ
	NkTzheP4SyoQvM938qPxE6Rvf4BBqZbrvbLoImZ9Obk0zZhKvz0hGMQRh04m/2z6pPeUF1xEcwA
	4FPQtxcFE+7cADcYWftkZWtz376Q=
X-Google-Smtp-Source: AGHT+IHwMvBDqfZG6gQ3WvghIG+/UUM+PVdp8YndKvoN3+J/IrhBRZtJRUo0Y6KBkff/nuryKHJTaMDIkCYWkQoY0bI=
X-Received: by 2002:a05:6512:3da9:b0:530:ae4a:58d0 with SMTP id
 2adb3069b0e04-53546af3605mr6524701e87.8.1725262045215; Mon, 02 Sep 2024
 00:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824033757.52005-1-kris.van.hees@oracle.com> <20240824033757.52005-3-kris.van.hees@oracle.com>
In-Reply-To: <20240824033757.52005-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Sep 2024 16:26:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKaCcmyTJPV+PhNyNu2ogFMU4OzgM0UncLRSoZa64ejA@mail.gmail.com>
Message-ID: <CAK7LNASKaCcmyTJPV+PhNyNu2ogFMU4OzgM0UncLRSoZa64ejA@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 12:38=E2=80=AFPM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:
>
> Create file module.builtin.ranges that can be used to find where
> built-in modules are located by their addresses. This will be useful for
> tracing tools to find what functions are for various built-in modules.
>
> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first membe=
r
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE
>
> The generated data will look like:
>
> .text 00000000-00000000 =3D _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 00b9f080-00ba011a intel_skl_int3472_discrete
> .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps6=
8470
> .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
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
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range dat=
a
> is generated for kernel modules that are built into the kernel image.
>
> How it works:
>
>  1. The modules.builtin file is parsed to obtain a list of built-in
>     module names and their associated object names (the .ko file that
>     the module would be in if it were a loadable module, hereafter
>     referred to as <kmodfile>).  This object name can be used to
>     identify objects in the kernel compile because any C or assembler
>     code that ends up into a built-in module will have the option
>     -DKBUILD_MODFILE=3D<kmodfile> present in its build command, and those
>     can be found in the .<obj>.cmd file in the kernel build tree.
>
>     If an object is part of multiple modules, they will all be listed
>     in the KBUILD_MODFILE option argument.
>
>     This allows us to conclusively determine whether an object in the
>     kernel build belong to any modules, and which.
>
>  2. The vmlinux.map is parsed next to determine the base address of each
>     top level section so that all addresses into the section can be
>     turned into offsets.  This makes it possible to handle sections
>     getting loaded at different addresses at system boot.
>
>     We also determine an 'anchor' symbol at the beginning of each
>     section to make it possible to calculate the true base address of
>     a section at runtime (i.e. symbol address - symbol offset).
>
>     We collect start addresses of sections that are included in the top
>     level section.  This is used when vmlinux is linked using vmlinux.o,
>     because in that case, we need to look at the vmlinux.o linker map to
>     know what object a symbol is found in.
>
>     And finally, we process each symbol that is listed in vmlinux.map
>     (or vmlinux.o.map) based on the following structure:
>
>     vmlinux linked from vmlinux.a:
>
>       vmlinux.map:
>         <top level section>
>           <included section>  -- might be same as top level section)
>             <object>          -- built-in association known
>               <symbol>        -- belongs to module(s) object belongs to
>               ...
>
>     vmlinux linked from vmlinux.o:
>
>       vmlinux.map:
>         <top level section>
>           <included section>  -- might be same as top level section)
>             vmlinux.o         -- need to use vmlinux.o.map
>               <symbol>        -- ignored
>               ...
>
>       vmlinux.o.map:
>         <section>
>             <object>          -- built-in association known
>               <symbol>        -- belongs to module(s) object belongs to
>               ...
>
>  3. As sections, objects, and symbols are processed, offset ranges are
>     constructed in a straight-forward way:
>
>       - If the symbol belongs to one or more built-in modules:
>           - If we were working on the same module(s), extend the range
>             to include this object
>           - If we were working on another module(s), close that range,
>             and start the new one
>       - If the symbol does not belong to any built-in modules:
>           - If we were working on a module(s) range, close that range
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>     Changes since v8:
>      - Added support for built-in Rust modules.
>      - Added optional 4th argument to specify kernel build directory.


When is the 4th parameter useful?

The map file knows all object paths.

The object file and its .*.cmd file exist in the same directory.

I did not find a use-case where the kdir prefix plays a role.

Did I miss something?



--
Best Regards
Masahiro Yamada

