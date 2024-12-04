Return-Path: <linux-kbuild+bounces-4997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF09E4867
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 00:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C640D282C2E
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 23:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D821A8F61;
	Wed,  4 Dec 2024 23:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fs4E/bc6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F61917D7;
	Wed,  4 Dec 2024 23:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353642; cv=none; b=Et44SGZrQInRcaz0Wyl5d7ErdGICJozn2R3Iv9IOBFEmNiq+jYVYStKCIc5IVy6rc0QdptYvYZCIoZ02piC4OqZZBCmBgkp/L2+c8h1IOXk3kA9tcN1tRZYTu9nNo1/UI9aBCk1sGFXqnWfBf9gtlcoIApr/31k/IvHGUPLg+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353642; c=relaxed/simple;
	bh=OMN2IFSUiKKrufELvPCeQ45Asb0k1nPnIEIFNMCPGCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKCh6aY3uJk59tzzcFP7guZoICqPrKPvu1KtqYefQKlA1s+adiCo94Z9Fdd8g0xXXDYOx6lIrcfTOuLY81ni+8smlZYrBwtf6/ybrLo9cnLQRi1CvUqVkmFpieYfdeiavsvEOabld9vxOZo3oatZA3DRWMRc283NDiwop/DhgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fs4E/bc6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76290C4CECD;
	Wed,  4 Dec 2024 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733353641;
	bh=OMN2IFSUiKKrufELvPCeQ45Asb0k1nPnIEIFNMCPGCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fs4E/bc6JHOFacKvtGTQdWSOCzr4ShViz2jCviiAQ3ECqIwxoKLV3KeIoFeGrJx5/
	 efGrr4PceciPtadid/p3h8hK4hdq8Lt2PfwT3oNl0FkIu9Z/6yO7D1B6Ge0r4XkEBB
	 0ocy/eE69NlAd+IzhOkUxjPb9l4dAHDgGPFk1POXPDGm3ZFZk3vU8M0NFMsLODSINm
	 W2mo2tPf0NOg0fM27dNdsYcp6baMJS8OcRozKPwudhQht52EOXibUw3npciURf5FGl
	 qm1pmVHNlabs7bn/cjbqqMiP3J/IOzHDPizwynhFADPa6x6EtPcytT3wS95YQxnF6d
	 mOSpwVHmq5dUQ==
Date: Wed, 4 Dec 2024 15:07:20 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Message-ID: <Z1DgqAb2wnlDjnLR@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <20241028034949.95322-2-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028034949.95322-2-ole0811sch@gmail.com>

On Mon, Oct 28, 2024 at 04:49:39AM +0100, Ole Schuerks wrote:
> PicoSAT (https://fmv.jku.at/picosat/) is the SAT solver used in this

PicoSAT [0] ... etc etc..

Then at the bottom you use the tag:

Link: https://fmv.jku.at/picosat/ # [0]

> project. It is used as a dynamically loaded library. 

OK

> This commit contains a

Obviously this commit exits... be more imperative...

> script that installs PicoSAT as a library on the host system, a source file
> that provides a function for loading a subset of functions from the
> library, and a header file that declares these functions.

Just say something like:

Add PicoSAT dynamic library support to kconfig. Support for this will be
used subsequent patches.

> +static void load_function(const char *name, void **ptr, void *handle, bool *failed)
> +{
> +	if (*failed)
> +		return;
> +
> +	*ptr = dlsym(handle, name);
> +	if (!*ptr) {
> +		printd("While loading %s: %s\n", name, dlerror());
> +		*failed = true;
> +	}
> +}
> +
> +bool load_picosat(void)
> +{
> +	void *handle = NULL;
> +	bool failed = false;
> +
> +	/*
> +	 * Try different names for the .so library. This is necessary since
> +	 * all packages don't use the same versioning.
> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(picosat_lib_names) && !handle; ++i)
> +		handle = dlopen(picosat_lib_names[i], RTLD_LAZY);
> +	if (!handle) {

This just deals with the first error and there is no unwinding, is that OK?

Other than that, did you run this through checkpatch.pl?

 Luis

