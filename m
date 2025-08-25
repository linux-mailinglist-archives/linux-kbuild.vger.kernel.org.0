Return-Path: <linux-kbuild+bounces-8576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 070ECB345D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 17:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC175E50EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB4C2FCBF1;
	Mon, 25 Aug 2025 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HudmS/JH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D020CCCA;
	Mon, 25 Aug 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136042; cv=none; b=dD301duUV01Zjdb/AG1zVX4hWFVBYISAifI+lDqwf7VfEEPCGL4uNTJV6AVOQBBX4S8TQ4wAhVAIurB+cDvMQiArMlE5VRhHuOH2kQaj2BF1/YrVtaYl3hDzOpJjJcjYn8pEgLfgcyuDPtqnEjzL04iImojBlL+Ui2uhbkr9YpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136042; c=relaxed/simple;
	bh=3MHuUrJA85kZg9pqQ9ja7UgU1fGiFhs/ppzPxlxFgxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXAaOkZ6FXsGuMyyMZ2cfGg50o2fNKzd32dctdO+X9R/dPSKJI2bbu1Eh7wrIg0np3hdwbJ6AOpTm1lt29/hJBTYAtu+bqAbS2zsffQstY6PUZWKqOh0i5boXtsSaLp7C/EILQ5D5inJAGVK9Xo0SxFrDytLkbQIlgbAAXRnetk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HudmS/JH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889BDC4CEED;
	Mon, 25 Aug 2025 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136041;
	bh=3MHuUrJA85kZg9pqQ9ja7UgU1fGiFhs/ppzPxlxFgxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HudmS/JHfspDfBCzO62hEaLPbXPLtHOHCdGNnxZGXjNsiP8MMHrCtKMHPb+7rh/rY
	 bb8xttodiZxiBiOqINmw/uL5wi2A0DTgwuxpgB8y1rUwfUMlWzaIlLxmrwL5ctYptR
	 vGmtTUhT9sCFB1yXE22v/wpDLWvSd0GpkKiFL53qBbxTwdYNQEA60aiTPAhXX8LF7K
	 dvhIzCUyFWWG8UqL0WCQ9ntSnq9DneESU3MaGz7Vu/FcJVlv+Kc64/jFLhjAV5i8QW
	 K5YGs60Cvmgt2ECznzT/QPnGw5UInRPZ/Kau51i0RGgXsIRJuJCshQCRu/1S0G0qJQ
	 2R0a8O/FbHgBQ==
Date: Mon, 25 Aug 2025 08:34:00 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508250833.AB86A99894@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-3-kees@kernel.org>

On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
>  static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			    s32 *start_cfi, s32 *end_cfi, bool builtin)
>  {
> +	if (builtin)
> +		pr_info("CFI: Using standard kCFI\n");
>  }

Oops, this needs IS_ENABLED(CONFIG_CFI) && ...

-- 
Kees Cook

