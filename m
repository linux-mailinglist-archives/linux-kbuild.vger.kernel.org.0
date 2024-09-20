Return-Path: <linux-kbuild+bounces-3655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B597D495
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 13:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06AB81F2240C
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4838913C67A;
	Fri, 20 Sep 2024 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVa9FZTk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C2482CD;
	Fri, 20 Sep 2024 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726830699; cv=none; b=FIJK6O/ffYAA2s4N6pGyFZDwpMzoRurG3ohICVDE4WXMOrrg5ZJdz0QBTwv44g/dUVrQOAk1zoiOHItSBFdx4jdBlbYQ1XoeSs4RJg1uHvCOeAqMktE7cc9OATLHOLGNH3QOfJycoC3MPMMUNzMzvBq3Q9MtFAUxSfdfqSWB6Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726830699; c=relaxed/simple;
	bh=17QOsE4ej7ALTY7Ol2haSsmj3Upr7FvwHWa70F8PVlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XATcOPxlkIr1MmF3nGveZH2PJHwftJMrsNVvBBIUx1BFISN9/T5KLKpqa6g/5YWRlpHdRvyIr4/uMCtEbQN/PJC5vf24HDVZ/KAEE5yeX2E7RKrv3PxwX0+iRwyG/fUMYnPhW8et2KL0tS2EfgHfTmDtr6m+aRLNX710s6u5Hgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVa9FZTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFB1C4CEC3;
	Fri, 20 Sep 2024 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726830698;
	bh=17QOsE4ej7ALTY7Ol2haSsmj3Upr7FvwHWa70F8PVlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVa9FZTkSWb+tv7DiRXZsnpXP/VaO1O5ZynttCU8ekpQlJD/hkLzlED3Qupvp1mzq
	 HA49+cijUdsgCoptAiiX35eHGrlOVXipDZc6SjHDSh18HWYKBbkMFroYgeoeHWJch9
	 3TAhqRYLTjRQh1grUfYMlbAhxsHstr2ALV0RnHHaCPJletbivetRF4ecT2YzwtCW2R
	 NC91KGzoyydsB38TxN13ZN6Ma8bDmWxZ4q+SxHcYyRrPXd2twi8rDLXcm9wxDqV0T8
	 WqHotqaG5my33gUAZU6xH+YBC3MzhVjIkmyzNZkF8pspNDbNfgZWujuyBnv1Ei9XsD
	 cb/r8HN9mNZig==
Date: Fri, 20 Sep 2024 04:11:36 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v5 01/11] kconfig: Add PicoSAT interface
Message-ID: <Zu1YaCDMtumhAmHc@bombadil.infradead.org>
References: <20240920085628.51863-1-ole0811sch@gmail.com>
 <20240920085628.51863-2-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920085628.51863-2-ole0811sch@gmail.com>

On Fri, Sep 20, 2024 at 10:56:18AM +0200, Ole Schuerks wrote:
> diff --git a/scripts/kconfig/install-picosat.sh b/scripts/kconfig/install-picosat.sh
> new file mode 100755
> index 000000000000..aadfa9582ecb
> --- /dev/null
> +++ b/scripts/kconfig/install-picosat.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +psinstdir=$(mktemp -d)
> +if [ $? -ne 0 ]; then
> +	echo "mktemp failed"
> +	exit 1
> +fi
> +cd $psinstdir
> +wget "https://fmv.jku.at/picosat/picosat-965.tar.gz"
> +tar -xf picosat-965.tar.gz
> +cd picosat-965
> +cp makefile.in makefile.in2
> +# change soname to conform with packages for Debian and Fedora
> +sed -e "s,-soname -Xlinker libpicosat.so,-soname -Xlinker	\
> +	libpicosat-trace.so.0," makefile.in2 > makefile.in
> +./configure.sh -O -t --shared
> +make libpicosat.so

Imagine if the kernel did the same thing for all the libraries we use,
so this is just not scalable. Instead it would be better for you to
intent to package this onto something like debian as a library for
picosat, once and accepted then your tooling would just detect if its
present and if so use it.

  Luis

