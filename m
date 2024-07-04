Return-Path: <linux-kbuild+bounces-2373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D561927A02
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE3421C2095D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FD11B010F;
	Thu,  4 Jul 2024 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZoYo+zhs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880831AD9CB
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jul 2024 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106900; cv=none; b=Un3vzo/R9FEzyCQWOJ7//fy6xAFBevwk7swyKxmPS33UIzXDlwJUVJuJHKYsLgpOKvS8V/lrYyjog//EZI/+Ro+TRZWYw8gSZ6bJIVmYC6LlLW2MT5jlBuujGwGBWE2eHSIRo7DMoni9fLr4imvZcdu/ezauLSJQtHT5/666y70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106900; c=relaxed/simple;
	bh=K+9khsHPrGl9+kaP0GvrXu0P9KWKNyzA+GM5yKpaUmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWJO7qASSnLp3PjoT6crS5RngK9r665Tr+ZDcG0s4VItbAp7IxM5rWR/OfN22VfntKWkcmVJyJcchGX1nuDoGwB7VMl765MaRme3CnUxy/M43TP/ibw0tI6iKb/WRhba5wjHerwXwHlC0ofAKnskCXA2S8xPmpRQfKNWOioJOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZoYo+zhs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720106897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHDQLEHUfgvmw0ktLAaUo/x5tRI2fcgOxkiiF8qk/9g=;
	b=ZoYo+zhsBKsBvBVGPDNEVQOStsjr/kx/QJznV76fejpJ684AOMvMEgHzmHvdPuaHkUgt9s
	sjAo2LukeSfjGpIW2jI2P22jNn7qbIhLAAd3qONd1ceMLJ7muKoTbUFaN/AOXErdapk8N8
	WYrFRz/uZ0DGn/pAFrS66R2tTsmEtYo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-fFb1-JyXP5aLjJuwV3dABA-1; Thu, 04 Jul 2024 11:28:16 -0400
X-MC-Unique: fFb1-JyXP5aLjJuwV3dABA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79d5509f112so102442585a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jul 2024 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106896; x=1720711696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHDQLEHUfgvmw0ktLAaUo/x5tRI2fcgOxkiiF8qk/9g=;
        b=XmhnBbjA0zH2W2RQ9iub0OyVUZklbq3qWrKJVqtGrzuzKQqchULmv1g9GAJZ+kopDm
         csuN0b/xOx5qeUh0wPLhjT7OXkNnErLCHEcxx6q9DLWbss2x0id++A5/3g9dUce++6Nq
         Qjirrjrl7SirJKa6k+zr82fqKp4w4rJ6boBzFKMV3RTICv8RfALu3kpHOMZQ7aW8c31w
         B2SIt6TjK85NjFfJ8pijQ940NXaZ2KD8JJEe9Pp4Q7XL9l3T81WP7FJQ2h/aX280724U
         HKG4Mhx8/SleCOcaiqGQBv+Z6Ph700psKFoapV6K7CypqAjKVjJEeHc2R6zLyO+htpkV
         53LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTjqXgUGt6MsXOTzAssZXFk0B0MHbrRlElVbDyekrAbl5bTRkRlf9egEnv0ty9XlNIB7PW047+4T42VJaifFm9nImdYHEgl1lnC4hu
X-Gm-Message-State: AOJu0YzEv8ip1yA3JRNwJz+oSsNzmsiI9jsJvol2566sHoCO+zhHV/bp
	lTFIxrQY66mV7CZXQ+NmmZE7jxLSas0qeOoZ8tSVoYe2XKwRKRbe8a+XtjI3TzgvsFK87f5IsYa
	FkxRe8DuNMVJ/H85v6B2EmlJCbaYdxSYxz/bGHGKngz5Sq6wXDFhiOjyJDgGOrg==
X-Received: by 2002:a05:620a:1a1a:b0:79c:2d:1f40 with SMTP id af79cd13be357-79eee1bf27dmr255649985a.26.1720106895748;
        Thu, 04 Jul 2024 08:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHes96ObGy5APTGY18HYlFTXCHgVASL0xqXVWp48t1abDxvgyujx+r7kVow6rFIGUnPQZIjqg==
X-Received: by 2002:a05:620a:1a1a:b0:79c:2d:1f40 with SMTP id af79cd13be357-79eee1bf27dmr255628085a.26.1720106891095;
        Thu, 04 Jul 2024 08:28:11 -0700 (PDT)
Received: from optiplex-fbsd (c-174-169-122-120.hsd1.nh.comcast.net. [174.169.122.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79ef26f843dsm24794385a.136.2024.07.04.08.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:28:10 -0700 (PDT)
Date: Thu, 4 Jul 2024 11:28:08 -0400
From: Rafael Aquini <aquini@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: rpm-pkg: introduce a simple changelog section
 for kernel.spec
Message-ID: <Zoa_iCGGrMWvbJEb@optiplex-fbsd>
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
 <20240611211123.959459-3-aquini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611211123.959459-3-aquini@redhat.com>

On Tue, Jun 11, 2024 at 05:11:22PM -0400, Rafael Aquini wrote:
> Fix the following rpmbuild warning:
> 
>   $ make srcrpm-pkg
>   ...
>   RPM build warnings:
>       source_date_epoch_from_changelog set but %changelog is missing
> 
> Signed-off-by: Rafael Aquini <aquini@redhat.com>
> ---
>  scripts/package/kernel.spec | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 19e458341f45..126b23c1f6c2 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -132,3 +132,8 @@ fi
>  /usr/src/kernels/%{KERNELRELEASE}
>  /lib/modules/%{KERNELRELEASE}/build
>  %endif
> +
> +%changelog
> +* %(echo "$(LC_ALL=C; date +'%a %b %d %Y') $(git config --get user.name) \
> +<$(git config --get user.email)>") - %{version}-%{release}
> +- Custom built Linux kernel.
> -- 
> 2.45.1
> 

Please, don't forget this one.

Thank you!


