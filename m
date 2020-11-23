Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD6F2BFE8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 04:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKWDP6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Nov 2020 22:15:58 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47631 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgKWDP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 22:15:58 -0500
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0AN3FXhf010142
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 12:15:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0AN3FXhf010142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606101334;
        bh=sK4N4tFyzOa2iwBC0aRXQ2jKebfjcJPe3y93fCrcQNk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zMvwRifNFVm4SZg1t2fb7jkpebhtG6jg8jorjeN8NfRsqiqgq/Uf95rSK4a5Y2x+q
         vnTtKkQGV6nMrRUxPpdj6RVWvdz1UE/clU7IUZS3Kv3A01YETyOSbHLxl16xo+FXkt
         9jsI6am5S0Nh24l/s+LlBgKeSkFyH4mXahd84bhs4YNJL2Maq+/L85wz2T18mC8KGw
         BoqKw7Wm9ey4C973Q4Fipoirt5RgfFqKtfzRqi7eN2S+/p4yqjcsoGDZt9BCSLkogw
         H0Rg5nb9Ce+AKGWrXxbddD5iZq9qu4Zst28NNi9uUP7mYu6x1rFitCm6Ja6QqjgJUJ
         ZV3WpIvk6dw4w==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id v12so13560046pfm.13
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Nov 2020 19:15:34 -0800 (PST)
X-Gm-Message-State: AOAM530O+P0ZntmFQ2SvTicZjWXX80qoMwerdrwsI4LEKOCPyCJXyXep
        uM9szzzPk5KuFeaGg87fH2aG5gbHAsRGnJnlh4A=
X-Google-Smtp-Source: ABdhPJyD951RPcPqeKVqGo6XhnYBGlKijzbkS27rfLCOsT4M+KTIEqFBdNaZlJ4w2x3QiHMmbXZ7m1LNDDYRDWTfLbM=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr23526445pjt.87.1606101333012;
 Sun, 22 Nov 2020 19:15:33 -0800 (PST)
MIME-Version: 1.0
References: <9edba305-da9d-6107-5644-7de60a326af9@kloenk.de>
In-Reply-To: <9edba305-da9d-6107-5644-7de60a326af9@kloenk.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 12:14:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxqPzwdN1N7RzS9hVOD6wkZ=jDXx+3ANhVMksiPe4bDg@mail.gmail.com>
Message-ID: <CAK7LNARxqPzwdN1N7RzS9hVOD6wkZ=jDXx+3ANhVMksiPe4bDg@mail.gmail.com>
Subject: Re: [PATCH] Fix most Shebang lines
To:     Finn Behrens <me@kloenk.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 3, 2020 at 5:51 AM Finn Behrens <me@kloenk.de> wrote:
>
> Change every shebang which does not need an argument to use /usr/bin/env.
> This is needed as not every distro has everything under /usr/bin,
> sometimes not even bash.
>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> ---
> Hi,
> Distros like NixOS don't have  /usr/bin/bash but only /usr/bin/env.
> This patch only changes the interpreter patch if no arguments are
> needed, as env does not support those.
> NixOS users are hitting this problems when calling ./scripts/config.
>

This patch is broken.
Please resend in the correct format.


Go to
https://patchwork.kernel.org/project/linux-kbuild/patch/9edba305-da9d-6107-5644-7de60a326af9@kloenk.de/

Click "mbox" and download your patch.
Run "git am" and find out what was wrong.




