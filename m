Return-Path: <linux-kbuild+bounces-3637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422197CE1F
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 21:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587B71C21EB5
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C215B21345;
	Thu, 19 Sep 2024 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dV0LaGw9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C0225A8
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2024 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726773857; cv=none; b=stjXx0BvAqYahU7ZHizq9n4aLVLp4PlyufmGCx3rDcow8vi/Cs3YNLMsOZMddwr2qlr7oEn9u02Mf1rmuoo4xYePF/kgfTFpLbomASHlilE8jDZjnT4an8ZHtX3rqsCNEJHY6uGcyIeR3+TgoU21lYM5Aun105Ez6b0ksAnTG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726773857; c=relaxed/simple;
	bh=IjDT9iqTJHfrRFhCloh81vzl0vaVD8F/cZMy720WJhA=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=h0ME+HDDavcV/bAEXMSDEAN3OYhTWY1Cn11wx+jE3VHz2GU152fyq9Q4/Ir2Bz0AyA0MRyGkeNNqwOcbCtTtZmUgTA9BwWxUCrInkE2dgWpO4+jGFHGWVbuOcOGas9CVZmSj+k/EVOLSFFB5XV574qBhOiwrWgHJzK1gUnUeT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dV0LaGw9; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240919192412euoutp02f6ba5180befca1bebdf6c56a8bf6b899~2u6uSj4aj3242632426euoutp02Y
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2024 19:24:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240919192412euoutp02f6ba5180befca1bebdf6c56a8bf6b899~2u6uSj4aj3242632426euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726773852;
	bh=QJPcX8V73+obafRpp+Tuw1mRcu/lkVFqnLsDYylEpOc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dV0LaGw9U3p0PDPYvVLDNluXrAHg0zYSsvzDI3WMFPuT4FYr2IOchrQ1tq8+xRa6e
	 dUlZWnfxKasjQ7W5lUw+iJTbTaaZ2ar6Iegj8uHOIjVeFkUldwvzmCjtAeFVAsR1o6
	 9rhh1aIVQXLr12AdWFrXY4rBZGFzFDtg4KAB1LWI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240919192412eucas1p12cc3da4af716cb68b879589751584559~2u6t5hzaf0918109181eucas1p1O;
	Thu, 19 Sep 2024 19:24:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id B5.B4.09624.C5A7CE66; Thu, 19
	Sep 2024 20:24:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240919192410eucas1p1b20597bb951af35f31e3fe5e0df62294~2u6sk-PJ90914409144eucas1p1C;
	Thu, 19 Sep 2024 19:24:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240919192410eusmtrp1cade60775b53c9cbded91cc0c51a394a~2u6sj1GPq0926209262eusmtrp1e;
	Thu, 19 Sep 2024 19:24:10 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-c4-66ec7a5cbcd8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 8C.45.19096.A5A7CE66; Thu, 19
	Sep 2024 20:24:10 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240919192410eusmtip2c17e21735de8bbb0a7b34f45e71ac409~2u6sXJqP20065600656eusmtip2E;
	Thu, 19 Sep 2024 19:24:10 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 19 Sep 2024 20:24:08 +0100
