Return-Path: <linux-kbuild+bounces-9430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A270DC3950A
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 08:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444D13BA74E
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 07:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FFF27B4FB;
	Thu,  6 Nov 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY+WG4Vm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B127A477;
	Thu,  6 Nov 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762412503; cv=none; b=uEb9x2LHN21eAFIPMHZyep7c1N9ThMTeujrFFnhO5t/0Hkoy9ibPKDYoB1kBd50BO7pmRxPe0GNVz0vDdBW5j2f98SxOUgPEdN+D/tUziuJ8MFQAuIUImqXt+0wsRU7d9btQnOQLV5x6SkWwlkF0t9TNLhL6kOQSl5VHlbE+5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762412503; c=relaxed/simple;
	bh=ABDS07uDqP2ie1y3aukydablW8qREgIQQCAqv79cW3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D63A+DdeCEOv5VhLaD3U6LxxCQNvYNnioNV137izTmuq11zGoH8VKL2MCYiiGqX/5RlOcPa4Cdw2R8RlPNScqoYKMKbITt43N24pmJkkCNLCMEfauoPwZ5SVwQc0D/fk3RTiR99gpf4IMpHk0DOD3AyyLglzZBK3SH/9O9AbTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY+WG4Vm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3131FC4CEF7;
	Thu,  6 Nov 2025 07:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762412502;
	bh=ABDS07uDqP2ie1y3aukydablW8qREgIQQCAqv79cW3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BY+WG4VmX2+3VljOuesjiMq7h0aapVDkivCC+41FKqycPh+7fK1Uj5t4cu7jE7GvS
	 jVtY4SjIu45dmGwJz8mXbx4uNjegA81KjPtVujVlI0ToSUS24pQlmPbQuQ20rSMsm4
	 aDjjCfU01Sea2JWmbxLv4viy6oUl/R9ExkuWesJBLjVDL7Fazl4k21C2R8IZ047Pfl
	 sdEW9vWrrMHi6/NqgvBwQYUcwSVx2yuIrtAQgRk5qMaOAhzPap9RJS/0sytW8yjVHG
	 ZnEVBZCA+upG7+Uagc4uPD8WlC++AZgnZjkg9dlmyL+xjopO6enCM1UOvsPjescvpc
	 4ZtSaw1oNNOOg==
Date: Thu, 6 Nov 2025 07:57:18 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Omar Sandoval <osandov@fb.com>,
	Samir M <samir@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] kbuild: Strip trailing padding bytes from
 modules.builtin.modinfo
Message-ID: <aQxGziZq6yK-V8HC@derry.ads.avm.de>
References: <20251105-kbuild-fix-builtin-modinfo-for-kmod-v1-1-b419d8ad4606@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-kbuild-fix-builtin-modinfo-for-kmod-v1-1-b419d8ad4606@kernel.org>

On Wed, Nov 05, 2025 at 03:30:27PM -0700, Nathan Chancellor wrote:
> After commit d50f21091358 ("kbuild: align modinfo section for Secureboot
> Authenticode EDK2 compat"), running modules_install with certain
> versions of kmod (such as 29.1 in Ubuntu Jammy) in certain
> configurations may fail with:
> 
>   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> 
> The additional padding bytes to ensure .modinfo is aligned within
> vmlinux.unstripped are unexpected by kmod, as this section has always
> just been null-terminated strings.
> 
> Strip the trailing padding bytes from modules.builtin.modinfo after it
> has been extracted from vmlinux.unstripped to restore the format that
> kmod expects while keeping .modinfo aligned within vmlinux.unstripped to
> avoid regressing the Authenticode calculation fix for EDK2.
> 
> Cc: stable@vger.kernel.org
> Fixes: d50f21091358 ("kbuild: align modinfo section for Secureboot Authenticode EDK2 compat")
> Reported-by: Omar Sandoval <osandov@fb.com>
> Reported-by: Samir M <samir@linux.ibm.com>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com/
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Tested-by: Omar Sandoval <osandov@fb.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.vmlinux | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

