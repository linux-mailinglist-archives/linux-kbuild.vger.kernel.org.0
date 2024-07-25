Return-Path: <linux-kbuild+bounces-2656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DB93C1C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 14:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C73D1C21ACC
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D8519AA76;
	Thu, 25 Jul 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zso9eOeQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF973199E88
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909921; cv=none; b=aFe67BVxynSL24jYF3f+ptE+/08cgImLFadHjreS/BH9i+/+/kL9iXpLFjLLIYjqnI7ZNl/XckRyWPVL102zqfC7bePMuw/cWkZl68cF1om2nOicbVx/NhuX38vA8c+NbN5nKevehG58uD/Sq5xX0n1gyhCOooElr2emRlvB7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909921; c=relaxed/simple;
	bh=tRbR7A0baw5A4frKyUMq4Vn06QKkaz/crVbi5d+42+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTn9vkTcLFK61TJVWqxGHV/7SWPDwTFE4IL/OboF+8dridNF5ak0A3sGiLSoOWE566lEOnBpGaksaFUiiNplEGYQzZ++CKlTGnADjVVosMaw61xEkgTnMDh83EGFBxDFEf3CBi1ti7gtPaAdtXZFSw8iu22vNLpwxMvcfd8sqy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zso9eOeQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721909919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3kWwEG67IR1rFGCSh/psqQO5lbbtnbmeSPEHdE9mjI=;
	b=Zso9eOeQXbgBA4jaRMUlWh/RDf4splpFKjVeVDKZFzHRkw2Ouj7m0aQE3VsB1WxHxdKQeT
	B6wkLzbFT9SE7zdoa64kSNdHFvmypI85K5cgnDC9OvAhgB7nr7dMeJc2ag1yPui0fcuqSa
	g9TENMu9n8pO1RZ92QIYROCdOpE4b9s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-WeRVj3z8OgypgQuzcCV93g-1; Thu, 25 Jul 2024 08:18:37 -0400
X-MC-Unique: WeRVj3z8OgypgQuzcCV93g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-44fdc851663so10536151cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721909917; x=1722514717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3kWwEG67IR1rFGCSh/psqQO5lbbtnbmeSPEHdE9mjI=;
        b=c399y0hiv4Faz3iLZJHSiAEVgNpd3gtyd7AiQ6bp3AlmOjofVWsebZg6uqBEVeQCB5
         C6rXbGxHtKKEOwkzOAYWvuYShrBJ/RfSOSeRWezECSY3ibgaVvs6EB4b5UXw+Rqz+S0m
         oh5qPxVSiX3llVIwVpUdNmKclqfzh5m+m2DuEPG9vdHMjrKL14uRvdfE+Wa4tcZPyUwx
         haG9NPeTtCYHHFvJSoWZAoRdNZ9Nc39uhm5y37rsr2igeTxohR5qivHwwxinO600tnYY
         EiASsDuMFdjY5GncjecWUP0GBaoBIvsPM8FtVNd4IJV4hEFJ8L1vHnNw7kf56DQdDV0r
         zHFQ==
X-Gm-Message-State: AOJu0Ywz9S5NqmvAUEOk8TQtCVhnSH+HCKexnpcIk4Wf93BllQB1IEH1
	LbmgLWDtIB3H9h28nUjYHRejhowXMGBe5xYH/5WOLRiGPGGWqpuAg9fDEfHiePhQn2OocHwSO3m
	eTYHthRZuSFS1E79abEkGrv25C1yb+PFKF4tJhY/uOCQ6Qiby//pCoHw9jRBKCGaqC43zjA==
X-Received: by 2002:a05:622a:4ccf:b0:445:5726:1545 with SMTP id d75a77b69052e-44fe327d0b2mr32063451cf.11.1721909916619;
        Thu, 25 Jul 2024 05:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdhwb4qAbj3ma56ZuNKXro6rpAsgfTvuhPsaSZdonfS4Wzuiv/8ZUWxdGLse2oUYtvjiuahg==
X-Received: by 2002:a05:622a:4ccf:b0:445:5726:1545 with SMTP id d75a77b69052e-44fe327d0b2mr32063211cf.11.1721909916142;
        Thu, 25 Jul 2024 05:18:36 -0700 (PDT)
Received: from optiplex-fbsd (c-174-169-122-120.hsd1.nh.comcast.net. [174.169.122.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe82013cdsm5571781cf.72.2024.07.25.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 05:18:35 -0700 (PDT)
Date: Thu, 25 Jul 2024 08:18:33 -0400
From: Rafael Aquini <aquini@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix C locale setup
Message-ID: <ZqJCmVOQDDCrJjio@optiplex-fbsd>
References: <20240724084655.930706-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240724084655.930706-1-pvorel@suse.cz>

On Wed, Jul 24, 2024 at 10:46:55AM +0200, Petr Vorel wrote:
> semicolon separation in LC_ALL is wrong. Either variable needs to be
> exported before as a separate commit or set as part of the commit in the
> beginning. Used second variant.
> 
> This fixes broken build on user's locale setup which makes 'date' binary
> to produce invalid characters in rpm changelog (e.g. cs_CZ.UTF-8 'čec'):
> 
> $ make binrpm-pkg
>   GEN     rpmbuild/SPECS/kernel.spec
> rpmbuild -bb rpmbuild/SPECS/kernel.spec --define='_topdirlinux/rpmbuild' \
>     --target x86_64-linux --build-in-place --noprep --define='_smp_mflags \
>     %{nil}' $(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)
> Building target platforms: x86_64-linux
> Building for target x86_64-linux
> error: bad date in %changelog: St čec 24 2024 user <user@somehost>
> make[2]: *** [scripts/Makefile.package:71: binrpm-pkg] Error 1
> make[1]: *** [linux/Makefile:1546: binrpm-pkg] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  scripts/package/mkspec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ead54d67a024..4dc1466dfc81 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -50,6 +50,6 @@ fi
>  cat << EOF
>  
>  %changelog
> -* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}>
> +* $(LC_ALL=C date +'%a %b %d %Y') ${name} <${email}>
>  - Custom built Linux kernel.
>  EOF
> -- 
> 2.43.0
>
 
Acked-by: Rafael Aquini <aquini@redhat.com>


