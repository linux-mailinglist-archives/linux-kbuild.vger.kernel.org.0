Return-Path: <linux-kbuild+bounces-7330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB42ACA801
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 03:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C6D17AA9A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 01:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF52172623;
	Mon,  2 Jun 2025 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mCqHdein"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B682C327C
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748825979; cv=none; b=Ma/MJ1tgMVh3YdDZzZP/5NqVBcvqW4QbNv5gmR1b2xszsaUpqZd2/ornVPXv+zAdc0rgEaaMBAVX3tfzdkdTvT1wwjFhhX/B39fL9HuENSd4OY660xkYKhbcU2SlN5QsYQxrmtnDiwVhiZNX0dM4wobF90y5tcxigYgMO+6qHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748825979; c=relaxed/simple;
	bh=4gp2cgkPNYgjp90siLccjFTMzVjBKng2C4mXBppX6wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeZlUsrdWg3ApmZjdqgUvfQ7+jKuE3tP8ACfFdUBWErgR45Ro3vPHF7bjpmNpNqNjRybc/dMGCRF1mn+4Oh/9rWvJzF/SE0HeholauTv0P0KBnXyVVpDOtFAIxV8uKnPDeZNN1YvYv22J9iocVcXkpBFTwxIubOp+CljMM0za6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mCqHdein; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uUown43kYq6XtbGwrP/QLunhSIYFt9fe7rk1tdGvugw=; b=mCqHdeinK8bCedgUvPlTt2Zx0p
	TQmA1xeUFO25VPhz15pchVIdBvLhJ5auTWnGwzxxfHgUo97NtI+PucPyx2d0CMSF8HzGa/AxqzjrP
	b5xKdrbeoUKaVP5/xYJ9DxFMxuRdV4JMXqI4yW9eoIu+d+5ia5gC9QhDjZQko6/u2qQ8bLUASihko
	JgDniQ/xdDZ3nkBYXPMb04GotHdHri82/wzxNlVl5HeFtMABnpjgwtqdxJ97+vHQ6+CDC3FovmX2C
	YrT2G4QUlv2f07HE1fGjmEk4cqox4cJZ+2WOqXJaiFXtgzz12d4ubknRV8x6itt+RGGvkmzeSEqsH
	Kk2c1Aeg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLtWX-00000000ZPn-2sgu;
	Mon, 02 Jun 2025 00:59:34 +0000
Message-ID: <2e8cb14e-abb7-4850-a1fe-31bad55bb04b@infradead.org>
Date: Sun, 1 Jun 2025 17:59:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
To: Franco Martelli <martellif67@gmail.com>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
 <20250601184049.368419-2-martellif67@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250601184049.368419-2-martellif67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/1/25 11:40 AM, Franco Martelli wrote:

Missing patch description/justification here.....


