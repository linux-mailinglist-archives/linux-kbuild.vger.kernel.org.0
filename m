Return-Path: <linux-kbuild+bounces-2254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C29184FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 16:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 117F01C21565
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 14:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BAF186285;
	Wed, 26 Jun 2024 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byk0MkZk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1EB185E46;
	Wed, 26 Jun 2024 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413807; cv=none; b=fgnMO6dtyMMltfZnhQT8dw7TN75TwtZtDL28JXuyzMyA1D6ecfHGSfso/1ZVHi0ig+JoCiSWblYe/r2dUGZUETOb6AKfAMUmbEEuWKJWLo1q0tPdsdlud4RlmpXzh67ZO1MY3NvXUOxieaIxBOL7uc1IaJPJ5/E7whvVXwDGcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413807; c=relaxed/simple;
	bh=HuskmBXBG3RcxnQtkWJKU/JjI3SQo//j+Sgi+qbxiik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+L+khH3aY2TsEed428cI+FaBP6lnflDT36J1rR9EOwfyGr5BltrY/cnUh5wa8KO8zbR0bZ4W42Uiskum/h1hHNqfZlHKpYzFLPnr0f4aRtWIwHHfWOKHM4vlxymsVRgiEsPAinpuVi/2RfAEIyxFYjSNTp3GZTVtu/7XZlGJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Byk0MkZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F99AC116B1;
	Wed, 26 Jun 2024 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719413806;
	bh=HuskmBXBG3RcxnQtkWJKU/JjI3SQo//j+Sgi+qbxiik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Byk0MkZkZMqGvpxGkwXylMUo4dYXs3nhH4OUpMWlXgUrxrwniY0Y2qZo0lVVBN9Rx
	 haKjRpcZOpIefhUsj5lRlAAThwSAEnGQLERkgGV+PggWrE3iBMDTRJBnUjEiQ4QOTC
	 vjPOPbw+2oj4mDohG7i/KkBN44LLgFxI4ipF/ZoW7mgkmL8SCXz7GX4oEqeiqTjCgv
	 W+wncc2ZQrp8pP45750/XpGV7KKQ3/Gi9vQwYMACk3ODOupVM73SHUiyDYrCzPP5du
	 UiyOILqPmU9PCePjCXclvK80Ob/hDWpp8M+PMG1dWS5uMwNkwZKCVGA4SjKhfJWjvs
	 TtkS070f17DHQ==
Date: Wed, 26 Jun 2024 08:56:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] kbuild: verify dtoverlay files against schema
Message-ID: <171941379329.3079760.8888191953810274742.robh@kernel.org>
References: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>


On Mon, 27 May 2024 14:34:24 +0300, Dmitry Baryshkov wrote:
> Currently only the single part device trees are validated against DT
> schema. For the multipart schema files only the first file is validated.
> Extend the fdtoverlay commands to validate the resulting DTB file
> against schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  scripts/Makefile.lib | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Applied, thanks!


