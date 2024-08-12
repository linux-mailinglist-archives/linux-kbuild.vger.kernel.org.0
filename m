Return-Path: <linux-kbuild+bounces-2959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08E94F8EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 23:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B951F22E83
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 21:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E23A19413E;
	Mon, 12 Aug 2024 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/UaLXr8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392418E022;
	Mon, 12 Aug 2024 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723497779; cv=none; b=HgxYKxdA0dn+FEgiByMOSf38pkxyl/RC+7MlVQWsYsYhIGAFGDZGncg6la3jmLX0PFL7UzBMX9j3xxrGW5Mcobn+jIh9PaV5Ei9/HaINt2+KvK6syfBkEWylb/9lptslUoX6ZYnM2tFAyQf2hF5EvmXMlYTj1ZCNMAH3m5csb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723497779; c=relaxed/simple;
	bh=qcCp9jeZiU3lTpiRVYh4I1XVj9Y/08xHuLt7L7IjYyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3YeqjSUNsiSjDu/JKVPIsedGxudQXS276g7oSCu0rP2J3MHqUdkmaXnhke/X3X0VWkFmbWY+eaZxQelTqKOAhOx2U6E0bjOi3kHIdZ6TXmYEC25eSjMlmfZNOS25MZTGKrJJiqXgpuZeQC4IoNWysjk4hzhsfGYYzR/Z8n3CpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/UaLXr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA45C32782;
	Mon, 12 Aug 2024 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723497778;
	bh=qcCp9jeZiU3lTpiRVYh4I1XVj9Y/08xHuLt7L7IjYyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/UaLXr8Fmk87PSsZnZqfOvz3CQmxATpET1ejxQhJkOq0C2QZGV35S+7gPRJFJ4Ie
	 x02DMbpQCFfVp6fPFb5GsRJSJ6OfdxhQopjfklXQaP+9co4ZCxQnyC5WewuoShZra1
	 IGFXPnPJjXJyU1T46drXsRs/AvzlUZ0xwnQwaN7E8wQh9kYhDoTv6v3k2JpluQw9tL
	 iFPW415n5MYvo9KAc4X1D3apmAchzboiniAzcYNnXnx9CPKmJBMDd/uextFGcwMOCk
	 9rKZO9mCd225DL/gc6ygo43sV9KGNnHW6FtPaNj3k7E5CeujlV3CZqV3EBF5xaWqKi
	 UKKLKHd38N3KA==
Date: Mon, 12 Aug 2024 14:22:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] modpost: simplify modpost_log()
Message-ID: <20240812212256.GA3675407@thelio-3990X>
References: <20240812144542.2121342-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812144542.2121342-1-masahiroy@kernel.org>

Hi Masahiro,

On Mon, Aug 12, 2024 at 11:45:39PM +0900, Masahiro Yamada wrote:
> With commit cda5f94e88b4 ("modpost: avoid using the alias attribute"),
> only two log levels remain: LOG_WARN and LOG_ERROR. Simplify this by
> making it a boolean variable.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/mod/modpost.c | 17 ++++++-----------
>  scripts/mod/modpost.h | 11 +++--------
>  2 files changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d0f138803207..c896872862dc 100644
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
> @@ -1692,7 +1687,7 @@ static void check_exports(struct module *mod)
>  		exp = find_symbol(s->name);
>  		if (!exp) {
>  			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
> -				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
> +				modpost_log(warn_unresolved,

I think the logic is reversed here? If warn_unresolved was true before,
LOG_WARN would be used but I think warn_unresolved being true with this
change would trigger the behavior of LOG_ERROR. Should it be
'!warn_unresolved'?

>  					    "\"%s\" [%s.ko] undefined!\n",
>  					    s->name, mod->name);
>  			continue;
> @@ -1715,7 +1710,7 @@ static void check_exports(struct module *mod)
>  			basename = mod->name;
>  
>  		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> -			modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
> +			modpost_log(allow_missing_ns_imports,

Same thing here?

Alternatively, I suppose the logic could be reversed in modpost_log()
and is_error could be turned into no_error or something?

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

I suppose the declaration of modpost_log() is close enough to see what
the true/false argument means but maybe something like

  modpost_log(/* is_error = */ false, ...)

could be nice? No strong opinion here though, feel free to just ignore
this whole comment entirely if you disagree!

>  #define fatal(fmt, args...)	do { error(fmt, ##args); exit(1); } while (1)
> -- 
> 2.43.0
> 

