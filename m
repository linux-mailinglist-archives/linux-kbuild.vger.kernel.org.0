Return-Path: <linux-kbuild+bounces-8737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85EB45171
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 10:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31BBB1C80C4B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 08:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A0E30DEB8;
	Fri,  5 Sep 2025 08:29:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3A3019D2;
	Fri,  5 Sep 2025 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060955; cv=none; b=hPgxsRRdaG8AR0HuzoLZrRoQTQ6FHBCtTJRp4Vp6ykvnLJVdG5PmTrv6qMViijKRSn8v/keccQxnPzJU9+fOYmiljxW7nBSZGnZ5MYPTkUFZ5dVpPtc/yPi4uNp/ZNceOQ0uo0CGxT0CKJNtR4DaRgZRWOPFrEUdZx6PRFg3Odo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060955; c=relaxed/simple;
	bh=uFpqLHJ/iwW5TixEGbiXanXB+kW0ltZ8ZAKzxsK5NzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/Jm0OchTAKiTV8vfEM5f/GLEH9kSgZjxIYSjQSRLacTgPXWSU143Nu5XSZo3/Sm9PK6jmcf/AKEgAGSB1JfryAq7JFpgrWdSa2vM5moJ0SOwE5fiRkiP5HeT+hZ/jaTbCmsp2JNCckjTH2BZsI270o7+d9ZLpLX3hUPGWGhIus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [124.127.223.97])
	by gateway (Coremail) with SMTP id _____8CxHvBTn7po8P8GAA--.14886S3;
	Fri, 05 Sep 2025 16:29:07 +0800 (CST)
Received: from [127.0.0.1] (unknown [124.127.223.97])
	by front1 (Coremail) with SMTP id qMiowJDxK8FQn7poxr9_AA--.3881S2;
	Fri, 05 Sep 2025 16:29:05 +0800 (CST)
Message-ID: <e08c4462-7ecd-4c2a-bd08-c38ec148b5c8@loongson.cn>
Date: Fri, 5 Sep 2025 16:29:04 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
To: Greg KH <gregkh@linuxfoundation.org>
Cc: WangYuli <wangyuli@uniontech.com>, ardb@kernel.org,
 chenhuacai@kernel.org, chenhuacai@loongson.cn, kernel@xen0n.name,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, nicolas@fjasle.eu, sashal@kernel.org,
 stable@vger.kernel.org
References: <2024120635-wham-campsite-b62b@gregkh>
 <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
 <2025020611-olive-gluten-fa45@gregkh>
 <17f2c722-a32b-482b-9363-6a415443fb40@loongson.cn>
 <2025090549-mannish-tremor-2469@gregkh>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <2025090549-mannish-tremor-2469@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxK8FQn7poxr9_AA--.3881S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEQEmi6e6UDhwABsL
X-Coremail-Antispam: 1Uk129KBj93XoWxXFykCFW7Ar15CF15Aw4rXrc_yoW5AF1fp3
	y7K3Wjkr4DJrn7Cwn2vw40vFyjy3yxJF98Gr98GryDC390vF1aqr43XF4Y9FyDur1rCry2
	qr4Yqas7ua15ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20x
	vEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU41xRDUUUU

Hi Greg,

On 9/5/25 15:09, Greg KH wrote:
> On Fri, Sep 05, 2025 at 02:49:44PM +0800, Ming Wang wrote:
>> Hi Greg, all,
>>
>> On 2/6/25 18:03, Greg KH wrote:
>>> On Thu, Feb 06, 2025 at 04:37:02PM +0800, WangYuli wrote:
>>>> Hi, Greg,
>>>>
>>>> It's rather unfortunate that currently, almost all Linux distributions
>>>> supporting LoongArch are using LTS kernels version v6.6 or older, such as
>>>> openEuler and deepin. [1][2]
>>>>
>>>> If this bugfix isn't merged into linux-stable, then every single distro
>>>> kernel team will have to waste time fixing the same darn bug over and
>>>> over, even though it's already fixed in later kernels.
>>>>
>>>> This would really make LTS look like it's failing to serve its intended
>>>> purpose. And I'm sure all of us do not want to see something so terrible
>>>> happen.
>>>
>>> LTS is here to ensure that the original release of these branches, keeps
>>> working for that branch.  Adding support for newer toolchains sometimes
>>> happens, but is not a requirement or a normal thing to do as that really
>>> isn't a "regression", right?
>>>
>>> Most of the time, fixing things up for newer compilers is simple.
>>> Sometimes it is not simple.  The "not simple" ones we usually just do
>>> not backport as that causes extra work for everyone over time.
>>>
>>> As for the distros like openEuler, and deepin, they are free to add
>>> these patches there, on top of their other non-LTS patches, right?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> I'm writing to follow up on this important discussion. I have carefully
>> read the entire thread, including your explanation of the LTS philosophy
>> regarding support for new toolchains. I understand and respect the
>> principle that LTS aims to maintain stability for the environment in
>> which it was released, and that adapting to future toolchains is
>> primarily a distributor's responsibility.
>>
>> However, I would like to respectfully ask for a reconsideration by
>> framing this issue from a slightly different perspective, based on the
>> excellent technical analysis provided by Xi Ruoyao and Ard Biesheuvel.
> 
> <snip>
> 
> i'm sorry, but for an email thread that happened 6+ months ago, it's a
> bit hard to try to remember anything involved in it.
> 
> Heck, I can't remember an email thread from last week.
> 
> Remember, some of us get 1000+ emails a day to deal with.
> 
> If you feel a patch set should be applied to a stable tree, and it has
> been rejected in the past, feel free to resubmit it with all of the new
> information about why the previous rejection was wrong and why it really
> should be applied this time.  Otherwise, there's really nothing I could
> possibly do here as the patches are long gone from everyone's review
> queues.
> 
> Also, why aren't you just using 6.12.y now?  :)
> 
> thanks,
> 
> greg k-h

Thank you for the quick reply.You've raised a very fair point about 
moving to a newer kernel. Thanks again for your time and the guidance.

Best Regards,
Robin


