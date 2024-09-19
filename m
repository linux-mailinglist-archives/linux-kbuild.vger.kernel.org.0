Return-Path: <linux-kbuild+bounces-3628-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3C97CCE1
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 537051C225D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 17:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901FE1A0BC4;
	Thu, 19 Sep 2024 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ikkNfrEa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5441A072A
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726765666; cv=none; b=gRtwKjL8SZNWmJ8Lp6lJkrYbSi2djrVGlYdKGW7LeOYss/m/n90xzMT6hH7DpjyZISWKoU/LUspXQCS2s8h5wPeTdHInYAxLlYl7G4zIhfoSuXL8+EAdws7Vd9tFpYdVr902Cs7ytxi0H6748GRMhjhJQkg4LNq8DztdW2LxIy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726765666; c=relaxed/simple;
	bh=L366IzsCSTjtrjmDG7asgbn7F61XBkrxY2zd9gHNJKA=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=qGRofr9gR/hA2Bl0okcuEqkvg2dhIBxr0X57uv8iLUiPIgCZ1kbsztTTxkcJes5v7UnZQvcXlmEkIj3gY2XVENyrDT85LcGdnThvWXDo6AcBNvX6EQy/KjBmKM19ERxhfiHSSGgquB6mFm4klJ+bmirkue4SK5YVdp0tqSOMad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ikkNfrEa; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240919170740euoutp01fe07c3a5169391f72dcaff96fb27bc50~2tDg380ma0763007630euoutp01I
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2024 17:07:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240919170740euoutp01fe07c3a5169391f72dcaff96fb27bc50~2tDg380ma0763007630euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726765660;
	bh=2vXOZPBEYzgQT+vJRldjTjo3CTg5NUJmrjjUn7gF8hA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ikkNfrEaYjMklCPO+1MMUfYiAFlyE23TimNA+MKHVv6pox5gUpW9QKm8M3pcqbOBC
	 M53EuBjvOTi+uGEJutvItcOx0StCETXmdva72QtwHsSvUO87O/snMZu9y4zSg89NI5
	 VAe3v2WgJUSnlIKvN2x65+rIQHbdMPOzXtMm2fsE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240919170739eucas1p2c87aa5e915c3791f646fbc0208048ff2~2tDgKaDxx3240832408eucas1p26;
	Thu, 19 Sep 2024 17:07:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 96.C1.09620.B5A5CE66; Thu, 19
	Sep 2024 18:07:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240919170739eucas1p1213d18f662c5370f71887fa1a5936409~2tDfmJz760623906239eucas1p1l;
	Thu, 19 Sep 2024 17:07:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240919170739eusmtrp1be6aa590a3fdec2baab242383511c1bb~2tDfkyvEf2364923649eusmtrp1I;
	Thu, 19 Sep 2024 17:07:39 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-46-66ec5a5bb337
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 2D.E2.19096.B5A5CE66; Thu, 19
	Sep 2024 18:07:39 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240919170739eusmtip2013f231205d12f818833e4896bec73d9~2tDfWtwCX0439304393eusmtip2O;
	Thu, 19 Sep 2024 17:07:39 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 19 Sep 2024 18:07:38 +0100
