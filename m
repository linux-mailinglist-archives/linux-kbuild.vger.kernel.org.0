Return-Path: <linux-kbuild+bounces-1540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B88A3649
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Apr 2024 21:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39D4281FAA
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Apr 2024 19:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368A1142E78;
	Fri, 12 Apr 2024 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="GAtsDFU/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FBD13DDAC
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Apr 2024 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712949830; cv=none; b=humDcPOarYzD/Li/6wSDb23fgQdfOznniwLwT+/TYUmBYV0KERn1kZuK3vBAQBgWm0EugicwHJ/bK+ApWZcZkFgYYauO1DMvvTpQ9HVCUFUNy5/nnjSh8PUsOH9klepSg12/zOtRJcy8LlTnecqfmUGtHYhB+1nkUS9AUp+5CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712949830; c=relaxed/simple;
	bh=rWrvxqm8dHbeMR8WrCiwg+HJ9k1NQpNEXDE12y/cVJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUEG1qzYLkKoJDKQ4iuj/BAl7NPJ/M1R6avqNsjFRGXtfGmLE+sBN11x+9/nnpHJHNTOWNknbFpk3/DxTglqlzCR6xYCMKAGyqE4gU9PAYnDSkHmPx5SvRAEI4XbU1Ccj46exPxg4hfQTpp3EYfDMPIeVRtXfj6s9k+TBsrkALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=GAtsDFU/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed4a80c19eso175291b3a.1
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Apr 2024 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1712949828; x=1713554628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuDDhdBpGWAW71fus2nLMnzxDNNjMThzumbpweOo2VI=;
        b=GAtsDFU/eIuWDC1SerweAxzsPHC/hvIcc9AnOTM2ys2GR8rX9QeoT5d+A/4BXP7twU
         ccu/oB54ZeLEIHA5+YfmCp6G13cO94Pxs4C5mzPZZ1u9X3xxUmNDf3RI/uUwdN+RpQ21
         UtQ9BK0zLvaeIm3cMMNMkl6XK5CO+iDzlnWDY0zO5iHy53cPQFKalEaNrzcLxfydOZyG
         6aGs30qazZWI9OzL6b9Y6kLs0W2BQSKCCWDLJ/9IOmVisiHeVYhlCD3Id0dePGUMrti1
         Tw8D7yT/aNyAEc1AlFKqBxllWjTRMpy4Q6z2TBNzdOGEYH2OYcD3IU9nNQFd+J7ct4/J
         f8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712949828; x=1713554628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuDDhdBpGWAW71fus2nLMnzxDNNjMThzumbpweOo2VI=;
        b=weaUJtuwFr2kN3+6YdkLn/rMuZG0KOUPI0UXbPVei5lFYbwf5HhM9bW0LuvECXvA83
         Coj8L1BKHdgHx4BNAqgzF8+WC71FSO1Y+rmI5ACRBdlORsCYmFRSb3gnD6xDc+ZhNGDw
         DET0M3svnZFLnGF/vpiYgPp+D/H2uSUlbo31i76autS/HFVnJfYA9SwZ2CGVmqDBjK50
         8xfwadt4saR9/O0kPbFF6HsVB41sxIF89PDYqdbw5zLIB8BUpPstqUsSqKXxLdx52pzv
         VE/PICGksY5fb6lwrRq5DixlFLQijhHqwThYIc3tY6PzD7gag7a0Lz0MMnctOCCFTFQp
         uOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp8pdvEgiwhqZ1vs0bQ2somYIYDIzQ+M2g//e2qz5j+9r8zRAeBShkb6IaUCgDMUB62bnwSt8ukNQHNQj3n5UaaXWHObrcRejSLqA5
X-Gm-Message-State: AOJu0YyX8lwqhgTnBaccDr11am597dTlF+hvmRbY/sN+yYztbEZBT0p6
	DfNiDnt/94XvBViMiGNrXsOtzOcTVTzqdylBZY6VTLKQfbAuUTBN6Wkk+MUjuMwt+C5OSHiQwnU
	h
X-Google-Smtp-Source: AGHT+IFwve24o4llz0ETmlp9AFQjC71/8w7y0IIgcx6YF5jsklg4uTsDSHXpAgomIyTqukPkEQQ+eg==
X-Received: by 2002:a05:6a20:a110:b0:1a9:a033:7327 with SMTP id q16-20020a056a20a11000b001a9a0337327mr3603211pzk.3.1712949827668;
        Fri, 12 Apr 2024 12:23:47 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.85])
        by smtp.gmail.com with ESMTPSA id je14-20020a170903264e00b001e22e8a859asm3358624plb.108.2024.04.12.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 12:23:47 -0700 (PDT)
Date: Fri, 12 Apr 2024 12:23:42 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: buildtar: Add arm support
Message-ID: <ZhmKPlMl_WJOPIXs@mozart.vkv.me>
References: <e7c14a0d329e28bdcda21376b54a43c85a4aaf3f.1712682861.git.calvin@wbinvd.org>
 <20240410170450.GA1828262@dev-arch.thelio-3990X>
 <ZhcZCwMmANQS39s2@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZhcZCwMmANQS39s2@mozart.vkv.me>

