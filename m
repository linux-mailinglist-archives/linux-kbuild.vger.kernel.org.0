Return-Path: <linux-kbuild+bounces-2985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C24952296
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 21:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64D01F21DE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005141BE84E;
	Wed, 14 Aug 2024 19:19:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AA1B1505;
	Wed, 14 Aug 2024 19:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723663173; cv=none; b=l60WuiwUjojKAj+tvRVUP/Tz8E3i+Ut+srU50+3qbcJhS3/8G3OC/YM1RbuPqBpev1UcELKPVd6Xq+QAK0wVf/TH+xBrRXwiEGoN3CjhfLYyPMJrR9k52pnm2BaQecuCaFJmKQpyjCRPoQd3lxVwwyiJEX5yJZG8KR78IEklYoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723663173; c=relaxed/simple;
	bh=Ti4rr0RoOG8FDd3YeOyLP1mOyccL/cp6IXJLh9W+g9M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pn0tRSUiKw7x03Yvv4BFYStZEA1pNHCXpgmlMwxBUL7PrO6r5Ye3pqMN8v5KC0X9l48hEiDbS7jLe+Mbg0O9Vm8zXjklQoly5c+6jMgy1znNrBEpW3cBv0IAQWW146m7LCt3/I52lMMBfqZXQ+LlonSvAtzX+TUkmgszBB2AH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069A8C116B1;
	Wed, 14 Aug 2024 19:19:31 +0000 (UTC)
Date: Wed, 14 Aug 2024 15:19:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Nick
 Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>,
 Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 3/4] scripts: add verifier script for builtin module
 range data
Message-ID: <20240814151945.122da7b6@gandalf.local.home>
In-Reply-To: <20240716031045.1781332-4-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
	<20240716031045.1781332-4-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hmm, does this handle my concern from the last patch. That is, if the
previous script is broken by some change, this will catch it?
If so, should there be a way to run this always? As it looks to be only
used for manual tests.

On Mon, 15 Jul 2024 23:10:44 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> The modules.builtin.ranges offset range data for builtin modules is
> generated at compile time based on the list of built-in modules and
> the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
						^^
As my daughter keeps reminding me, nobody uses double spaces after a period
anymore ;-)

> to determine whether a symbol at a particular address belongs to
> module code that was configured to be compiled into the kernel proper
> as a built-in module (rather than as a standalone module).
> 
> This patch adds a script that uses the generated modules.builtin.ranges
> data to annotate the symbols in the System.map with module names if
> their address falls within a range that belongs to one or mre built-in
							   "more" ?

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

After running this, I do get a lot of messages:

uncore_pmu_event_start in intel_uncore (should NOT be)
uncore_pcibus_to_dieid in intel_uncore (should NOT be)
uncore_die_to_segment in intel_uncore (should NOT be)
uncore_device_to_die in intel_uncore (should NOT be)
__find_pci2phy_map in intel_uncore (should NOT be)
uncore_event_show in intel_uncore (should NOT be)
uncore_pmu_to_box in intel_uncore (should NOT be)
uncore_msr_read_counter in intel_uncore (should NOT be)
uncore_mmio_exit_box in intel_uncore (should NOT be)
uncore_mmio_read_counter in intel_uncore (should NOT be)
uncore_get_constraint in intel_uncore (should NOT be)
uncore_put_constraint in intel_uncore (should NOT be)
uncore_shared_reg_config in intel_uncore (should NOT be)
uncore_perf_event_update in intel_uncore (should NOT be)
uncore_pmu_event_read in intel_uncore (should NOT be)
uncore_pmu_event_stop in intel_uncore (should NOT be)
uncore_pmu_event_add in intel_uncore (should NOT be)
[..]
usb_debug_root in usb_common (should NOT be)
usb_hcds_loaded in usbcore (should NOT be)
iTCO_vendorsupport in iTCO_vendor_support (should NOT be)
snd_ecards_limit in snd (should NOT be)
snd_major in snd (should NOT be)
snd_oss_root in snd (should NOT be)
snd_seq_root in snd (should NOT be)
ip6_min_hopcount in ipv6 (should NOT be)
ip6_ra_chain in ipv6 (should NOT be)
raw_v6_hashinfo in ipv6 (should NOT be)
Verification of /work/build/nobackup/debiantesting-x86-64/modules.builtin.ranges:
  Correct matches:   24962 (75% of total)
    Module matches:      0 (0% of matches)
  Mismatches:         8262 (24% of total)
  Missing:               0 (0% of total)


What does this mean?

-- Steve


> ---
> 
> Notes:
>     Changes since v4:
>      - New patch in the series
> 
>  scripts/verify_builtin_ranges.awk | 348 ++++++++++++++++++++++++++++++
>  1 file changed, 348 insertions(+)
>  create mode 100755 scripts/verify_builtin_ranges.awk
> 
> diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
> new file mode 100755
> index 000000000000..a2475a38ba50
> --- /dev/null
> +++ b/scripts/verify_builtin_ranges.awk
> @@ -0,0 +1,348 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# verify_builtin_ranges.awk: Verify address range data for builtin modules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> +#				   modules.builtin vmlinux.map vmlinux.o.map
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#

