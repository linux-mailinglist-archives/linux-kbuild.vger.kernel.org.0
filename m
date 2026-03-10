Return-Path: <linux-kbuild+bounces-11766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJOnNmHyr2nkdAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11766-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:28:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656E249628
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D56EA3094FA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DAC44E040;
	Tue, 10 Mar 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="BweS2JUD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012FF44D6AC;
	Tue, 10 Mar 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138356; cv=none; b=HYQcFwZ4VesoVuqO2SJZX/FhC2Yni2bhQvZ/67Gmdej8Y/3TFLiplCvTdWPqFhpPEmm39LYpcoM3a/7AAyB7w3EWrBKtfuuxvt+rb45YEr9WNHthp+H2C9edW8Xv9K6JMCrYSHb4xUp7icqcZ17oiNBKxeGe6wZH6BAlY7VL7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138356; c=relaxed/simple;
	bh=wjwQ2OMoo43vbc8D8z3M9A/xNukuGxrmRXCsqPZl+0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX6MpCWJcm+fxRhWDPLhKWuXN07p2SFhSL4NkyAIQUGw28ESsGViMZ3jriJ05ipDWTdgCV7CY8fVAiJ3HiAXsdo1s1nbtMvX4n00wFflf94m9C5Iax0qFzevhj+rEeLG57IECZ94pghg/bqBtHxT8rINGMbZSmQ/wTSDzRqIVcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=BweS2JUD reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4fVVQR6H4rz1FDX7;
	Tue, 10 Mar 2026 11:25:51 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4fVVQR4Zpfz1DHWN;
	Tue, 10 Mar 2026 11:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1773138351;
	bh=wnS0z46CpZ6iN00Vybv/HgogR15TTI+8jgiFzdPLPWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BweS2JUDxCi4x056j0gzZE6X8MyC/pxogI+jVlj9e8aBLEQ+pbjdJ1gs/I2U1KwyC
	 2iwDNHcPQIzIxXcQEjwKkWUbKq6QY1xY5soLoTg8k9vxrmkKKTU7r/eY28DhHnkRKM
	 7G8NRU60O0CKirzMZnIBLGBoio7anq83t6UXGVSSnz/mNr5wEyIW5GBOgZ1Bo+T36C
	 f1lEPskouENjg4qcEbMj6IoWxNg7wn/ov4J+7dT1O+EQNZx+cKQPQnBqOxWSA3Iq2k
	 P6jnaqX9PXhFMKfRCuerzfFbSjhNgdZ7saN7m9td3f6r0pzLJoBu/umh2bIe3nvcvn
	 I/kIYZYnsLD3Q==
Message-ID: <5307ce52-e740-4d4a-b896-64d741eb9811@gaisler.com>
Date: Tue, 10 Mar 2026 11:25:51 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
 <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
 <20260309170904.GA2779008@ax162> <aa_NWVOiHyN7CVvg@nuoska>
 <5e948d9f-dac3-4329-b7fe-e7f9a80108d9@gaisler.com> <aa_r8kw7ClCnTvp9@nuoska>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <aa_r8kw7ClCnTvp9@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5656E249628
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11766-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gaisler.com:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.848];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gnu.org:url,gaisler.com:mid,merge_config.sh:url]
X-Rspamd-Action: no action

