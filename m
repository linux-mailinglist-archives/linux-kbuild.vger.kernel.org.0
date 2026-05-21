Return-Path: <linux-kbuild+bounces-13297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCWcFqxJD2ptIgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13297-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:06:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C738B5AAC29
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BC393171317
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 17:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC0B3ED3BB;
	Thu, 21 May 2026 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZfqDSgWU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226A3E5587
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386266; cv=none; b=blf53/IsJi+BgYDp3mpfyZkgkWUt6h2b2rigxzVFrsdzpGx0iqPpwbKUhOKhE3NZmCqnlqaQzliMJQTSAiaBQdFDrgvQpeNRd3nbPISKzIyH6jUQuf2/u1o8qPNyEM2i2UVbnOj5+GHwZpTeRD2sp8jVF8s47QrpWqTpnO5Q7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386266; c=relaxed/simple;
	bh=fhMJeEtf48wfhs6WEzw9JIhUEyLqIW3ueZckmjfjmb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRWvoG4Mun18Pb89GdX2M482/G2Py1P+ez4fuJvRl5cn8NcIPtGoDV3U9J3HW1dSqjOBwPhL9qHkONNiCcsR9Slw6ECMz6yrC+mZ113tZJd71C2QzsLjxyf93EMWRKyweU3u7N7Cn0Rqkr1rFEylEdttmkGY38OtwxMFEx02L6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZfqDSgWU; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779386252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vB7y4Z6fBlVyLn2Op9km7+Z416nX/TCNl4lHmjXL0HI=;
	b=ZfqDSgWUHUkyNQ0BJiz7SmT0HDBMN7Wc82BEL5n49pZOEQAgBtTuY7eGowJvMP0Udqt0ah
	RTAbnb3cUp6A4VXSrTBeK4QVHWh4FhLHHrGArYtvetPiXkncvQB2Y9m9hroRVLjouxcI+d
	giNQS86U1wRotv1fMClcgNjAzFhtlsA=
Date: Thu, 21 May 2026 10:57:19 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang
 ThinLTO
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>, xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Stafford Horne <shorne@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Piotr Gorski <piotrgorski@cachyos.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20260331154827.2793269-1-xur@google.com>
 <20260331154827.2793269-4-xur@google.com> <20260331162729.GA2006419@ax162>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260331162729.GA2006419@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13297-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[o.map:url,linux.dev:mid,linux.dev:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C738B5AAC29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> Hi Rong,
>
> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
>> diff --git a/Makefile b/Makefile
>> index 69ccf9b8507d..26005c64016d 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
>>   endif
>>   
>>   ifdef CONFIG_LTO_CLANG
>> -ifdef CONFIG_LTO_CLANG_THIN
>> +ifdef CONFIG_LTO_CLANG_FULL
>> +CC_FLAGS_LTO	:= -flto
>> +else
>>   CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
>> +if CONFIG_LTO_CLANG_THIN
> This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake:
>
>    https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
>    https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.dev/
>
> Please slow down and test build your changes before sending them. Each
> revision adds four new emails to everyone's inbox, which is just noise
> when there are obvious, basic problems. 'b4 diff' shows no actual
> difference from v8 and v9, which should have been caught by a simple
> build test right before 'git send-email'.
>
>>   KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
>> -else
>> -CC_FLAGS_LTO	:= -flto
>> +endif

The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be removed.
See llvm patch
    https://github.com/llvm/llvm-project/pull/188074
which supports distributed thin-lto mode too for reducing the number
of renaming. In other words, for llvm23, both in-process and
distributed-process are supported for thin-lto.

>>   endif
>>   CC_FLAGS_LTO	+= -fvisibility=hidden
>>   
>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
>>   CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>>   	       modules.builtin modules.builtin.modinfo modules.nsdeps \
>>   	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>> +	       vmlinux.thinlto-index builtin.order \
>>   	       compile_commands.json rust/test \
>>   	       rust-project.json .vmlinux.objs .vmlinux.export.c \
>>                  .builtin-dtbs-list .builtin-dtb.S
>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
>>   	$(call cmd,rmfiles)
>>   	@find . $(RCS_FIND_IGNORE) \
>>   		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
>> -		-o -name '*.ko.*' \
>> +		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
>>   		-o -name '*.dtb' -o -name '*.dtbo' \
>>   		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
>>   		-o -name '*.dt.yaml' -o -name 'dtbs-list' \
> With that addressed above, the series survives my basic LLVM 22.1.2
> build test with my distribution configuration. I'll provide formal tags
> on a properly tested and fixed revision.
>
> Cheers,
> Nathan