Date: Thu, 19 Sep 2024 21:24:08 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Sam James <sam@gentoo.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Kris Van Hees
	<kris.van.hees@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, Nick Alcock <nick.alcock@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>, Steven Rostedt
	<rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
	Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <20240919192408.e4phivt2h742e7mo@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ldzncy8l.fsf@gentoo.org>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djP87oxVW/SDF42cVvcONTIYrHx9H02
	i/Nf/zJb/Nm1g8ni8q45bBYNs7+zWhxZf5bF4uGDG6wWNyY8ZbRYvFzN4sOE/0wWJ74cZ7Q4
	/n8No8W+jgdMFrvuPWR24Pe4/P0Ns8fOWXfZPVr23WL3WLCp1GPTqk42j49Pb7F4fN4kF8Ae
	xWWTkpqTWZZapG+XwJXxbs9cxoLF9RXn959ga2DcldDFyMkhIWAisfv0DMYuRi4OIYEVjBLL
	/+xjgXC+MEp0tNxng3A+M0qcvnGUGaal9fYsqMRyRomj3ccY4ar6XhxmgnA2M0q83j2XEaSF
	RUBVYubXHiYQm01AU2LfyU3sILaIgJzE9PZ5YN3MAgtZJLqWnQDbISwQKnGsbTqYzSvgLbH9
	w18WCFtQ4uTMJ0A2B1CDpsT6XfoQprTE8n8cIBXMAvISzVtng3VyCmhINC/4D3W1osSMiStZ
	IOxaiVNbboHdKSGwn1Ni277pTBAJF4kZ+y6wQtjCEq+Ob2GHsGUkTk/ugWpOl1iybhaUXSCx
	5/YsVpAbJASsJfrO5ECEHSWW3L4FFeaTuPFWEOI0PolJ20CeAgnzSnS0CU1gVJmF5K1ZCG/N
	QnhrFpK3FjCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMcKf/Hf+0g3Huq496hxiZ
	OBgPMUpwMCuJ8Ip/eJkmxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc1RT5VSCA9sSQ1OzW1ILUI
	JsvEwSnVwCR7hfuJYPHOvatkH8tE1ujnp/TsuWxaeVtrE0/vXuaWOpPTfAdXNpTHB3ps/LHP
	7+X0lDR3G/Po1tONfvekWKUW/JlkOJFhf1bx8XdhsgH/p+qci3rUy/xxv4z/paL/VzyPPxFj
	3ZDQFFK0ycihIDC8w/rI5kNbVdm9ojnuzckQ7ZCaWbuLVcN5b8+mf7euH+mdtCPt8rGJq75P
	32jpyfFqTfCuP7P29V0uXnr+Ts0fvmIj3beTcqXzvT7tkd1R6jbltXDZzJNvBSpPT1p0abKU
	2/OzOrPc2rU+PX1wY8bl41r7mMS8/px9nZHBtn2Fn7lTfcKk/ZVPl4X5a8ioF3K+2rlN7uj6
	iC82pZJLpm1RYinOSDTUYi4qTgQArJNMpt8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsVy+t/xe7pRVW/SDH7P1re4caiRxWLj6fts
	Fue//mW2+LNrB5PF5V1z2CwaZn9ntTiy/iyLxcMHN1gtbkx4ymixeLmaxYcJ/5ksTnw5zmhx
	/P8aRot9HQ+YLHbde8jswO9x+fsbZo+ds+6ye7Tsu8XusWBTqcemVZ1sHh+f3mLx+LxJLoA9
	Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j3Z65
	jAWL6yvO7z/B1sC4K6GLkZNDQsBEovX2LLYuRi4OIYGljBJX9jxmh0jISGz8cpUVwhaW+HOt
	C6roI6PEo73NjCAJIYHNjBLPvmuA2CwCqhIzv/YwgdhsApoS+05uAhskIiAnMb19HiNIM7PA
	QhaJhc/6mEESwgKhEsfapoPZvALeEts//GWB2PCBSWLL/f1sEAlBiZMznwAlOIC6NSXW79KH
	MKUllv/jAKlgFpCXaN46G2wMp4CGRPOC/8wQRytKzJi4kgXCrpX4/PcZ4wRGkVlIhs5CGDoL
	YegsJEMXMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECEwA24793LKDceWrj3qHGJk4GA8x
	SnAwK4nwin94mSbEm5JYWZValB9fVJqTWnyI0RQYQhOZpUST84EpKK8k3tDMwNTQxMzSwNTS
	zFhJnJftyvk0IYH0xJLU7NTUgtQimD4mDk6pBqadKVPqlIPyFmYbrXw8LTDp79JzXemPmY5x
	10TPXbHsrNnuNoEnsu3Rn42nqPopPl5QV7H4zcf2/Z6Gdi6VK81fd9kwm8lf0JRqv8C0+nWh
	isbZN0I2MfVOEwTnWb8+Wr3yNitH3uHo2t31c8z28h3YrBF/6E3Do4yi1DDR6KlJ/xmENTbu
	PrkiV+2cKpNwG+e3mRvqzd8dLpk+f7/W64in1rl9WlU+tkte/588I+DLh8in4Uu9n994pWR8
	Va6+Qk7my7R9TnLXCuReX35R17KI79/O3T7lt+Z9Xzu1f8nkZ68XsCnJbDx2p2ni9r83HUMm
	pi6IW8l3s8LLU/LSMwbp06V79iTHbunMWKkVpbdCiaU4I9FQi7moOBEACSnuo4kDAAA=
