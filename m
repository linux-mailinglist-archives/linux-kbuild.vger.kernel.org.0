Return-Path: <linux-kbuild+bounces-218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 557907FFC79
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860DA1C20D2C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4BF64D;
	Thu, 30 Nov 2023 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b="VL+5tHP5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.oetec.com (mail.oetec.com [108.160.241.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980241715
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:30:24 -0800 (PST)
Received: from [172.16.35.9] (cpe8c6a8d4d360a-cm8c6a8d4d3608.cpe.net.cable.rogers.com [99.253.151.152])
	(authenticated bits=0)
	by mail.oetec.com (8.17.1/8.16.1) with ESMTPSA id 3AUKUHaK088376
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Thu, 30 Nov 2023 15:30:18 -0500 (EST)
	(envelope-from dclarke@blastwave.org)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blastwave.org;
	s=default; t=1701376220;
	bh=/AO9bHhiO7lqHWL6mYqvfEW7TwJLbLFwNox+mdAvsYQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=VL+5tHP5AGo0rJtBCrYNWVW72RzVLOlZX/8tHyhMwqEhWnzWuTb/51OVGsjNTRd49
	 iISQXnXevQJiUrzlKBCk+61DTWi+s+84QTnDjViBo3uiBi1ZsYoaSPahq0u3rSu3u1
	 3gX/DLM0TbjuzGipctj64A2r1AlA1NSR6IAOBlRdlUdrpAfKIiBcqenJeU3iwPK9Tt
	 RklcyKpneCM0wyhJBxoj95MR/ke0+2Pv6Qzy81hI28/3EBO1I1jNrFgLICq1jg6Ue/
	 VuU9Q0pq7A4F/6pg8mcXJJ9NpTQRE5YcAv7hC+ssTNK3lEkcZsfexWY+MLO+7ISseN
	 d5sPaJs/ZEYkw==
Message-ID: <8cb7186f-6346-7997-13b3-8f5a1d71bc3d@blastwave.org>
Date: Thu, 30 Nov 2023 15:30:17 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Dennis Clarke <dclarke@blastwave.org>
Subject: =?UTF-8?Q?Re=3a_Fwd=3a_sign-file=2ec=3a149=3a17=3a_warning=3a_impli?=
 =?UTF-8?Q?cit_declaration_of_function_=e2=80=98ENGINE=5fload=5fbuiltin=5fen?=
 =?UTF-8?B?Z2luZXPigJk=?=
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
        Linux Kernel Keyrings <keyrings@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
        David Woodhouse
 <dwmw2@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
 <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
 <164a4d4434e77ba1b65624a081799a073a3aced7.camel@HansenPartnership.com>
 <7fce272f-65f5-9aa8-5f28-aeecb98a8ab4@blastwave.org>
 <ce0c752cd1ed482bff97c6c62266440e3ff8f937.camel@HansenPartnership.com>
Content-Language: en-CA
Organization: GENUNIX
In-Reply-To: <ce0c752cd1ed482bff97c6c62266440e3ff8f937.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-oetec-MailScanner-Information: Please contact the ISP for more information
X-oetec-MailScanner-ID: 3AUKUHaK088376
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-From: dclarke@blastwave.org

On 11/23/23 20:05, James Bottomley wrote:
> On Thu, 2023-11-23 at 18:42 -0500, Dennis Clarke wrote:
>> On 11/23/23 09:53, James Bottomley wrote:
>>> On Fri, 2023-11-17 at 00:34 -0500, Dennis Clarke wrote:
>>>> On 11/16/23 18:41, Bagas Sanjaya wrote:
>>>>> Hi,
>>>>>
>>>>> I notice a bug report on Bugzilla [1]. Quoting from it:
>>>>>
>>>> <snip>
>>>>>> Not related to
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I
.
.  <snip>
.
>>
>> I am looking into this. The code will likely age into some deprecated
>> calls and I think that I may be way out on the edge here.
> 
> So you did build without engine support ...

Yep.

     --prefix=/usr/local no-asm shared no-engine no-hw threads zlib
          sctp enable-weak-ssl-ciphers -DPEDANTIC -D_REENTRANT

So there we see the "no-engine" option.  That pretty much kicks the
sign-file.c code to the curb.


>>   However the code will need a pile of ifndef stuff and then call the
>> correct future looking calls for OpenSSL 3.x etc etc etc ... the
>> usual stuff
> 
> Well, not really: openssl is highly configurable and if it gets
> configured wrongly, stuff like this happens. 

Well, not "wrongly". More like "not the usual off the shelf stuff".

> That's why distros have a
> fairly inclusive configuration and they stick to it.  No-one can cope
> with the combinatoric explosion of openssl configuration possibilities
> (even though they have ifdefs for most of them) so the only way is
> really to fix a standard configuration and assume you're building for
> it.

Seems clear to me.

> Openssl has been talking for ages about removing engine support, but
> they've been unable to do so due to the rather slow pace of conversion
> of their own engines.  I anticipate this code can be removed in favour
> of the pkcs11 provider long before openssl actually manages to remove
> engines.
> 
> James


Well I thank you for the clarity here. I still feel that sign-file.c 
needs a bit of a rewrite and I guess the old expression "patches are
welcome" works here.


Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken


