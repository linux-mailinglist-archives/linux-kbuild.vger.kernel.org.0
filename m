Return-Path: <linux-kbuild+bounces-13919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pTHqBqfPRWqJFgsAu9opvQ
	(envelope-from <linux-kbuild+bounces-13919-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Jul 2026 04:40:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA26F314D
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Jul 2026 04:40:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.alibaba.com header.s=default header.b=JfWG3+PG;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13919-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13919-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.alibaba.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11F2B300460C
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jul 2026 02:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CF630C176;
	Thu,  2 Jul 2026 02:40:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC318D636;
	Thu,  2 Jul 2026 02:40:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960031; cv=none; b=mpmamsrKtVwPMgeBFrH29aLQuW30N4mTr+mwnTGDU8bHOcYfz/jaiJ4aNVwTApjbfrvfkJVio1mjvsDL1UAE0ch7MtzkUYuEXCIo7YpYvQ0R55PEPQAhcAbkTxxPtN6/3BKCrCtVx+n8NAi1kM5lkBNkvfmrJwVx4PsasqxD++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960031; c=relaxed/simple;
	bh=9afQM0SA0eBKolIOuWMN/Ikm4rmRjOdVM8h12KJYNFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRzilwsW6Zt1m51Eh3aTsC6AAuhwpfyChkWdFJQLpzL5hERCL/hMFfupIgsf/1oh9rlt/Ow+gJVlzQ5M4Q37oNlv4ieVZ5OU++385dLk9+FIZ2i0wNfSqsMBPYgErJLPqmszE8laGBHg5rD1NfOdGghEM1rnPJNgfp3aMLw2hkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JfWG3+PG; arc=none smtp.client-ip=115.124.30.113
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782960025; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TkcylkSmU8L8WnUwuXjPBQPuPFMLUrZHX9Qy3nwXozE=;
	b=JfWG3+PGnxeKNKdlwWW8MnSUngU2k5U5huiwGoj7piVqY6M0I4xY7P0F7rWu+DLZxHlnNlPMKWkPs17xZA9+yq9J0OXp3yKnQZiJ1K7+7H0nqvdtmMn0fmWsG/JdbqH7yxt/DE7anVqAhTD/gouam7CMifbk1o8FNJXDIsDxBTo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=zelin.deng@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6COITJ_1782960024;
Received: from 30.74.129.76(mailfrom:zelin.deng@linux.alibaba.com fp:SMTPD_---0X6COITJ_1782960024 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 02 Jul 2026 10:40:25 +0800
Message-ID: <ec834cd5-27ba-4bae-8c19-f6b97f098139@linux.alibaba.com>
Date: Thu, 2 Jul 2026 10:40:21 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: livepatch: unset sub_make_done in case top
 level Makefile be overwritten
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Petr Mladek <pmladek@suse.com>
Cc: Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, live-patching@vger.kernel.org,
 mpdesouza@suse.com, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
References: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
 <alpine.LSU.2.21.2606191638540.26638@pobox.suse.cz>
 <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
 <akPTcJjrIAI1ZNyH@pathway.suse.cz>
 <20260630181125-a7a41726-4270-4bb7-92fe-17ec28cbe176@linutronix.de>
 <akUu0DEYrhd9cLCL@pathway.suse.cz>
 <20260701171713-7dd2f65f-abe2-4ae6-bcd4-e0bcdada6bed@linutronix.de>
From: Zelin Deng <zelin.deng@linux.alibaba.com>
In-Reply-To: <20260701171713-7dd2f65f-abe2-4ae6-bcd4-e0bcdada6bed@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.16 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[alibaba.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13919-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:pmladek@suse.com,m:mbenes@suse.cz,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:live-patching@vger.kernel.org,m:mpdesouza@suse.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.alibaba.com:dkim,linux.alibaba.com:mid,linux.alibaba.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12DA26F314D

在 2026/7/1 23:19, Thomas Weißschuh 写道:

> On Wed, Jul 01, 2026 at 05:14:24PM +0200, Petr Mladek wrote:
>> On Tue 2026-06-30 18:12:46, Thomas Weißschuh wrote:
>>> Hi Zelin,
>>>
>>> On Tue, Jun 30, 2026 at 04:32:16PM +0200, Petr Mladek wrote:
>>>> Added some people involved in "filechk_makefile" feature into Cc.
>>>>
>>>> For the new people, see the whole thread at
>>>> https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
>>> Thanks for the report and forwarding it.
>>>
>>>> On Sun 2026-06-21 22:36:24, Zelin Deng wrote:
>>>>> 在 2026/6/19 22:42, Miroslav Benes 写道:
>>>>>> On Mon, 25 May 2026, Zelin Deng wrote:
>>>>> Here're how I reproduce the issue:
>>>>>
>>>>> 1. pull linux-next, reset to HEAD, for example
>>>>> 3ce97bd3c4f18608335e709c24d6a40e7036cab8 (tag next-20260619)
>>>>>
>>>>> 2. at linux-next tree: make all -j$(nproc) && make modules_install
>>>>> headers_install -j$(nproc) && make install && reboot
>>>>>
>>>>> 3. at linux-next tree: make kselftest-all
>>>>>
>>>>> 4. top level Makefile in linux-next has been overwritten by
>>>>>
>>>>>      export KBUILD_OUTPUT = .
>>>>>      export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
>>>>>      export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
>>>>>      include /home/shiyu.dzl/linux-next/Makefile
>>>>>
>>>>> it is a stub generated by filechk_makefile.
>>>> It seems that "filechk_makefile" has reached mainline in v7.1-rc1,
>>>> see the commit c9bb03ac2c66bc5aa81b ("kbuild: reduce output spam when
>>>> building out of tree").
>>>>
>>>> The commit message says:
>>>>
>>>> <paste>
>>>>      The Makefile is now created even if the build is aborted due to an
>>>>      unclean working tree. That should not make a difference in practice.
>>>>   </paste>
>>>>
>>>> It seems that is actually makes a difference in the livepatch selftest
>>>> case.
>>>>
>>>> Sigh, the Makefile rules are a maze to me. It is possible that
>>>> we do something wrong in
>>>> tools/testing/selftests/livepatch/test_modules/Makefile. Namely
>>>> with:
>>>>
>>>> ifneq ("$(wildcard $(KDIR))", "")
>>>> 	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
>>>> endif
>>>>
>>>> But I see "$(MAKE) -C ..." called in many other makefiles.
>>>>
>>>> Best Regards,
>>>> Petr
>>>>
>>>>> I'm not quite sure that it could be related to my toolchain (like make
>>>>> version ?), I briefed analysis the root cause on my environment (KDIR
>>>>> '/lib/modules/7.1.0-next-20260619/build' which actually a symbol link to my
>>>>> kernel source -> '/home/shiyu.dzl/linux-next'):
>>>>>
>>>>>    1. sub_make_done leaks via environment. The top-level Makefile sets export
>>>>> sub_make_done := 1 after its first-pass initialization.
>>>>>    Because it is exported, every child make process inherits it.
>>>>>    2. livepatch test_modules re-invokes the top-level Makefile. The call
>>>>> chain is: top-level Makefile → kselftest-% pattern rule →
>>>>>    tools/testing/selftests/ → livepatch test_modules/Makefile → $(MAKE) -C
>>>>> $(KDIR) modules KBUILD_EXTMOD=..., which re-enters the top-level Makefile to
>>>>>    build an external module.
>>>>>    3. The inherited sub_make_done=1 skips critical initialization. The
>>>>> top-level Makefile's first-pass block (ifneq ($(sub_make_done),1)) is
>>>>>    skipped entirely. This block is responsible for correctly parsing
>>>>> command-line variables and setting up KBUILD_EXTMOD-related paths.
>>>>>    4. Path mismatch triggers false out-of-tree detection. With the
>>>>> initialization skipped, srcroot and CURDIR end up with mismatched values
>>>>> (e.g.,
>>>>>    absolute vs. relative). The comparison (ifeq ($(srcroot),$(CURDIR)))
>>>>> fails, so building_out_of_srctree is incorrectly set to 1.
>>>>>    5. outputmakefile overwrites the source tree's Makefile. Because
>>>>> building_out_of_srctree is set, the filechk_makefile rule fires and replaces
>>>>> the
>>>>>    real top-level Makefile with a generated stub containing KBUILD_OUTPUT,
>>>>> KBUILD_EXTMOD, and an include directive.
>>>>>
>>>>>    Why make -C tools/testing/selftests/ all is unaffected: it enters the
>>>>> selftests directory directly without ever executing the top-level Makefile
>>>>>    first, so sub_make_done is never exported into the environment. When
>>>>> livepatch test_modules later invokes $(MAKE) -C $(KDIR), the top-level
>>>>> Makefile
>>>>>    runs its full initialization normally.
>>> Can you try this:
>>>
>>> diff --git a/Makefile b/Makefile
>>> index b9c5792c79e0..f717a4dc96d6 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1591,10 +1591,10 @@ tools/%: FORCE
>>>   
>>>   PHONY += kselftest
>>>   kselftest: headers
>>> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>>> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>>>   
>>>   kselftest-%: headers FORCE
>>> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
>>> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests $*
>>>   
>>>   PHONY += kselftest-merge
>>>   kselftest-merge:
>> Heh, this is exactly the same change which Zelin Deng proposed as
>> well, see
>> https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
> The difference is that my proposal is in the toplevel Makefile while
> Zelin's is in the selftest one. The toplevel one should fix all selftests at
> the same time.
Thank you Petr. Yeah, Thomas's proposal is in top-level Makefile - if 
any other selftest also re-invokes the top-level Makefile with 
KBUILD_EXTMOD, it'd be covered too.
>
>>> The same is done for cmd_install.
>> I guess that this is related to the commit 14ccc638b02f9ec ("kbuild:
>> cancel sub_make_done for the install target to fix DKMS"). Which
>> is related to the commit bcf637f54f6d2515d ("kbuild: parse C= and M=
>> before changing the working directory").
>>
>> Honestly, it all looks like a wild magic to me. I would need much
>> better understanding of the Makefile maze to get on top of it.
> I was not able to reproduce the issue yet. My proposal is just a guess.
> We'll need feedback from Zelin.

I had verify your proposal, it worked well - liveupatch kmod was built 
successfully and top-level Makefile wasn't overwritten any more.

Petr thank you for your Ack, I think Thomas's proposal is better than 
mine, we don't have to do the quirk everytime when new selftest kmod is 
added.

Thomas, so do I have to send a updated patch or you will do it by youself?

>
>> But it seems that it is a reasonable fix after all. It solves the
>> original problem. It does not break my workflow. So, I tend to add:
>>
>> Acked-by: Petr Mladek <pmladek@suse.com>
>
> Thomas

