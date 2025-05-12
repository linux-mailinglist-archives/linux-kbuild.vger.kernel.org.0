Return-Path: <linux-kbuild+bounces-7089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF61AB3CF8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 18:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAD83AE239
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 16:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAA624678E;
	Mon, 12 May 2025 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b="en+5tvkJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125FC1AAE08
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065940; cv=none; b=CyKr2SQ1q9sBAkBIW92sFC/ilvuA58Akf1EhKD9DFkS0T/gpY3DLSgRv2LDuQrSH/R23A/CtGIW1x2RPiY5paAJrK6AWyztm8YaSgj1zQYkPnILMr+i8oqseUA1A6A68CNo1iiQfLH14PD/Lk1/ltH77Cnt9VgfyzE+NGf8SQ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065940; c=relaxed/simple;
	bh=Qww/+DGY1oh/zF5dnfoZAg4ka+2ohc4hHKxkb8WSqmI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=U02/hNAdzxwQfQAvv6CuEYdLDCNz551DZET4k8an92juip+GZddRVMkyzE0GdnFCQuOoryseGsUZSeupu7uZn7gXmoMFdcc8lgQYM9tLCHxjP/rROD+Qo4jkpHp6Y/3EVQZ/30LIvPAMkHAfY3+CrdDeiuvQzeL8I482PYh7l8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se; spf=pass smtp.mailfrom=lxm.se; dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b=en+5tvkJ; arc=none smtp.client-ip=93.188.3.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lxm.se
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 5277E38ACAF
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 17:55:54 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.6])
	by s807.loopia.se (Postfix) with ESMTP id 3F1CB38AFCF;
	Mon, 12 May 2025 17:55:54 +0200 (CEST)
Received: from s470.loopia.se (unknown [172.22.191.5])
	by s934.loopia.se (Postfix) with ESMTP id 3C22E7CEA49;
	Mon, 12 May 2025 17:55:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s470.loopia.se (amavisd-new); dkim=pass (2048-bit key)
 header.d=lxm.se
Received: from s981.loopia.se ([172.22.191.6])
 by s470.loopia.se (s470.loopia.se [172.22.190.34]) (amavisd-new, port 10024)
 with UTF8LMTP id xMWofZxMXs0z; Mon, 12 May 2025 17:55:53 +0200 (CEST)
X-Loopia-Auth: webmail
X-Loopia-User: henrik@lxm.se
Received: from webmail.loopia.se (unknown [172.22.212.7])
	(Authenticated sender: henrik@lxm.se)
	by s981.loopia.se (Postfix) with ESMTPA id ADF0D22B179C;
	Mon, 12 May 2025 17:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lxm.se;
	s=loopiadkim1708025221; t=1747065353;
	bh=o6tlUAAKaemR+GJxvM/NEaZspAsiJGP2uOmTEG9aDPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=en+5tvkJv4WuqB9u7zDCv0XbJiZO+QethysUB/ciuDdW7mulkN0n3+ZBxct6kjid5
	 Z/bXSVmIKkFSQC1dwRrFcl/667Q7zmyt5lyDuFzWJlOFOTsfFy0WX4M5uvK8me3Cfk
	 uN4r3G7tFQwgtZb20HyJefD95LriO7AnxBnykWpMERqunAMuwaZfFBrcNvBlW0h3aW
	 bGqvKvZ7owM4rmpp9/Cke7W1mFUIWfiW1lh0lpKC0vpVzcPm7TBZRzz35xtl0GHKC/
	 eNJenXBl9l0+D6maeRY62+gKYPbL1nkgtXVaHFggTsHjdXbd4DMexkvvNxZacKckhz
	 2iyDpaoAuA5WA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 May 2025 17:55:53 +0200
From: =?UTF-8?Q?Henrik_Lindstr=C3=B6m?= <henrik@lxm.se>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: nathan@kernel.org, nicolas.schier@linux.dev,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Makefile: remove dependency on archscripts for header
 installation
In-Reply-To: <CAK7LNASYL6VCf_JgT_ks6ZObiR1xdB8HvV0XyYrWLrfYghtzbA@mail.gmail.com>
References: <20250510153204.11052-1-henrik@lxm.se>
 <CAK7LNASYL6VCf_JgT_ks6ZObiR1xdB8HvV0XyYrWLrfYghtzbA@mail.gmail.com>
User-Agent: Loopia Webmail/1.6.10
Message-ID: <8bd773107cf5a78359bcf03a0dcd2785@lxm.se>
X-Sender: henrik@lxm.se
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

That was my attempt to explain why i wanted to make this change, but 
you're right that it's really just a small cleanup.

Will go again with a simpler message, thanks.

On 2025-05-12 14:23, Masahiro Yamada wrote:
> On Sun, May 11, 2025 at 12:34 AM Henrik Lindström <henrik@lxm.se> 
> wrote:
>> 
>> There doesn't seem to be any purpose behind this dependency, and it 
>> prevents
>> installing x86 and mips headers on non Linux systems. Doing so is 
>> useful when
>> building a cross compiler targetting Linux, which requires the header 
>> files.
>> 
>> Signed-off-by: Henrik Lindström <henrik@lxm.se>
>> ---
> 
> This clean-up makes sense.
> 
> However, I could not understand the commit description
> about the non-Linux systems.
> 
> In my understanding, archscripts is not required here
> regardless of whether it is a Linux or non-Linux system.
> 
> So, the following description sound good to me:
> 
>   archscripts has nothing to do with headers_install.
> 
> 
> Could you send v2 with the simplified commit log?
> 
> 
> 
> 
> 
> 
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index b29cc321ffd9..0234faafe8f0 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1366,7 +1366,7 @@ PHONY += archheaders archscripts
>>  hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
>> 
>>  PHONY += headers
>> -headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders 
>> archscripts
>> +headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders
>>  ifdef HEADER_ARCH
>>         $(Q)$(MAKE) -f $(srctree)/Makefile HEADER_ARCH= 
>> SRCARCH=$(HEADER_ARCH) headers
>>  else
>> --
>> 2.39.5
>> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

