Return-Path: <linux-kbuild+bounces-4365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F839B314A
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 14:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1CB1C212AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 13:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CCE1DA10B;
	Mon, 28 Oct 2024 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="np3PLJB0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297ED1D5CC5;
	Mon, 28 Oct 2024 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120756; cv=none; b=PWZHkmVuvvMZPBKX1QEqE3a/4R/RSnYQf//aQqtvS/fwFLkms6815B7VV7EwDLSV4rMNV68xtdRDZiVU9ZnYov0QzUFk5ohdoaE+Uvy4tvxZjScC2VDh8zFY+v+oP06nEg79hiU+ElCI1y1smb3FfSCprIZWrwDK7rXdbgpmH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120756; c=relaxed/simple;
	bh=xVkha/3t0CkcBj2lIfJGChfeJqTY6+JJHEsmaAXn9uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N93jZN7IXaqOsA3jItWmPfvt8qL4V92a3hB3uf2ijktW+C73mRHtu0xCVpLmCpjIs8iV8Hne4DtZFiA5BX8uAccpJdEvjjl7w9w414++UnYi/84APq9DtY0/+B0SIg7bRypE6ONEH6hjdz0jd+3Cjnh+xNO/lJXE/+WHqjcC1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=np3PLJB0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730120755; x=1761656755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xVkha/3t0CkcBj2lIfJGChfeJqTY6+JJHEsmaAXn9uI=;
  b=np3PLJB0Q7K0qJWxmC5Q02Dw7sLiyLCUUpnP1hp1JGDrRnZ/lcQ+ABp1
   gdSDhDu5Y+yo6pQFQV8wi/x7kmtklHdDiuJzbGiW74TrPLjQMR9qpp1Oi
   3JFealuZ1ACuYuCwCikEhgNQfr5xJKF1wcaJLie2lQTbCdQgibsZuaiDh
   qdFfxMCfI0J3Q0l4JCkxfSIDo2No1jtsS6YgrCkSOD2SjV5cXBmEzv8mY
   +GZ3xLt2Q791mhkB3cCHX3lhEHjr+/YLFq0gcBlJekZT0ITXikvMH9Dya
   0ASxHjZlWQtS9Sux1wd40NGuJh+gydYiX3eP0kfyVO9s3juCEPyTygdM9
   w==;
X-CSE-ConnectionGUID: VzSNiVy8SqKK24x9AwhTmg==
X-CSE-MsgGUID: 4ljupiUzQaiHo6fJTmYjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29145771"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29145771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:05:53 -0700
X-CSE-ConnectionGUID: E9YSedCRSEa3dYJ9VhBk4A==
X-CSE-MsgGUID: DTV+ALmAShSCLDWBO2c6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81711772"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:05:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5PRM-00000008427-2A8k;
	Mon, 28 Oct 2024 15:05:48 +0200
Date: Mon, 28 Oct 2024 15:05:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the
 modules automatically
Message-ID: <Zx-MLAyyNWiQg-sq@smile.fi.intel.com>
References: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com>
 <Zx9uSIWOwTgclmBF@smile.fi.intel.com>
 <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 28, 2024 at 01:49:52PM +0100, Masahiro Yamada wrote:
> On Mon, Oct 28, 2024 at 11:58 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Oct 16, 2024 at 01:59:51PM +0300, Andy Shevchenko wrote:
> > > Rework Makefile to add 'intel' prefix to the modules automatically.
> > > This removes a lot of boilerplate code in it and also makes robust
> > > against mistypos in the prefix.
> >
> > > ---
> > >
> > > v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped RFC marker
> > >
> > > Note to Kbuild people: TBH I rather want to have something like this
> > > to be available on the level of Kbuild for any of the subdirectories
> > > in question.
> >
> > Anyone, any comments on this?
> > This already passed a CI tests without failure so far. Perhaps it's good
> > to apply to show the demand of such a feature in Kbuild in the future?
> > Because I want to do the same for various */tests/ folders where we have
> > tons of test*, *kunit modules effectively duplicating the folder name.
> 
> I do not like what you are doing here,

That's why the question is to Kbuild if it's possible to have this feature
available treewide for users in a form that you like?

> but it is up to you whatever you do in Makefiles you maintain.

Thanks! Ilpo, what do you think about applying this in its current form?

-- 
With Best Regards,
Andy Shevchenko



