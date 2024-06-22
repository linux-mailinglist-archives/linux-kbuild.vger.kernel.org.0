Return-Path: <linux-kbuild+bounces-2235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB09131B2
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2024 04:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C521C21B0F
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2024 02:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92885664;
	Sat, 22 Jun 2024 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="AGN9EyJZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0D522E
	for <linux-kbuild@vger.kernel.org>; Sat, 22 Jun 2024 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719024933; cv=none; b=Bzv6w4mg4OPf93Nl9jqdX3lTHE/K+iQ54IwFJzor8mG9wRK39lwzJ/hg6w+W3PSTKuU3A3RRXOhmyj2yuDXXfNrt2NqWAUioFg2niAMfV2Fl7CW2tSkM0fZgk/vtyRtouuXwcJW2FsbXUkfNO8/b0CtMiNM0OUXH6SahE8bZx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719024933; c=relaxed/simple;
	bh=cFm3oU+O3ftwhE1/YyR//xmiv64Jhxl0bY53bUEjhkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ii2TZvF25LLuUJiDrN7UByJw/OyI8mz+IiomGpLPbxiug6rY6psTw+1a2TUS7ZZq0awNTKokd3GaatsD9PGvZ8JR+f7mRb0+K1YfNJct0wave1rRUcjjHpTtFaAlPMBscoz9Mmc6FOi7vGD/kkGGwD1VjWoiNdF/Ewa5N/FNsq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=AGN9EyJZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c8000cac03so334710a91.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jun 2024 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1719024931; x=1719629731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwP5SXjNhIZlkDmJOYjqFnuGdCe4xjq6ghxO1lquneU=;
        b=AGN9EyJZ6zI8ePpVhW9aZVfYfCyf3297kIp7c8rqg77s4Fej2BDXdAhtuOrHWMwtGJ
         0wwoSzS6zQytMdjGeNzDHUvaZLWrbBFSu/giWvL3Yu5dDYA71NG1tQOals1g2VBWE2Ld
         XlBvMrKNsjTTO04egQFy3sr/cUJZP+DqSut1BqMTUFLDdb9QU1xcXg/GBwAH5b7o4sLv
         /tTIpksicDQMXa0nqN8Eu6A2gWUOGZfP5GVpmHdabs9UxlNSk9agOpZA6B0dZHnLnNec
         J7pxcn1EnZpnSPPxc9r0VKsxhjd3v28d0xS775Gthp3pVGLug6WNKmuEGjM43fifdTfr
         OKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024931; x=1719629731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwP5SXjNhIZlkDmJOYjqFnuGdCe4xjq6ghxO1lquneU=;
        b=sQ/tfCu4htCMi+XVxAhhehQUqPayGrMhdrmJtG0WdXzLHBJt5BypxfIRA9NR7HHD/F
         Vk+VyueoSKD6DqF+nlfk5nXat+FmDuWI06H8qmvJjwYXspc8o2r4eubBNglMu2ej1ES8
         W/mrE1IYNgYZ5cy3KDJJlLTGkgmni9Xbu8TOFCFZUoJSHDEo2KJAVycXcen0MFLT70p2
         FBaDIADzPIkoRCRb/8Xt5mzyTpV58R83mtNWgDFXVLy0FWJw/WGEBDy60nv3ZG+i8YmI
         rP2w6Oo/od4RN+iyRA8ltxbRkoMgUjb4P67e5O8WGl/ZO6h8L79r9saUQ4CmTsr9wRWT
         bNYA==
X-Forwarded-Encrypted: i=1; AJvYcCVXzLBY+rceQ/pNg3HND2yJf/nm0n3rSuVNgrALTMzYeiOGSQKc+ewoGRl8w1NQkY/+WxSF4L7kAxAXxx7WhI0oMXDe0kVoNeFbHnOW
X-Gm-Message-State: AOJu0YwXYGXzLnPvULzJ+lZvOhQmNQxHkJ4FQxFGksUncwBHDpLC8p3I
	py++pNDwK1OwfZgtRlAmPU/t4ColtofCX0/Fnnq6+TD+nOLXgrAs2XtYlJySKFE=
X-Google-Smtp-Source: AGHT+IF47sfgPxYe0Bek1fqI/+hwfyhqIs29uq1xyzUPKjbau4Bd/kc73W0dBrGxpSbBSzfQHQBEkw==
X-Received: by 2002:a05:6a20:9483:b0:1b5:6b5e:c100 with SMTP id adf61e73a8af0-1bcea5f5f95mr539893637.5.1719024931149;
        Fri, 21 Jun 2024 19:55:31 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.166.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dd0cf7sm2325325a91.48.2024.06.21.19.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 19:55:30 -0700 (PDT)
Date: Fri, 21 Jun 2024 19:55:28 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RESEND PATCH v2] kbuild: buildtar: Add explicit 32-bit arm
 support
Message-ID: <ZnY9IEt571DwqtTJ@mozart.vkv.me>
References: <ZhmKzqxHXaSZmXee@mozart.vkv.me>
 <6bc61e82eaae9e614cbd50a322322173f593c90c.1718936424.git.calvin@wbinvd.org>
 <20240621145514.GA3770753@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240621145514.GA3770753@thelio-3990X>

On Friday 06/21 at 07:55 -0700, Nathan Chancellor wrote:
> Hi Calvin,
> 
> On Thu, Jun 20, 2024 at 07:25:59PM -0700, Calvin Owens wrote:
> > Implement buildtar for 32-bit arm, so the zImage (or xipimage) appears
> > at boot/vmlinuz-$foo, rather than at boot/vmlinux-kbuild-$foo, matching
> > the structure of the tar-pkg on arm64 and other architectures.
> > 
> > Link: https://lore.kernel.org/all/ZhmKzqxHXaSZmXee@mozart.vkv.me/
> > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/package/buildtar | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > index eb67787f8673..23d7ff675396 100755
> > --- a/scripts/package/buildtar
> > +++ b/scripts/package/buildtar
> > @@ -104,6 +104,9 @@ case "${ARCH}" in
> >  				cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}";;
> >  		esac
> >  		;;
> > +	arm)
> > +		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> > +		;;
> >  	*)
> >  		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> >  		;;
> > -- 
> > 2.39.2
> > 
> 
> Is this change necessary after commit 2b1ab1405068 ("kbuild: buildtar:
> remove warning for the default case")? Without the '[ -f ... ] &&' part
> of the expression, which was removed for other cases in
> commit c3f7bed8fa14 ("kbuild: buildtar: add comments about inconsistent
> package generation"), it appears to be the same thing.

Oops. Sorry for the noise.

Thanks,
Calvin

> Cheers,
> Nathan