Date: Thu, 19 Sep 2024 19:07:37 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
CC: <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, Nick
	Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, Masahiro
	Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
	Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <20240919170737.3oe2teklabpz54hx@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906144506.1151789-3-kris.van.hees@oracle.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djP87rRUW/SDBZ8N7C4caiRxWLj6fts
	Fue//mW2+LNrB5PF5V1z2CwaZn9ntTiy/iyLxcMHN1gtbkx4ymixeLmaxYcJ/5ksTnw5zmhx
	/P8aRot9HQ+YLHbde8jswO9x+fsbZo+ds+6ye7Tsu8XusWBTqcemVZ1sHh+f3mLx+LxJLoA9
	issmJTUnsyy1SN8ugSvj9/XdjAUX3jJWHJ/9i7GBcfNmxi5GTg4JAROJi/c2sXYxcnEICaxg
	lLhx+SCU84VR4uz5W4wQzmdGiUdPL8K1LJjRzw6RWM4oMWtzBwtCVd9jZghnM6PE6ps9YC0s
	AqoSD6YvZQWx2QQ0Jfad3ATUzsEhIqAj8XhhDEg9s8BEFomzn5aD1QgLhEoca5vODGLzCnhL
	zPlxlQ3CFpQ4OfMJC4jNDNS7YPcnNpA5zALSEsv/cYCYnAIOEn3vpCEOVZSYMXElC4RdK3Fq
	yy0mkFUSAus5Ja6cP8QGkXCRWPdlJtRnwhKvjm9hh7BlJE5P7oFqTpdYsm4WlF0gsef2LFaQ
	XRIC1hJ9Z3Igwo4SS27fggrzSdx4KwhxJJ/EpG0gj4CEeSU62oQgqtUkVt97wzKBUXkWkrdm
	IXlrFsJbCxiZVzGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgQms9P/jn/dwbji1Ue9Q4xM
	HIyHGCU4mJVEeMU/vEwT4k1JrKxKLcqPLyrNSS0+xCjNwaIkzquaIp8qJJCeWJKanZpakFoE
	k2Xi4JRqYGKwn/Dkn/tOxbOrOMw2hKyav6Ze41JXwWom18jMTF0/68shf6fUWXRX6f70+hiz
	pfCpfCW3VXwok7+8O29Jllfi3X9FhyZtT62Y+Zfv7cMKy5t3t1Wx/yzI7EtdedVdwffl2vq1
	On+fzbw8v2hd3MmUmT3nQpfpdCkK97/+eXOFwgahkN5bHD/8Ch/VTfh/m4n752bmyXdSPTgW
	nEmu8+iV+V4zfcGM2Ueb5rMm7/fYxmKSe2SN4pV6dpbL/eIHJz+Q3MKwJH3FdqlFXLa8iwwK
	fj1i/aQ34W+a1iZ3o5hnX05HtAQJ5y6cb12S9qpvsb/lneMF7wKff5KI36ebUWn9Istk82mL
	itVul2uvPlJiKc5INNRiLipOBABKt+NF1QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7rRUW/SDHYs4LG4caiRxWLj6fts
	Fue//mW2+LNrB5PF5V1z2CwaZn9ntTiy/iyLxcMHN1gtbkx4ymixeLmaxYcJ/5ksTnw5zmhx
	/P8aRot9HQ+YLHbde8jswO9x+fsbZo+ds+6ye7Tsu8XusWBTqcemVZ1sHh+f3mLx+LxJLoA9
	Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j9/Xd
	jAUX3jJWHJ/9i7GBcfNmxi5GTg4JAROJBTP62bsYuTiEBJYySpxrf80OkZCR2PjlKiuELSzx
	51oXG0TRR0aJnktvoTo2M0psbLrDDFLFIqAq8WD6UrAONgFNiX0nNwEVcXCICOhIPF4YA1LP
	LDCRReJwXzPYamGBUIljbdPBenkFvCXm/LjKBlIvJFAqseVrLURYUOLkzCcsIDYz0JgFuz+B
	lTALSEss/8cBYnIKOEj0vZOGOFNRYsbElSwQdq3E57/PGCcwCs9CMmgWkkGzEAYtYGRexSiS
	Wlqcm55bbKRXnJhbXJqXrpecn7uJERjT24793LKDceWrj3qHGJk4GA8xSnAwK4nwin94mSbE
	m5JYWZValB9fVJqTWnyI0RQYDhOZpUST84FJJa8k3tDMwNTQxMzSwNTSzFhJnJftyvk0IYH0
	xJLU7NTUgtQimD4mDk6pBibnnb7NtlZtVd/ush9J0JyXWe1d8zQw36QpZ8Xf/Re9/vtv52y5
	6f435Pl5JY/mc1kyBZra+xjWTOd7eMt3gZeV0sTGaWt5N2Rdme2tELJCKuTk887L++IfzrvR
	v/4Ow4/z+Zvfrll22GPTvYDddf5Fqqmm4Z48Z0vZpTadODE3aYrotyz1cok1kzt1pF4e/NBv
	cN55jaLMttv5SToGPHcXGpccuvWJ5crqc7vsO0+EnnzeUPsj5b/kt4Uxdg/KY9du/Re4SeFe
	Uof063tKFRN+VCVMXvmg6kpw8a+sJVuYeK+e12x3CMt5oLp8607PsnPum3dt+TOTj7fg3+y7
	zGuuPzVfYWS8KvNtZpRez31nJZbijERDLeai4kQA2+ddAXIDAAA=