> Kind regards,
> Finn Behrens
>
> Documentation/sphinx/parse-headers.pl | 2 +-
> Documentation/target/tcm_mod_builder.py | 2 +-
> Documentation/trace/postprocess/decode_msr.py | 2 +-
> Documentation/trace/postprocess/trace-pagealloc-postprocess.pl | 2 +-
> Documentation/trace/postprocess/trace-vmscan-postprocess.pl | 2 +-
> arch/ia64/scripts/unwcheck.py | 2 +-
> scripts/bloat-o-meter | 2 +-
> scripts/config | 2 +-
> scripts/diffconfig | 2 +-
> scripts/get_abi.pl | 2 +-
> scripts/show_delta | 2 +-
> scripts/sphinx-pre-install | 2 +-
> scripts/split-man.pl | 2 +-
> scripts/tracing/draw_functrace.py | 2 +-
> tools/perf/python/tracepoint.py | 2 +-
> tools/perf/python/twatch.py | 2 +-
> tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py | 2 +-
> tools/testing/ktest/compare-ktest-sample.pl | 2 +-
> tools/testing/kunit/kunit.py | 2 +-
> tools/testing/kunit/kunit_tool_test.py | 2 +-
> tools/testing/selftests/bpf/test_offload.py | 2 +-
> .../selftests/drivers/net/mlxsw/sharedbuffer_configuration.py | 2 +-
> tools/testing/selftests/kselftest/prefix.pl | 2 +-
> tools/testing/selftests/net/devlink_port_split.py | 2 +-
> tools/testing/selftests/tc-testing/tdc_batch.py | 2 +-
> tools/testing/selftests/tc-testing/tdc_multibatch.py | 2 +-
> 26 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/Documentation/sphinx/parse-headers.pl
> b/Documentation/sphinx/parse-headers.pl
> index 1910079f984f..b063f2f1cfb2 100755
> --- a/Documentation/sphinx/parse-headers.pl
> +++ b/Documentation/sphinx/parse-headers.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> use strict;
> use Text::Tabs;
> use Getopt::Long;
> diff --git a/Documentation/target/tcm_mod_builder.py
> b/Documentation/target/tcm_mod_builder.py
> index 1548d8420499..54492aa813b9 100755
> --- a/Documentation/target/tcm_mod_builder.py
> +++ b/Documentation/target/tcm_mod_builder.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # The TCM v4 multi-protocol fabric module generation script for
> drivers/target/$NEW_MOD
> #
> # Copyright (c) 2010 Rising Tide Systems
> diff --git a/Documentation/trace/postprocess/decode_msr.py
> b/Documentation/trace/postprocess/decode_msr.py
> index 0ab40e0db580..aa9cc7abd5c2 100644
> --- a/Documentation/trace/postprocess/decode_msr.py
> +++ b/Documentation/trace/postprocess/decode_msr.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # add symbolic names to read_msr / write_msr in trace
> # decode_msr msr-index.h < trace
> import sys
> diff --git
> a/Documentation/trace/postprocess/trace-pagealloc-postprocess.pl
> b/Documentation/trace/postprocess/trace-pagealloc-postprocess.pl
> index 0a120aae33ce..b9b7d80c2f9d 100644
> --- a/Documentation/trace/postprocess/trace-pagealloc-postprocess.pl
> +++ b/Documentation/trace/postprocess/trace-pagealloc-postprocess.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # This is a POC (proof of concept or piece of crap, take your pick) for
> reading the
> # text representation of trace output related to page allocation. It
> makes an attempt
> # to extract some high-level information on what is going on. The
> accuracy of the parser
> diff --git a/Documentation/trace/postprocess/trace-vmscan-postprocess.pl
> b/Documentation/trace/postprocess/trace-vmscan-postprocess.pl
> index 995da15b16ca..2f4e39875fb3 100644
> --- a/Documentation/trace/postprocess/trace-vmscan-postprocess.pl
> +++ b/Documentation/trace/postprocess/trace-vmscan-postprocess.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # This is a POC for reading the text representation of trace output
> related to
> # page reclaim. It makes an attempt to extract some high-level
> information on
> # what is going on. The accuracy of the parser may vary
> diff --git a/arch/ia64/scripts/unwcheck.py b/arch/ia64/scripts/unwcheck.py
> index c55276e31b6b..bfd1b671e35f 100644
> --- a/arch/ia64/scripts/unwcheck.py
> +++ b/arch/ia64/scripts/unwcheck.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0
> #
> # Usage: unwcheck.py FILE
> diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
> index d7ca46c612b3..652e9542043f 100755
> --- a/scripts/bloat-o-meter
> +++ b/scripts/bloat-o-meter
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> #
> # Copyright 2004 Matt Mackall <mpm@selenic.com>
> #
> diff --git a/scripts/config b/scripts/config
> index eee5b7f3a092..8c8d7c3d7acc 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
> # SPDX-License-Identifier: GPL-2.0
> # Manipulate options in a .config file from the command line
>
> diff --git a/scripts/diffconfig b/scripts/diffconfig
> index 89abf777f197..627eba5849b5 100755
> --- a/scripts/diffconfig
> +++ b/scripts/diffconfig
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0
> #
> # diffconfig - a tool to compare .config files.
> diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
> index 2cb592f8eba4..f9c071bb283c 100755
> --- a/scripts/get_abi.pl
> +++ b/scripts/get_abi.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # SPDX-License-Identifier: GPL-2.0
>
> use strict;
> diff --git a/scripts/show_delta b/scripts/show_delta
> index 264399307c4f..28e67e178194 100755
> --- a/scripts/show_delta
> +++ b/scripts/show_delta
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0-only
> #
> # show_deltas: Read list of printk messages instrumented with
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index 40fa6923e80a..828a8615a918 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # SPDX-License-Identifier: GPL-2.0-or-later
> use strict;
>
> diff --git a/scripts/split-man.pl b/scripts/split-man.pl
> index c3db607ee9ec..96bd99dc977a 100755
> --- a/scripts/split-man.pl
> +++ b/scripts/split-man.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # SPDX-License-Identifier: GPL-2.0
> #
> # Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> diff --git a/scripts/tracing/draw_functrace.py
> b/scripts/tracing/draw_functrace.py
> index b65735758520..74f8aadfd4cb 100755
> --- a/scripts/tracing/draw_functrace.py
> +++ b/scripts/tracing/draw_functrace.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0-only
>
> """
> diff --git a/tools/perf/python/tracepoint.py
> b/tools/perf/python/tracepoint.py
> index eb76f6516247..461848c7f57d 100755
> --- a/tools/perf/python/tracepoint.py
> +++ b/tools/perf/python/tracepoint.py
> @@ -1,4 +1,4 @@
> -#! /usr/bin/python
> +#! /usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0
> # -*- python -*-
> # -*- coding: utf-8 -*-
> diff --git a/tools/perf/python/twatch.py b/tools/perf/python/twatch.py
> index ff87ccf5b708..04f3db29b9bc 100755
> --- a/tools/perf/python/twatch.py
> +++ b/tools/perf/python/twatch.py
> @@ -1,4 +1,4 @@
> -#! /usr/bin/python
> +#! /usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0-only
> # -*- python -*-
> # -*- coding: utf-8 -*-
> diff --git a/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
> b/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
> index 3c47865bb247..e15e20696d17 100755
> --- a/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
> +++ b/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0-only
> # -*- coding: utf-8 -*-
> #
> diff --git a/tools/testing/ktest/compare-ktest-sample.pl
> b/tools/testing/ktest/compare-ktest-sample.pl
> index 4118eb4a842d..ebea21d0a1be 100755
> --- a/tools/testing/ktest/compare-ktest-sample.pl
> +++ b/tools/testing/ktest/compare-ktest-sample.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # SPDX-License-Identifier: GPL-2.0
>
> open (IN,"ktest.pl");
> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
> index ebf5f5763dee..26df1de7c5a1 100755
> --- a/tools/testing/kunit/kunit.py
> +++ b/tools/testing/kunit/kunit.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
> # SPDX-License-Identifier: GPL-2.0
> #
> # A thin wrapper on top of the KUnit Kernel
> diff --git a/tools/testing/kunit/kunit_tool_test.py
> b/tools/testing/kunit/kunit_tool_test.py
> index 99c3c5671ea4..349125b8e93a 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
> # SPDX-License-Identifier: GPL-2.0
> #
> # A collection of tests for tools/testing/kunit/kunit.py
> diff --git a/tools/testing/selftests/bpf/test_offload.py
> b/tools/testing/selftests/bpf/test_offload.py
> index 43c9cda199b8..f736d34b89e1 100755
> --- a/tools/testing/selftests/bpf/test_offload.py
> +++ b/tools/testing/selftests/bpf/test_offload.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>
> # Copyright (C) 2017 Netronome Systems, Inc.
> # Copyright (c) 2019 Mellanox Technologies. All rights reserved
> diff --git
> a/tools/testing/selftests/drivers/net/mlxsw/sharedbuffer_configuration.py
> b/tools/testing/selftests/drivers/net/mlxsw/sharedbuffer_configuration.py
> index 0d4b9327c9b3..2223337eed0c 100755
> ---
> a/tools/testing/selftests/drivers/net/mlxsw/sharedbuffer_configuration.py
> +++
> b/tools/testing/selftests/drivers/net/mlxsw/sharedbuffer_configuration.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
> # SPDX-License-Identifier: GPL-2.0
>
> import subprocess
> diff --git a/tools/testing/selftests/kselftest/prefix.pl
> b/tools/testing/selftests/kselftest/prefix.pl
> index 31f7c2a0a8bd..12a7f4ca2684 100755
> --- a/tools/testing/selftests/kselftest/prefix.pl
> +++ b/tools/testing/selftests/kselftest/prefix.pl
> @@ -1,4 +1,4 @@
> -#!/usr/bin/perl
> +#!/usr/bin/env perl
> # SPDX-License-Identifier: GPL-2.0
> # Prefix all lines with "# ", unbuffered. Command being piped in may need
> # to have unbuffering forced with "stdbuf -i0 -o0 -e0 $cmd".
> diff --git a/tools/testing/selftests/net/devlink_port_split.py
> b/tools/testing/selftests/net/devlink_port_split.py
> index 58bb7e9b88ce..834066d465fc 100755
> --- a/tools/testing/selftests/net/devlink_port_split.py
> +++ b/tools/testing/selftests/net/devlink_port_split.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
> # SPDX-License-Identifier: GPL-2.0
>
> from subprocess import PIPE, Popen
> diff --git a/tools/testing/selftests/tc-testing/tdc_batch.py
> b/tools/testing/selftests/tc-testing/tdc_batch.py
> index 995f66ce43eb..35d5d9493784 100755
> --- a/tools/testing/selftests/tc-testing/tdc_batch.py
> +++ b/tools/testing/selftests/tc-testing/tdc_batch.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>
> """
> tdc_batch.py - a script to generate TC batch file
> diff --git a/tools/testing/selftests/tc-testing/tdc_multibatch.py
> b/tools/testing/selftests/tc-testing/tdc_multibatch.py
> index 5e7237952e49..48e1f17ff2e8 100755
> --- a/tools/testing/selftests/tc-testing/tdc_multibatch.py
> +++ b/tools/testing/selftests/tc-testing/tdc_multibatch.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
> # SPDX-License-Identifier: GPL-2.0
> """
> tdc_multibatch.py - a thin wrapper over tdc_batch.py to generate
> multiple batch
> --
> 2.28.0
>
>


--
Best Regards
Masahiro Yamada
