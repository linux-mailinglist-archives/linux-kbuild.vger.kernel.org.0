Return-Path: <linux-kbuild+bounces-6920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B4AA8350
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 May 2025 01:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E7B189AF29
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 23:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882CD1DCB09;
	Sat,  3 May 2025 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wr+CcmQH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F01C2335;
	Sat,  3 May 2025 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746314608; cv=none; b=Ub+52Q6WT0FlHV3TK8DSivl4veDTQ/2d8Nx8ZV66Xkky0YeFbSZfO91tfpKuxEeRlRybE2TXtevcMCQuHQUYaVci4d8B0t0hHM63EvHa2pVjxKPyQjqOzbmj9b0LEWVvfk/8oPpSIMo0IGQKNrkQKIPFhlW9Xw14XOyuu7FdTlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746314608; c=relaxed/simple;
	bh=vWJirjpn+gKyP51TOzaxzeMdh3TMT3+EyxZX6qjhwB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u16IXcJBUQtYwX6L0FvuJXPwHVerAmgkPiTwPVA3R6fezh4tK6f3TeASi6NJhiIzeCl6y4iZz5ez1HbLD8rsmd0wckCkKsHIWen5j0UUBCl1MyNHjUlDItRtfoDWraJ69xFgn/NZNegHzqDnEbkGvGfV/epZvNYQCEjU8XRY9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Wr+CcmQH; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DvgereG4tW9JLpb0AoTSdmJfjMg0Tksuj+QaZ4Q0t20=; b=Wr+CcmQHKGpDKjkE2FKEvUjnR5
	vdErh31gX4bD9NR6eoXSp+n7dLSA4D9e0Ux1ggbGvGE8sMSFN6P8raKWvNA8B9T4jfxb2WQlsrZ7N
	uhBLdtSLrywG33VPRd0g4MSDraUvlIs7J8exEzfs8cof5uzXb7jbfsewiYEBg9b6f0iOvHYSwtQbe
	u6EuKESfaCJExAysCSpZvplJdXN+PeHuWPDJG8yAMnVxOdd+036DEIDcrteGR9IsQj/s+cVMJ9NwI
	azgF+ATodlpHQ+VxpumCYlV+rbLbK9fEa3g+jQ8J+LMdnvJUMJz7y+pI5DRxDy8zV4fKwyUqUOhIp
	E1hheMsQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uBMCT-0000000FHvM-2FrB;
	Sat, 03 May 2025 23:23:21 +0000
Message-ID: <21182762-30b9-49e5-aa6c-a0f967d81529@infradead.org>
Date: Sat, 3 May 2025 16:23:13 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20250426030815.1310875-1-rdunlap@infradead.org>
 <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
 <CAK7LNAQpZvXREY5+4H_WA4UOgYpYoTLS=bpb_Gkb+SyetKh_tw@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQpZvXREY5+4H_WA4UOgYpYoTLS=bpb_Gkb+SyetKh_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/3/25 9:13 AM, Masahiro Yamada wrote:
> On Sun, May 4, 2025 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Sat, Apr 26, 2025 at 12:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
>>> bpf_perf_event.h for arch/openrisc/.
>>>
>>> Fixes a build error:
>>> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
>>
>>
>>
>> Where can I get openrisc compiler that enables CONFIG_CC_CAN_LINK?
> 
> Never mind.
> I downloaded a one from
> https://github.com/stffrdhrn/or1k-toolchain-build/releases
> 
> Hmm, I did not observe an error like that.
> 
> Instead, I got a different error message.
> 
>   HDRTEST usr/include/linux/bpf_perf_event.h
> In file included from <command-line>:
> ./usr/include/linux/bpf_perf_event.h:15:9: error: unknown type name '__u64'
>    15 |         __u64 sample_period;
>       |         ^~~~~
> ./usr/include/linux/bpf_perf_event.h:16:9: error: unknown type name '__u64'
>    16 |         __u64 addr;
>       |         ^~~~~
> 

Does HDRTEST use the #include files from the header that is being tested?

usr/include/linux/bpf_perf_event.h #includes <asm/bpf_perf_event.h>
(from usr/include/ ??) which #includes <asm-generic/bpf_perf_event.h>
(from usr/include/ ??) which #includes <linux/ptrace.h> (from usr/include/ ??)
which #includes <linux/types.h>.  I don't see this problem in my builds.

I do still continue to see this failure:

  HDRTEST usr/include/linux/bpf_perf_event.h
In file included from <command-line>:
./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
   14 |         bpf_user_pt_regs_t regs;
      |                            ^~~~
make[5]: *** [../usr/include/Makefile:85: usr/include/linux/bpf_perf_event.hdrtest] Error 1

> 
> 
> 
> diff --git a/include/uapi/linux/bpf_perf_event.h
> b/include/uapi/linux/bpf_perf_event.h
> index eb1b9d21250c..61264bdda988 100644
> --- a/include/uapi/linux/bpf_perf_event.h
> +++ b/include/uapi/linux/bpf_perf_event.h
> @@ -8,6 +8,7 @@
>  #ifndef _UAPI__LINUX_BPF_PERF_EVENT_H__
>  #define _UAPI__LINUX_BPF_PERF_EVENT_H__
> 
> +#include <linux/types.h>
>  #include <asm/bpf_perf_event.h>
> 
>  struct bpf_perf_event_data {
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>>
>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Jonas Bonn <jonas@southpole.se>
>>> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>>> Cc: Stafford Horne <shorne@gmail.com>
>>> Cc: linux-openrisc@vger.kernel.org
>>> Cc: linux-kbuild@vger.kernel.org
>>> ---
>>>  usr/include/Makefile |    4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> --- linux-next-20250424.orig/usr/include/Makefile
>>> +++ linux-next-20250424/usr/include/Makefile
>>> @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
>>>  no-header-test += linux/bpf_perf_event.h
>>>  endif
>>>
>>> +ifeq ($(SRCARCH),openrisc)
>>> +no-header-test += linux/bpf_perf_event.h
>>> +endif
>>> +
>>>  ifeq ($(SRCARCH),powerpc)
>>>  no-header-test += linux/bpf_perf_event.h
>>>  endif
>>
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
> 
> 
> 

-- 
~Randy


