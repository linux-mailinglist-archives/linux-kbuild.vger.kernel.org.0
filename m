Return-Path: <linux-kbuild+bounces-6701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD2A94076
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Apr 2025 01:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33A08E2BB3
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 23:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046ED248193;
	Fri, 18 Apr 2025 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8D7Ijsy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6141FF1C9;
	Fri, 18 Apr 2025 23:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020318; cv=none; b=c1pGkyiE0XXSrlq133pA6pVbCCsQbz9BLdWb/AhYxiFcVkNmuA7BylGnJ+v5sz/Ox7RUM/FOhnCOoOcpKGCAOv/W416jb92y6aS0Db8k353Zq/iKF0jyrpKv2CuG83Z2hy1mzIwmEBPl9pwFqNJ+Lep5TAaqAKtp0vjfwXOds2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020318; c=relaxed/simple;
	bh=wLPohTXGJoWF6jYaqWx8ve/2ZkRtBlSg3hR6/76xmgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRuCaZ7BCVIJup29bLJk5OHG6530eU3HRRQro3S48VIZc9V+woD6sygwywR+L0j5pT1EpieWgJoxtj6uThknv2wgXLHzbB67y24suBftsML9awtrJ9TM+7fZqaFVK2goahYwVWLoBVEXJB9EQs1XhOMSGhBwZLy/LZZCFmIBJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8D7Ijsy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77690C4CEE2;
	Fri, 18 Apr 2025 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745020318;
	bh=wLPohTXGJoWF6jYaqWx8ve/2ZkRtBlSg3hR6/76xmgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J8D7Ijsy0qGDz3jclp8CIAWOAySfgRsIfiJV8hl6byKyn8/wmiDBAUt56cga94/KY
	 bVC6ZLpkjUyF7VVbwVaMxUvVuw5oNJpxM60tAWGd8j7mbDM3To16egN2ZvBE5J3Sxj
	 u2nJe1b/Ig1SFrBzkfXIX8B0L6cXJBXDoRRbi30AO8FG6Tsjs2061GjMpjJyvgNc+R
	 pgGOnkAtychBl+BNoda9QGbmO+xOsB0R2OEY+CmSTrafq9aXaUlnavl4NH56S4Vzmv
	 eAfg9P/IKwQiEASwUshViSDppakdmJzlYaPUXaIUOm8QLmQm3HMjh2KUSkFQPfsbB9
	 9H9zgZAQl+79A==
Date: Sat, 19 Apr 2025 07:51:41 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250419075141.720970a8@sal.lan>
In-Reply-To: <Z_97SbBwVp29MNzL@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
	<4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
	<87tt6opks7.fsf@intel.com>
	<20250416171917.0985c0eb@sal.lan>
	<20250416172901.60104103@sal.lan>
	<20250416173811.71c3c345@sal.lan>
	<Z_97SbBwVp29MNzL@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Andy,

Em Wed, 16 Apr 2025 12:41:29 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 05:38:11PM +0800, Mauro Carvalho Chehab wrote:
> > Em Wed, 16 Apr 2025 17:29:01 +0800
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:  
> 
> ...
> 
> > Heh, trying to quickly write a patch before calling it a day is
> > usually not a good idea ;-)
> > 
> > I'll send a fix tomorrow.  
> 
> Take your time, we still have a couple or so weeks to address this.

Sent a v3. Please check.

Regards,
Mauro

