Return-Path: <linux-kbuild+bounces-8320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70BB1E0D5
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 05:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0750C178EEB
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 03:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850C71953A1;
	Fri,  8 Aug 2025 03:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xWxOyDa0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F19B17AE11;
	Fri,  8 Aug 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622692; cv=none; b=ksFSxzDQkpaxuHBXdk+/aOT9XJBQDDMpIQaTePll+v+ckkZVtzxvj3Bg63Ahv+Vgf5kW6/QR8/8UhMotwWffmOPJgVhMPTd7NXNtHMl3aRT9YfqLs8K4EmCjojX2Gl+BrYsQC+e9Gif+hTMLz2lVjG4DWqHPEtzbzATH+bG6Els=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622692; c=relaxed/simple;
	bh=Ql0LzalBUAax9xMkEhOLsITCRk26lWuBUSC87W4PNzs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBgPz6V/yzUZtD94xdyyz5ran3mCPaTaGfGtKF8z6hTfJfjMNnvxnO/ox4k7CK6ryTsqgBYZvEscWl3ZaxIqCaQrxC6fpO8D4I3XvsHB/4cnboFA+kPkR3etiVWXM11hloDOvwaHRoDlzHCx9YeDZGruWCZdXOvNwjFRcqhzem0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xWxOyDa0; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1754622380; bh=t6PKdLiuF8qer/I/QVYAhTSCVCHbGPtczY6cPvoEoYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xWxOyDa0oEQ4PnwrGmu5Belv6Xpv/Fu+H/qCUtC8pzTqfMpr520qN5S0w9f/XKXZB
	 QZxYK9XljMeyGT2sSvSHt6ViBD7KFjhEDRQW1BW+9ZZtwI7IpbHmlf36i5yABBkQuM
	 BehV2J25Z0jiwGdgFHmN1Y8eaPxnGN6w566EM83A=
Received: from localhost.localdomain ([120.197.14.100])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 190AD47E; Fri, 08 Aug 2025 11:06:16 +0800
X-QQ-mid: xmsmtpt1754622376tb2oigiim
Message-ID: <tencent_75A1C584111DB4F85859451B0014D06C0C0A@qq.com>
X-QQ-XMAILINFO: OQhZ3T0tjf0aOtjtj66biQIyxsOwssCLsl34kdUNqzcdWeTrya9db1PUfed5CB
	 YLQWF0E4umpKJHZlbFuVDWVYRdIBwB3d7iXdkSJ3qHuJc4tysg7SsIxJfEoGQ6PB8m6tD3AxU45f
	 2YUZ3J8IebcC1J80NrSe3XfMOXkAwnRcwJJkcARjvogcSnfjYpMMzCyLNMZVXRyEm+6Aplu5lWZf
	 x33MdsQ4hlu2c1MReRVKzxlRhxEMnkuAWumSRoSG/s+0WelobdHQJ9lw+eX+z7faUElKno7I6O6H
	 +5mCy3w4Jb+BYhJDiHD82QoeHvB7ItFnJnB4DT6trmCN3HbWztuiWYU0gKMqeasZ0ZTJzVaEDfM5
	 RtKrmg0Cj2aSYogVeRW6Uq9lrGMqLnshsiY+uBKWdTJVHCF4m1yV4IaEhEs4U+iX/1uwMVEv2VFQ
	 95I+6vEevDy4xdogIYolF4CtOa2YcbjHkW2zcEKv4sI23vF9HXhkR90Cian3tnGD64VUa9OaTHG+
	 5DRDw8DJQSQhnNLY3YEcJpKTM8EFbZFwb28zLlLB/FWmLVDMysQd6orL6CLykir0eN2FphMFtRlQ
	 aLnT/Qe7YQPOqQQRYOVfhlLkLkL8Ao6Un2i8qpecMY96F3jRW5xG+AAFOvaZgQeOesmPii5EMk/C
	 Txn9N6Jjd8MbDL88/FzRk8daCJ2t11VfdcWIxMKxMHUq1SY9BmDvKlzbBlpCjhcrXlpUWkHWQerz
	 y+hLJz/UV5+ciz3QKkL2oNty8wH0BXhdLNpH9+XQZ+wNjAN1udEYjPhlD9qyAfcTWgox7Zie6Vks
	 l6dpemKt67wMRYtUVq5pjX7OYq3qPjw1pZl+rbv3cduQcpYWwmBAzDPADDr7Ypbboa4qR1rYB+Y/
	 C5IECCxPHhuGUz/bE4iblpagpFv+3yk0Od63E8nXueWYmFD96lu76GfyKBnvujLwctYsEUhODJAJ
	 PpzSOZuOFArICHmBCNC7dykxkPpSjr0PxzMxi8+xG9E5TJ48ibJH8yBRsonO85
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Date: Fri, 8 Aug 2025 11:06:16 +0800
From: Haoran lee <470658536@qq.com>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mod/modpost: For CentOS 7/old binutils
 compatibility
X-OQ-MSGID: <aJVpqD9aUEk5-MGE@localhost.localdomain>
References: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
 <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>

On Thu, Aug 07, 2025 at 12:51:59PM +0200, Nicolas Schier wrote:
> On Tue, Jul 29, 2025 at 12:19:46AM +0800, Haoran lee wrote:
> > 
> > Signed-off-by: Haoran Lee <470658536@qq.com>
> > ---
> 
> Please note that empty commit descriptions will not be accepted.
> 
> 
> >  scripts/mod/modpost.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 5ca7c268294e..216647e2f301 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -30,6 +30,32 @@
> >  
> >  #define MODULE_NS_PREFIX "module:"
> >  
> > +/* CentOS 7 / old binutils compatibility */
> 
> Since v6.16-rc1 the minimum binutils version has been lifted to 
> binutils-2.30 [1].
> 
> Which binutils version do you have at CentOS 7 ?

Hi! This is my binutils and gcc version on my CentOS 7 system:

rpm -q binutils
binutils-2.27-44.base.el7_9.1.x86_64

gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/opt/rh/devtoolset-9/root/usr/libexec/gcc/x86_64-redhat-linux/9/lto-wrapper
Target: x86_64-redhat-linux
gcc version 9.3.1 20200408 (Red Hat 9.3.1-2) (GCC)


