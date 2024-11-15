Return-Path: <linux-kbuild+bounces-4688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F49CDBCC
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 10:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3681F235BF
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E004418E025;
	Fri, 15 Nov 2024 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="H+rlJYCa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483218C039;
	Fri, 15 Nov 2024 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663922; cv=none; b=OPxn8H18h1XWgyeeG9pF1DhI+aoQx5dCZCnhfLxxQhQrxLjL0TMpECaj7PxnYpcvadsBn/Ajc8lVt7S9o6cXsO31mb1DF89NwI4l+TBYTxwov0QWRdseYkNkSbmy5V7KfDHpYNBSjl9c4pO5XsjHccL0j9/3/M4NkOoCRBrgGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663922; c=relaxed/simple;
	bh=0Ua1gEH83HMJfF8a0QbWXqH0PMnUV9EK2uLfKohST4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE2s6E3k49uoVZ9gAtMu7dSjlZeTszXRRzqD1D+bXLLtEmLegr3lr8anVEhePtYAm4FtHiH6WzjvFCwLU+/4ZSwS2rh2MlAvWog2j3279ws/fAjkFEnWigYXQRKwfJi+cJRUXVUmKtzZjCkS+JPFW2o3QIxiWWtQSddpLE/ayD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=H+rlJYCa; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9516B1F9C1;
	Fri, 15 Nov 2024 10:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1731663916;
	bh=fXgpNCrCg0QJFZPc/cMFrQdCG+CEBjUIdZW8CrlxJRc=;
	h=Received:From:To:Subject;
	b=H+rlJYCaVhZDM2yw4dLNeax0ScF4CKrvIwUI5LWN2KJAXyBIBrzz7vE2LA+f07bkN
	 oloiYB65LBojBojUg/VFIZHNn+aSvPW6oYtRMgmio8B62LfeRUxxUppBefSCvF4fvW
	 ddfOY4cCdebrIQ0Pt8u7qxSrsGQyAEuqXwpSlsAEkBSiB5vLNmvJy0my8YlHDOBa7/
	 cwx7f0vzWHGrAFttAg+4m5m2QB1zHRQCplvKJiILJvrAd1HEfkBf4D8fBMl3R+9M7/
	 U4A+uXIcR++NqTNUypl6l59ib1YQeUoGkbmkxhUmQO57s2fFV04eADR2MYxCd4aF/y
	 eZh0K3QnrXqaQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 398B57F949; Fri, 15 Nov 2024 10:45:16 +0100 (CET)
Date: Fri, 15 Nov 2024 10:45:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg KH <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Parth Pancholi <parth105105@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh>
 <20241115083940.GA3971@francesco-nb>
 <2024111541-antiquity-footpath-e221@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024111541-antiquity-footpath-e221@gregkh>

On Fri, Nov 15, 2024 at 10:22:13AM +0100, Greg KH wrote:
> On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> > On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > 
> > > > Replace lz4c with lz4 for kernel image compression.
> > > > Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> > > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> > > > and lz4c have been packaged together, making it safe to update the
> > > > requirement from lz4c to lz4.
> > > > 
> > > > Consequently, some distributions and build systems, such as OpenEmbedded,
> > > > have fully transitioned to using lz4. OpenEmbedded core adopted this
> > > > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> > > > lz4c"), causing compatibility issues when building the mainline kernel
> > > > in the latest OpenEmbedded environment, as seen in the errors below.
> > > > 
> > > > This change also updates the LZ4 compression commands to make it backward
> > > > compatible by replacing stdin and stdout with the '-' option, due to some
> > > > unclear reason, the stdout keyword does not work for lz4 and '-' works for
> > > > both. In addition, this modifies the legacy '-c1' with '-9' which is also
> > > > compatible with both. This fixes the mainline kernel build failures with
> > > > the latest master OpenEmbedded builds associated with the mentioned
> > > > compatibility issues.
> > > > 
> > > > LZ4     arch/arm/boot/compressed/piggy_data
> > > > /bin/sh: 1: lz4c: not found
> > > > ...
> > > > ...
> > > > ERROR: oe_runmake failed
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > 
> > > What bug does this resolve that it needs to be backported to stable
> > > kernels?
> > 
> > This is not solving any existing actual bug, and therefore there is no
> > fixes tag.
> > 
> > The issue here is that the kernel build system is using lz4c, that is
> > deprecated since 2018, and now distributions are actively moving away from it. 
> > 
> > openSUSE Tumbleweed and OE already removed it, so you would not be able
> > to compile a stable kernel on such distribution when using lz4 unless we
> > backport such a patch.
> > 
> > Everything should be properly documented in the commit message already.
> > 
> > My understanding is that something like that would be a reason for
> > backporting to stable, if my understanding is not correct we'll remove
> > the cc:stable and send a v3.
> 
> Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for what meets stable kernel requirements.  I don't think that this
> patch is that.

Greg, ack.

Masahiro, can you please let me know if we should send a v3 with the stable
tag removed or you can remove it yourself when applying?

Francesco


