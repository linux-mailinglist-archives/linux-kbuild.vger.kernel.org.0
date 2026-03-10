Return-Path: <linux-kbuild+bounces-11764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBPgNwjrr2nkdAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11764-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:57:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E923248F23
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8B28300335B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 09:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56C346AFB;
	Tue, 10 Mar 2026 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="f9l52WHH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D517251793;
	Tue, 10 Mar 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136552; cv=none; b=ZK9gIZmbCYeeAzCVlezD03JxpG7NLfzPo5YbHVQ9lWSCxx5v73P3kEsU9g9RbaFotrMPv7ZEPP7zPZYmzUQXO/fPpIEsOS+rszXDtCZe8nR+9q1eELzymo8mIfkCjieILynwzFbKqa5zod4uXyPiRldeyxP+laGVnLuM5zVqEL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136552; c=relaxed/simple;
	bh=yTFspxeupX6u682M/zM43Vgysj0M53+vw9KdgOqViyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2Tow/JKoUvbfrIXA1FbIaG8zYhLhEc+fu1U27TBIIWrBY+NQrSTDiTnbinCJHsNzLPKJmiABMnDxYhXeoFrFxoHp01fim8+0XM+bUkqD0UN3rt9c8oE/eJaSQiHmXuzbCk7rb5iTAVSSnDDnOO5kDOZZsZnK8+lPqXKhqlt+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=f9l52WHH reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4fVTll2h26z1DHng;
	Tue, 10 Mar 2026 10:55:47 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4fVTll0t7fz1DDXR;
	Tue, 10 Mar 2026 10:55:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1773136547;
	bh=/m0utPBZ48p7Kb+DsLOiso75/qXVFwoCVphbEurN+qQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f9l52WHH/Ce0motumxulidRxbUjalhAl3roSjPqhY4ROX+HAH5P95wniRDCVLME1h
	 Xu3IskxZmdlZk5PSnqC1ljh4C+0sHeRLw8pfPUUuMq6o0io4aM3HBT5jHFpgUtdLwk
	 hOMVB/AiY1sbYZX7UtxQ9NdfjB2ypRBctA3xu+K9yfuX6kAEntDvLahifNhOR+s3aL
	 ZL5tEMIphxfIT3gK1IJmVEqK9X95vdiHwc8+nlN5xG82nV5ayZz5S9h07Gvx8a+JM2
	 LyLei69ZCT1cFeu5pUYUm4Y9zbA1h0qHH+b78R3XBQVBjJRS7WS4Vl1mlRryZJd9x2
	 eQj1+YTJFkkOw==
Message-ID: <5e948d9f-dac3-4329-b7fe-e7f9a80108d9@gaisler.com>
Date: Tue, 10 Mar 2026 10:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Anders Roxell
 <anders.roxell@linaro.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
 <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
 <20260309170904.GA2779008@ax162> <aa_NWVOiHyN7CVvg@nuoska>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <aa_NWVOiHyN7CVvg@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E923248F23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11764-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.833];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,merge_config.sh:url,gaisler.com:mid]
X-Rspamd-Action: no action

