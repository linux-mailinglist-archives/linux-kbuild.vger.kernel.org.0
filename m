Return-Path: <linux-kbuild+bounces-6961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42984AABBBB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 09:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BCF93BC461
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693004B1E4F;
	Tue,  6 May 2025 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hheskveb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB954B1E53;
	Tue,  6 May 2025 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512357; cv=none; b=hbMOuNb1me2sXmGpLgF3vIRjZpIE0qROMUvPsDU52xysxNhvC+7IlnNR2+hVW1DKRcktvNtP44cugeKPebl1LpUhSAFS/C4DtBdYneOrGdG8kQy2FvhpdQjOlhKHZWn5tUVKVo7KXy55N+CBtCqesSjJzy82485p2+rNpmXZccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512357; c=relaxed/simple;
	bh=B1qIbjusEpRgfMu6NIodjGnKKAy8agpjaCYD2EZKsHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZi3aIPscPgCk0F5PTQZCKVYmuhDreJ3fXtSkOjtQFvG5VqXVEupgkWIUKWbhnc2IaWsSIJhCXh5TwcrVUauiAxbYYr5neTlliy+iNeD1cqjEh9uBx86kg5yASyUxcj0iEf9GsGgcaXFyGUwpwiYUjIWn2TtLNC90oKwZtJFOmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hheskveb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X66a8aqy8Sc5yz+OH/4AGeulzZmlh6bJeyjMmrE79y0=; b=Hheskveb8jjlHczV1SRIeFQ0EY
	TgNpbvPnQBa2HpnAuRyzX0m2pakOKSrUbJ97PzmuyOFdX0Jz8DHM8YlXqlqaGHy5sZ2HmsMwgs03k
	0Xdp8xiUhoaGBnZo9XQVrdFzjK0qEbzxx4Qff8UzgckQoyTMdfncvQvS6OhVrU7Bxyu0I1ksHfCh3
	tE9kkNsVuEvKJdiKG+Kd7OFuwNSXMqmgg3wn/CfSIDVDn2F4+U0BhvhCY+Hpa+OzKs54xxj1N058c
	LHQ5Xs/GGpSMKAL6CRShE9Gbk4qX/5pa1J0IS0bTnq2EzT0iwPWM1hmh9M+4Bifxyy0RA479yKQ1K
	o8okECvw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCBdx-0000000Fbfs-3Azm;
	Tue, 06 May 2025 06:19:09 +0000
Message-ID: <4981523b-b4bf-42ce-9128-2daf7a4d2834@infradead.org>
Date: Mon, 5 May 2025 23:19:01 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FAILED: patch "[PATCH] drm: Select DRM_KMS_HELPER from" failed to
 apply to 6.6-stable tree
To: Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <2025050504-placate-iodize-9693@gregkh>
 <7cb8c3e1-52c3-498f-92af-b8b61a2ce8e8@app.fastmail.com>
 <2025050530-monotype-eligibly-e5b1@gregkh>
 <2f79e1ab-5a22-4617-8bec-d2122194964f@app.fastmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2f79e1ab-5a22-4617-8bec-d2122194964f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/5/25 3:51 AM, Janne Grunau wrote:
> Hej,
> 
> On Mon, May 5, 2025, at 10:49, Greg Kroah-Hartman wrote:
>> On Mon, May 05, 2025 at 10:33:49AM +0200, Janne Grunau wrote:
>>> Hej,
>>>
>>> On Mon, May 5, 2025, at 09:53, gregkh@linuxfoundation.org wrote:
>>>> The patch below does not apply to the 6.6-stable tree. If someone
>>>> wants it applied there, or to any other stable or longterm tree, then
>>>> please email the backport, including the original git commit id to
>>>> <stable@vger.kernel.org>.
>>>>
>>>> To reproduce the conflict and resubmit, you may use the following
>>>> commands:
>>>>
>>>> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/ linux-6.6.y
>>>> git checkout FETCH_HEAD
>>>> git cherry-pick -x 32dce6b1949a696dc7abddc04de8cbe35c260217
>>>
>>> This works for me without conflicts. Are there git configs which might
>>> influence this? The only noticeable thing is that the position of the
>>> DRM_DEBUG_DP_MST_TOPOLOGY_REFS entry shifted 82 lines down. I looked
>>> at the history of drivers/gpu/drm/Kconfig and the config
>>> DRM_DEBUG_DP_MST_TOPOLOGY_REFS block hasn't changed since v5.10. So I
>>> would expect the cherry-pick to work.
>>
>> It applies cleanly, but breaks the build badly.  Try it and see :)
> 
> Indeed. The issue is caused by turning CONFIG_DRM_KMS_HELPER from 'm'
> to 'y' while leaving CONFIG_DRM as 'm'. This is clearly broken and not intended.
> It's exactly what Documentation/kbuild/kconfig-language.rst warns about. OTOH
> it also warns about using both 'depends on' and 'select' on the same symbol
> which blows up here.
> I don't see which change between in v6.6..v6.12 for scripts/kconfig could have
> changed this.
> 
> Using "select DRM_KMS_HELPER if DRM" fixes the linux-6.6.y build. I only
> discovered this as possible solution from the commit message of commit
> 77a92660d8fe ("kconfig: remove wrong expr_trans_bool()").
> 
> CC-ing kconfig maintainer for clarification if "select DRM_KMS_HELPER if
> DRM" is a valid solution for this issue. Commit causing issue replicated below
> for context.

I would just add one more line to the Kconfig:

 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
+       depends on DRM
        depends on STACKTRACE_SUPPORT
         select STACKDEPOT
-        depends on DRM_KMS_HELPER
+        select DRM_KMS_HELPER
         depends on DEBUG_KERNEL
         depends on EXPERT
         help

No problems with that in my testing.

-- 
~Randy


