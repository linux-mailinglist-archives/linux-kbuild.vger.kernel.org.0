Return-Path: <linux-kbuild+bounces-5481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C5A10D98
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 18:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2513A53C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 17:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE51CEAC8;
	Tue, 14 Jan 2025 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNFZ6VfT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F04232450;
	Tue, 14 Jan 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875474; cv=none; b=OktnL2/pzAJIds6TuMusI8W5QUe/ovJXGB2f8EPWY+UGyhi4hBBQ8tex0PrLXYBN+phAJd4299WXR33Yi0wcUOW5Iky8YdWt0jV3w9gwaEEbWnZuq8SpnqQCp7ArvW+tFiHQIRkcwcT16446vdx8TSX6S2dXbcfnh5uDDxrv/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875474; c=relaxed/simple;
	bh=t4Ueif6yH1kPwovoUCZbPsI4ARwO8tXQRpimGo4eGtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsNyjmjGqb55m3aeOeV0BdtB1eBxNLEMx2jGayF5XMtD4eFvEbZBVRjWesv/JScoIqBkzN4vDTKZGqFDmoGRuWGQ2wzV6sUm6arrUErXEU5YJ/k0A7RTht5MIcqJ+kbBm32PJJclxz85yzR7K7raHlZ7L9hOjc2hvwzLmnon5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNFZ6VfT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D066FC4CEDD;
	Tue, 14 Jan 2025 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736875473;
	bh=t4Ueif6yH1kPwovoUCZbPsI4ARwO8tXQRpimGo4eGtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNFZ6VfTDW0GSJDB8dFc4mfPSGphCLd7n2ytZA0M4gEa7KsSAYvQ9KSKJL75C8f1k
	 3Q28crhbpyiXAFi7JGx5UFb6RLgxNgUN4vtqzkKLoKXJr13LI7VW0xfAHd6jTtHH/E
	 cXd/uCQUozbfwGv6lw12eMaaX3J8cmuAbUtTyj1Ok/THIMSvzy4u/04ujtzZMcb5YE
	 /cBu6Nl04sCLTLVx/jsv87/hyLHxZREsXmKppQDo+Y+hmOJyNoysvvDCfoH1lscJlg
	 bUwy2AJdR5RPyT4/bf4Iho5CKsJrri91lTcx2EQgKwOWu6Ldpoikftpvv4Ng8d8mR6
	 f/YnBUTAz13QQ==
Date: Tue, 14 Jan 2025 10:24:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 1/2] objtool: Add --Werror
Message-ID: <20250114172429.GA246689@ax162>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250113-objtool-strict-v3-1-8b51f94957fb@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-objtool-strict-v3-1-8b51f94957fb@google.com>

On Mon, Jan 13, 2025 at 02:05:15PM +0000, Brendan Jackman wrote:
> At present objtool only prints to the terminal when observing "fatal
> warnings". This option lets you have it produce an error instead.
> 
> The use case for this is noinstr validation; so far I've never seen any
> false warnings here, but it quite often detects real bugs. It would
> be useful for the build to fail when I have those bugs.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  tools/objtool/builtin-check.c           | 6 ++++++
>  tools/objtool/check.c                   | 7 ++-----
>  tools/objtool/include/objtool/builtin.h | 1 +
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
> index 387d56a7f5fb8da8435d0a3f5c05eeee66932c9b..0b28082df90710ff7127327deb857c0548f378c7 100644
> --- a/tools/objtool/builtin-check.c
> +++ b/tools/objtool/builtin-check.c
> @@ -94,6 +94,12 @@ static const struct option check_options[] = {
>  	OPT_BOOLEAN(0, "sec-address", &opts.sec_address, "print section addresses in warnings"),
>  	OPT_BOOLEAN(0, "stats", &opts.stats, "print statistics"),
>  	OPT_BOOLEAN('v', "verbose", &opts.verbose, "verbose warnings"),
> +	/*
> +	 *  For now, don't fail the kernel build on fatal warnings by default.
> +	 *  These errors are still fairly common due to the growing matrix of
> +	 *  supported toolchains and their recent pace of change.
> +	 */
> +	OPT_BOOLEAN(0, "Werror", &opts.werror, "fail on fatal warnings"),
>  
>  	OPT_END(),
>  };
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 76060da755b5c51cda3a669d8245d7d004e25f22..e44135293eb45f908e00359d84d954cfeddd266f 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -4944,10 +4944,7 @@ int check(struct objtool_file *file)
>  	}
>  
>  out:
> -	/*
> -	 *  For now, don't fail the kernel build on fatal warnings.  These
> -	 *  errors are still fairly common due to the growing matrix of
> -	 *  supported toolchains and their recent pace of change.
> -	 */
> +	if (opts.werror && warnings)

It might be a good idea to print a message here about why the build is
failing, in lieu of turning all "objtool: warning:" messages into
"objtool: error:" messages ala -Werror for C compilers, which does not
seem simple on quick glance. Otherwise, I am not entirely sure it will
be obvious to people why a build like allmodconfig may start failing if
this configuration gets turned on.

https://lore.kernel.org/Z4X8j%2FqJj7ib0vkh@rli9-mobl/

> +		return 1;
>  	return 0;
>  }
> diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
> index fcca6662c8b4b5e0048e54fada8694cc2e6ebc34..97d668010efadfa05bb6e25e1967a7d72bf77815 100644
> --- a/tools/objtool/include/objtool/builtin.h
> +++ b/tools/objtool/include/objtool/builtin.h
> @@ -38,6 +38,7 @@ struct opts {
>  	bool sec_address;
>  	bool stats;
>  	bool verbose;
> +	bool werror;
>  };
>  
>  extern struct opts opts;
> 
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 

