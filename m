Return-Path: <linux-kbuild+bounces-6521-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34525A814E4
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 20:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C811BC091D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E121F23E359;
	Tue,  8 Apr 2025 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAiEur8+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373542405EB;
	Tue,  8 Apr 2025 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137772; cv=none; b=UAZNvwAifMGW5MwTfZUz2TwYrcHkvpqdLh6hm1TkNKH+CRiu81t0A1V5QS+t/7HGlILZImp+4K2cWw26Yy9HqiUcwPH8RIPSD+kBzNOTATd24OxGz81LI9RHNgb9Vdv98NH4cubnMHUe9wQrPKm4KUdYeLRjZJnwNG4syTcmj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137772; c=relaxed/simple;
	bh=Gk2fzlQjUCLt/ACS0iGbHiEoJLXRFDn3gd/CajWFMrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ge+irbr/Iu4UPFUpG9659ktjF6KoA7MMV8vL8VEDqvzjyju0Ge/Zu/fw5r7v/kOsqWdHYQEYBOxALjxotzXTKg9UzO8RxuXsRmLVFQ3FNAPTMKZuiiTaoMi2k3CFkecr7/3JqrOouUH0eT7ZinKgBaLCqZrhECUbjZ4wit8BDGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAiEur8+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744137768; x=1775673768;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Gk2fzlQjUCLt/ACS0iGbHiEoJLXRFDn3gd/CajWFMrU=;
  b=XAiEur8+bMJxl0SGqvqVVclJW0icILoQa3T+d5eUD6jK1dV7CHB62jTv
   qbx2LMVTgU8Jyjh8ioEZZ6n5NYq8v3KaeRywZ0byGNEA7Q78SAq+VBNvi
   vxp14MITvrB8AvOj4/JDaP3TG5ajazXkVmCxGrLtNdGuZIVwWfAPVhFbO
   Ur57QCVg5a+US/EFlS0gotoQWsvAqaYBDIiXNib+XvBDvp2YIV2gXWCSq
   E7AKOtGFnnLyeNX9i3vKBzg1V6zeRsMKM8L9a3paVoygFzmmDB9VUUTUT
   JHogCxdCKX0J8ccbgyAxWSNLaFT231ozg629tkWUqjJPx1hT0GOVXwG8k
   A==;
X-CSE-ConnectionGUID: jYnr3wSlSuuX+cJrwHMvnw==
X-CSE-MsgGUID: q9OmKM67Q+GsfSKxdMqi0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49385085"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49385085"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:42:43 -0700
X-CSE-ConnectionGUID: iCCNA21DQBKQORjCd8kn8A==
X-CSE-MsgGUID: bvmlVMOTTxaX/KP11+a2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133219858"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:42:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
In-Reply-To: <20250408160127.GD1778492@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com> <20250408160127.GD1778492@nvidia.com>
Date: Tue, 08 Apr 2025 21:42:36 +0300
Message-ID: <87friixzoj.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 08 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Apr 08, 2025 at 11:27:58AM +0300, Jani Nikula wrote:
>> On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
>> >
>> >> Even with Jason's idea [1], you *still* have to start small and opt-in
>> >> (i.e. the patch series at hand). You can't just start off by testing
>> >> every header in one go, because it's a flag day switch. 
>> >
>> > You'd add something like 'make header_check' that does not run
>> > automatically. Making it run automatically after everything is fixed
>> > to keep it fixed would be the flag day change. It is how we have
>> > managed to introduce other warning levels in the past.
>> 
>> That approach does not help *me* or drm, i915 and xe in the least. They
>> are already fixed, and we want a way to keep them fixed. This is how all
>> of this got started.
>
> I imagine you'd include a way to have the 'make header_check' run on
> some subset of files only, then use that in your CI for the interm.
>
>> Your goal may be to make everything self-contained, but AFAICS there is
>> no agreement on that goal. As long as there's no buy-in to this, it's
>> not possible fix everything, it's an unreachable goal.
>
> I didn't see that. I saw technical problems with the implementation
> that was presented. I'd be shocked if there was broad opposition to
> adding missing includes and forward declaration to most headers. It is
> a pretty basic C thing. :\

Unless I'm mistaken, both Linus and Masahiro have said they disagree
with headers having to be self-contained as a general rule, regardless
of the issues with kconfig and the build artifacts.

We actually had header checks back in 2019 but it was reverted basically
without discussion with commit fcbb8461fd23 ("kbuild: remove header
compile test"). Sure, there were issues, but still removed without an
attempt to address the issues. Since then it's been skunkworks in
i915. There's a reason this has felt like an uphill battle, and why I'm
reluctant to putting effort into much more than small incremental steps
at a time.

> Until someone sends a series trying to add missing includes and
> forward declarations we can't really know..
>
>> Arguably the situation is similar to W=1 builds. We can't run W=1 in our
>> CI, because of failures outside of the drivers we maintain. 
>
> You can run W=1 using a subdirectory build just for your drivers.

I don't think there's a way to build the entire kernel while limiting
W=1 warnings to a subdirectory, is there? Mixing W=1 and regular builds
causes everything to be rebuilt due to dependencies. It's not only for
CI, it's also for developers.

>> Even if I put in the effort to generalize this the way you prefer, I
>> guess a few kernel releases from now, it still would not do what we have
>> already in place in i915 and xe. And, no offense, but I think your
>> proposal is technically vague to start with. I really don't know where
>> the goal posts are.
>
> Well, I spent a little bit and wrote a mock up and did some looking at
> how much work is here. Focusing on allnoconfig as a starting point,
> 293 out of 1858 headers failed to build, and with some fiddling I got
> it down to 150, a couple of hours would get patches made for the vast
> majority of it.
>
> https://github.com/jgunthorpe/linux/commits/hdrcheck/
>
> I don't see the same dire view as you do, it seems reasonable and doable.

Thanks for the proof-of-concept. It's just that I don't see how that
could be bolted to kbuild, with dependency tracking. I don't want to
have to rebuild the world every time something changes.

Say, I'm refactoring stuff, and I want to ensure headers are okay every
step of the way. git rebase -i origin -x 'make header_check'. How do you
only check the headers whose dependencies were changed since the
previous commit? That requires looking at the .cmd again.


BR,
Jani.


-- 
Jani Nikula, Intel