X-CMS-MailID: 20240919170739eucas1p1213d18f662c5370f71887fa1a5936409
X-Msg-Generator: CA
X-RootMTR: 20240919170739eucas1p1213d18f662c5370f71887fa1a5936409
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240919170739eucas1p1213d18f662c5370f71887fa1a5936409
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
	<20240906144506.1151789-3-kris.van.hees@oracle.com>
	<CGME20240919170739eucas1p1213d18f662c5370f71887fa1a5936409@eucas1p1.samsung.com>

On Fri, Sep 06, 2024 at 10:45:03AM -0400, Kris Van Hees wrote:
> Create file module.builtin.ranges that can be used to find where
> built-in modules are located by their addresses. This will be useful for
> tracing tools to find what functions are for various built-in modules.
> 
> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first member
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE
> 
> The generated data will look like:
> 
> .text 00000000-00000000 = _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 00b9f080-00ba011a intel_skl_int3472_discrete
> .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> ...
> .data 00000000-00000000 = _sdata
> .data 0000f020-0000f680 amd_uncore
> 
> For each ELF section, it lists the offset of the first symbol.  This can
> be used to determine the base address of the section at runtime.
> 
> Next, it lists (in strict ascending order) offset ranges in that section
> that cover the symbols of one or more builtin modules.  Multiple ranges
> can apply to a single module, and ranges can be shared between modules.
> 
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
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
>     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
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
> 
> Notes:
>     Changes since v9:
>      - Reverted support for build directory as optional 4th argument.
>      - Added modules.builtin.ranges and vmlinux.o.map to CLEAN_FILES.
>      - Fixed support for sparc64.
>     
>     Changes since v8:
>      - Added support for built-in Rust modules.
>      - Added optional 4th argument to specify kernel build directory.
>     
>     Changes since v7:
>      - Removed extra close(fn).
>      - Make CONFIG_BUILTIN_MODULE_RANGES depend on !lTO.
>     
>     Changes since v6:
>      - Applied Masahiro Yamada's suggestions (Kconfig, makefile, script).
>     
>     Changes since v5:
>      - Removed unnecessary compatibility info from option description.
>     
>     Changes since v4:
>      - Improved commit description to explain the why and how.
>      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
>      - Improved comments in generate_builtin_ranges.awk
>      - Improved logic in generate_builtin_ranges.awk to handle incorrect
>        object size information in linker maps
>     
>     Changes since v3:
>      - Consolidated patches 2 through 5 into a single patch
>      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
>      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
>      - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
>      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
>      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
>     
>     Changes since v2:
>      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
>      - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
>      - Switched from using modules.builtin.objs to parsing .*.cmd files
>      - Parse data from .*.cmd in generate_builtin_ranges.awk
>      - Use $(real-prereqs) rather than $(filter-out ...)
>     ---
> 
>  Documentation/process/changes.rst   |   7 +
>  Makefile                            |   1 +
>  lib/Kconfig.debug                   |  15 +
>  scripts/Makefile.vmlinux            |  18 +
>  scripts/Makefile.vmlinux_o          |   3 +
>  scripts/generate_builtin_ranges.awk | 508 ++++++++++++++++++++++++++++
>  6 files changed, 552 insertions(+)
>  create mode 100755 scripts/generate_builtin_ranges.awk
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 3fc63f27c226..00f1ed7c59c3 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
>  Python (optional)      3.5.x            python3 --version
> +GNU AWK (optional)     5.1.0            gawk --version
>  ====================== ===============  ========================================
>  
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
> @@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
>  built from the U-Boot source code. See the instructions at
>  https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
>  
> +GNU AWK
> +-------
> +
> +GNU AWK is needed if you want kernel builds to generate address range data for
> +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> +
>  System utilities
>  ****************
>  
> diff --git a/Makefile b/Makefile
> index d57cfc6896b8..ec98a1e5b257 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1482,6 +1482,7 @@ endif # CONFIG_MODULES
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  	       modules.builtin modules.builtin.modinfo modules.nsdeps \
> +	       modules.builtin.ranges vmlinux.o.map \
>  	       compile_commands.json rust/test \
>  	       rust-project.json .vmlinux.objs .vmlinux.export.c
>  
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index a30c03a66172..5e2f30921cb2 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -571,6 +571,21 @@ config VMLINUX_MAP
>  	  pieces of code get eliminated with
>  	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>  
> +config BUILTIN_MODULE_RANGES
> +	bool "Generate address range information for builtin modules"
> +	depends on !LTO
> +	depends on VMLINUX_MAP
> +	help
> +	 When modules are built into the kernel, there will be no module name
> +	 associated with its symbols in /proc/kallsyms.  Tracers may want to
> +	 identify symbols by module name and symbol name regardless of whether
> +	 the module is configured as loadable or not.
> +
> +	 This option generates modules.builtin.ranges in the build tree with
> +	 offset ranges (per ELF section) for the module(s) they belong to.
> +	 It also records an anchor symbol to determine the load address of the
> +	 section.
> +
>  config DEBUG_FORCE_WEAK_PER_CPU
>  	bool "Force weak per-cpu definitions"
>  	depends on DEBUG_KERNEL
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 5ceecbed31eb..dfb408aa19c6 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -33,6 +33,24 @@ targets += vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>  	+$(call if_changed_dep,link_vmlinux)
>  
> +# module.builtin.ranges
> +# ---------------------------------------------------------------------------
> +ifdef CONFIG_BUILTIN_MODULE_RANGES
> +__default: modules.builtin.ranges
> +
> +quiet_cmd_modules_builtin_ranges = GEN     $@
> +      cmd_modules_builtin_ranges = $(real-prereqs) > $@
> +
> +targets += modules.builtin.ranges
> +modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
> +			modules.builtin vmlinux.map vmlinux.o.map FORCE
> +	$(call if_changed,modules_builtin_ranges)
> +
> +vmlinux.map: vmlinux
> +	@:
> +
> +endif
> +
>  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index d64070b6b4bc..0b6e2ebf60dc 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
>  # Link of vmlinux.o used for section mismatch analysis
>  # ---------------------------------------------------------------------------
>  
> +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
> +
>  quiet_cmd_ld_vmlinux.o = LD      $@
>        cmd_ld_vmlinux.o = \
>  	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> +	$(vmlinux-o-ld-args-y) \
>  	$(addprefix -T , $(initcalls-lds)) \
>  	--whole-archive vmlinux.a --no-whole-archive \
>  	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> new file mode 100755
> index 000000000000..b9ec761b3bef
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,508 @@
> +#!/usr/bin/gawk -f

