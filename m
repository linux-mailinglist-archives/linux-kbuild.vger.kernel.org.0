Return-Path: <linux-kbuild+bounces-2927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7594D95B
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 02:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8873F283254
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 00:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961E253A7;
	Sat, 10 Aug 2024 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JqaP9a4G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD32F32
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2024 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723249006; cv=none; b=uZ0gtda8fewsa4zCw284L71j3Pq3B3S0mibJradkTXlTTlfgYhvydwMeZer+HhCPM5mfUifrJM2ahAYMklKyI/YKlvDsavF/ZRmCgZbjCQ60AF07yA3pwdVVhlHlfQMxX4OH3c6lk28Nz+d1rnRP4Bz3gXxYc67IutPWHQqWN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723249006; c=relaxed/simple;
	bh=WACofQWdwAkbE5ke6bFhsACE4OIkGjWD8HDhe4FYJIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGLBNs6mFhTvHQO+ulChYaqvy6tyZWyFO7ZGJi6yNb+fM5xG10d4keOSHTDagyLWwDWYi3JMIZWVDblRfy/dukkmJFwpjAyXqgaROkHz5Elco3tSEMPteQEohCBPCqiYwFt6iFVaIwH+2pt4dEHm+uB8KTMyFBK8qH1aTMYUk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JqaP9a4G; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 9 Aug 2024 18:16:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723249002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVv3rZrHzx7MST34i4ApDOfnrFMCTY00UBmlr5tyqU4=;
	b=JqaP9a4G9mt2Uvh9W5mHv8SeW9DdUbZ4bRaxaoc+mjjxyJdajrJ7HAePLWm8vOtZF5gn13
	U2Jk8M+OMfZGO32FT+LkQj16HPno2XZdBKXO9lWptnEYabA28KcBYiZTFHiVryVGLQqcDH
	jRexw/38tzXg63w8PYCEqPvUw7NKeeA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
 <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
 <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
 <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de>
X-Migadu-Flow: FLOW_OUT

On 24/08/07 07:31PM, Thomas Weißschuh wrote:
> On 2024-08-08 02:02:59+0000, Masahiro Yamada wrote:
> > On Thu, Aug 8, 2024 at 1:41 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > > > On Wed, Aug 7, 2024 at 11:28 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:
> 
> <snip>
> 
> > > > Lastly, I will never accept new error messages
> > > > with CONFIG_MODULES=n.
> > >
> > > Could you elaborate?
> > > For me this works fine with CONFIG_MODULES=n.
> > > (After having fixed the above issues so all subpackages are built)
> > 
> > $ make  allnoconfig pacman-pkg
> > 
> > Check the linux-headers log closely.
>  
> I see now, previously I was not on kbuild/for-next and had an old
> Module.symvers sitting around, hiding the issue.
> 
> ==> Starting package_linux-upstream-headers()...
> Installing build files...
> tar: Module.symvers: Cannot stat: No such file or directory
> tar: Exiting with failure status due to previous errors
> Installing System.map and config...
> Adding symlink...
> ==> Tidying install...
> 
> (coming from scripts/package/install-extmod-build)
> 
> linux-upstream-headers also contains .config and System.map which are
> useful without modules.
> So either we completely disable linux-upstream-headers or skip
> install-extmod-build when CONFIG_MODULES=n.
> And maybe move System.map and .config to some other package,
> which would then deviate from the original PKGBUILD.
> 
> Neither option feels great, but it probably won't make a big difference.
> If you have a preference, let's go with that.

Thomas, Masahiro,
Thanks for the feedback. It seems that System.map and .config are commonly
included in -header Arch packages. To avoid deviating too much and to address
the issue with install-extmod-build when CONFIG_MODULES=n, how about considering
something like this:

mkdir -p "${builddir}" # needed if install-extmod-build is not run
if grep -q CONFIG_MODULES=y include/config/auto.conf; then
	echo "Installing build files..."
	"${srctree}/scripts/package/install-extmod-build" "${builddir}"	
fi

echo "Installing System.map and config..."
cp System.map "${builddir}/System.map"
cp .config "${builddir}/.config"

Thanks,
Jose

