Return-Path: <linux-kbuild+bounces-10594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 126DFD232E6
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 09:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE3783059809
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jan 2026 08:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C649D3375C3;
	Thu, 15 Jan 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/Uu3v3i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3A5336EE5;
	Thu, 15 Jan 2026 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465851; cv=none; b=tbASEgJiYb2N1+tuo4IVrnugMeg9aZkwB0ul5F/nT4yVvPhLKgKoGTLY+7WxIS1IUQS9eBUXUxLeyWd+jQg7uOd2iYhxM/87jgZaZLTjaOxx4U2EIA7nRzY5RREB/HjKP52meuzaFseU3Y+cLwSK4YHGQqQ6jaVXSYTDYTGk+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465851; c=relaxed/simple;
	bh=na6jp5maJy+pL2W5Ail0ZfkyWvLXsv7dxD9elrwAlpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJiv0KQUuO4e0maFQyBkV1FCm+zs02SveVuuFE8LhQK82dzNv/FsM/ZXRO82VGaKIKRZxi0aQ40rqGw2z5w9NBVc73QAmrqgtqo94AvYjniTgAfP1HEzg98KwjBq82mWT0GWiIWKF/wOnfIzxyKzZ07t1WYD+ZK6gy47xDnMB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/Uu3v3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C76C116D0;
	Thu, 15 Jan 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768465850;
	bh=na6jp5maJy+pL2W5Ail0ZfkyWvLXsv7dxD9elrwAlpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/Uu3v3iRnjdg7Yy+6F2luQssQegnifgdbGwkIDIDH+Sd3aXBF1TXs27DugHbqIPK
	 gb971WyGpYdbbh85GBj0ae6VRPeuJ4y38hI6ZqTWmrtuKB87oyRyPcwnBI1bHOYwso
	 sOPF4xVxS5frHmOyStVSmHp2xBFrZYNtMcd31/l2cOUDjKHU/7FUi5iPRKIG0bmaex
	 ZJ5dVKuPSyqlhpRCFmyWbVniwM8T8IjKPQoa7NLxw+/4Qs7qZl5snaon/08TucoI4F
	 ry5PxrGxpcJhMFy3SgtMqC+00zRrEIdi+dqG3azWjZ6ipa2/h8z8rmO11OaTGHUadJ
	 tFoQu8g66rUPA==
Date: Thu, 15 Jan 2026 09:30:32 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
Message-ID: <aWilqPP-udHWtiu1@derry.ads.avm.de>
Mail-Followup-To: Holger Kiehl <Holger.Kiehl@dwd.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>
 <aWFt34dkIvlu1EYI@derry.ads.avm.de>
 <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de>
 <aWLF4BwQemwIZMMp@levanger>
 <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>

On Sun, Jan 11, 2026 at 06:41:39PM +0100, Holger Kiehl wrote:
> On Sat, 10 Jan 2026, Nicolas Schier wrote:
> 
> > A simple solution might be to call modules_sign target after the
> > find-debuginfo.sh run; but commit 16c36f8864e3 spunds to me as if we
> > should rather do something similiar as for the Debian packages:
> > modules_install with INSTALL_MOD_STRIP=1 and then install only the debug
> > infos manually.
> > 
> > Does that make sense?
> > 
> I am not a kernel developer and my knowledge in this area is very
> limited. Did try your suggestion to call modules_install with
> INSTALL_MOD_STRIP=1, but still the signature was removed in the
> RPM. Removing the 'chmod u+x', so find-debuginfo.sh does not strip
> them, did not help either. But, most properly, I am still missing
> something.

I am going to have a closer look at that, but that will take time.

A possible work-around might be to enable CONFIG_MODULE_COMPRESS and
CONFIG_MODULE_COMPRESS_ALL, which prevents find-debuginfo.sh from
stripping (but you won't get debug modules, too).

Kind regards,
Nicolas

