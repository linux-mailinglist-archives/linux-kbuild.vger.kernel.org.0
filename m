Return-Path: <linux-kbuild+bounces-9570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12DC4E815
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 15:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C91A34F0D42
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B5C2DBF73;
	Tue, 11 Nov 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9U8qBDo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF8A55
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871292; cv=none; b=YWQriPr6aLDgn1rwlWLOB1FAgQj7NTaB0fVidMw5hVIaYMg4bQ64B4pBK6E/qrfy2pgi1tfqYmH5z5EFSzmiwmIxa01pwZXHM90TbjMAnle+QZoOWqgnwjzhhJhVGfvbftg/w/23vjKA2Ib43HnDtUe0loV4RSOEKTRm4stWmIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871292; c=relaxed/simple;
	bh=iLYIBY2frXJ0gotqYOoQCqWwfSygqsRLbVDRxfXwaBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHQRbbeS/o0lIqPIXNPtuRwfsgn2CJcAhz9lPUnJr7SEizGPvDRpePkL7nptIIRwEvlQcG9ddVTtltLZYDAeCmM9fDLYM1wEIdLRtTJmpWhMY04ELtl1Se3EjlQ4PdjYOsS7Ca9yl547TVhEOp9epXYIm1ehFA5RIhnxegvEhTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9U8qBDo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b31c610fcso2174517f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762871289; x=1763476089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXCOTwtVMElh+FAj3dMJZ33XpcZlOmbftcoEi+ijDBo=;
        b=s9U8qBDo9DZPRFEbRUS9DC3jVnw5rgjCZZXJhOYuqFiFnfmkgWY/gEkf4ZtYsAjynP
         p7+sNMlGVh9JPI1thdsrhUoVLPqGJDyR/vAbnMCNHs0A2np5d+XIOhSrIVbh5Suanhok
         igRhnGi7SolViWsEtF3qMKLeIgqjDc9dh95dMkBhiJ4CmNeMGhxO0cg/MwgpfGdVs6E8
         yq2Q38AW6rH1LWaOxYuYl7xHWLFXSWNh+wKewyHAgVPjdKAZYaKJRKV075L9Jg9kXJBa
         eZqSeC6AcIn7MMvI5c8jzqK+4JgL1TI5xE3oljiOgGrA81Y+FQcMiTPQgxnLiU3YmNPu
         QlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871289; x=1763476089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXCOTwtVMElh+FAj3dMJZ33XpcZlOmbftcoEi+ijDBo=;
        b=aFAeTZV5WlpMOEzoS4+JYHHfil1/9FNzM5D3S1C7fKip8jUbnsIYhLVSEx98SLDZn+
         rN+pSrlY4/Czy7J3Y2EJ1638sXEETQ/3sazlfeVEvKFBDSeqtfK6VdVxE8fa2COLwmPQ
         5AOPk94IGoEVIUr4gmJZ8f4p+OI/ToQ96ZeBZp0m7bm/CE4uD2zjxNnjVY7xdkkQk7Pc
         LR2ytwHVlbPiryq8HuXB0uW+E4cIljfIqzLksdWKugrjAh2Ag/dnIov08xbt2bEZq64m
         pAq0Pexn50vo/WiKgVAB+/GVD2N/BPHnW1P3+TanbcpmGSbkgA+28psYom/IcUyZGuGc
         N4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVduaAXSpv9FeBuhWzmgU/yisHpTvcCO6gd7gdhVt+uC0gJEygv6UoxexXv1fMeFClXiRLqhR9fXnnmNEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdV973e79Ue2yrIS/8nr46s01hllLSLRmXnixEbj0GQAoC9yPQ
	O6qNK2QJOTf/VAORiJ0pacV55Jac9XXE0Url4+S10H1B2auOqQ/mUmFFtnHy1G0XSvs=
X-Gm-Gg: ASbGnctZkMeW2+a2/9W4bRg7z/WJAyd7j4ueHCk03G5Tv8JJH2uYeFCemc9I9/V+sBL
	isYfWAucQhGK1qvMRI6HT6W0FNADmCkFMRwjm28Ojo93uPkLNC1BGR/qOBCedO3OIoJG1cMvido
	w2ScXh3UpQgJPr+nhRzBAU+2jcl3V1T0EIOGQjzAsSjCgyYG5caLtXobMQvfJbKM+MSSp/Kr54a
	zIhXsSR5HxDH3t8wHFDm58SnRQYODLSmBjDYbL57A0rdeTq235svJGYFxDiuQ7+tYdYv6gim8tG
	OTsKjSk0zVTIzePC7Yujc8Ei0HNS+V9I6ap9ElHv5GwoHT9gVqFGTYg5xCNT8H2Cvwsc6CNABQm
	PrMmHy/4oCZ8uXbsoqNs0bxJwGcefO7xGAk5A8yWJz0lAvUurkysKjGMB1reuttN9bMKGapUs
X-Google-Smtp-Source: AGHT+IGPfRejxBAmiaZBMiUbDgxfy1lDW1fEdjwlTeUfE/bKxwM3e6qM7gTMb/MRXqU4L02jFgT4yA==
X-Received: by 2002:a05:6000:2d87:b0:42b:2ea5:61b6 with SMTP id ffacd0b85a97d-42b2ea565f0mr7883555f8f.46.1762871288932;
        Tue, 11 Nov 2025 06:28:08 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2c6d3f67sm22398883f8f.37.2025.11.11.06.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:28:08 -0800 (PST)
Date: Tue, 11 Nov 2025 16:28:06 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: install-extmod-build: Properly fix CC
 expansion when ccache is used
Message-ID: <4qwfibqgwhigh4g7ic75ueeyy7py4hgjdg22cyuyvxod7x7vjf@nd4t2em2uaqp>
References: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
 <aRM0DmrBq-neaNYw@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRM0DmrBq-neaNYw@derry.ads.avm.de>

On 25-11-11 14:03:10, Nicolas Schier wrote:
> On Tue, Nov 11, 2025 at 08:43:51AM +0200, Abel Vesa wrote:
> > Currently, when cross-compiling and ccache is used, the expanding of CC
> > turns out to be without any quotes, leading to the following error:
> > 
> > make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> > make[3]: *** [Makefile:2164: run-command] Error 2
> > 
> > And it makes sense, because after expansion it ends up like this:
> > 
> > make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
> > HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...
> > 
> > So add another set of double quotes to surround whatever CC expands to
> > to make sure the aarch64-linux-gnu-gcc isn't expanded to something that
> > looks like an entirely separate target.
> > 
> > Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Moved the new double quotes inside of single ones, to be able
> >   to drop the escape, like Nathan suggested.
> > - Re-worded the commit message according to the above change.
> > - Link to v1: https://lore.kernel.org/r/20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org
> > ---
> >  scripts/package/install-extmod-build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Just as a note: the fix is only required for build rpm packages.

.. or pacman packages. Easy way to reproduce:

make ARCH=arm64 CROSS_COMPILE="aarch64-linux-gnu-" CC="ccache aarch64-linux-gnu-gcc" pacman-pkg

> For the Debian package call of install-extmod-build
> CC="${DEB_HOST_GNU_TYPE}-gcc" is used, no matter what was given to make
> deb-pkg.
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks.

