Return-Path: <linux-kbuild+bounces-38-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCA7EE295
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 15:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA4BAB20BA3
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 14:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38120DDAB;
	Thu, 16 Nov 2023 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="e6oxUElr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1095219D
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2023 06:18:47 -0800 (PST)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id 3aXQr00VGgpyE3dChrfxK9; Thu, 16 Nov 2023 14:18:47 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 3dCfrIsn48KNv3dCgr4Yqz; Thu, 16 Nov 2023 14:18:46 +0000
X-Authority-Analysis: v=2.4 cv=dp3Itns4 c=1 sm=1 tr=0 ts=655624c6
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=QjxsOCQfT30fdp00ze8A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MOuVp5lGP1M6/tw0eHZ9E5ELxXkBynPRyGwIqBxCovU=; b=e6oxUElrS6W3RP5z+BAZjOCQ1n
	ay/qOEbo57lOUd/+S89VygFWbiXYPRewufIVQIM1NyyRciA4E918iCehewb0kiAv75cNmbgDDc0Fb
	GvD2DS3jqqJH7gIgZPbwMr09SskeTzBmoZkQ84Wo3amGsonw+UCOnERSFUfx12fjwaHgdC/7sUFbO
	7a4csOmE7QaZZzRndHlYPm/23q+nE13Vd+vTvOidt19rWRqrnyVOV1rzK5xZnV9qnzkUr898a3Cc0
	90t/xi3fhz4elnjUSZnKT/13ig2TXvDEwbSL9of+JpkeFfepFKNe8PDU+q0h9XfPovkxx3VYv8Vh0
	wqeoWMpw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38172 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r3dCf-000Wnb-0W;
	Thu, 16 Nov 2023 08:18:45 -0600
Message-ID: <e385a095-c6ea-4db5-ab7c-7221593dc6c3@embeddedor.com>
Date: Thu, 16 Nov 2023 08:18:43 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] Makefile: Enable -Wstringop-overflow globally
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZVWMCZ/jb4nX3yHn@work>
 <CAK7LNAR1i8HP8E3UmmSggZMka+UbJswU_bVMyxmRt4CbQhoTAA@mail.gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CAK7LNAR1i8HP8E3UmmSggZMka+UbJswU_bVMyxmRt4CbQhoTAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r3dCf-000Wnb-0W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:38172
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH4ty0mN6I5j02A2C+UkvrBZRLgxSG0KGYqsTVFLGiaj/f3vn2+daz0vCKvAu3CSyWTlQfhiudjhu09RXvc+4CS1lQLv1lVLRi2atYIBPtZM2BHbhPC4
 jmLWUTMQDNKpV3bObQ4h980BhDQqxXwBknkemgnFbgr/XYFrtNTKAsjoihLY3I6m9oCcCkS0mUT9ycL7CrSARiO7EHbfIOzxbmpz5dVupc/asVZaMu2By67U



On 11/16/23 05:23, Masahiro Yamada wrote:
> On Thu, Nov 16, 2023 at 12:27 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
>>
>> It seems that we have finished addressing all the remaining
>> issues regarding compiler option -Wstringop-overflow. So, we
>> are now in good shape to enable this compiler option globally.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   Makefile                   | 3 +++
>>   scripts/Makefile.extrawarn | 2 --
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 690cde550acd..452b7d0e19e9 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -985,6 +985,9 @@ NOSTDINC_FLAGS += -nostdinc
>>   # perform bounds checking.
>>   KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
>>
>> +# We are now in good shape to enable this option.
> 
> Please remove this comment.
> 
> It it fine to mention it in the commit log, but
> not in the Makefile.

Sure thing. I'll change that and add this patch to my -next tree.

> 
> 
> 
> I hope somebody will double-check this patch in CI infrastructure.

I'll take care of that.

Thanks
--
Gustavo

> 
> 
> 
> 
>> +KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
>> +
>>   # disable invalid "can't wrap" optimizations for signed / pointers
>>   KBUILD_CFLAGS  += -fno-strict-overflow
>>
>> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
>> index 2fe6f2828d37..1527199161d7 100644
>> --- a/scripts/Makefile.extrawarn
>> +++ b/scripts/Makefile.extrawarn
>> @@ -106,7 +106,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
>>   KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
>>   KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
>>   KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
>> -KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
>>   KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>>
>>   KBUILD_CPPFLAGS += -Wundef
>> @@ -122,7 +121,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
>> -KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>>
>>   ifdef CONFIG_CC_IS_CLANG
>> --
>> 2.34.1
>>
> 
> 

