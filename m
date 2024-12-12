Return-Path: <linux-kbuild+bounces-5090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A449EE6D6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 13:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A43328321F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 12:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA72080D8;
	Thu, 12 Dec 2024 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="YjfUP5rj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CA204F97;
	Thu, 12 Dec 2024 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007017; cv=none; b=Ays8ByEdm4QfKZqDS+IE9VGCk7X7x8HgC659WglLzAUU3P7batFobzdlzYef5cdJ58n8zl830yD1mw6GyoZm18KS61Bwz7zv12ahhWd+v9GSAWdJxkYF1MM/ub1XtApbmYWzHyfqPxQULPTfXp71xVSZo61qRoZUg48i1SlddcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007017; c=relaxed/simple;
	bh=LtIjPFgjVvhqbdwiOezw3/j2sS9WiRG1pdS1TFKBPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYgP5JPNYInJmyw1GR9QKwVVUbvci4lrLD2snNABvVlWDq8XdNPghHLy5xhxJQY9OFBGTQqTjCAaEoC1HnaTR0/Gt0J9iEJn8qGK7H6hnnDOV7cJIMqI07KtY1VVuUh3xPRIqdJTv2Rt4co6MdMNJC9kqX+CovioHbUGCTLvdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=YjfUP5rj; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0nHCYoVWqqYxpX4iR02WX2GCmdNTEeA3DktgXY8H7N0=; b=YjfUP5rjMJeEW+GNk/qi5WZRFK
	4+Tmlh1B/VKtNgbhd40I1QpkVKUMfFMmLPQqLQkPjeTyTfts+ulMqa8pZHNpzk/bzn428DosHd0AG
	HTtK+BQradfNtkwVOF315YU6wjrNIStNPK66PHW2i7zFpjuZgAycXO05PjDOwkJ7J0gXpFGZauHEK
	OPvGWgMTciqkTl+0HFx0ovsJF19k4T5UhlxnYM2NuL87RIKn46cg662R3CPbvw+l0G5tJlLRjFaeF
	5c01fmBPUn3E6wNLkXUWsXEGj0OTcWDJsPN79MCdyEhaR//xX1/HyCGkR+lPsxX/yv2kxtoBMY2B2
	KUpd0o3w==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tLiQr-00AOjU-RW;
	Thu, 12 Dec 2024 13:36:41 +0100
Date: Thu, 12 Dec 2024 13:36:37 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: Do request initrd for user-mode-linux
Message-ID: <20241212-rational-muskox-of-abundance-e9aab3@lindesnes>
References: <20241212-kbuild-deb-pkg-no-initrd-for-um-v1-1-23243b5c7093@fjasle.eu>
 <CAK7LNAT6pNpnytGpzf0NTS+VbohJNF-CCj6dUGW=xHVdkOT74g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT6pNpnytGpzf0NTS+VbohJNF-CCj6dUGW=xHVdkOT74g@mail.gmail.com>

On Thu, Dec 12, 2024 at 09:12:58PM +0900, Masahiro Yamada wrote:
> On Thu, Dec 12, 2024 at 6:25 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > Do not request initramfs-tools to build an initrd image for
> > user-mode-linux.
> >
> > Building and installing a user-mode-linux Debian package with
> >
> >     make bindeb-pkg ARCH=um
> >     apt install ./user-mode-linux-*.deb
> >
> > fails reasonable due to missing kernel config in /boot
> > (KVER=6.13.0-rc2-00006-g8f2db654f79c):
> >
> >     update-initramfs: Generating /usr/bin/initrd.img-${KVER}
> >     grep: /boot/config-${KVER}: No such file or directory
> >     W: zstd compression (CONFIG_RD_ZSTD) not supported by kernel, using
> >      gzip
> >     grep: /boot/config-${KVER}: No such file or directory
> >     E: gzip compression (CONFIG_RD_GZIP) not supported by kernel
> >     update-initramfs: failed for /usr/bin/initrd.img-${KVER} with 1.
> >     run-parts: /etc/kernel/postinst.d/initramfs-tools exited with return
> >      code 1
> >     ...
> >     dpkg: error processing package user-mode-linux-${KVER} (--configure):
> >      installed user-mode-linux-${KVER} package post-installation script
> >      subprocess returned error exit status 1
> >     Errors were encountered while processing:
> >      user-mode-linux-${KVER}
> >     E: Sub-process /usr/bin/dpkg returned an error code (1)
> >
> > There is no need to build initrd for user-mode-linux, so stop requesting
> > it.
> >
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> 
> I think this change is wrong.
> 
> maint scripts do not make sense for user-mode-linux.

yes, sure.  For completeness: The Debian user-mode-linux package has
maintainter scripts for setting up / tearing down the
update-alternatives link, but that is probably not needed here.

I am going to send a new patch to install maint scripts only for non-um
archs.

Kind regards,
Nicolas



> 
> 
> 
> 
> 
> >  scripts/package/builddeb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index b497b933901013b1b8b82c2c340a88c9257c6193..d88ee487a1f2cfa3365350abe5b2203f48980d36 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -46,10 +46,12 @@ install_linux_image () {
> >                 cp System.map "${pdir}/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
> >                 cp ${KCONFIG_CONFIG} "${pdir}/usr/share/doc/${pname}/config"
> >                 gzip "${pdir}/usr/share/doc/${pname}/config"
> > +               initrd_wanted=No
> >         else
> >                 mkdir -p "${pdir}/boot"
> >                 cp System.map "${pdir}/boot/System.map-${KERNELRELEASE}"
> >                 cp ${KCONFIG_CONFIG} "${pdir}/boot/config-${KERNELRELEASE}"
> > +               initrd_wanted=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
> >         fi
> >
> >         # Not all arches have the same installed path in debian
> > @@ -82,7 +84,7 @@ install_linux_image () {
> >                 export DEB_MAINT_PARAMS="\$*"
> >
> >                 # Tell initramfs builder whether it's wanted
> > -               export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
> > +               export INITRD=${initrd_wanted}
> >
> >                 # run-parts will error out if one of its directory arguments does not
> >                 # exist, so filter the list of hook directories accordingly.
> >
> > ---
> > base-commit: 8f2db654f79c7fa579c64eda2b5db44553d6e513
> > change-id: 20241212-kbuild-deb-pkg-no-initrd-for-um-1c7b9ab2f264
> >
> > Best regards,
> > --
> > Nicolas
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

-- 
Nicolas

