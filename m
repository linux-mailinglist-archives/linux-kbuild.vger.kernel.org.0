Return-Path: <linux-kbuild+bounces-4797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD179D6039
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 15:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 496F0B245F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 14:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA768614E;
	Fri, 22 Nov 2024 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZpensGR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96E2AEFE;
	Fri, 22 Nov 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732284831; cv=none; b=tcvbnR3rcrhIP1z4uXvyyaWhCfnXMLOFGbZMIHIhtzmZb6WvvEmNN1kgP+qfJzilJ3XduIbsjN8ARRL7FS+8n/J4fQg5VpgGprUgzeBwR+YFVyhdSfYW7YICeMy6L1kixGtLc+tu83FNxO3eq16wK1Xu0XLoySPwoelHTf3WGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732284831; c=relaxed/simple;
	bh=ypl+SVm/vowo72kux/mF1Apop3W03Eh3zLxLFhXiyeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qsyNL/INE/6UdIJ1SY5uDjpN415KglAqLUV+W2lIBwtGP7Btv+M8E8nluF7JA1giS4O2Al0dYSLX2cfMKR26Dh/kCHajfP6BRFzE8eJUc1CYwAqcdq8WDdOk5B5+P9/LpgmnW3FQQPLEyXcBUWOx8id1agLziFy34Fm00kC3ajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZpensGR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732284829; x=1763820829;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ypl+SVm/vowo72kux/mF1Apop3W03Eh3zLxLFhXiyeI=;
  b=UZpensGRV8BAOoEXZPyne2wSRUQ6wGLcBafB/5piEZXrTrJAVx+OZbrX
   xHM9+Ob2IPsu5jxuGWH9c5auJ9+Q4VEvZjRTgB5PUQqBdS9RJ3zswDbKN
   U4DiNHcVjkqnJgxyT36LtzDX50SGrQM43CKrJlLWrtY66B6W+7cTwO5wW
   cMxuzWVosczHGZXo0prXBR9gCsuMZlPGIGKXayCaf2kMaPVn9CKeUjzKK
   TXW7ybD/+SCxM5gJdD0KrMjz9hlqgy/4dIEqgw/wT/nL0kbDW3EWuxm3r
   pB/jHlWM2rjV9IPH+HBa8Fvha2SZcYtObCGG4iqW6aZaV7dSn1mIkZyUZ
   g==;
X-CSE-ConnectionGUID: fI3DR0IaS8WxXQ34XuA9Zg==
X-CSE-MsgGUID: GOmNZpijTCy0nNdbwkrTFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="54945917"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54945917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:13:48 -0800
X-CSE-ConnectionGUID: frUTGn/+QE+IF4pFfk2OIg==
X-CSE-MsgGUID: nopFpGsqQhu9zNHu+omBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121539891"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:13:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Vorel <pvorel@suse.cz>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave Airlie
 <airlied@redhat.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
In-Reply-To: <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
 <87h67zzjdc.fsf@intel.com>
 <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Date: Fri, 22 Nov 2024 16:13:37 +0200
Message-ID: <878qtbz78u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 22 Nov 2024, Rob Clark <robdclark@gmail.com> wrote:
> I may be biased here, but being able to generate code/tables/etc at
> build time is something that python is very useful for, and has been
> used to great effect in mesa.

Agreed. I look at the list of required dependencies, and none of the
alternatives seem more appropriate for the task. Not having to worry
about hostprogs build is a bonus.

BR,
Jani.


-- 
Jani Nikula, Intel

