Return-Path: <linux-kbuild+bounces-3469-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6719704EB
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 04:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B93BB2206E
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 02:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE02B9B5;
	Sun,  8 Sep 2024 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrZbUba2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA126281;
	Sun,  8 Sep 2024 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725763892; cv=none; b=CLkhuiTm6Q3BINVagHg1wpv8F96CLuJW2svrs2xSYgUfyTDPCZtH1p7bbP/bLghL+Ah5aRAB+GCC/FFIZ2zVTOzurroQGEcAv/nB/Q09xqBKjtzfLmohspK+6oHd5/xxCpuhaI6WV8ho2yB/tV0AX8JG1aOXUi0YovjuMQ6zSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725763892; c=relaxed/simple;
	bh=Tv/ED6S/FMzadGVYnT66mt0s95rzSx2VxOMLAXOFnp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxmYKsUsiYIe5cOiDJNB9PM3sAFJLN9hJUkz4PAVry7U/4NekKnIkABFYveVyeIA90GlACZmDNmYcn/Ajaj1pV0ODkjrw8AKWXcsRpFZIM8E/uXuuMKXALcJ2x9EHWB1n9/xTCmTkW9cdE1xOISeO7sWUtDYniR7fM5OCob97is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrZbUba2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8EAC4CEC8;
	Sun,  8 Sep 2024 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725763890;
	bh=Tv/ED6S/FMzadGVYnT66mt0s95rzSx2VxOMLAXOFnp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CrZbUba23LJmEMM+vUMPWzetPwwiJMiLTirJxpvCOCPuMWlv7CHykUEf1y8UXuI0q
	 1ve+vbX5U3MyOUiXd1FWx4iWPHGjIS6lNKoN+yCgnpxUzLejN9xAYMHpciM5Bs601U
	 nXaqsm2iiv3YwsPtpbLVvyhU5GK9Q0rbudBORKXYnCBS/MDQ6OdLsGV1iFBkONdBW5
	 YUngSys6W3e27hqTChWHJANrW/9dSLDUbUV+VhUo+yoEDBzOHfaSISzFLeGi/zAzAc
	 qRgr+s1kuK5tQfHFDLofgbJxWZ/KII18N6dThz9MMRYfMP5i53C6CvvL0MmIfoV6k5
	 VgzX4yNk9SLXw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75d044201so6319881fa.0;
        Sat, 07 Sep 2024 19:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy0gOsyTANoi7kK3V//22/FpdkCjQF0Cfmrzdk4e5k4eUIWAbJ3knHmp9YRJd6eMbinujcz7odfKkZc1ErjOGcdgBS@vger.kernel.org, AJvYcCVAYt9TCJ1Sh7jzOeuwuTxX9iGiPY8GP1CVNxEkccJGHQIKYyOkisng9x47w9F0qxOMD6AZXXop96lry5Q=@vger.kernel.org, AJvYcCVXWncFcUNekQV0jRFFxZQiLwdl8sKk7Bnkrmjh54tM4cmBo5fcZuXIl1hE8f4EMsLoQCJ3U/TgoYPUypa4nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2qZnANIyuanrmRMWAHP4ESCDWyVzyGSjebjy8WSJLSzM5tNd
	8dU4Rj9ENHOK03eW0V3hNd2BIwJSF2+rgcjVPArPinjlnL2OX5eUypYS3hI13SE9y87e998lBHx
	i5aAXT8Ap9+8rSnoPgzJbGGeDOo8=
X-Google-Smtp-Source: AGHT+IFCbPWbO63m3YcDbzyehY+q/eYvTtdimM3GvdqnmXWvtDQHDthbrVShmyXYH3cVZDYbKbJWyBpveDxmOqrHW6E=
X-Received: by 2002:a2e:a545:0:b0:2f7:6062:a0a9 with SMTP id
 38308e7fff4ca-2f76062a29bmr5747841fa.7.1725763889062; Sat, 07 Sep 2024
 19:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906144506.1151789-1-kris.van.hees@oracle.com> <20240906144506.1151789-3-kris.van.hees@oracle.com>
In-Reply-To: <20240906144506.1151789-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 11:50:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
Message-ID: <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 11:45=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
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
> Tested-by: Sam James <sam@gentoo.org>
> ---


If v10 is the final version, I offer to locally squash the following:



diff --git a/.gitignore b/.gitignore
index c06a3ef6d6c6..625bf59ad845 100644
--- a/.gitignore
+++ b/.gitignore
@@ -69,6 +69,7 @@ modules.order
 /Module.markers
 /modules.builtin
 /modules.builtin.modinfo
+/modules.builtin.ranges
 /modules.nsdeps

 #
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 3c399f132e2d..a867aea95c40 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -180,6 +180,7 @@ modpost
 modules-only.symvers
 modules.builtin
 modules.builtin.modinfo
+modules.builtin.ranges
 modules.nsdeps
 modules.order
 modversions.h*




If Sami reports more errors and you end up with v11,
please remember to fold it.





--=20
Best Regards
Masahiro Yamada