On 2026-03-10 11:01, Mikko Rapeli wrote:
> Hi,
> 
> On Tue, Mar 10, 2026 at 10:55:46AM +0100, Andreas Larsson wrote:
>> On 2026-03-10 08:50, Mikko Rapeli wrote:
>>> On Mon, Mar 09, 2026 at 10:09:04AM -0700, Nathan Chancellor wrote:
>>>> On Mon, Mar 09, 2026 at 05:38:58PM +0100, Andreas Larsson wrote:
>>>>> On 2026-01-22 11:57, Mikko Rapeli wrote:
>>>>>> From: Anders Roxell <anders.roxell@linaro.org>
>>>>>>
>>>>>> merge_config.sh shell/sed/grep loop scales poorly and is slow.
>>>>>> With Yocto genericarm64 kernel and around 190 config fragments
>>>>>> the script takes more than 20 minutes to run on a fast build machine.
>>>>>> Re-implementation with awk does the same job in 10 seconds.
>>>>>> Using awk since it is likely available in the build environments
>>>>>> and using perl, python etc would introduce more complex runtime
>>>>>> dependencies. awk is good enough and lot better than shell/sed/grep.
>>>>>>
>>>>>> Output stays the same but changed execution time means that
>>>>>> parallel job output may be ordered differently.
>>>>>>
>>>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>>>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>>>>> ---
>>>>>>  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
>>>>>>  1 file changed, 128 insertions(+), 40 deletions(-)
>>>>>
>>>>> Hi,
>>>>>
>>>>> Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
>>>>> shell/sed/grep to awk") breaks merge_config.sh for me:
>>>>>
>>>>> ---------->%----------
>>>>> $ make tiny.config
>>>>>   HOSTCC  scripts/basic/fixdep
>>>>>   HOSTCC  scripts/kconfig/conf.o
>>>>>   HOSTCC  scripts/kconfig/confdata.o
>>>>>   HOSTCC  scripts/kconfig/expr.o
>>>>>   LEX     scripts/kconfig/lexer.lex.c
>>>>>   YACC    scripts/kconfig/parser.tab.[ch]
>>>>>   HOSTCC  scripts/kconfig/lexer.lex.o
>>>>>   HOSTCC  scripts/kconfig/menu.o
>>>>>   HOSTCC  scripts/kconfig/parser.tab.o
>>>>>   HOSTCC  scripts/kconfig/preprocess.o
>>>>>   HOSTCC  scripts/kconfig/symbol.o
>>>>>   HOSTCC  scripts/kconfig/util.o
>>>>>   HOSTLD  scripts/kconfig/conf
>>>>> The base file '.config' does not exist. Creating one...
>>>>> Using .config as base
>>>>> Merging ./kernel/configs/tiny.config
>>>>> awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
>>>>> mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
>>>>> make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
>>>>> make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
>>>>> make: *** [Makefile:248: __sub-make] Error 2
>>>>> ---------->%----------
>>>>>
>>>>> with this underlying call to merge_config.sh, an empty .config and where
>>>>> my awk is GNU Awk 5.1.0:
>>>>>
>>>>> ---------->%----------
>>>>> $ make tiny.config V=1
>>>>> make --no-print-directory -C <kernel-source-top-dir> \
>>>>> -f <kernel-source-top-dir>/Makefile tiny.config
>>>>> make -f ./scripts/Makefile.build obj=scripts/basic
>>>>> make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
>>>>> # cmd_merge_fragments tiny.config
>>>>>   ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
>>>>> ...
>>>>>
>>>>> $ awk --version
>>>>> GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
>>>>> ---------->%----------
>>>>>
>>>>> At 5fa9b82cbcfc~ things works as expected.
>>>
>>> Hmm, all these steps work for me with GNU awk 5.1.0 so something else
>>> is different here. On line 267 awk is given input file args
>>> "$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new" and it fails to
>>> create the output file "$TMP_FILE.new" with >> and plain print statement.
>>>
>>>> Hmmm, not sure how I have not seen this error myself since I test
>>>> tiny.config but I can reproduce with a clean output directory. Something
>>>> like this seems like a simple fix but the only instances of ARGV[3] in
>>>> the awk script that I can see use '>>', which should create the file if
>>>> it does not exist. Mikko, any ideas?
>>>>
>>>> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
>>>> index 735e1de450c6..070ecae87a1c 100755
>>>> --- a/scripts/kconfig/merge_config.sh
>>>> +++ b/scripts/kconfig/merge_config.sh
>>>> @@ -123,6 +123,7 @@ fi
>>>>  MERGE_LIST=$*
>>>>  
>>>>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
>>>> +touch "$TMP_FILE.new"
>>>>  
>>>>  echo "Using $INITFILE as base"
>>>
>>> This could help but I fail to understand why this would be needed. Why is awk
>>> not able to create this file on line 256?
>>>
>>> awk manual says:
>>>
>>> https://www.gnu.org/software/gawk/manual/html_node/Redirection.html
>>>
>>>     print items >> output-file
>>>
>>>     This redirection prints the items into the preexisting output file named
>>>     output-file. The difference between this and the single-‘>’ redirection
>>>     is that the old contents (if any) of output-file are not erased. Instead,
>>>     the awk output is appended to the file. If output-file does not exist,
>>>     then it is created.
>>
>> Awk is opening the file for reading and fails before any prints with >>
>> to it, much like this one does:
>>
>> $ awk 'FILENAME == "non-existent" {nextfile}' non-existent
>> awk: fatal: cannot open file `non-existent' for reading: No such file or directory
>>
>> $ strace awk 'FILENAME == "non-existent" {nextfile}' non-existent |& grep non-existent
>> execve("/usr/bin/awk", ["awk", "FILENAME == \"non-existent\" {next"..., "non-existent"], 0x7ffd32bda2e8 /* 66 vars */) = 0
>> openat(AT_FDCWD, "non-existent", O_RDONLY) = -1 ENOENT (No such file or directory)
>> write(2, "cannot open file `non-existent' "..., 70cannot open file `non-existent' for reading: No such file or directory) = 70
>>
>>
>>> And in all my testing this works. Which distro is this? Is something else like
>>> file system setup in some way unusual?
>> Ubuntu 22.04.5 and a regular ext4 file system.
> 
> Right, so some awk versions behave differently. For the record in my testing on
> Ubuntu 22.04.5 LTS (Jammy Jellyfish) this script works :/
> 
> Can you try if the touch fix from Nathan works?

Yes, with that fix it works fine.

Cheers,
Andreas