X-CMS-MailID: 20240919192410eucas1p1b20597bb951af35f31e3fe5e0df62294
X-Msg-Generator: CA
X-RootMTR: 20240919170739eucas1p1213d18f662c5370f71887fa1a5936409
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240919170739eucas1p1213d18f662c5370f71887fa1a5936409
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
	<CGME20240919170739eucas1p1213d18f662c5370f71887fa1a5936409@eucas1p1.samsung.com>
	<20240906144506.1151789-3-kris.van.hees@oracle.com>
	<20240919170737.3oe2teklabpz54hx@AALNPWDAGOMEZ1.aal.scsc.local>
	<CAK7LNAR_TKY+eiW6C_9DhDKY=7x9zmh=CMEM3fVSL6n26ruEjQ@mail.gmail.com>
	<87ldzncy8l.fsf@gentoo.org>

On Thu, Sep 19, 2024 at 07:08:42PM +0100, Sam James wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
> 
> > On Fri, Sep 20, 2024 at 2:07 AM Daniel Gomez <da.gomez@samsung.com> wrote:
> >>
> >> On Fri, Sep 06, 2024 at 10:45:03AM -0400, Kris Van Hees wrote:
> >> > Create file module.builtin.ranges that can be used to find where
> >> > built-in modules are located by their addresses. This will be useful for
> >> > tracing tools to find what functions are for various built-in modules.
> >> >
> >> > The offset range data for builtin modules is generated using:
> >> >  - modules.builtin: associates object files with module names
> >> >  - vmlinux.map: provides load order of sections and offset of first member
> >> >     per section
> >> >  - vmlinux.o.map: provides offset of object file content per section
> >> >  - .*.cmd: build cmd file with KBUILD_MODFILE
> >> >
> >> > The generated data will look like:
> >> >
> >> > .text 00000000-00000000 = _text
> >> > .text 0000baf0-0000cb10 amd_uncore
> >> > .text 0009bd10-0009c8e0 iosf_mbi
> >> > ...
> >> > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> >> > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> >> > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> >> > ...
> >> > .data 00000000-00000000 = _sdata
> >> > .data 0000f020-0000f680 amd_uncore
> >> >
> >> > For each ELF section, it lists the offset of the first symbol.  This can
> >> > be used to determine the base address of the section at runtime.
> >> >
> >> > Next, it lists (in strict ascending order) offset ranges in that section
> >> > that cover the symbols of one or more builtin modules.  Multiple ranges
> >> > can apply to a single module, and ranges can be shared between modules.
> >> >
> >> > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> >> > is generated for kernel modules that are built into the kernel image.
> >> >
> >> > How it works:
> >> >
> >> >  1. The modules.builtin file is parsed to obtain a list of built-in
> >> >     module names and their associated object names (the .ko file that
> >> >     the module would be in if it were a loadable module, hereafter
> >> >     referred to as <kmodfile>).  This object name can be used to
> >> >     identify objects in the kernel compile because any C or assembler
> >> >     code that ends up into a built-in module will have the option
> >> >     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> >> >     can be found in the .<obj>.cmd file in the kernel build tree.
> >> >
> >> >     If an object is part of multiple modules, they will all be listed
> >> >     in the KBUILD_MODFILE option argument.
> >> >
> >> >     This allows us to conclusively determine whether an object in the
> >> >     kernel build belong to any modules, and which.
> >> >
> >> >  2. The vmlinux.map is parsed next to determine the base address of each
> >> >     top level section so that all addresses into the section can be
> >> >     turned into offsets.  This makes it possible to handle sections
> >> >     getting loaded at different addresses at system boot.
> >> >
> >> >     We also determine an 'anchor' symbol at the beginning of each
> >> >     section to make it possible to calculate the true base address of
> >> >     a section at runtime (i.e. symbol address - symbol offset).
> >> >
> >> >     We collect start addresses of sections that are included in the top
> >> >     level section.  This is used when vmlinux is linked using vmlinux.o,
> >> >     because in that case, we need to look at the vmlinux.o linker map to
> >> >     know what object a symbol is found in.
> >> >
> >> >     And finally, we process each symbol that is listed in vmlinux.map
> >> >     (or vmlinux.o.map) based on the following structure:
> >> >
> >> >     vmlinux linked from vmlinux.a:
> >> >
> >> >       vmlinux.map:
> >> >         <top level section>
> >> >           <included section>  -- might be same as top level section)
> >> >             <object>          -- built-in association known
> >> >               <symbol>        -- belongs to module(s) object belongs to
> >> >               ...
> >> >
> >> >     vmlinux linked from vmlinux.o:
> >> >
> >> >       vmlinux.map:
> >> >         <top level section>
> >> >           <included section>  -- might be same as top level section)
> >> >             vmlinux.o         -- need to use vmlinux.o.map
> >> >               <symbol>        -- ignored
> >> >               ...
> >> >
> >> >       vmlinux.o.map:
> >> >         <section>
> >> >             <object>          -- built-in association known
> >> >               <symbol>        -- belongs to module(s) object belongs to
> >> >               ...
> >> >
> >> >  3. As sections, objects, and symbols are processed, offset ranges are
> >> >     constructed in a straight-forward way:
> >> >
> >> >       - If the symbol belongs to one or more built-in modules:
> >> >           - If we were working on the same module(s), extend the range
> >> >             to include this object
> >> >           - If we were working on another module(s), close that range,
> >> >             and start the new one
> >> >       - If the symbol does not belong to any built-in modules:
> >> >           - If we were working on a module(s) range, close that range
> >> >
> >> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> >> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> >> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> >> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> >> > Tested-by: Sam James <sam@gentoo.org>
> >> > ---
> >> >
> >> > Notes:
> >> >     Changes since v9:
> >> >      - Reverted support for build directory as optional 4th argument.
> >> >      - Added modules.builtin.ranges and vmlinux.o.map to CLEAN_FILES.
> >> >      - Fixed support for sparc64.
> >> >
> >> >     Changes since v8:
> >> >      - Added support for built-in Rust modules.
> >> >      - Added optional 4th argument to specify kernel build directory.
> >> >
> >> >     Changes since v7:
> >> >      - Removed extra close(fn).
> >> >      - Make CONFIG_BUILTIN_MODULE_RANGES depend on !lTO.
> >> >
> >> >     Changes since v6:
> >> >      - Applied Masahiro Yamada's suggestions (Kconfig, makefile, script).
> >> >
> >> >     Changes since v5:
> >> >      - Removed unnecessary compatibility info from option description.
> >> >
> >> >     Changes since v4:
> >> >      - Improved commit description to explain the why and how.
> >> >      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
> >> >      - Improved comments in generate_builtin_ranges.awk
> >> >      - Improved logic in generate_builtin_ranges.awk to handle incorrect
> >> >        object size information in linker maps
> >> >
> >> >     Changes since v3:
> >> >      - Consolidated patches 2 through 5 into a single patch
> >> >      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
> >> >      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
> >> >      - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
> >> >      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
> >> >      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
> >> >
> >> >     Changes since v2:
> >> >      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
> >> >      - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
> >> >      - Switched from using modules.builtin.objs to parsing .*.cmd files
> >> >      - Parse data from .*.cmd in generate_builtin_ranges.awk
> >> >      - Use $(real-prereqs) rather than $(filter-out ...)
> >> >     ---
> >> >
> >> >  Documentation/process/changes.rst   |   7 +
> >> >  Makefile                            |   1 +
> >> >  lib/Kconfig.debug                   |  15 +
> >> >  scripts/Makefile.vmlinux            |  18 +
> >> >  scripts/Makefile.vmlinux_o          |   3 +
> >> >  scripts/generate_builtin_ranges.awk | 508 ++++++++++++++++++++++++++++
> >> >  6 files changed, 552 insertions(+)
> >> >  create mode 100755 scripts/generate_builtin_ranges.awk
> >> >
> >> > diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> >> > index 3fc63f27c226..00f1ed7c59c3 100644
> >> > --- a/Documentation/process/changes.rst
> >> > +++ b/Documentation/process/changes.rst
> >> > @@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
> >> >  gtags (optional)       6.6.5            gtags --version
> >> >  mkimage (optional)     2017.01          mkimage --version
> >> >  Python (optional)      3.5.x            python3 --version
> >> > +GNU AWK (optional)     5.1.0            gawk --version
> >> >  ====================== ===============  ========================================
> >> >
> >> >  .. [#f1] Sphinx is needed only to build the Kernel documentation
> >> > @@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
> >> >  built from the U-Boot source code. See the instructions at
> >> >  https://protect2.fireeye.com/v1/url?k=6b601b01-34fc322b-6b61904e-000babe598f7-59f65dfa7ee29fbf&q=1&e=8abd7076-5118-4660-a833-f762c2c71d32&u=https%3A%2F%2Fdocs.u-boot.org%2Fen%2Flatest%2Fbuild%2Ftools.html%23building-tools-for-linux
> >> >
> >> > +GNU AWK
> >> > +-------
> >> > +
> >> > +GNU AWK is needed if you want kernel builds to generate address range data for
> >> > +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> >> > +
> >> >  System utilities
> >> >  ****************
> >> >
> >> > diff --git a/Makefile b/Makefile
> >> > index d57cfc6896b8..ec98a1e5b257 100644
> >> > --- a/Makefile
> >> > +++ b/Makefile
> >> > @@ -1482,6 +1482,7 @@ endif # CONFIG_MODULES
> >> >  # Directories & files removed with 'make clean'
> >> >  CLEAN_FILES += vmlinux.symvers modules-only.symvers \
> >> >              modules.builtin modules.builtin.modinfo modules.nsdeps \
> >> > +            modules.builtin.ranges vmlinux.o.map \
> >> >              compile_commands.json rust/test \
> >> >              rust-project.json .vmlinux.objs .vmlinux.export.c
> >> >
> >> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> >> > index a30c03a66172..5e2f30921cb2 100644
> >> > --- a/lib/Kconfig.debug
> >> > +++ b/lib/Kconfig.debug
> >> > @@ -571,6 +571,21 @@ config VMLINUX_MAP
> >> >         pieces of code get eliminated with
> >> >         CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> >> >
> >> > +config BUILTIN_MODULE_RANGES
> >> > +     bool "Generate address range information for builtin modules"
> >> > +     depends on !LTO
> >> > +     depends on VMLINUX_MAP
> >> > +     help
> >> > +      When modules are built into the kernel, there will be no module name
> >> > +      associated with its symbols in /proc/kallsyms.  Tracers may want to
> >> > +      identify symbols by module name and symbol name regardless of whether
> >> > +      the module is configured as loadable or not.
> >> > +
> >> > +      This option generates modules.builtin.ranges in the build tree with
> >> > +      offset ranges (per ELF section) for the module(s) they belong to.
> >> > +      It also records an anchor symbol to determine the load address of the
> >> > +      section.
> >> > +
> >> >  config DEBUG_FORCE_WEAK_PER_CPU
> >> >       bool "Force weak per-cpu definitions"
> >> >       depends on DEBUG_KERNEL
> >> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> >> > index 5ceecbed31eb..dfb408aa19c6 100644
> >> > --- a/scripts/Makefile.vmlinux
> >> > +++ b/scripts/Makefile.vmlinux
> >> > @@ -33,6 +33,24 @@ targets += vmlinux
> >> >  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> >> >       +$(call if_changed_dep,link_vmlinux)
> >> >
> >> > +# module.builtin.ranges
> >> > +# ---------------------------------------------------------------------------
> >> > +ifdef CONFIG_BUILTIN_MODULE_RANGES
> >> > +__default: modules.builtin.ranges
> >> > +
> >> > +quiet_cmd_modules_builtin_ranges = GEN     $@
> >> > +      cmd_modules_builtin_ranges = $(real-prereqs) > $@
> >> > +
> >> > +targets += modules.builtin.ranges
> >> > +modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
> >> > +                     modules.builtin vmlinux.map vmlinux.o.map FORCE
> >> > +     $(call if_changed,modules_builtin_ranges)
> >> > +
> >> > +vmlinux.map: vmlinux
> >> > +     @:
> >> > +
> >> > +endif
> >> > +
> >> >  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
> >> >  # ---------------------------------------------------------------------------
> >> >
> >> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> >> > index d64070b6b4bc..0b6e2ebf60dc 100644
> >> > --- a/scripts/Makefile.vmlinux_o
> >> > +++ b/scripts/Makefile.vmlinux_o
> >> > @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
> >> >  # Link of vmlinux.o used for section mismatch analysis
> >> >  # ---------------------------------------------------------------------------
> >> >
> >> > +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)    += -Map=$@.map
> >> > +
> >> >  quiet_cmd_ld_vmlinux.o = LD      $@
> >> >        cmd_ld_vmlinux.o = \
> >> >       $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> >> > +     $(vmlinux-o-ld-args-y) \
> >> >       $(addprefix -T , $(initcalls-lds)) \
> >> >       --whole-archive vmlinux.a --no-whole-archive \
> >> >       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> >> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> >> > new file mode 100755
> >> > index 000000000000..b9ec761b3bef
> >> > --- /dev/null
> >> > +++ b/scripts/generate_builtin_ranges.awk
> >> > @@ -0,0 +1,508 @@
> >> > +#!/usr/bin/gawk -f
> >>
> >> This forces the gawk to be found always in /usr/bin. For systems where gawk can
> >> be located in other places, can we change the Shebang to:
> >>
> >> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> >> index b9ec761b3bef..886251c8d3f7 100755
> >> --- a/scripts/generate_builtin_ranges.awk
> >> +++ b/scripts/generate_builtin_ranges.awk
> >> @@ -1,4 +1,4 @@
> >> -#!/usr/bin/gawk -f
> >> +#!/usr/bin/env gawk -f
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  # generate_builtin_ranges.awk: Generate address range data for builtin modules
> >>  # Written by Kris Van Hees <kris.van.hees@oracle.com>
> >
> >
> > No. We cannot fix it this way.