> Signed-off-by: Franco Martelli <martellif67@gmail.com>
> ---
>  scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
>  scripts/kconfig/expr.h             |   9 ++
>  scripts/kconfig/lkc.h              |  11 ++
>  scripts/kconfig/lkc_proto.h        |   4 +
>  scripts/kconfig/lxdialog/menubox.c |  13 +-
>  scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
>  6 files changed, 376 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index ac95661a1c9d..078d058c01d7 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -257,7 +257,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>  			sym->flags |= def_flags;
>  			break;
>  		}
> -		if (def != S_DEF_AUTO)
> +		if (def != S_DEF_AUTO && def != S_DEF_COMP)
>  			conf_warning("symbol value '%s' invalid for %s",
>  				     p, sym->name);
>  		return 1;
> @@ -386,6 +386,7 @@ int conf_read_simple(const char *name, int def)
>  	def_flags = SYMBOL_DEF << def;
>  	for_all_symbols(sym) {
>  		sym->flags &= ~def_flags;
> +		sym->comp_is_avail = false;
>  		switch (sym->type) {
>  		case S_INT:
>  		case S_HEX:
> @@ -445,6 +446,8 @@ int conf_read_simple(const char *name, int def)
>  
>  		sym = sym_find(sym_name);
>  		if (!sym) {
> +			if (def == S_DEF_COMP)
> +				continue;
>  			if (def == S_DEF_AUTO) {
>  				/*
>  				 * Reading from include/config/auto.conf.
> @@ -462,6 +465,9 @@ int conf_read_simple(const char *name, int def)
>  			continue;
>  		}
>  
> +		if (def == S_DEF_COMP)
> +			sym->comp_is_avail = true;
> +
>  		if (sym->flags & def_flags)
>  			conf_warning("override: reassigning to symbol %s", sym->name);
>  
> @@ -529,6 +535,91 @@ int conf_read(const char *name)
>  	return 0;
>  }
>  
> +const char sym_get_comp_tristate_char(struct symbol *sym)
> +{
> +	char ch = '#';
> +
> +	if (sym_get_comp_is_avail(sym))
> +		switch (sym_get_comp_tristate_value(sym)) {
> +		case yes: ch = '*'; break;
> +		case mod: ch = 'M'; break;
> +		case no:  ch = '_'; break;
> +		}
> +
> +	return ch;
> +}
> +
> +static char * masked_xrealloc(char *s, size_t len, size_t *size)

   static char *mask_xrealloc(...
(no space after '*')

> +{
> +	char *ls = s;
> +
> +	if (s == NULL)
> +		*size = 0;
> +	if (len > *size)
> +		ls = xrealloc(s, (*size = ((len / SYMBOL_MAXLENGTH) + 1) * SYMBOL_MAXLENGTH));
> +
> +	return ls;
> +}
> +
> +#define LINE_LENGTH	(SYMBOL_MAXLENGTH +32)
> +
> +char * comp_get_list_diff(void)

ditto.

> +{

> +}

> @@ -801,6 +892,78 @@ int conf_write_defconfig(const char *filename)
>  	return 0;
>  }
>  
> +bool conf_write_comp(const char *name)
> +{
> +	FILE *fptemp, *fplist;
> +	char *list = NULL, f_old[PATH_MAX +1],  tmpfile[] = "file_XXXXXX";
> +	int ch;
> +
> +	if (!name)
> +		return false;
> +
> +	if (is_present(name)) {
> +		if (is_dir(name))
> +			return false;
> +		snprintf(f_old, PATH_MAX, "%s.old", name);
> +		if (rename(name, f_old)) {
> +			fprintf(stderr, "Failed to rename file: %s to %s\n", name, f_old);
> +			return false;
> +		}
> +	}
> +
> +	list = comp_get_list_diff();
> +	int tmpfd = mkstemp(tmpfile);
> +
> +	if (tmpfd < 0) {
> +		fprintf( stderr, "Failed to create temporary file.\n" );
> +		return false;
> +	}
> +
> +	if ((fptemp = fdopen(tmpfd, "w")) == NULL) {
> +		remove(tmpfile);
> +		fprintf(stderr, "Failed to open a stream for the temporary file: %s\n", tmpfile);
> +		return false;
> +	}
> +
> +	if ((fplist = fmemopen(list, strlen(list), "r")) == NULL ) {
> +		fclose(fptemp);
> +		remove(tmpfile);
> +		fprintf( stderr, "Failed to open a stream for fplist.\n" );
> +		if (list)
> +			free(list);
> +		return false;
> +	}
> +
> +	while ((ch = fgetc(fplist)) != EOF)
> +		fputc(ch, fptemp);
> +
> +	if (ferror(fptemp)) {	/* checks whether fputc has encountered errors while writing the file */
> +		fclose(fptemp);
> +		fclose(fplist);
> +		if (list)
> +			free(list);
> +		fprintf( stderr, "An error occured when writing the file: %s", tmpfile);

		                           occurred

> +		return false;
> +	}
> +
> +	if (rename(tmpfile, name)) {
> +		fprintf(stderr, "Failed to rename file: %s to %s\n", tmpfile, name);
> +		fclose(fptemp);
> +		fclose(fplist);
> +		if (list)
> +			free(list);
> +		remove(tmpfile);
> +		return false;
> +	}
> +
> +	fclose(fptemp);
> +	fclose(fplist);
> +	if (list)
> +		free(list);
> +
> +	return true;
> +}
> +
>  int conf_write(const char *name)
>  {
>  	FILE *out;


-- 
~Randy


