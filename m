Return-Path: <linux-kbuild+bounces-5098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DF9EFD72
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 21:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F07528B757
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 20:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A9818FDA9;
	Thu, 12 Dec 2024 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b="bFFJzy3M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46005DDDC
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Dec 2024 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734035358; cv=none; b=Ryy/LfoRKw0LfMPN75uro0cPtD/F2qfQ1cLP6vGZp4tcLv8WsWfhlSKZ3QYKa+3VXrPiHGHZxJM3S/jnPr67Up9MVssRdK4Mo69mUDvkcjvTXhTTmSPo5lyhLDlTQ8dA/7PMk2XbClBm+keUOvrBGLUrJMIx4zIl7reIIgsm2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734035358; c=relaxed/simple;
	bh=UFpPWqv46Rx5cy85zZSkKkAlF0Lt8EuANCPSpDg2O04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMCSu35jckULbNkJd+eILwfZmTYB6jc9iD+a02ZfA3fONU1UmH9CLaM2l7x2g/EWdL55d7+cr1dumFsB5+KRk0yk/E8tpN8QZl+tgR+Q7ncMDXdfpPNb59JyjFh13bGR7zpedZzQ0nrtuPTMyGnUhyjeet5T4+Zqpg5pCm4RADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro; spf=pass smtp.mailfrom=limbasan.ro; dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b=bFFJzy3M; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=limbasan.ro
Message-ID: <bdbd14d9-0291-4b55-9f3c-b333048465d4@limbasan.ro>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=limbasan.ro; s=key1;
	t=1734035352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f16qZ9e/hVbXcfDuCSyoMATNIkqyrfKhHrWg9H/2Nd8=;
	b=bFFJzy3Mm6fZWC6ltkkVFOH3OPu1lps3dnKn3LZRS0diLUeT6y6DMKiuF8WUOY5bWlj9op
	3MhgDvAIKmO6NqFW1WdNgOqYNcOYw7lY02kDooVOCzxU3LYrZ9AjQKHpSzRNPCfgklrOzM
	I3nkQms51iQmd4RKWh8+2wGFxFtSAiwL4hl1BKIyG8ceZHzax5VAakr3I1Km3daCrgHjSn
	FuWtDcEQdYCgcqaMEjTV77sfFid0WLOUfEqIVTasZfGa0ryow2KXOMu3DCSRkap81gyjuG
	xqN8N7dvvxxAugxlulj/hUKt5b664ijrruC2gUOw3kP99W4g7KXmyc2TdBsLtQ==
Date: Thu, 12 Dec 2024 22:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [Bug] 6.12+ DKMS modsign breakage due to missing .config in
 Debian headers package
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
 <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com>
 <9b87eed3-4b6e-4a2a-88c6-db56c043c9fe@limbasan.ro>
 <CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com>
Content-Language: en-US, ro, de-DE
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Mihai_Limb=C4=83=C8=99an?= <mihai@limbasan.ro>
In-Reply-To: <CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi!

Just a quick update for searchability's sake: This issue has been fixed 
in DKMS in 
https://github.com/dell/dkms/pull/468/commits/27b9d1fcc83d62968d75f089666929af2232899a 
with the corresponding discussion in 
https://github.com/dell/dkms/issues/464 .

Thanks for the guidance!
Mihai

On 2024-12-11 05:45, Masahiro Yamada wrote:
> On Tue, Dec 10, 2024 at 8:08 PM Mihai Limbășan <mihai@limbasan.ro> wrote:
>> Hi!
>>
>> On 2024-12-10 12:45, Masahiro Yamada wrote:
>>> On Mon, Dec 9, 2024 at 5:31 PM Mihai Limbășan <mihai@limbasan.ro> wrote:
>>>> Hi!
>>>>
>>>> Would like to report a DKMS build system impacting bug with kernel 6.12+
>>>> introduced in commit aaed5c7739be81ebdd6008aedc8befd98c88e67a . Hope I'm
>>>> addressing this following proper protocol by mailing linux-kbuild, tried
>>>> mailing the maintainer directly on 2024-11-20 but received no feedback;
>>>> my apologies otherwise, it's my first kernel bug report.
>>> Sorry, I missed that.
>>>
>>> Before you, another guy asked me the same question off-list.
>>> Multiple people contacted me off-list for the same question.
>>>
>>> Presumably, asking this in the ML is better because
>>> other people may find the answer and avoid duplicated questions.
>> Oh my, not a problem. Initially approached directly to avoid potentially
>> bugging a lot of unrelated people, but you're absolutely right, easier
>> to find this way. Thank you!
>>
>>>> Specifically, the commit changes scripts/package/install-extmod-build to
>>>> remove the shipped copy of the kernel configuration as .config in the
>>>> generated package. Unfortunately, this breaks DKMS when secure boot is
>>>> being used and any locally compiled the modules need to be signed. DKMS
>>>> needs it to extract various characteristics of the built kernel, among
>>>> which CONFIG_MODULE_SIG_HASH so that it can sign the .ko files it
>>>> creates. It's likely that it also uses various other symbols from the
>>>> kernel config, e.g. clang-related stuff, but I didn't test that.
>>>>
>>>> The removal of the other formerly shipped files doesn't appear to cause
>>>> any problems, at least not in this scenario.
>>> I do not think removal of the .config is a problem because
>>> another copy, include/config/auto.conf exists in the package.
>>>
>>> DKMS can parse "${kernel_source_dir}/include/config/auto.conf
>>> for CONFIG options.
>> True. The problem I see with  with that is that it unexpectedly breaks
>> the current behavior (even though admittedly there never was a formal
>> API contract in place) and requires an update to DKMS across *all*
>> distributions. I'll report a bug to upstream DKMS to this effect, but it
>> might take a long time to fix this, and many distros will likely not
>> backport a future DKMS fix to current or older-but-still-supported
>> versions, whereas re-including .config in the kernel headers package at
>> the cost of a 200-300kb .config copy would not let users of the mainline
>> kernel hanging, *and* would minimize the surprise factor.
> This is a problem only when users replace the distro kernel
> with the upstream one.
> Distributions do not use scripts/package/install-extmod-build.
>
>
>
>
>
>>   From my testing, things seem to work perfectly well when creating a
>> relative symlink from "${kernel_source_dir}/.config" to
>> "include/config/auto.conf" -- maybe this could be a compromise solution?
>> It'd avoid shipping the extra noise from the full .config while at the
>> same time avoid breaking already-shipped DKMS versions.
>>
>> Mind you, it's not like it's a big deal for me personally. It's just
>> that the behavior of the system as a whole with this issue in place is
>> thoroughly unintuitive: DKMS does *not* report an error nor does it fail
>> OOT module build. From an user point of view, what happens are problems
>> on the next system boot (potentially boot failure, depending on what
>> failure to load the OOT modules does), with module load failure messages
>> that initially give no clue as to the root cause. And since the use case
>> for DKMS here is *exactly* a set-and-forget approach to OOT module
>> building, it can take a *while* before people think to check the build
>> logs (if they even keep them) and somehow figure out that "Kernel config
>> ${kernel_config} not found, modules won't be signed" means "upstream
>> changed the kernel headers package semantics".
>>
>> Thanks,
>> Mihai
> The linux-headers package is intended to provide the necessary tools
> for building external modules.
>
> The .config file is not required for building external modules,
> so it was removed.
>
> This is an issue with DKMS.
>
> Furthermore, I do not understand why they decided to allow the process
> to proceed successfully when the file DKMS requires is missing:
>
> https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419b/dkms.in#L1026
>
> They need to fix the issue in DKMS.
>


