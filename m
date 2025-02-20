Return-Path: <linux-kbuild+bounces-5841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE6A3DFAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76CB3A48B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 16:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C631FF7A5;
	Thu, 20 Feb 2025 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="jDqO7kjd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B08A1FECD8;
	Thu, 20 Feb 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067207; cv=none; b=iBTEM1WyXgCqOhhzNA8a6N4oaoIm0mTFA6KhsU9zD6GBZ8Bj5g10GlJUa4b9CBJ2T/jaufFkNRx4ip2bOFjRThLby4u0QLvRgMospPo1EesWdzOyElx2xn8ZoePPrvxZYXVeNaSEoDXyYDPWsKDP4BbyPVSQg4RHSs2Yb605Foc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067207; c=relaxed/simple;
	bh=GLKbcC3ae72AZ7nESSdOgYNj0ol85ebzOyHSvnHXZHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEc2+TRzMYpF78smf6cFIBNIjoQoX3soWeoGEQmIDWZKub+YenUDW2Ff4HYrXgOJiN6RDmSD/DlxNiaulu5YKGTciMIzF7Ipet3zvsgQVADuhi/bYkfFn2ytO8XsArVFAQEHb+TcEi83+vzg7oPdpVkn+olvVIPQI1dxtzytYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=jDqO7kjd; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1740066880; bh=GLKbcC3ae72AZ7nESSdOgYNj0ol85ebzOyHSvnHXZHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDqO7kjdUAwCYHOwrzNre8nXySaFwgR1XN+9uhYa9JKm3YsUFS/JC/diif4Pz+3fG
	 5LvX8tp5JyQTQJFsGBz1+OOjNdc4JT0x8zlLQreb0QulHhPi4XHTxGVACn+kZ7ihrq
	 7IvFPUSL589un9VtwLsqfAd5w7PdGEOGPmmTHU8o=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67b75040-038b-7f0000032729-7f0000019174-1
	for <multiple-recipients>; Thu, 20 Feb 2025 16:54:40 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 20 Feb 2025 16:54:40 +0100 (CET)
Received: from l-nschier-nb (unknown [IPv6:2001:9e8:9e4:1f01:9fb7:d3c6:7f35:9b14])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 4DD318083B;
	Thu, 20 Feb 2025 16:54:40 +0100 (CET)
Date: Thu, 20 Feb 2025 16:54:39 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
 <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
X-purgate-ID: 149429::1740066880-5220FE17-CD29D720/0/0
X-purgate-type: clean
X-purgate-size: 2696
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Thu, Feb 20, 2025 at 08:03:32AM -0700, Jeffrey Hugo wrote:
> On 2/20/2025 3:03 AM, Nicolas Schier wrote:
> > On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
> > > On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
> > > > Exclude directories and files unnecessary for building external modules:
> > > > 
> > > >    - include/config/  (except include/config/auto.conf)
> > > >    - scripts/atomic/
> > > >    - scripts/dtc/
> > > >    - scripts/kconfig/
> > > >    - scripts/mod/mk_elfconfig
> > > >    - scripts/package/
> > > >    - scripts/unifdef
> > > >    - .config
> > > 
> > > Please revert this (the removal of .config).
> > > 
> > > I got some strange reports that our external module install broke, and
> > > traced it to this change.  Our external module references the .config
> > > because we have different logic for the build depending on if other, related
> > > modules are present or not.
> > > 
> > > Also, it looks like this broke DKMS for some configurations, which not only
> > > impacts DKMS itself [1] but also downstream projects [2].
> > > 
> > > While DKMS may be updated going forward to avoid this issue, there are
> > > plenty of affected version out in the wild.
> > > 
> > > Also, I haven't surveyed every distro, but it looks like Ubuntu still
> > > packages the .config with their headers in their upcoming "Plucky" release
> > > based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
> > > needed/useful.
> > > 
> > > -Jeff
> > > 
> > > [1]: https://github.com/dell/dkms/issues/464
> > > [2]: https://github.com/linux-surface/linux-surface/issues/1654
> > 
> > Hi Jeff,
> > 
> > do you know the related thread [1]?  According to the last mail, DKMS
> > has fixed its issue already in December.
> 
> DKMS tip might be fixed, but production versions are in various distros,
> which are not updated.  Therefore actual users are impacted by this.
> 
> What happened to the #1 rule of kernel, that we do not break users?

I think, Masahiro already provided valid and profound reasons for
keeping it the way it is.  Users of run-time kernel interfaces are not
affected by the change.  Concretely reported issues were, as far as I
know, only a matter of specific non-official way to work with .config
for other reasons than just building external kernel modules in the way
it is thought to work.

Kind regards,
Nicolas

> This still needs to be reverted.
> 
> -Jeff
> 
> > 
> > Kind regards,
> > Nicolas
> > 
> > [1]: https://lore.kernel.org/linux-kbuild/CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com/T/#m95f48caf46357a41c1df5e038e227a01ab89dbda
> 

