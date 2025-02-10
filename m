Return-Path: <linux-kbuild+bounces-5696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA0A2F1E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 16:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA53188618F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 15:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718624BD0E;
	Mon, 10 Feb 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlVyYTuR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69D24BCE4;
	Mon, 10 Feb 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201870; cv=none; b=jGLPdQcpnc7XZHN/HdFtF+XEE/CN12ZzLuJATJeTjCYM5rw14cNlPEJsnGY//M5jEhm6cKHIWRGziAwkDNswfdJ8aNqNAHi7Tckkf2DciQWXaFWIGtdkP95AWFc58e4VCwT/IbBxHP55/nGIbJN6fYHQBip1tDoygOGXqIbS2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201870; c=relaxed/simple;
	bh=ypH5wZbIAKwTCy9QnimeezutxVPhezXvZ1cfReovsio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBcJnzX/c3h5lEMAx2sH0AJoEyzkYvz/Gew8dpGUhRuoqH5UOVSQUxSsytk9U/LxwVQPao7MjfKYW48q01XtRhO8DdCWnh1EaZ9UGkFByFVNj/C408MVx2W3muQRFO4+b6P6G3ehz3QKBxkHYGE2ZbZl2MxXENVFLMeyTv+Oodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlVyYTuR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FBEC4CED1;
	Mon, 10 Feb 2025 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739201870;
	bh=ypH5wZbIAKwTCy9QnimeezutxVPhezXvZ1cfReovsio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlVyYTuRGS37f73ocwTC3/EYtAU0nnRcIhMBFvqW0SdlGD4e6AHAADTldcuvUvERY
	 YjDXDhNWOGRheZfDM7fQ3d2nKQEGmbczQZPw6VqsOcctbRTEKS4kgpunylBzURobTc
	 xSZqn34gjUJuAV0GsKg9rkpg6StZ4V3jEdK4HlI9wI4NfHt8uB+pwayD47dUkabeEt
	 fcOGxLYfZi3QAIqWEmERZv982hsdCMl/U4g1dYTp+Hk14G9l7dVmASAA+TJBvf+ePL
	 /r/Lb/nDoRB7n4WWArLhEgyZsfW9k1Hbcg2rqsjPB7MQjfUzn1JrA550wQBKHkzeD6
	 B/bzSsLbcPVqw==
Date: Mon, 10 Feb 2025 07:37:48 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v7 01/11] kconfig: Add PicoSAT interface
Message-ID: <Z6odTBbLvTTnaSII@bombadil.infradead.org>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <20250208163959.3973163-2-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208163959.3973163-2-ole0811sch@gmail.com>

On Sat, Feb 08, 2025 at 05:39:49PM +0100, Ole Schuerks wrote:
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
> +		printd("%s\n", dlerror());
> +		return false;
> +	}

This will only detect an error if the last dlopen() failed.

Other than that:

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

 Luis

