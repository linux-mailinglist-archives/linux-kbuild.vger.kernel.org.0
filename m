Return-Path: <linux-kbuild+bounces-3052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8549551FD
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 22:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F304F1C21628
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 20:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050A139D0B;
	Fri, 16 Aug 2024 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m25jHj7Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B800A8063C;
	Fri, 16 Aug 2024 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723841119; cv=none; b=fShhbxARYevDQLrkt2o/HBQ0Lry8FppMtXaQQdx61+Up16XwHmuoksZwmzFasTwiD3brkomG3RlaeHarrv8jO3loZo/nuSKYcdCEAltKiYxNly79T+/59X4LxI7liymxT5DbdHsWzkS/+0etyj4NrWj18P6Un7KDosPhnHHNRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723841119; c=relaxed/simple;
	bh=N/JyokGH+tPr2BMzeR+H499TQsBvQFqmDh7BFpQM2co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myC2zp5FTMr3EJjT9vSoVycoiHQ9qF6i2I/BVArTQlc1t4hD4PWJKa+1MSge4uRXk9fodcwGEPvp9GFrhGpqhPNh+vpkp9BYwgtBfwEsUkD/nc86uPrWhxY+y9BDzHxOGUBexeoH/LlV8lMAUpETkuGuzoKKyz/sWXz9y5THXZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m25jHj7Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F75C32782;
	Fri, 16 Aug 2024 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723841119;
	bh=N/JyokGH+tPr2BMzeR+H499TQsBvQFqmDh7BFpQM2co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m25jHj7YDUN2OC6zQnru9WMygOq1Ip1iWJJ3FCGHwHn/MqND6xcxFTkBJNBVssmNs
	 gSNX7Pab+3mmF088QAAbrFOItbCktrSoaWixa1bD3S9CcenINLurwMorAqARrSY4y6
	 tqR98wnGJ8EK6kApoP//31gSBhj73/7FG7dF3j3/zMcCOSSY5zvsBl0AQs22l33wmd
	 tRQ5nMSoBfgr8ORCW9XJUnPVz/9HiW9+PlExRywDcro2Vt7nraICdJyX13SC42MkDt
	 YLeWCer2kf7tcfdzkFOj5HEdkc80WKIZaL0V+jHIad1CRu10Q6LNeEKKWxvir070oD
	 mnDzcxMUFy86w==
Date: Fri, 16 Aug 2024 13:45:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2] modpost: simplify modpost_log()
Message-ID: <20240816204517.GB3870443@thelio-3990X>
References: <20240816134443.1183732-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816134443.1183732-1-masahiroy@kernel.org>

On Fri, Aug 16, 2024 at 10:44:29PM +0900, Masahiro Yamada wrote:
> With commit cda5f94e88b4 ("modpost: avoid using the alias attribute"),
> only two log levels remain: LOG_WARN and LOG_ERROR. Simplify this by
> making it a boolean variable.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Changes in v2:
>  - Fix reversed logics
> 
>  scripts/mod/modpost.c | 17 ++++++-----------
>  scripts/mod/modpost.h | 11 +++--------
>  2 files changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3e474291258c..a27d1b5ce3c6 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -67,20 +67,15 @@ static unsigned int nr_unresolved;
>  
>  #define MODULE_NAME_LEN (64 - sizeof(Elf_Addr))
>  
> -void modpost_log(enum loglevel loglevel, const char *fmt, ...)
> +void modpost_log(bool is_error, const char *fmt, ...)
>  {
>  	va_list arglist;
>  
> -	switch (loglevel) {
> -	case LOG_WARN:
> -		fprintf(stderr, "WARNING: ");
> -		break;
> -	case LOG_ERROR:
> +	if (is_error) {
>  		fprintf(stderr, "ERROR: ");
>  		error_occurred = true;
> -		break;
> -	default: /* invalid loglevel, ignore */
> -		break;
> +	} else {
> +		fprintf(stderr, "WARNING: ");
>  	}
>  
>  	fprintf(stderr, "modpost: ");
> @@ -1697,7 +1692,7 @@ static void check_exports(struct module *mod)
>  		exp = find_symbol(s->name);
>  		if (!exp) {
>  			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
> -				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
> +				modpost_log(!warn_unresolved,
>  					    "\"%s\" [%s.ko] undefined!\n",
>  					    s->name, mod->name);
>  			continue;
> @@ -1720,7 +1715,7 @@ static void check_exports(struct module *mod)
>  			basename = mod->name;
>  
>  		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> -			modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
> +			modpost_log(!allow_missing_ns_imports,
>  				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
>  				    basename, exp->name, exp->namespace);
>  			add_namespace(&mod->missing_namespaces, exp->namespace);
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index f756e6578b9e..6f418f0afd04 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -184,13 +184,8 @@ char *read_text_file(const char *filename);
>  char *get_line(char **stringp);
>  void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
>  
> -enum loglevel {
> -	LOG_WARN,
> -	LOG_ERROR,
> -};
> -
>  void __attribute__((format(printf, 2, 3)))
> -modpost_log(enum loglevel loglevel, const char *fmt, ...);
> +modpost_log(bool is_error, const char *fmt, ...);
>  
>  /*
>   * warn - show the given message, then let modpost continue running, still
> @@ -205,6 +200,6 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...);
>   * fatal - show the given message, and bail out immediately. This should be
>   *         used when there is no point to continue running modpost.
>   */
> -#define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
> -#define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
> +#define warn(fmt, args...)	modpost_log(false, fmt, ##args)
> +#define error(fmt, args...)	modpost_log(true, fmt, ##args)
>  #define fatal(fmt, args...)	do { error(fmt, ##args); exit(1); } while (1)
> -- 
> 2.43.0
> 