On Wednesday 04/10 at 15:56 -0700, Calvin Owens wrote:
> On Wednesday 04/10 at 10:04 -0700, Nathan Chancellor wrote:
> > Hi Calvin,
> > 
> > Thanks for the patch!
> > 
> > On Tue, Apr 09, 2024 at 10:17:07AM -0700, Calvin Owens wrote:
> > > Make 'make tar-pkg' and friends work on 32-bit arm.
> > > 
> > > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > 
> > Technically speaking, buildtar works for 32-bit ARM right now (I use it
> > almost daily), this is just explicitly adding it to the supported list
> > to avoid the warning and putting zImage at vmlinuz-${KERNELRELEASE}
> > instead of vmlinux-kbuild-${KERNELRELEASE}, right?
> 
> Exactly. I assumed (maybe incorrectly?) the vmlinux-kbuild-* name was
> generic "unimplemented" filler that was meant to be replaced. It seems
> like the vmlinuz-* naming has sort of become a de facto standard in the
> tar-pkgs.
> 
> The context for me is a pile of scripts that build kernels and boot them
> with QEMU on arm and arm64: it's convenient if the tar-pkg structure is
> consistent between the two (and across other architectures too).
> 
> > That said, looks mostly fine to me, one comment below.
> > 
> > Before:
> > 
> >   './System.map' -> 'tar-install/boot/System.map-6.9.0-rc3-00023-g2c71fdf02a95'
> >   '.config' -> 'tar-install/boot/config-6.9.0-rc3-00023-g2c71fdf02a95'
> >   './vmlinux' -> 'tar-install/boot/vmlinux-6.9.0-rc3-00023-g2c71fdf02a95'
> >   'arch/arm/boot/zImage' -> 'tar-install/boot/vmlinux-kbuild-6.9.0-rc3-00023-g2c71fdf02a95'
> > 
> >   ** ** **  WARNING  ** ** **
> > 
> >   Your architecture did not define any architecture-dependent files
> >   to be placed into the tarball. Please add those to scripts/package/buildtar ...
> > 
> > After:
> > 
> >   './System.map' -> 'tar-install/boot/System.map-6.9.0-rc3-00023-g2c71fdf02a95-dirty'
> >   '.config' -> 'tar-install/boot/config-6.9.0-rc3-00023-g2c71fdf02a95-dirty'
> >   './vmlinux' -> 'tar-install/boot/vmlinux-6.9.0-rc3-00023-g2c71fdf02a95-dirty'
> >   './arch/arm/boot/zImage' -> 'tar-install/boot/vmlinuz-6.9.0-rc3-00023-g2c71fdf02a95-dirty'
> > 
> > and the location of zImage is the only thing that changes as expected.
> > 
> > > ---
> > >  scripts/package/buildtar | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > > index 72c91a1b832f..0939f9eabbf2 100755
> > > --- a/scripts/package/buildtar
> > > +++ b/scripts/package/buildtar
> > > @@ -101,6 +101,9 @@ case "${ARCH}" in
> > >  			fi
> > >  		done
> > >  		;;
> > > +	arm)
> > > +		[ -f "${objtree}/arch/arm/boot/zImage" ] && cp -v -- "${objtree}/arch/arm/boot/zImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> > 
> > While it probably does not matter too much, it would be more proper to
> > make this
> > 
> >   [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> > 
> > as the current line does not work with CONFIG_XIP_KERNEL=y, since zImage
> > does not exist (KBUILD_IMAGE is arch/arm/boot/xipImage with this
> > configuration)
> > 
> >   $ ls arch/arm/boot
> >   compressed  dts  xipImage
> > 
> > resulting in buildtar failing because
> > 
> >   [ -f "${objtree}/arch/arm/boot/zImage" ]
> > 
> > fails and is the last statement that runs in the script (and the tar
> > package is not really complete in this configuration anyways).
> > 
> > Prior to this change, the correct image would get placed into the
> > tarball.
> > 
> >   'arch/arm/boot/xipImage' -> 'tar-install/boot/vmlinux-kbuild-6.9.0-rc3-00023-g2c71fdf02a95'
> 
> Makes sense, thanks. Although...
> 
> > > +		;;
> > >  	*)
> > >  		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
> > >  		echo "" >&2
> 
> ...it ends up looking almost identical to the default case. Does it make
> make more sense to change the destination in the default case and remove
> the warning? I'm not sure if anything might rely on the current
> behavior, it goes all the way back (git sha 6d983feab809).

What I'm trying to say is: using KBUILD_IMAGE like you suggest allows
more of the existing cases to be combined, like the below (and probably
alpha too, at least).

Thanks,
Calvin

---8<---

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 72c91a1b832f..66b4d8d308b6 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -54,8 +54,8 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 # Install arch-specific kernel image(s)
 #
 case "${ARCH}" in
-	x86|i386|x86_64)
-		[ -f "${objtree}/arch/x86/boot/bzImage" ] && cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+	x86|i386|x86_64|arm)
+		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	alpha)
 		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"

