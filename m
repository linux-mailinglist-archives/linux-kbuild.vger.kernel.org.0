Return-Path: <linux-kbuild+bounces-11544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O4FGEGNp2nliAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11544-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:39:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7761F98F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD3B3314E619
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 01:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA879315785;
	Wed,  4 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlqDVp8B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7930EF86;
	Wed,  4 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772587691; cv=none; b=drf5aovjjP74he3uQmUvGYEoXpIrQtwwKkCtlk4Dkxew0W/kJQ5Y8d+gCQp8g+iZeThAMaDBxXJEztEcbfpnwytrw/RSUo9sg3UgSFWIanYXJwsCb0tpf1yXorYL1ncWT+l5wVZSuo5/1P33xvmGuEHijlf3KzHpFzqi4rja4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772587691; c=relaxed/simple;
	bh=tlL/8WdJD0d9jG2rBAaeDXxofN7B8fJpA+xw0D0xTeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GA0JrODmqKt5SnXSpKsRGMM1rF969/Kj7BNjughXQorTU/NnOe54106tlhBUnrmu4Vt2ycKHTeiVeOZ9rH8GLSDaiF797j5TMlTGDz7WPA720h6Kfbi9cRbHzNL7ET28VUTopkfMp3B85AoY/1/3sn1/02kj4yL2dar2Y7jMF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlqDVp8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB70EC2BC9E;
	Wed,  4 Mar 2026 01:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772587691;
	bh=tlL/8WdJD0d9jG2rBAaeDXxofN7B8fJpA+xw0D0xTeU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GlqDVp8BB7stucd97wuW1mNl2D/oP5MR74esP9luZpfEr7cCLvEL8xo4rGPfhWJgJ
	 5pyi4cbwQO6TfEVjg3z1HxkTkcD0gsmdgP0DU9g+z5/kXmgm/6GJebBEEjZs2mNO2f
	 jKO1mWagp4X0LBy07vkmsZ6HGMt3C7sqzj2C9tAnfIqh6hZQkmayH3txCJirP0QOZo
	 rqfAUYt7SQ9zx0eCOvQsS6ELbnW2h7jmZd/vNI382pX8C3piW7eLLJdlFNeuuh/6H9
	 uQtQQv9blsTN0j03QBG19sbBJSwGmrf/9ulKnWE8m5oZS/NKzTwc9WlQx/n36Knh6o
	 TWzNj2GUzklAQ==
Message-ID: <2ff9897c-3822-4e31-acfb-884690448af0@kernel.org>
Date: Wed, 4 Mar 2026 02:28:05 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
To: Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
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
 <c886c8c9-d336-4ec3-94c0-c4869dee7e7f@kernel.org>
 <aaeHcL7vEhZ0LWth@google.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <aaeHcL7vEhZ0LWth@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BC7761F98F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11544-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qmo@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

2026-03-03 17:14 UTC-0800 ~ Namhyung Kim <namhyung@kernel.org>
> Hello,
> 
> On Fri, Feb 27, 2026 at 11:52:38AM +0000, Quentin Monnet wrote:
>> 2026-02-27 10:36 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
>>> On Thu, Feb 26, 2026 at 10:52:01PM +0000, Quentin Monnet wrote:
>>>> 2026-02-26 10:38 UTC-0800 ~ Namhyung Kim <namhyung@kernel.org>
>>>>> Adding bpftool maintainer.
>>>>>
>>>>> On Tue, Feb 24, 2026 at 12:16:40PM +0000, Leo Yan wrote:
>>>>>> GCC-15 release claims [1]:
>>>>>>
>>>>>>   {0} initializer in C or C++ for unions no longer guarantees clearing
>>>>>>   of the whole union (except for static storage duration initialization),
>>>>>>   it just initializes the first union member to zero. If initialization
>>>>>>   of the whole union including padding bits is desirable, use {} (valid
>>>>>>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
>>>>>>   restore old GCC behavior.
>>>>>>
>>>>>> As a result, this new behaviour might cause unexpected data when we
>>>>>> initialize a union with using the '{ 0 }' initializer.
>>>>>>
>>>>>> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
>>>>>> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
>>>>>> in unions and structures.  This commit applies the same option for tools
>>>>>> building.
>>>>>>
>>>>>> The option is not supported neither by any version older than GCC 15 and
>>>>>> is also not supported by LLVM, this patch adds the cc-option function to
>>>>>> dynamically detect the compiler option.
>>>>>>
>>>>>> [1] https://gcc.gnu.org/gcc-15/changes.html
>>>>>>
>>>>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>>>
>>>>
>>>> Thank you Namhyung for the Cc.
>>>>
>>>> I built bpftool with the patch, with gcc 13 (which didn't get the flag,
>>>> as expected) and gcc 15, and it's fine with both. As far as I can tell,
>>>> bpftool does not initialise any union with "{0}" anyway.
>>>
>>> Thanks a lot for testing!
>>>
>>>> One potential concern (I didn't try) could be for cross-compilation:
>>>> bpftool's Makefile sets HOST_CFLAGS based on $(CFLAGS), but $(HOSTCC)
>>>> and $(CC) could be different versions of gcc, for example.
>>>
>>> To avoid confusion, we can use EXTRA_CFLAGS and HOST_EXTRACFLAGS instead
>>> in Makefile.include:
>>>
>>> -----
>>>
>>> # cc-option
>>> # Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
>>> cc-option = $(call try-run, \
>>>        $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
>>>
>>> host-cc-option = $(call try-run, \
>>>        $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
>>>
>>> # Explicitly clear padding bits with the initializer '{ 0 }'
>>> EXTRA_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
>>> HOST_EXTRACFLAGS += $(call host-cc-option,-fzero-init-padding-bits=all)
>>>
>>> -----
>>>
>>> Then, in a project, its Makefile can append EXTRA_CFLAGS and
>>> HOST_EXTRACFLAGS to CFLAGS and HOSTCFLAGS respectively.
>>
>>
>> This sounds like it should work for bpftool as long as we += and don't
>> overwrite the EXTRA_CFLAGS passed from command line. In bpftool's
>> Makefile we'd have to move HOST_CFLAGS's CFLAGS-based defintion higher
>> up, before we add the EXTRA_CFLAGS to CFLAGS; and if anything needs to
>> be passed to the host binary, users will have to specify
>> HOST_EXTRACFLAGS (or HOST_EXTRA_CFLAGS?) independently, which is acceptable.
> 
> Quentin, do you want v2 with this or just ok for v1?
> 
> Thanks,
> Namhyung


Hi Namhyung

(I'm not entirely sure what v1/v2 refer to, this one was tagged v2 and I
suspect v1 was the first post before the resend - I suppose you mean
this one is v1 and a v2 would be with an additional host variable.)

I don't want bpftool's HOST_CFLAGS to inherit
-fzero-init-padding-bits=all if the compiler doesn't support it, which
may happen with the current version of the patch. I'd prefer a version
with separate EXTRA_CFLAGS and HOST_EXTRA_CFLAGS, as proposed by Leo and
discussed above, to address the cross-compilation issue.

Thanks,
Quentin