This forces the gawk to be found always in /usr/bin. For systems where gawk can
be located in other places, can we change the Shebang to:

diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
index b9ec761b3bef..886251c8d3f7 100755
--- a/scripts/generate_builtin_ranges.awk
+++ b/scripts/generate_builtin_ranges.awk
@@ -1,4 +1,4 @@
-#!/usr/bin/gawk -f
+#!/usr/bin/env gawk -f
 # SPDX-License-Identifier: GPL-2.0
 # generate_builtin_ranges.awk: Generate address range data for builtin modules
 # Written by Kris Van Hees <kris.van.hees@oracle.com>

Not sure if it's too late? in that case I can send a patch to change this.


Daniel


> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> +#		vmlinux.o.map > modules.builtin.ranges
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, s) {
> +	if (fn in omod)
> +		return omod[fn];
> +
> +	if (match(fn, /\/[^/]+$/) == 0)
> +		return "";
> +
> +	obj = fn;
> +	mod = "";
> +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +	if (getline s <fn == 1) {
> +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> +			mod = substr(s, RSTART + 16, RLENGTH - 16);
> +			gsub(/['"]/, "", mod);
> +		} else if (match(s, /RUST_MODFILE=[^ ]+/) > 0)
> +			mod = substr(s, RSTART + 13, RLENGTH - 13);
> +	}
> +	close(fn);
> +
> +	# A single module (common case) also reflects objects that are not part
> +	# of a module.  Some of those objects have names that are also a module
> +	# name (e.g. core).  We check the associated module file name, and if
> +	# they do not match, the object is not part of a module.
> +	if (mod !~ / /) {
> +		if (!(mod in mods))
> +			mod = "";
> +	}
> +
> +	gsub(/([^/ ]*\/)+/, "", mod);
> +	gsub(/-/, "_", mod);
> +
> +	# At this point, mod is a single (valid) module name, or a list of
> +	# module names (that do not need validation).
> +	omod[obj] = mod;
> +
> +	return mod;
> +}
> +
> +# Update the ranges entry for the given module 'mod' in section 'osect'.
> +#
> +# We use a modified absolute start address (soff + base) as index because we
> +# may need to insert an anchor record later that must be at the start of the
> +# section data, and the first module may very well start at the same address.
> +# So, we use (addr << 1) + 1 to allow a possible anchor record to be placed at
> +# (addr << 1).  This is safe because the index is only used to sort the entries
> +# before writing them out.
> +#
> +function update_entry(osect, mod, soff, eoff, sect, idx) {
> +	sect = sect_in[osect];
> +	idx = sprintf("%016x", (soff + sect_base[osect]) * 2 + 1);
> +	entries[idx] = sprintf("%s %08x-%08x %s", sect, soff, eoff, mod);
> +	count[sect]++;
> +}
> +
> +# (1) Build a lookup map of built-in module names.
> +#
> +# The first file argument is used as input (modules.builtin).
> +#
> +# Lines will be like:
> +#	kernel/crypto/lzo-rle.ko
> +# and we record the object name "crypto/lzo-rle".
> +#
> +ARGIND == 1 {
> +	sub(/kernel\//, "");			# strip off "kernel/" prefix
> +	sub(/\.ko$/, "");			# strip off .ko suffix
> +
> +	mods[$1] = 1;
> +	next;
> +}
> +
> +# (2) Collect address information for each section.
> +#
> +# The second file argument is used as input (vmlinux.map).
> +#
> +# We collect the base address of the section in order to convert all addresses
> +# in the section into offset values.
> +#
> +# We collect the address of the anchor (or first symbol in the section if there
> +# is no explicit anchor) to allow users of the range data to calculate address
> +# ranges based on the actual load address of the section in the running kernel.
> +#
> +# We collect the start address of any sub-section (section included in the top
> +# level section being processed).  This is needed when the final linking was
> +# done using vmlinux.a because then the list of objects contained in each
> +# section is to be obtained from vmlinux.o.map.  The offset of the sub-section
> +# is recorded here, to be used as an addend when processing vmlinux.o.map
> +# later.
> +#
> +
> +# Both GNU ld and LLVM lld linker map format are supported by converting LLVM
> +# lld linker map records into equivalent GNU ld linker map records.
> +#
> +# The first record of the vmlinux.map file provides enough information to know
> +# which format we are dealing with.
> +#
> +ARGIND == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
> +	map_is_lld = 1;
> +	if (dbg)
> +		printf "NOTE: %s uses LLVM lld linker map format\n", FILENAME >"/dev/stderr";
> +	next;
> +}
> +
> +# (LLD) Convert a section record fronm lld format to ld format.
> +#
> +# lld: ffffffff82c00000          2c00000   2493c0  8192 .data
> +#  ->
> +# ld:  .data           0xffffffff82c00000   0x2493c0 load address 0x0000000002c00000
> +#
> +ARGIND == 2 && map_is_lld && NF == 5 && /[0-9] [^ ]+$/ {
> +	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
> +}
> +
> +# (LLD) Convert an anchor record from lld format to ld format.
> +#
> +# lld: ffffffff81000000          1000000        0     1         _text = .
> +#  ->
> +# ld:                  0xffffffff81000000                _text = .
> +#
> +ARGIND == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
> +	$0 = "  0x"$1 " " $5 " = .";
> +}
> +
> +# (LLD) Convert an object record from lld format to ld format.
> +#
> +# lld:            11480            11480     1f07    16         vmlinux.a(arch/x86/events/amd/uncore.o):(.text)
> +#  ->
> +# ld:   .text          0x0000000000011480     0x1f07 arch/x86/events/amd/uncore.o
> +#
> +ARGIND == 2 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
> +	gsub(/\)/, "");
> +	sub(/ vmlinux\.a\(/, " ");
> +	sub(/:\(/, " ");
> +	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
> +}
> +
> +# (LLD) Convert a symbol record from lld format to ld format.
> +#
> +# We only care about these while processing a section for which no anchor has
> +# been determined yet.
> +#
> +# lld: ffffffff82a859a4          2a859a4        0     1                 btf_ksym_iter_id
> +#  ->
> +# ld:                  0xffffffff82a859a4                btf_ksym_iter_id
> +#
> +ARGIND == 2 && map_is_lld && sect && !anchor && NF == 5 && $5 ~ /^[_A-Za-z][_A-Za-z0-9]*$/ {
> +	$0 = "  0x"$1 " " $5;
> +}
> +
> +# (LLD) We do not need any other ldd linker map records.
> +#
> +ARGIND == 2 && map_is_lld && /^[0-9a-f]{16} / {
> +	next;
> +}
> +
> +# (LD) Section records with just the section name at the start of the line
> +#      need to have the next line pulled in to determine whether it is a
> +#      loadable section.  If it is, the next line will contains a hex value
> +#      as first and second items.
> +#
> +ARGIND == 2 && !map_is_lld && NF == 1 && /^[^ ]/ {
> +	s = $0;
> +	getline;
> +	if ($1 !~ /^0x/ || $2 !~ /^0x/)
> +		next;
> +
> +	$0 = s " " $0;
> +}
> +
> +# (LD) Object records with just the section name denote records with a long
> +#      section name for which the remainder of the record can be found on the
> +#      next line.
> +#
> +# (This is also needed for vmlinux.o.map, when used.)
> +#
> +ARGIND >= 2 && !map_is_lld && NF == 1 && /^ [^ \*]/ {
> +	s = $0;
> +	getline;
> +	$0 = s " " $0;
> +}
> +
> +# Beginning a new section - done with the previous one (if any).
> +#
> +ARGIND == 2 && /^[^ ]/ {
> +	sect = 0;
> +}
> +
> +# Process a loadable section (we only care about .-sections).
> +#
> +# Record the section name and its base address.
> +# We also record the raw (non-stripped) address of the section because it can
> +# be used to identify an anchor record.
> +#
> +# Note:
> +# Since some AWK implementations cannot handle large integers, we strip off the
> +# first 4 hex digits from the address.  This is safe because the kernel space
> +# is not large enough for addresses to extend into those digits.  The portion
> +# to strip off is stored in addr_prefix as a regexp, so further clauses can
> +# perform a simple substitution to do the address stripping.
> +#
> +ARGIND == 2 && /^\./ {
> +	# Explicitly ignore a few sections that are not relevant here.
> +	if ($1 ~ /^\.orc_/ || $1 ~ /_sites$/ || $1 ~ /\.percpu/)
> +		next;
> +
> +	# Sections with a 0-address can be ignored as well.
> +	if ($2 ~ /^0x0+$/)
> +		next;
> +
> +	raw_addr = $2;
> +	addr_prefix = "^" substr($2, 1, 6);
> +	base = $2;
> +	sub(addr_prefix, "0x", base);
> +	base = strtonum(base);
> +	sect = $1;
> +	anchor = 0;
> +	sect_base[sect] = base;
> +	sect_size[sect] = strtonum($3);
> +
> +	if (dbg)
> +		printf "[%s] BASE   %016x\n", sect, base >"/dev/stderr";
> +
> +	next;
> +}
> +
> +# If we are not in a section we care about, we ignore the record.
> +#
> +ARGIND == 2 && !sect {
> +	next;
> +}
> +
> +# Record the first anchor symbol for the current section.
> +#
> +# An anchor record for the section bears the same raw address as the section
> +# record.
> +#
> +ARGIND == 2 && !anchor && NF == 4 && raw_addr == $1 && $3 == "=" && $4 == "." {
> +	anchor = sprintf("%s %08x-%08x = %s", sect, 0, 0, $2);
> +	sect_anchor[sect] = anchor;
> +
> +	if (dbg)
> +		printf "[%s] ANCHOR %016x = %s (.)\n", sect, 0, $2 >"/dev/stderr";
> +
> +	next;
> +}
> +
> +# If no anchor record was found for the current section, use the first symbol
> +# in the section as anchor.
> +#
> +ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
> +	addr = $1;
> +	sub(addr_prefix, "0x", addr);
> +	addr = strtonum(addr) - base;
> +	anchor = sprintf("%s %08x-%08x = %s", sect, addr, addr, $2);
> +	sect_anchor[sect] = anchor;
> +
> +	if (dbg)
> +		printf "[%s] ANCHOR %016x = %s\n", sect, addr, $2 >"/dev/stderr";
> +
> +	next;
> +}
> +
> +# The first occurrence of a section name in an object record establishes the
> +# addend (often 0) for that section.  This information is needed to handle
> +# sections that get combined in the final linking of vmlinux (e.g. .head.text
> +# getting included at the start of .text).
> +#
> +# If the section does not have a base yet, use the base of the encapsulating
> +# section.
> +#
> +ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
> +	if (!($1 in sect_base)) {
> +		sect_base[$1] = base;
> +
> +		if (dbg)
> +			printf "[%s] BASE   %016x\n", $1, base >"/dev/stderr";
> +	}
> +
> +	addr = $2;
> +	sub(addr_prefix, "0x", addr);
> +	addr = strtonum(addr);
> +	sect_addend[$1] = addr - sect_base[$1];
> +	sect_in[$1] = sect;
> +
> +	if (dbg)
> +		printf "[%s] ADDEND %016x - %016x = %016x\n",  $1, addr, base, sect_addend[$1] >"/dev/stderr";
> +
> +	# If the object is vmlinux.o then we will need vmlinux.o.map to get the
> +	# actual offsets of objects.
> +	if ($4 == "vmlinux.o")
> +		need_o_map = 1;
> +}
> +
> +# (3) Collect offset ranges (relative to the section base address) for built-in
> +# modules.
> +#
> +# If the final link was done using the actual objects, vmlinux.map contains all
> +# the information we need (see section (3a)).
> +# If linking was done using vmlinux.a as intermediary, we will need to process
> +# vmlinux.o.map (see section (3b)).
> +
> +# (3a) Determine offset range info using vmlinux.map.
> +#
> +# Since we are already processing vmlinux.map, the top level section that is
> +# being processed is already known.  If we do not have a base address for it,
> +# we do not need to process records for it.
> +#
> +# Given the object name, we determine the module(s) (if any) that the current
> +# object is associated with.
> +#
> +# If we were already processing objects for a (list of) module(s):
> +#  - If the current object belongs to the same module(s), update the range data
> +#    to include the current object.
> +#  - Otherwise, ensure that the end offset of the range is valid.
> +#
> +# If the current object does not belong to a built-in module, ignore it.
> +#
> +# If it does, we add a new built-in module offset range record.
> +#
> +ARGIND == 2 && !need_o_map && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
> +	if (!(sect in sect_base))
> +		next;
> +
> +	# Turn the address into an offset from the section base.
> +	soff = $2;
> +	sub(addr_prefix, "0x", soff);
> +	soff = strtonum(soff) - sect_base[sect];
> +	eoff = soff + strtonum($3);
> +
> +	# Determine which (if any) built-in modules the object belongs to.
> +	mod = get_module_info($4);
> +
> +	# If we are processing a built-in module:
> +	#   - If the current object is within the same module, we update its
> +	#     entry by extending the range and move on
> +	#   - Otherwise:
> +	#       + If we are still processing within the same main section, we
> +	#         validate the end offset against the start offset of the
> +	#         current object (e.g. .rodata.str1.[18] objects are often
> +	#         listed with an incorrect size in the linker map)
> +	#       + Otherwise, we validate the end offset against the section
> +	#         size
> +	if (mod_name) {
> +		if (mod == mod_name) {
> +			mod_eoff = eoff;
> +			update_entry(mod_sect, mod_name, mod_soff, eoff);
> +
> +			next;
> +		} else if (sect == sect_in[mod_sect]) {
> +			if (mod_eoff > soff)
> +				update_entry(mod_sect, mod_name, mod_soff, soff);
> +		} else {
> +			v = sect_size[sect_in[mod_sect]];
> +			if (mod_eoff > v)
> +				update_entry(mod_sect, mod_name, mod_soff, v);
> +		}
> +	}
> +
> +	mod_name = mod;
> +
> +	# If we encountered an object that is not part of a built-in module, we
> +	# do not need to record any data.
> +	if (!mod)
> +		next;
> +
> +	# At this point, we encountered the start of a new built-in module.
> +	mod_name = mod;
> +	mod_soff = soff;
> +	mod_eoff = eoff;
> +	mod_sect = $1;
> +	update_entry($1, mod, soff, mod_eoff);
> +
> +	next;
> +}
> +
> +# If we do not need to parse the vmlinux.o.map file, we are done.
> +#
> +ARGIND == 3 && !need_o_map {
> +	if (dbg)
> +		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
> +	exit;
> +}
> +
> +# (3) Collect offset ranges (relative to the section base address) for built-in
> +# modules.
> +#
> +
> +# (LLD) Convert an object record from lld format to ld format.
> +#
> +ARGIND == 3 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
> +	gsub(/\)/, "");
> +	sub(/:\(/, " ");
> +
> +	sect = $6;
> +	if (!(sect in sect_addend))
> +		next;
> +
> +	sub(/ vmlinux\.a\(/, " ");
> +	$0 = " "sect " 0x"$1 " 0x"$3 " " $5;
> +}
> +
> +# (3b) Determine offset range info using vmlinux.o.map.
> +#
> +# If we do not know an addend for the object's section, we are interested in
> +# anything within that section.
> +#
> +# Determine the top-level section that the object's section was included in
> +# during the final link.  This is the section name offset range data will be
> +# associated with for this object.
> +#
> +# The remainder of the processing of the current object record follows the
> +# procedure outlined in (3a).
> +#
> +ARGIND == 3 && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
> +	osect = $1;
> +	if (!(osect in sect_addend))
> +		next;
> +
> +	# We need to work with the main section.
> +	sect = sect_in[osect];
> +
> +	# Turn the address into an offset from the section base.
> +	soff = $2;
> +	sub(addr_prefix, "0x", soff);
> +	soff = strtonum(soff) + sect_addend[osect];
> +	eoff = soff + strtonum($3);
> +
> +	# Determine which (if any) built-in modules the object belongs to.
> +	mod = get_module_info($4);
> +
> +	# If we are processing a built-in module:
> +	#   - If the current object is within the same module, we update its
> +	#     entry by extending the range and move on
> +	#   - Otherwise:
> +	#       + If we are still processing within the same main section, we
> +	#         validate the end offset against the start offset of the
> +	#         current object (e.g. .rodata.str1.[18] objects are often
> +	#         listed with an incorrect size in the linker map)
> +	#       + Otherwise, we validate the end offset against the section
> +	#         size
> +	if (mod_name) {
> +		if (mod == mod_name) {
> +			mod_eoff = eoff;
> +			update_entry(mod_sect, mod_name, mod_soff, eoff);
> +
> +			next;
> +		} else if (sect == sect_in[mod_sect]) {
> +			if (mod_eoff > soff)
> +				update_entry(mod_sect, mod_name, mod_soff, soff);
> +		} else {
> +			v = sect_size[sect_in[mod_sect]];
> +			if (mod_eoff > v)
> +				update_entry(mod_sect, mod_name, mod_soff, v);
> +		}
> +	}
> +
> +	mod_name = mod;
> +
> +	# If we encountered an object that is not part of a built-in module, we
> +	# do not need to record any data.
> +	if (!mod)
> +		next;
> +
> +	# At this point, we encountered the start of a new built-in module.
> +	mod_name = mod;
> +	mod_soff = soff;
> +	mod_eoff = eoff;
> +	mod_sect = osect;
> +	update_entry(osect, mod, soff, mod_eoff);
> +
> +	next;
> +}
> +
> +# (4) Generate the output.
> +#
> +# Anchor records are added for each section that contains offset range data
> +# records.  They are added at an adjusted section base address (base << 1) to
> +# ensure they come first in the second records (see update_entry() above for
> +# more information).
> +#
> +# All entries are sorted by (adjusted) address to ensure that the output can be
> +# parsed in strict ascending address order.
> +#
> +END {
> +	for (sect in count) {
> +		if (sect in sect_anchor) {
> +			idx = sprintf("%016x", sect_base[sect] * 2);
> +			entries[idx] = sect_anchor[sect];
> +		}
> +	}
> +
> +	n = asorti(entries, indices);
> +	for (i = 1; i <= n; i++)
> +		print entries[indices[i]];
> +}
> -- 
> 2.45.2
> 

