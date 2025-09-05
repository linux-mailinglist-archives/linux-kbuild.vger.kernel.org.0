Return-Path: <linux-kbuild+bounces-8734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EFB44E39
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 08:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B8D3A759B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 06:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0732BF3CF;
	Fri,  5 Sep 2025 06:50:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962C023B605;
	Fri,  5 Sep 2025 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055003; cv=none; b=h4BJKXYY32DWGOSiNTYwzBgyejfnZle24//40ANNe85HYn7n0ysLxO69Uxy29eqK2PTOc5y2wCXNmiGU/2aeusxd/k8ry2LYlpW3Mf+QjT2+YrivQVk/dLIMuqt7xPRJXhh0IKx6LZnP332lyQm2XJ7rdSwrKvxlRCEImX2b5Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055003; c=relaxed/simple;
	bh=V1cbCu4EQV8urxLhTiYKFn+wwpdWhCVDC8bBsrk+pLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBeIDLNi6cz5haBd0Klu2kbqFfLdxs6b2KZaopfA4RG4xG/wmcKgglArGhtLLXPtGumujQHfG+jrO5xQ6o/vAb6fgOfMHL12pk0ug0n7bUvYDN+FycMZEp5YL2D97MKg1Jdz4fpYSxwzREsUN/pS5Pl7/YmDERos+ZLFXYj0sXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [124.127.223.97])
	by gateway (Coremail) with SMTP id _____8Bxnr8UiLpoUfYGAA--.13742S3;
	Fri, 05 Sep 2025 14:49:56 +0800 (CST)
Received: from [127.0.0.1] (unknown [124.127.223.97])
	by front1 (Coremail) with SMTP id qMiowJBxD8IIiLpouZ9_AA--.40671S2;
	Fri, 05 Sep 2025 14:49:47 +0800 (CST)
Message-ID: <17f2c722-a32b-482b-9363-6a415443fb40@loongson.cn>
Date: Fri, 5 Sep 2025 14:49:44 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
To: Greg KH <gregkh@linuxfoundation.org>, WangYuli <wangyuli@uniontech.com>
Cc: ardb@kernel.org, chenhuacai@kernel.org, chenhuacai@loongson.cn,
 kernel@xen0n.name, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 nicolas@fjasle.eu, sashal@kernel.org, stable@vger.kernel.org
References: <2024120635-wham-campsite-b62b@gregkh>
 <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
 <2025020611-olive-gluten-fa45@gregkh>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <2025020611-olive-gluten-fa45@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxD8IIiLpouZ9_AA--.40671S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAgEQEmi6e4sAywAAso
X-Coremail-Antispam: 1Uk129KBj93XoWxAw4rtF47Xr18uryUAFW7ZFc_yoWrJw43pa
	ySga4ktr4DJF1Ivwn2vws2va40v3yfJFy5Gr95K34DZrs8WF9FqrWSqa1Yqa4Duw4fWa1q
	qr4aq34kCa4UZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20x
	vEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2PEfUUUUU

Hi Greg, all,

On 2/6/25 18:03, Greg KH wrote:
> On Thu, Feb 06, 2025 at 04:37:02PM +0800, WangYuli wrote:
>> Hi, Greg,
>>
>> It's rather unfortunate that currently, almost all Linux distributions
>> supporting LoongArch are using LTS kernels version v6.6 or older, such as
>> openEuler and deepin. [1][2]
>>
>> If this bugfix isn't merged into linux-stable, then every single distro
>> kernel team will have to waste time fixing the same darn bug over and
>> over, even though it's already fixed in later kernels.
>>
>> This would really make LTS look like it's failing to serve its intended
>> purpose. And I'm sure all of us do not want to see something so terrible
>> happen.
> 
> LTS is here to ensure that the original release of these branches, keeps
> working for that branch.  Adding support for newer toolchains sometimes
> happens, but is not a requirement or a normal thing to do as that really
> isn't a "regression", right?
> 
> Most of the time, fixing things up for newer compilers is simple.
> Sometimes it is not simple.  The "not simple" ones we usually just do
> not backport as that causes extra work for everyone over time.
> 
> As for the distros like openEuler, and deepin, they are free to add
> these patches there, on top of their other non-LTS patches, right?
> 
> thanks,
> 
> greg k-h

I'm writing to follow up on this important discussion. I have carefully
read the entire thread, including your explanation of the LTS philosophy
regarding support for new toolchains. I understand and respect the
principle that LTS aims to maintain stability for the environment in
which it was released, and that adapting to future toolchains is
primarily a distributor's responsibility.

However, I would like to respectfully ask for a reconsideration by
framing this issue from a slightly different perspective, based on the
excellent technical analysis provided by Xi Ruoyao and Ard Biesheuvel.

This situation appears to be more than just an incompatibility with a
"newer" toolchain. As Xi Ruoyao detailed, the older toolchains did not
"work correctly" but instead had a silent bug that produced incorrect
code for undefined weak symbols on LoongArch. The new binutils version
did not introduce a regression, but rather, it correctly started
erroring out on this problematic code pattern, thus exposing a
pre-existing, latent issue.

 From this viewpoint, this patch series is less about "adding support for
a new toolchain" and more about "fixing a latent bug that was previously
hidden by silent toolchain defects."

Furthermore, the patches themselves, originally authored by Ard, 
represent a clean, correct, and low-risk improvement. They were accepted 
into the mainline not just as a workaround, but as a superior way to 
handle these symbols, improving codegen for all architectures. 
Backporting this series would therefore be applying a high-quality, 
vetted bug fix that also has the fortunate side effect of resolving this 
build failure.

While the build failure currently only manifests on LoongArch, the
underlying code improvement is generic. For a relatively new 
architecture like LoongArch, ensuring that the primary LTS kernels are 
usable with modern, widely-adopted toolchains is crucial for the health 
and growth of its ecosystem within the broader Linux community. As 
WangYuli pointed out, this would prevent fragmented efforts across 
multiple distributions.

In summary, we believe this case is exceptional because the patch fixes
a latent issue exposed by a toolchain correction and represents a clean,
mainline-accepted improvement. We would be very grateful if you could
take another look at this series from this perspective.

Thank you for your time.

Best Regards,
Robin


