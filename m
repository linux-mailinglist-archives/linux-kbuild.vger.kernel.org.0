Return-Path: <linux-kbuild+bounces-11484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDktIRSGoWlOuAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11484-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 12:55:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D83631B6CBF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 12:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8C713147CD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FB031D381;
	Fri, 27 Feb 2026 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiHomnsf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DA45038;
	Fri, 27 Feb 2026 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193163; cv=none; b=EuWWdm4EO2dCnvsqkllEcm/h8MP7w9YB4hjbm1Hu7WeMtsQa3JIoxHm4dAdwYnuL2akA/OCqxJjaSmGMf95zr8H3lKScYNLY5dTnDvPioWKcPEadGdpyOWGtaXXkj2vhKBbEcgEtc1yV5vSNfByA9va3p+cfNUH75b7LvmC/C6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193163; c=relaxed/simple;
	bh=z+NXcBM7JbN3Zu5LqWibDEudNKsGvDpEeK39vyCdwWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey/gHGSM0fGq+MpCa2UL3nz/wj4YXdmOdqpa/XGOqDB0vaa3/QVvdVEzmAtluP+gQJ6wBJNzwvZ8dCfOWf9PKMcyPUvW2H0uI9khnhqIIOvwvhxPxeS5m7Id9Fyp8VvTOmxiAYu6DXqlxVJBJxjYlP7Z9X0OpNi3Z/7nEc+ep28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiHomnsf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1DDC116C6;
	Fri, 27 Feb 2026 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772193162;
	bh=z+NXcBM7JbN3Zu5LqWibDEudNKsGvDpEeK39vyCdwWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiHomnsfGJ5MdXEo0TFM1i9JAmT6d40X49TBElz3J+rUXzph9AzwrBUbW1e946bmN
	 vRT4s2GuoZ+zz2SsGN9I/q4p/Fgh3ZST7sRahvKAHzKGq1O4RStTZCXNmYur7yFeq/
	 2ZvckrOX1qwCdlU1ep+MwwuDMfy112BNIkgqq0LOP7mePaarAiODBgGYVbB+ouKfUZ
	 FXkLi+cw4OYFHwCrEPSCchfgq2t7kpyIZaFicdJmFnzdeoMz/gpE0L6DocVH2FlcKS
	 zOh7yqHpqTUtZj3zoHm7xnydhMZjgzpHWuzySv2JdBlwyow3S0FaQSUkwp0Zxy4Uii
	 SH50Hv1IFrlxA==
Message-ID: <c886c8c9-d336-4ec3-94c0-c4869dee7e7f@kernel.org>
Date: Fri, 27 Feb 2026 11:52:38 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
To: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, bpf@vger.kernel.org
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
 <aaCTC86U9KjnmZmu@google.com>
 <99e7fe4e-72de-4b55-9a9a-ae51718a0e73@kernel.org>
 <20260227103611.GA1098637@e132581.arm.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <20260227103611.GA1098637@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11484-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qmo@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,gnu.org:url]
X-Rspamd-Queue-Id: D83631B6CBF
X-Rspamd-Action: no action

2026-02-27 10:36 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
> On Thu, Feb 26, 2026 at 10:52:01PM +0000, Quentin Monnet wrote:
>> 2026-02-26 10:38 UTC-0800 ~ Namhyung Kim <namhyung@kernel.org>
>>> Adding bpftool maintainer.
>>>
>>> On Tue, Feb 24, 2026 at 12:16:40PM +0000, Leo Yan wrote:
>>>> GCC-15 release claims [1]:
>>>>
>>>>   {0} initializer in C or C++ for unions no longer guarantees clearing
>>>>   of the whole union (except for static storage duration initialization),
>>>>   it just initializes the first union member to zero. If initialization
>>>>   of the whole union including padding bits is desirable, use {} (valid
>>>>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
>>>>   restore old GCC behavior.
>>>>
>>>> As a result, this new behaviour might cause unexpected data when we
>>>> initialize a union with using the '{ 0 }' initializer.
>>>>
>>>> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
>>>> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
>>>> in unions and structures.  This commit applies the same option for tools
>>>> building.
>>>>
>>>> The option is not supported neither by any version older than GCC 15 and
>>>> is also not supported by LLVM, this patch adds the cc-option function to
>>>> dynamically detect the compiler option.
>>>>
>>>> [1] https://gcc.gnu.org/gcc-15/changes.html
>>>>
>>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>
>>
>> Thank you Namhyung for the Cc.
>>
>> I built bpftool with the patch, with gcc 13 (which didn't get the flag,
>> as expected) and gcc 15, and it's fine with both. As far as I can tell,
>> bpftool does not initialise any union with "{0}" anyway.
> 
> Thanks a lot for testing!
> 
>> One potential concern (I didn't try) could be for cross-compilation:
>> bpftool's Makefile sets HOST_CFLAGS based on $(CFLAGS), but $(HOSTCC)
>> and $(CC) could be different versions of gcc, for example.
> 
> To avoid confusion, we can use EXTRA_CFLAGS and HOST_EXTRACFLAGS instead
> in Makefile.include:
> 
> -----
> 
> # cc-option
> # Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
> cc-option = $(call try-run, \
>        $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> 
> host-cc-option = $(call try-run, \
>        $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> 
> # Explicitly clear padding bits with the initializer '{ 0 }'
> EXTRA_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> HOST_EXTRACFLAGS += $(call host-cc-option,-fzero-init-padding-bits=all)
> 
> -----
> 
> Then, in a project, its Makefile can append EXTRA_CFLAGS and
> HOST_EXTRACFLAGS to CFLAGS and HOSTCFLAGS respectively.


This sounds like it should work for bpftool as long as we += and don't
overwrite the EXTRA_CFLAGS passed from command line. In bpftool's
Makefile we'd have to move HOST_CFLAGS's CFLAGS-based defintion higher
up, before we add the EXTRA_CFLAGS to CFLAGS; and if anything needs to
be passed to the host binary, users will have to specify
HOST_EXTRACFLAGS (or HOST_EXTRA_CFLAGS?) independently, which is acceptable.

Out of curiosity I looked at other tools, and of course everyone does it
differently:

- Some of them, like bpftool, reuse the CFLAGS inherited from
tools/scripts/Makefile.include, adding EXTRA_CFLAGS to it, so setting
aside cross-compiling, both approaches (using CFLAGS or EXTRA_CFLAGS)
are fine.

- Some of them, such as tools/lib/bpf/Makefile for example, reset CFLAGS
before/by adding EXTRA_CFLAGS, so your v2 relying on CFLAGS would
probably have no effect for them.

- Some of them, such as tools/tracing/latency/Makefile or
tools/mm/Makefile, do not use EXTRA_CFLAGS - maybe it's worth adding it
if your objective is to pass the flag to all/most tools.

- (Also many smaller Makefiles such as most of the ones in selftests do
not pull tools/scripts/Makefile.include at all, but I suppose this is
out of scope.)


> If this is fine for us, I will repin patches
> 
>> The same concern could apply to perf with HOSTCFLAGS, by the way?
> 
> I don't see perf's HOSTCFLAGS to reuse CFLAGS.


Woops I can't see the HOSTCFLAGS using the CFLAGS either for perf, sorry
about that.

Thanks,
Quentin

