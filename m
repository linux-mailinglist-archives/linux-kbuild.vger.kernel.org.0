Return-Path: <linux-kbuild+bounces-9439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E10AC3F5AD
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 11:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E6944EA065
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7B22FD1B1;
	Fri,  7 Nov 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDRSG4CO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3D26ED59;
	Fri,  7 Nov 2025 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510432; cv=none; b=esroVION0fy9oa0Zq+0lXh+PBOJgFw/N94Yh8gyMKKyNFW67btlHnaHgtTEXgioIrEG1FLGuOkg04gozBqU3+EKAtWgu4D3gv1BsK+sMJee+WoQrZNRazzWE1ateTkx1PXayU+SdYsSRZJfyrvpDm1Swy09M6Ox3PoAqldwAF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510432; c=relaxed/simple;
	bh=gsDUbgjVK8+TvaCnc3zal5eDg2DK48XrnAG217wn69M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQZ2uxIrpjhCLZ8kMPhOfZNtqFyg+X5+rbU/CjpHutmC75QsRtbkupYh1Isy54C1qaTq11fIuhNC+YEObCgXUnOX7M5Sa1bBJdPs7y7rgeSE3lv9EXlokjBfK2s3NAarqTtaiaaApi04HuVMAMUVp/K03w5mOAoExYduM/fd3F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDRSG4CO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE84C116B1;
	Fri,  7 Nov 2025 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762510431;
	bh=gsDUbgjVK8+TvaCnc3zal5eDg2DK48XrnAG217wn69M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDRSG4COSQUoEMDU/xLaAjitdc5qYIsv9LmFdRZ4mR7rfU7UWVos80w5hXNczYNUE
	 q1DFdCmBMzSkSGBl8dJiu+S4PU86KhaNxBzCnLw71D0Pz6qmDlTj0XY9mAtUCCn/1V
	 h1RU9SL+ujcFg69zzn7GZMv0xl4XESrUxNTjWsyHydxIo3qgrtrK9GTGzcdLKvRn5T
	 duBeoGNrVHquZB38B1i6BuKML5WUujORK2CH5r/G8GHFlRr3Vy0BaGGmRhjwzMvSOp
	 TRAkKpvI3+H5RG7PiHgbKanXwmX9Wgc/udtQWsLH1Ijfz0gvR5aHbwdCXW8h7GQTS7
	 Q0P/ktuVkB8xw==
Date: Fri, 7 Nov 2025 07:13:42 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107071342.52ed6437@sal.lan>
In-Reply-To: <c0e4a0b0-b7c9-491b-ada3-74945fb2e3d9@infradead.org>
References: <20251103131419.5e504ae2@endymion>
	<20251103185609.GB672460@ax162>
	<c0e4a0b0-b7c9-491b-ada3-74945fb2e3d9@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 3 Nov 2025 11:00:51 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi,
> 
> On 11/3/25 10:56 AM, Nathan Chancellor wrote:
> > On Mon, Nov 03, 2025 at 01:14:19PM +0100, Jean Delvare wrote:  
> >> It is possible to force a specific version of python to be used when
> >> building the kernel by passing PYTHON3= on the make command line.
> >> However kernel-doc.py is currently called with python3 hard-coded and
> >> thus ignores this setting.
> >>
> >> Use PYTHON3 to call kernel-doc.py so that the desired version of
> >> python is used.
> >>
> >> Signed-off-by: Jean Delvare <jdelvare@suse.de>  
> > 
> > I see one use of KERNELDOC in tools/docs/sphinx-build-wrapper that would
> > appear to break with this change? Does it matter? I am not familiar with
> > the docs build. Otherwise, this seems like the correct thing to do.  
> 
> I think there has been some discussion of these matters on the linux-doc
> mailing list (adding it here).

Yes. The way the current building system works, after the discussions,
is that:

1. Makefile runs sphinx-build-wrapper, which is a python script, using
   this target:

    htmldocs mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
        $(Q)PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
                $(srctree)/tools/docs/sphinx-pre-install --version-check
        +$(Q)PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
                $(PYTHON3) $(BUILD_WRAPPER) $@ \
                --sphinxdirs="$(SPHINXDIRS)" $(RUSTDOC) \
                --builddir="$(BUILDDIR)" --deny-vf=$(FONTS_CONF_DENY_VF) \
                --theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)

2. sphinx-build-wrapper will run sphinx-build with the same python
   version it was called;
3. Sphinx kerneldoc.py extension will directly call kernel-doc
   classes, meaning that it will use the same python version as
   sphinx-build. There, it will use KERNELDOC var *only* to check if
   it ends with ".py", as there is (still) a fallback code there to allow
   running a different script via fork.

On other words, if one wants to run a different python version, it has
to do:

	make PYTHON3=/usr/bin/python-3.11 htmldocs

This should work for doc builds.

Please notice, however, that kERNEL_DOC env var is also called at some
DRM makefiles. Perhaps the issue you're getting is there.

Regards,
Mauro

> 
> >> ---
> >>  Makefile |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> --- linux-6.17.orig/Makefile
> >> +++ linux-6.17/Makefile
> >> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
> >>  
> >>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
> >>  # has a logic to call it
> >> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> >> +KERNELDOC       = $(PYTHON3) $(srctree)/scripts/kernel-doc.py

This is not the right place to add it, as it may break the Sphinx 
extension.

> >>  export KERNELDOC
> >>  
> >>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> >>
> >>
> >> -- 
> >> Jean Delvare
> >> SUSE L3 Support  
> >   
> 