May I ask why if a distro installs gawk somewhere else, the "/usr/bin/env"
approach will not work either? I just want to understand that case.

> >
> >
> > I already pointed out this shebang issue.
> >
> > https://lore.kernel.org/lkml/CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com/

To clarify, I've mentioned this because the patch landed in the linux-next
without the fix below. And I did not see there was a build error reporting it.

Thanks for sending the link!

> >
> >
> >
> > I thought Kris would send a fix up, but
> > perhaps people tend to be busy with LPC this week.
> >
> >
> 
> He did, see https://lore.kernel.org/all/20240912171646.1523528-1-kris.van.hees@oracle.com/.

Thanks for the link. That worked for me too.

> 
> >
> >> Not sure if it's too late? in that case I can send a patch to change this.
> >
> >
> > I can locally fix it up.
> >
> > Kris agreed with this fix.
> >
> >
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index dfb408aa19c6..1284f05555b9 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -39,7 +39,7 @@ ifdef CONFIG_BUILTIN_MODULE_RANGES
> >  __default: modules.builtin.ranges
> >
> >  quiet_cmd_modules_builtin_ranges = GEN     $@
> > -      cmd_modules_builtin_ranges = $(real-prereqs) > $@
> > +      cmd_modules_builtin_ranges = gawk -f $(real-prereqs) > $@
> >
> >  targets += modules.builtin.ranges
> >  modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \

