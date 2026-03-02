Return-Path: <linux-kbuild+bounces-11520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIeyG53ipWkvHgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11520-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 20:18:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 630AC1DEC70
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 20:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 489A23000BBF
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 19:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571A377019;
	Mon,  2 Mar 2026 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HMy6NuJm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79307375ACD;
	Mon,  2 Mar 2026 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479121; cv=none; b=lZTCtNc+VGgN9yff2xUboZwvwQMKxhcrxiF/D9e79ddS8jbYdrx2lgZ7LUXrvqfn0emWUjRDA2FNPQ+ahSs97BuQtkFqHOuG/0R8VSKguqcCw3EhXpQjLv0rjv7BFT1RXJQz+l/0h2Enh0cN5CzmHW26O/0gHHLtk4bd30WdDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479121; c=relaxed/simple;
	bh=3iRWUDyKDVxpcOyY+BCTJ0SyjlYIUHKZ0NO5Xf3HlRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffKfHfx2p6mKqLGFHatcSwXhxPgbOtoAGTfNHkjmpWVlHjjsfNbuREH9AR6TNG95FnZYIQZMGBu93jNtm94jJ/FizU4Vl20IitQL48RlPA7lWu+JYtPuc649mR4cLr/I6by8YfgH6mQjRXKWiRqeacFaLVe+cUQ88KksBbdisXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HMy6NuJm; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fPpch6JrQz76nD;
	Mon,  2 Mar 2026 20:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772479108;
	bh=3iRWUDyKDVxpcOyY+BCTJ0SyjlYIUHKZ0NO5Xf3HlRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HMy6NuJmsUIijdP1rwBAenut4hH/nS54l2xmJ0r5vSP5MiD076KUI4iPm+u3kf4PP
	 x0mJ2C8Y/RiHYeUXCvGhfcLBoC4FRKbTEQT8u1hpbNdIJZ9cE32mHwihIBR79mtf4o
	 GLmLXGy3uuLEVQS0d5qspwas1yDBY7/V7X8DGNoc7pEGKmct6sJ4CItaAavyMPn4Fo
	 hXKdcDtmZahXa8uyUJWbBIu/AQgs0X30+G3ohC47YzyE//NVDKGflqcCuq3MLCRfxp
	 RDDChqOj1PhwgXHYQjAIpt437QUCOvkH0GEB6gwn4JKZl6jK9YDxrz145d3/FSrNH9
	 +UV9kc4s63CCw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fPpch5bSmz76mj;
	Mon,  2 Mar 2026 20:18:28 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fPpch0xyfz8tHB;
	Mon,  2 Mar 2026 20:18:27 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0A39A633B7;
	Mon,  2 Mar 2026 20:18:25 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <03045f41-fe4c-44ff-b01c-6e325d82255a@leemhuis.info>
Date: Mon, 2 Mar 2026 20:18:17 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: -next build error due to "kbuild: Leave objtool binary around with
 'make clean'"
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>,
 Rainer Fiebig <jrf@mailbox.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: 
 <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCaOO74gUJHfEI0wAKCRBytubv
 TFg9Lc4iD/4omf2z88yGmior2f1BCQTAWxI2Em3S4EJY2+Drs8ZrJ1vNvdWgBrqbOtxN6xHF
 uvrpM6nbYIoNyZpsZrqS1mCA4L7FwceFBaT9CTlQsZLVV/vQvh2/3vbj6pQbCSi7iemXklF7
 y6qMfA7rirvojSJZ2mi6tKIQnD2ndVhSsxmo/mAAJc4tiEL+wkdaX1p7bh2Ainp6sfxTqL6h
 z1kYyjnijpnHaPgQ6GQeGG1y+TSQFKkb/FylDLj3b3efzyNkRjSohcauTuYIq7bniw7sI8qY
 KUuUkrw8Ogi4e6GfBDgsgHDngDn6jUR2wDAiT6iR7qsoxA+SrJDoeiWS/SK5KRgiKMt66rx1
 Jq6JowukzNxT3wtXKuChKP3EDzH9aD+U539szyKjfn5LyfHBmSfR42Iz0sofE4O89yvp0bYz
 GDmlgDpYWZN40IFERfCSxqhtHG1X6mQgxS0MknwoGkNRV43L3TTvuiNrsy6Mto7rrQh0epSn
 +hxwwS0bOTgJQgOO4fkTvto2sEBYXahWvmsEFdLMOcAj2t7gJ+XQLMsBypbo94yFYfCqCemJ
 +zU5X8yDUeYDNXdR2veePdS3Baz23/YEBCOtw+A9CP0U4ImXzp82U+SiwYEEQIGWx+aVjf4n
 RZ/LLSospzO944PPK+Na+30BERaEjx04MEB9ByDFdfkSbM7BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJo47viBQkd8QjTAAoJEHK25u9MWD0tCH8P/1b+AZ8K3D4TCBzXNS0muN6pLnISzFa0
 cWcylwxX2TrZeGpJkg14v2R0cDjLRre9toM44izLaz4SKyfgcBSj9XET0103cVXUKt6SgT1o
 tevoEqFMKKp3vjDpKEnrcOSOCnfH9W0mXx/jDWbjlKbBlN7UBVoZD/FMM5Ul0KSVFJ9Uij0Z
 S2WAg50NQi71NBDPcga21BMajHKLFzb4wlBWSmWyryXI6ouabvsbsLjkW3IYl2JupTbK3viH
 pMRIZVb/serLqhJgpaakqgV7/jDplNEr/fxkmhjBU7AlUYXe2BRkUCL5B8KeuGGvG0AEIQR0
 dP6QlNNBV7VmJnbU8V2X50ZNozdcvIB4J4ncK4OznKMpfbmSKm3t9Ui/cdEK+N096ch6dCAh
 AeZ9dnTC7ncr7vFHaGqvRC5xwpbJLg3xM/BvLUV6nNAejZeAXcTJtOM9XobCz/GeeT9prYhw
 8zG721N4hWyyLALtGUKIVWZvBVKQIGQRPtNC7s9NVeLIMqoH7qeDfkf10XL9tvSSDY6KVl1n
 K0gzPCKcBaJ2pA1xd4pQTjf4jAHHM4diztaXqnh4OFsu3HOTAJh1ZtLvYVj5y9GFCq2azqTD
 pPI3FGMkRipwxdKGAO7tJVzM7u+/+83RyUjgAbkkkD1doWIl+iGZ4s/Jxejw1yRH0R5/uTaB MEK4
In-Reply-To: 
 <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177247910647.493356.13345228406736779355@mxe9fb.netcup.net>
X-NC-CID: nqnyCpTCXQXqA9g1tBoWO7sq6PS7bDenR4viJFcEestrxs6jLik=
X-Rspamd-Queue-Id: 630AC1DEC70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_FROM(0.00)[bounces-11520-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,copr.fedorainfracloud.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/28/26 06:40, Nathan Chancellor wrote:
> The difference between 'make clean' and 'make mrproper' is documented in
> 'make help' as:
> 
>   clean     - Remove most generated files but keep the config and
>               enough build support to build external modules
>   mrproper  - Remove all generated files + config + various backup files
> 
> After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> target"), running 'make clean' then attempting to build an external
> module with the resulting build directory fails with
> 
>   $ make ARCH=x86_64 O=build clean
> 
>   $ make -C build M=... MO=...
>   ...
>   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> 
> as 'make clean' removes the objtool binary.
> 
> Split the objtool clean target into mrproper and clean like Kbuild does
> and remove all generated artifacts with 'make clean' except for the
> objtool binary, which is removed with 'make mrproper'.

Thx for fixing this regression, sadly this caused my daily -next rpm
builds for Fedora to fail on x86_64 during a "make mrproper":

""
kernel.spec:2485: InitBuildVars: Copy files
+ /usr/bin/make -s 'HOSTCFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -mtls-dialect=gnu2   ' 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' -j32 mrproper
find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.check.o.cmd’: No such file or directory
find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.elf.o.cmd’: No such file or directory
[and many more like these]
""
For the full build log, see:
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-42-x86_64/10183736-next-next-all/builder-live.log.gz

This is almost exactly the rpm spec file that is used in Fedora rawhide.
The sections that causes this looks like this:

"""
    %{log_msg "InitBuildVars: Copy files"}
    %{make} %{?_smp_mflags} mrproper
    cp configs/$Config .config
"""

So it could be something strange in there that causes this, but from a
quick look I did not see what. And reverting this patch makes things
work again:
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-42-x86_64/10184184-kernel/builder-live.log.gz

Ciao, Thorsten

 
> Cc: stable@vger.kernel.org
> Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> Reported-by: Michal Suchanek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/20260225112633.6123-1-msuchanek@suse.de/
> Reported-by: Rainer Fiebig <jrf@mailbox.org>
> Closes: https://lore.kernel.org/62d12399-76e5-3d40-126a-7490b4795b17@mailbox.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I realize that this will technically decend into tools/objtool twice
> during cleaning when running mrproper but I don't think it is the end of
> the world for a much simpler implementation.
> 
> I can take this via kbuild-fixes with a proper Ack or it can go through
> -tip, does not matter to me.
> ---
>  Makefile               | 8 ++++----
>  tools/objtool/Makefile | 6 ++++--
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e944c6e71e81..d76d706a5580 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1497,13 +1497,13 @@ ifneq ($(wildcard $(resolve_btfids_O)),)
>  	$(Q)$(MAKE) -sC $(srctree)/tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
>  endif
>  
> -PHONY += objtool_clean
> +PHONY += objtool_clean objtool_mrproper
>  
>  objtool_O = $(abspath $(objtree))/tools/objtool
>  
> -objtool_clean:
> +objtool_clean objtool_mrproper:
>  ifneq ($(wildcard $(objtool_O)),)
> -	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) clean
> +	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) $(patsubst objtool_%,%,$@)
>  endif
>  
>  tools/: FORCE
> @@ -1686,7 +1686,7 @@ PHONY += $(mrproper-dirs) mrproper
>  $(mrproper-dirs):
>  	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
>  
> -mrproper: clean $(mrproper-dirs)
> +mrproper: clean objtool_mrproper $(mrproper-dirs)
>  	$(call cmd,rmfiles)
>  	@find . $(RCS_FIND_IGNORE) \
>  		\( -name '*.rmeta' \) \
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 6964175abdfd..50d3e38e6137 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -142,13 +142,15 @@ $(LIBSUBCMD)-clean:
>  	$(Q)$(RM) -r -- $(LIBSUBCMD_OUTPUT)
>  
>  clean: $(LIBSUBCMD)-clean
> -	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
>  	$(Q)find $(OUTPUT) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
>  	$(Q)$(RM) $(OUTPUT)arch/x86/lib/cpu-feature-names.c $(OUTPUT)fixdep
>  	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep
>  	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.objtool
>  	$(Q)$(RM) -r -- $(OUTPUT)feature
>  
> +mrproper: clean
> +	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
> +
>  FORCE:
>  
> -.PHONY: clean FORCE
> +.PHONY: clean mrproper FORCE
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260227-avoid-objtool-binary-removal-clean-83ce7fbcc8a1
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
> 


