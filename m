Return-Path: <linux-kbuild+bounces-5839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91DA3D624
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 11:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1CB3AE813
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 10:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EBA1EF0B4;
	Thu, 20 Feb 2025 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="WlLD/52C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCF1F0E29;
	Thu, 20 Feb 2025 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046151; cv=none; b=rdyy6SwEL+N7cWAPS2EEq1mmRa19WNApbfdFhWwhum0YD4zT0/YnvWZES07zc08fNYpTEYqPRLI3cghvsSub9iO1mMPlKtFHxUJQpJ51YBN9iYXg6R1NrwN+/1vCdUGeKv63ZxGJWltNs8g36zaRT8mQbNs9SlqF2b/dhLcPfFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046151; c=relaxed/simple;
	bh=50txLVVCRobSv4NuU/82XKthyZkFsywUPDHvc9nxY2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgOgztdDUus/F0uftWZjTbjPa8K+ka4hXA4RsybLfYQ5RDENQ3BmBurSN3F5LrrwokAVGqJ9oqlU8ISE3EnUWbTxlXbzJR1gMtx6tpN8LfKozloF+xU83PxUcRDlaoSlkLTbP51o5XFmU3RpMHiOW1hUqP/cCYPwc8gULQNa73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=WlLD/52C; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1740045793; bh=50txLVVCRobSv4NuU/82XKthyZkFsywUPDHvc9nxY2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlLD/52C6GCjWesK9gEN8XWUfhzgR4ROGpYpf03EHywvuCQYvIP3U+1EBwKRVaGBB
	 yzkI6DQXRi2eXRNE8NSNVW+ibNXXf2Gh9WAeSBY6Pnhk3Jq4uOdcACXsUcZWwFZHoq
	 TfYK444OcOr9G7NfuEBPI4GTAwtbyYCMqObqs9EU=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67b6fde1-714a-7f0000032729-7f000001d908-1
	for <multiple-recipients>; Thu, 20 Feb 2025 11:03:13 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 20 Feb 2025 11:03:13 +0100 (CET)
Received: from l-nschier-nb (unknown [IPv6:2001:9e8:9e4:1f01:9fb7:d3c6:7f35:9b14])
	by mail-auth.avm.de (Postfix) with ESMTPSA id D89ED806E9;
	Thu, 20 Feb 2025 11:03:12 +0100 (CET)
Date: Thu, 20 Feb 2025 11:03:11 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
X-purgate-ID: 149429::1740045793-D9F66CDC-45E15D99/0/0
X-purgate-type: clean
X-purgate-size: 1706
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
> On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
> > Exclude directories and files unnecessary for building external modules:
> > 
> >   - include/config/  (except include/config/auto.conf)
> >   - scripts/atomic/
> >   - scripts/dtc/
> >   - scripts/kconfig/
> >   - scripts/mod/mk_elfconfig
> >   - scripts/package/
> >   - scripts/unifdef
> >   - .config
> 
> Please revert this (the removal of .config).
> 
> I got some strange reports that our external module install broke, and
> traced it to this change.  Our external module references the .config
> because we have different logic for the build depending on if other, related
> modules are present or not.
> 
> Also, it looks like this broke DKMS for some configurations, which not only
> impacts DKMS itself [1] but also downstream projects [2].
> 
> While DKMS may be updated going forward to avoid this issue, there are
> plenty of affected version out in the wild.
> 
> Also, I haven't surveyed every distro, but it looks like Ubuntu still
> packages the .config with their headers in their upcoming "Plucky" release
> based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
> needed/useful.
> 
> -Jeff
> 
> [1]: https://github.com/dell/dkms/issues/464
> [2]: https://github.com/linux-surface/linux-surface/issues/1654

Hi Jeff,

do you know the related thread [1]?  According to the last mail, DKMS
has fixed its issue already in December.

Kind regards,
Nicolas

[1]: https://lore.kernel.org/linux-kbuild/CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com/T/#m95f48caf46357a41c1df5e038e227a01ab89dbda

