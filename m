Return-Path: <linux-kbuild+bounces-226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDA7FFE1D
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 22:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59169B20FDD
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E0E5FEFB;
	Thu, 30 Nov 2023 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="exbIDVb2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F272A8
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 13:58:00 -0800 (PST)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 8lIxrjc546nOZ8p2lrXA6h; Thu, 30 Nov 2023 21:57:59 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8p2krPW0ihDny8p2krsupa; Thu, 30 Nov 2023 21:57:58 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=65690567
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=mDV3o1hIAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=mtVZSKp5H8FKAB1gxMEA:9 a=QEXdDO2ut3YA:10
 a=_FVE-zBwftR9WsbkzFJk:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dDGFLF6PkeETmU0fsnSFV5Rw/e4Y+bpJ1D8hQqlmxIU=; b=exbIDVb2LgL3FR4rjH2ZSLMgq3
	Bu9tnX5DD9QWxG18FQBDIHOv+1DzOJSZWLGXlCgDzE/oohV1JcoLjwLn0FSiS1X2SceCTT9wJQ5VK
	PWVgVH2Z6ZhjSdoYWdf0IMySCfz+uB+YnP6E9s3ProD0jPzWNREZmK0gAzGXzQHHzaI9MH5LHw2Mi
	YuOECKsZhgqGFOKK46LP8jscqVvwLOLEGCDVeFSHp8ibNYgSu7f63RTTF8BgWpOVkNIKbOX+d1XIm
	6H6R4YmEyttMLoe/hmLRAhsMZGbpoe/OVrdEFxZ3pRKEGIPIQL5Jxre64aBqpsImq4cem9Fq8OeZR
	E5zMgaBw==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:45574 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8p2j-003kks-2M;
	Thu, 30 Nov 2023 15:57:57 -0600
Message-ID: <041335a9-32f6-4b3b-8512-0ab462334af1@embeddedor.com>
Date: Thu, 30 Nov 2023 15:57:55 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] init: Kconfig: Disable -Wstringop-overflow for
 GCC-11
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZWj1+jkweEDWbmAR@work> <202311301304.28F0C52BA@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202311301304.28F0C52BA@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.215.208.186
X-Source-L: No
X-Exim-ID: 1r8p2j-003kks-2M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:45574
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfABGSj9Hso+NvqqD9yyAloZsuVyZamIUvL3GktYDbCn6usEfDszEewiOy8RaeiOBVPN5mEJxRYzM7wlEeg06t19Mz83BNgXwlvq9htqmGLk+GW8tugKH
 0xux+tCSJMqsOdHu0SSJj4JJFmmyBmjPKgcFmmAmAYI4HsEa/9oSZ9D617cIkAP95MYKATGCyWkMS3j17TCf7fFtaDjZdBcN/P8WU3Qjbv9W6po0xb+W2jT7



On 11/30/23 15:07, Kees Cook wrote:
> On Thu, Nov 30, 2023 at 02:52:10PM -0600, Gustavo A. R. Silva wrote:
>> -Wstringop-overflow is buggy in GCC-11. Therefore, we should disable
> 
> Can you add some links for this? For example, maybe this?
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97490
> 
> Or discussions from -next builds?

Done. :)

> 
>> this option specifically for that compiler version. To achieve this,
>> we introduce a new configuration option: GCC11_NO_STRINGOP_OVERFLOW.
>>
>> The compiler option related to string operation overflow is now managed
>> under configuration CC_STRINGOP_OVERFLOW. This option is enabled by
>> default for all other versions of GCC that support it.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> But yeah, let's get this landed to keep new warnings from appearing...
> 

I just applied this to my -next tree.

> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!
--
Gustavo

