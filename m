Return-Path: <linux-kbuild+bounces-4967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4E9E230D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 16:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4F96B65F3A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30F1EE006;
	Tue,  3 Dec 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emF1J0GU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49871E32CB;
	Tue,  3 Dec 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234386; cv=none; b=tbgrLP5J0XV1RhTI6r0mYdoS7FQDcrq3GZXhS9Dqsn2I2bZ0rfdp0g45xdcDnIen9BNNbY7tFHwv0lnxeLzAfqPflacw2sItN4eZqOmzcGdtyIx3KGJ/X26CEcde24y0XVqTkY/ljTIOs1xEFNrhM1D43UKO7gRD7gPOwelYS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234386; c=relaxed/simple;
	bh=LjPcE93nS8srOepOdWDgsIrsPff/dVPGSA7vrvWl9Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wy3ciy603JSopCN0p1RTlU0COqZHrm4mb/M8in3/qKpIgc5rxtVdPdOe/6ne3oyQ0WzmHMZ1E8snHMklkWY8m9sEOqZFFZmb1eBHYEm/rsLUE1/Dtf60yGBVYmrfe0uHV5CWvchDa30WgNahZr79WIU+uQsQp8wvx+d4poQVsbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emF1J0GU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8342DC4CECF;
	Tue,  3 Dec 2024 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733234386;
	bh=LjPcE93nS8srOepOdWDgsIrsPff/dVPGSA7vrvWl9Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emF1J0GUUTMvYbvn1TcEoRcqh1xSD6oX+9ZkCoOuzraz0njX5h9Syg5DtTzyulbKk
	 DIX9974JfCV/V0VufxON3dIrBSnv4Imgc5hHZY6gmlm8NbFu4NBOUnx3T2uRomiyDe
	 Mdn/aHA42fo9Gb4lGg8cV543u56daWql0d7exPLgHuo4qkDOFkUHFLR24sx6hBGbhH
	 Hl85yDOWrNE6ZgCNGvK3WGoBmc8PF1LH2jXPDBE/MVELmtt9XRpWXK9kyXz7yj6icc
	 IxbHJiwi44RSUzDhMdtj6TR+kT8lXwpvZ1mmv2ZOla0WQWFC6p2JE4A4cyF7uWtyzd
	 8WqTCZVjAv0AQ==
Date: Tue, 3 Dec 2024 15:59:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
Message-ID: <20241203135941.GJ1245331@unreal>
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>

On Tue, Dec 03, 2024 at 03:55:18PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Builds with -s option (silent) are supposed to silence all output
> which is not an error. It is the case for target builds but not
> for configs. These builds generate prints like this:
> 
> ➜  kernel git:(rdma-next) make -s defconfig debug.config
>  Using .config as base
>  Merging ./kernel/configs/debug.config
>  #
>  # merged configuration written to .config (needs make)
>  #
>  ...
>  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/configs/debug.config:
>  Previous value: # CONFIG_FUNCTION_TRACER is not set
>  New value: CONFIG_FUNCTION_TRACER=y
>  ----
> 
> Let's honor -s option and hide all non-error output.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  scripts/kconfig/Makefile        |  3 ++-
>  scripts/kconfig/merge_config.sh | 18 +++++++++++++-----
>  2 files changed, 15 insertions(+), 6 deletions(-)

Masahiro,

I hope that you don't mind that I put "rdma-next" as a target. It wasn't
intentionally, and bug in my submission scripts.

Thanks

