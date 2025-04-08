Return-Path: <linux-kbuild+bounces-6511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8777A7F7CE
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BE01896B34
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CF4263C66;
	Tue,  8 Apr 2025 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyJ708qr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE4263C77;
	Tue,  8 Apr 2025 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100889; cv=none; b=NZfQvz/TIhEK2oZUyKdAWZYBZSrkpbPd84Z5ZkDh9rFgd8u0AE4P5dBsE/qj2Gfh79LChUdrn8TztgDkHYeRp/zbw5FSwaCvyYUE988m4wgi2f3ByUMu9xHRuzzGWni/YybkekqqN5BzGO+JKbSVyMGLgEKZh/ZwArO9o+K2kGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100889; c=relaxed/simple;
	bh=5nkU3pywDyYpm6B8QE8CDHNm5Jg/YRm60RtxsBZZNSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pBvET3PBzItBuPshCwkAoOCG0ubOYAJ0Gqcd76vYBY+7qRcRsVxAABPws5VtuCpPmM5U5rfvFe2F7iJ1O0fxAutM0guZv4v41SaRtSwCB2zRIuA2kaG65JcAUFj57d6s9U6uOLPV9jfs3B0AX1990MSasekbpC2akvv+p0zI+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyJ708qr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744100888; x=1775636888;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=5nkU3pywDyYpm6B8QE8CDHNm5Jg/YRm60RtxsBZZNSY=;
  b=gyJ708qryX2laqZR27idVA7sOgcFZs4Zh51s/WkGCT4Z1jFdOoqGKhKw
   3oCPLT1ASnr7A3j78avpFnX/m1ZmW/PT4bhwjy/1pxdA9QhjVCp2pASDj
   iQUVqZKxBzFvAMjVOUxStxvyVtggw7ZC99vtk9fCODO1xTl1hb4wrZgHQ
   n4b8yp2VvV9ulqruGT57HQ/WDmcQvYLXRcJeiMTwiH95XirtPCCd48kqg
   4A7j28I2xslVEo+Kg8+FKl0tNDJtyinRhblBF8+RljVvHalGLQaDn84qd
   2bSQzbzNKTmZmePFuBADih6LgRjDquXBvM0Av79XR4ZbxmNvUw6HPIuce
   w==;
X-CSE-ConnectionGUID: 8F9oUmMkRDOIFkWRViT/NQ==
X-CSE-MsgGUID: RRySFiKkSfa8LwXLFOcdoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56886007"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="56886007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:28:05 -0700
X-CSE-ConnectionGUID: x4G6H6sxTuWnpeVE/j3SIA==
X-CSE-MsgGUID: NQh7EQA9Q5aZcEeLBdZO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="133066492"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:28:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
In-Reply-To: <20250407171209.GJ1557073@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
Date: Tue, 08 Apr 2025 11:27:58 +0300
Message-ID: <871pu3ys4x.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
>
>> Even with Jason's idea [1], you *still* have to start small and opt-in
>> (i.e. the patch series at hand). You can't just start off by testing
>> every header in one go, because it's a flag day switch. 
>
> You'd add something like 'make header_check' that does not run
> automatically. Making it run automatically after everything is fixed
> to keep it fixed would be the flag day change. It is how we have
> managed to introduce other warning levels in the past.

That approach does not help *me* or drm, i915 and xe in the least. They
are already fixed, and we want a way to keep them fixed. This is how all
of this got started.

Your goal may be to make everything self-contained, but AFAICS there is
no agreement on that goal. As long as there's no buy-in to this, it's
not possible fix everything, it's an unreachable goal.

Arguably the situation is similar to W=1 builds. We can't run W=1 in our
CI, because of failures outside of the drivers we maintain. Thus we add
most W=1 checks manually in our Makefiles, and keep our drivers warning
free. This is what we want for headers too. But the key difference is
that there *is* general consensus that W=1 fixes should be merged.

Perhaps inadvertently, you're making it harder for the people who are on
board with your goal to do their part of the job in their corner of the
kernel.

> If you added the infrastructure there is a whole list of people on
> kernel-janitors that would probably help with the trivial cleanups to
> make it run clean.
>
>> With this type of antagonistic rather than encouraging attitude towards
>> contributions, there's just no way I can justify to myself (or my
>> employer) spending more time on what looks like a wild goose chase. I
>> have zero confidence that no matter what I do I'd get approval from you.
>
> I think you've been given a clear direction on what would be accepted
> and have the option to persue it. Claiming that is "antagonistic"
> seems unnecessary.

I have to disagree on both of those points.

>> And this is the primary reason subsystems and drivers hack up stuff in
>> their little corners of the kernel instead of sticking their necks out
>> and trying to generalize anything.
>
> Seems to me like this is the usual case of generalizing being actually
> hard, you almost always have to actually do more work to succeed.

I think you and me both share the idea that most headers should be
self-contained. Neither Linus nor Masahiro seem to think that is
generally true. I've provided a way to opt-in for the checks. Linus
seems to find the approach acceptable. You and Masahiro don't.

I think I'm at an impasse.

Even if I put in the effort to generalize this the way you prefer, I
guess a few kernel releases from now, it still would not do what we have
already in place in i915 and xe. And, no offense, but I think your
proposal is technically vague to start with. I really don't know where
the goal posts are.


BR,
Jani.


-- 
Jani Nikula, Intel

