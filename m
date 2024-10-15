Return-Path: <linux-kbuild+bounces-4122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EEE99E4ED
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 13:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D321F22D34
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 11:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901791E6DDE;
	Tue, 15 Oct 2024 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTHBSWL5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F61D2F40;
	Tue, 15 Oct 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990083; cv=none; b=cIJtNdU7Y4usL4k391pelFnTPOHbiFhl+zUmjFnqxemHH8S5brYDOGkPM43odEKNlN7JmWndKrFeSGxs15Wxd/HO/Ali5I9pJ3TS6E/9nq/gpknt+oRVDBJy5IN7qax7rkSADlhXigFsshCcKWu3KWfNDgi7xjPmaHJzpigw1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990083; c=relaxed/simple;
	bh=DYd9vUKA1wQY9vnoWI4P3OQ63f0YACwFIpAFjmFJS7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3y6rWEAuO/xKdzOexvPaHIYDeV1R033sHHw3HvEFGBbGjt3pYryPFGE7uWbQgDefOghMVoQ7kVwB29yitS8NI9zbTq4DVz8D+JzrzouVroWCV9KuX9Kaa2Bj0vH3fsKcIbMaG1lLUr00ArzgYOeb561ow3Op5EAeoHw+N6uKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTHBSWL5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728990082; x=1760526082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DYd9vUKA1wQY9vnoWI4P3OQ63f0YACwFIpAFjmFJS7Q=;
  b=dTHBSWL5Adyk+TJUj9ZHMqHvzMd/JIvzZsU6ARI40SWWMoAVxNoWNot9
   8FSvZg+pwlFIM8/XIv1G803IZJ0ZP1Ji1n1YhF2uSsxYQPxS+MU9GAWlq
   SqzhQmbZZ2psvNIYjaR0LkYL4Eb2b7ajFvtBRQ5fkfuH3upHpbB/U8ei3
   ueiCFniY9AZeQljkpKpfU8Vgy+/uYW26fvnzlqrC+vwGd+Pk4gqL90Uc3
   u1/M8tGDuWVbqXg7iKxNXbQ+2jGy8BnZ/axbdqZ9V5gR42MShlo4Q3LeV
   fbztFH+/V3v0G/hXvMPTCJ63XWSNtQhQ3uCtf7ryHorbOsT4uoiqWdjRB
   Q==;
X-CSE-ConnectionGUID: pozsDYioRKuNkNqsnztJyQ==
X-CSE-MsgGUID: b0acP6xdS2mag7G+7US6iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28565805"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="28565805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:01:21 -0700
X-CSE-ConnectionGUID: 1AS3lee5Q7ecYfAEaBgB5w==
X-CSE-MsgGUID: h/6xB29hTxC3gGiVxrYnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77941029"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:01:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0fIh-00000003F5i-3U65;
	Tue, 15 Oct 2024 14:01:15 +0300
Date: Tue, 15 Oct 2024 14:01:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org, Tero Kristo <tero.kristo@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [rfc, PATCH v1 1/1] platform/x86: intel: Add 'intel' prefix to
 the modules automatically
Message-ID: <Zw5Lew9I3YG_apPx@smile.fi.intel.com>
References: <20241011172531.3407093-1-andriy.shevchenko@linux.intel.com>
 <caa4b5e0-742b-a4f4-d4c8-8e14cc99eefc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caa4b5e0-742b-a4f4-d4c8-8e14cc99eefc@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 12:05:45PM +0300, Ilpo Järvinen wrote:
> On Fri, 11 Oct 2024, Andy Shevchenko wrote:
> 
> > Rework Makefile to add 'intel' prefix to the modules automatically.
> > This removes a lot of boilerplate code in it and also makes robust
> > against mistypos in the prefix.

...

> > Send as RFC because TBH I rather want to have something like this to be
> > available on the level of Kbuild for any of the subdirectories in
> > question. Also I haven't done any comprehensive build tests on this,
> > let's see what CIs think about this...
> 
> It feels useful to have this automatically available for the folder one 
> level towards root... (perhaps two levels).

Yeah, ideally for a few levels of folders, but at least one would be useful
to start with.

> But you didn't include kbuild ML (now added).

I'll do it in v2.

...

> Why call these intel-target-*, wouldn't intel-obj-* be more consistent?

The (potential) problem with obj as it may collide with the standard way of
collecting objects under meta one (which will become a real module). I haven't
tested that but I believe that putting anything to FOO-obj-y/m is a carefully
placed minefield, if not now, then later. That said, I would avoid using obj
there.

-- 
With Best Regards,
Andy Shevchenko