On 2026-03-10 08:50, Mikko Rapeli wrote:
> Hi,
> 
> On Mon, Mar 09, 2026 at 10:09:04AM -0700, Nathan Chancellor wrote:
>> On Mon, Mar 09, 2026 at 05:38:58PM +0100, Andreas Larsson wrote:
>>> On 2026-01-22 11:57, Mikko Rapeli wrote:
>>>> From: Anders Roxell <anders.roxell@linaro.org>
>>>>
>>>> merge_config.sh shell/sed/grep loop scales poorly and is slow.
>>>> With Yocto genericarm64 kernel and around 190 config fragments
>>>> the script takes more than 20 minutes to run on a fast build machine.
>>>> Re-implementation with awk does the same job in 10 seconds.
>>>> Using awk since it is likely available in the build environments
>>>> and using perl, python etc would introduce more complex runtime
>>>> dependencies. awk is good enough and lot better than shell/sed/grep.
>>>>
>>>> Output stays the same but changed execution time means that
>>>> parallel job output may be ordered differently.
>>>>
>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>>> ---
>>>>  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
>>>>  1 file changed, 128 insertions(+), 40 deletions(-)
>>>
>>> Hi,
>>>
>>> Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
>>> shell/sed/grep to awk") breaks merge_config.sh for me:
>>>
>>> ---------->%----------
>>> $ make tiny.config
>>>   HOSTCC  scripts/basic/fixdep
>>>   HOSTCC  scripts/kconfig/conf.o
>>>   HOSTCC  scripts/kconfig/confdata.o
>>>   HOSTCC  scripts/kconfig/expr.o
>>>   LEX     scripts/kconfig/lexer.lex.c
>>>   YACC    scripts/kconfig/parser.tab.[ch]
>>>   HOSTCC  scripts/kconfig/lexer.lex.o
>>>   HOSTCC  scripts/kconfig/menu.o
>>>   HOSTCC  scripts/kconfig/parser.tab.o
>>>   HOSTCC  scripts/kconfig/preprocess.o
>>>   HOSTCC  scripts/kconfig/symbol.o
>>>   HOSTCC  scripts/kconfig/util.o
>>>   HOSTLD  scripts/kconfig/conf
>>> The base file '.config' does not exist. Creating one...
>>> Using .config as base
>>> Merging ./kernel/configs/tiny.config
>>> awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
>>> mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
>>> make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
>>> make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
>>> make: *** [Makefile:248: __sub-make] Error 2
>>> ---------->%----------
>>>
>>> with this underlying call to merge_config.sh, an empty .config and where
>>> my awk is GNU Awk 5.1.0:
>>>
>>> ---------->%----------
>>> $ make tiny.config V=1
>>> make --no-print-directory -C <kernel-source-top-dir> \
>>> -f <kernel-source-top-dir>/Makefile tiny.config
>>> make -f ./scripts/Makefile.build obj=scripts/basic
>>> make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
>>> # cmd_merge_fragments tiny.config
>>>   ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
>>> ...
>>>
>>> $ awk --version
>>> GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
>>> ---------->%----------
>>>
>>> At 5fa9b82cbcfc~ things works as expected.
> 
> Hmm, all these steps work for me with GNU awk 5.1.0 so something else
> is different here. On line 267 awk is given input file args
> "$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new" and it fails to
> create the output file "$TMP_FILE.new" with >> and plain print statement.
> 
>> Hmmm, not sure how I have not seen this error myself since I test
>> tiny.config but I can reproduce with a clean output directory. Something
>> like this seems like a simple fix but the only instances of ARGV[3] in
>> the awk script that I can see use '>>', which should create the file if
>> it does not exist. Mikko, any ideas?
>>
>> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
>> index 735e1de450c6..070ecae87a1c 100755
>> --- a/scripts/kconfig/merge_config.sh
>> +++ b/scripts/kconfig/merge_config.sh
>> @@ -123,6 +123,7 @@ fi
>>  MERGE_LIST=$*
>>  
>>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
>> +touch "$TMP_FILE.new"
>>  
>>  echo "Using $INITFILE as base"
> 
> This could help but I fail to understand why this would be needed. Why is awk
> not able to create this file on line 256?
> 
> awk manual says:
> 
> https://www.gnu.org/software/gawk/manual/html_node/Redirection.html
> 
>     print items >> output-file
> 
>     This redirection prints the items into the preexisting output file named
>     output-file. The difference between this and the single-‘>’ redirection
>     is that the old contents (if any) of output-file are not erased. Instead,
>     the awk output is appended to the file. If output-file does not exist,
>     then it is created.

Awk is opening the file for reading and fails before any prints with >>
to it, much like this one does:

$ awk 'FILENAME == "non-existent" {nextfile}' non-existent
awk: fatal: cannot open file `non-existent' for reading: No such file or directory

$ strace awk 'FILENAME == "non-existent" {nextfile}' non-existent |& grep non-existent
execve("/usr/bin/awk", ["awk", "FILENAME == \"non-existent\" {next"..., "non-existent"], 0x7ffd32bda2e8 /* 66 vars */) = 0
openat(AT_FDCWD, "non-existent", O_RDONLY) = -1 ENOENT (No such file or directory)
write(2, "cannot open file `non-existent' "..., 70cannot open file `non-existent' for reading: No such file or directory) = 70


> And in all my testing this works. Which distro is this? Is something else like
> file system setup in some way unusual?
Ubuntu 22.04.5 and a regular ext4 file system.

Cheers,
Andreas


