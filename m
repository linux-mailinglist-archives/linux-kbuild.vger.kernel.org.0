Return-Path: <linux-kbuild+bounces-4452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4A9B7D1A
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 15:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26D8D283941
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 14:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9303C1A0BC0;
	Thu, 31 Oct 2024 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZfojVZX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C11442AA5;
	Thu, 31 Oct 2024 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385603; cv=none; b=r6DOgHB7WuSTyooQjlhTch7GTNU340nfvZEyYQOMTDKMjRbjc8OD9oypw/LF979uTQ1tFgBLFxXWR1vejIjA/WGJ92JUrKB/7AZGH+TFyIGnYMK1Qb6dlGJcKGrpx8apgXD5nTskvsypc9DN3kotJ58u6cVqaGd24MpL64cmUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385603; c=relaxed/simple;
	bh=JhopF/i9cpnpqNEITlZhLDwM+uA+vF0rA4LzpkSXVls=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UAusyiWH5eIgXIKb6UTQeFyGD+aGu9MfaNu0fC+8Pbw5TGxQqDohlVQFeCTlSmnmFM72nvK1Eoho7qaY0HxPLQudkVcArDNHx5zxexZd7DWWoOcNlGrl9gHeg56dudHlOqvdphkbJArYZbU1OEF4U4GF52JKfnHe68vfxo7CdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZfojVZX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730385602; x=1761921602;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JhopF/i9cpnpqNEITlZhLDwM+uA+vF0rA4LzpkSXVls=;
  b=bZfojVZXC8Z72SgmMGu/MsDuJ8r8ckLYyezmPINjuMsDpZLsSXJ5N1xr
   cIJmiS0yf6T66miUQlO6I0IIiA6IMmXzkpoaKK0Gwj/FC2pqlWNfUwPdq
   SqXZ7KvZSf1CyJsBIvKcruONXqovQVoOQyLc8FqJbzCFthsMweHhScD++
   v9uoAtij4qnEhlGH9YmCj6K+o5jH+1YqS3ICiNtfaDlkTSocRyccoFFFa
   ORrfDK3at8XBpTUcJREfg224SeS/ECmjCrjBNS173BgywXRXYQy5NLg1D
   eRF1+q7eRRWX8+FE2JXHS6WKco5NEowl1Pq/hU7hcDZpjXFT0xNvZwVAC
   A==;
X-CSE-ConnectionGUID: XG0EtLebQ5isKvUNM5Ixyg==
X-CSE-MsgGUID: FZf/3SPsQDaQNDzejJLAyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47599555"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47599555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:40:00 -0700
X-CSE-ConnectionGUID: eqeK1ZfcRhKKl+MSdWLLDg==
X-CSE-MsgGUID: 6QYH84dITx2w8Gn6sFM76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113492665"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.160])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:39:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 31 Oct 2024 16:39:53 +0200 (EET)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Masahiro Yamada <masahiroy@kernel.org>, 
    Tero Kristo <tero.kristo@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
    David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the
 modules automatically
In-Reply-To: <Zx-MLAyyNWiQg-sq@smile.fi.intel.com>
Message-ID: <77eaee7a-4544-01e1-44b9-9173e670679f@linux.intel.com>
References: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com> <Zx9uSIWOwTgclmBF@smile.fi.intel.com> <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com> <Zx-MLAyyNWiQg-sq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1484629555-1730385593=:939"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1484629555-1730385593=:939
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 28 Oct 2024, Andy Shevchenko wrote:

> On Mon, Oct 28, 2024 at 01:49:52PM +0100, Masahiro Yamada wrote:
> > On Mon, Oct 28, 2024 at 11:58=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Oct 16, 2024 at 01:59:51PM +0300, Andy Shevchenko wrote:
> > > > Rework Makefile to add 'intel' prefix to the modules automatically.
> > > > This removes a lot of boilerplate code in it and also makes robust
> > > > against mistypos in the prefix.
> > >
> > > > ---
> > > >
> > > > v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped R=
FC marker
> > > >
> > > > Note to Kbuild people: TBH I rather want to have something like thi=
s
> > > > to be available on the level of Kbuild for any of the subdirectorie=
s
> > > > in question.
> > >
> > > Anyone, any comments on this?
> > > This already passed a CI tests without failure so far. Perhaps it's g=
ood
> > > to apply to show the demand of such a feature in Kbuild in the future=
?
> > > Because I want to do the same for various */tests/ folders where we h=
ave
> > > tons of test*, *kunit modules effectively duplicating the folder name=
=2E
> >=20
> > I do not like what you are doing here,
>=20
> That's why the question is to Kbuild if it's possible to have this featur=
e
> available treewide for users in a form that you like?
>=20
> > but it is up to you whatever you do in Makefiles you maintain.
>=20
> Thanks! Ilpo, what do you think about applying this in its current form?

I applied this patch now to review-ilpo branch. Hopefully we'll one day=20
have a generic mechanism for this but until then this will have to do.

--=20
 i.

--8323328-1484629555-1730385593=:939--

