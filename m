Return-Path: <linux-kbuild+bounces-88-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC027F1DC7
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 21:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968C02811F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 20:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E173715A;
	Mon, 20 Nov 2023 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrJ6G2ZA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA003BE;
	Mon, 20 Nov 2023 12:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700510936; x=1732046936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rU+hV0Dwyl2lU7FcgPXL3hIp8mCrdq1swhV5294kYhg=;
  b=QrJ6G2ZACJSP7sKnNNRSg3ER0HU62s5+cGBpH1qgEZz73UUQ4diORoVd
   wGeuv/UG9ZZAq0IxcQLvXaPbYTcUFdxYN8bAYm9z4w+MbK85WIY7JTpLz
   BEETmXRmDuJkx4UTlTKAaTLNwIYT+FHfBuzoUVzJ6qFGswRk7f3GrkTKC
   5MPMxhU7HCTm3bQ79hToRup6NGLJodtq7jaodVPxt4ZLtt19ddsxp9F3S
   jbkrlXra01QdVLuOKI5vv++mXhlV/dnf/RZKrroZYO3eMa43NVJ4Ymh7+
   75ll0BiB3FNRxZCrhuqujUll3f3wtDRApDLsPswTIz7DHLuThGUhnZf48
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10367114"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="10367114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 12:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="14270125"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 12:08:55 -0800
Date: Mon, 20 Nov 2023 12:08:50 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Add inline-account tool
Message-ID: <ZVu8u+oofXO8iwyf@tassilo>
References: <20231115004932.650702-1-ak@linux.intel.com>
 <CAK7LNASS1YWdqW5TUXQ0iC3vgoDbUf-M-cRX0BvrkOV8HPyjxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASS1YWdqW5TUXQ0iC3vgoDbUf-M-cRX0BvrkOV8HPyjxg@mail.gmail.com>

> 
> > +    sym_sizes = [syms[x + 1] - syms[x] for x, _ in enumerate(syms[:-1])]
> > +    sym_total = sum(sym_sizes)
> 
> 
> This is equivalent to
> 
>       sym_total = syms[-1] - syms[0]
> 
> isn't it?

No it's not when there are gaps in the symbols, which always happens in
the kernel.  The previous version used the range but that led to inbalances.

> def get_ranges(syms, threads):
> 
>     ranges = []
>     prev = syms[0]
>     i = 1
> 
>     while threads > 0:
> 
>         boundary = prev + 1 + (syms[-1] - prev - 1) // threads
> 
>         while syms[i] < boundary:
>             i += 1


Note the boundary is not the address, but the sum of symbol sizes


-Andi

