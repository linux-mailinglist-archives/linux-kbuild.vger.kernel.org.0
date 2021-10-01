Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3173B41EBEC
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 13:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353914AbhJALbe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 07:31:34 -0400
Received: from mail.avm.de ([212.42.244.119]:59744 "EHLO mail.avm.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353902AbhJALbc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 07:31:32 -0400
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
        by mail.avm.de (Postfix) with ESMTP
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Oct 2021 13:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1633087783; bh=RlNM0TgJbqwGyS7qd1mq0/neCkw0zZkWlkjkYNyK8Eo=;
        h=Date:Subject:References:In-Reply-To:To:Cc:From:From;
        b=xhlCSgPccWO3Q1PxrG0/Cxl96m0Qgl2+C6J31abh09wWhpwB5KltTApkz/4oOOTqI
         kCAvFXaYzoJByfCgCRxrMgQmxwKOMToH0sJ36gRztj5MiHbsfdEZ9wOxezc3xLSjhV
         nId/o2NODJrVs/czYtrr4JYT3S+lMv5Uu2GLjejM=
Received: from mail.avm.de ([212.42.244.94])
          by mail-notes.avm.de (HCL Domino Release 11.0.1FP3)
          with ESMTP id 2021100113283188-8256 ;
          Fri, 1 Oct 2021 13:28:31 +0200 
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
        by mail.avm.de (Postfix) with ESMTPS
        for <n.schier@mail-notes.avm.de>; Fri,  1 Oct 2021 13:28:31 +0200 (CEST)
Received: from deb-nschier.ads.avm.de (unknown [172.17.24.144])
        by mail-auth.avm.de (Postfix) with ESMTPSA id 58DCC80521
        for <n.schier@avm.de>; Fri,  1 Oct 2021 13:28:31 +0200 (CEST)
Received: by deb-nschier.ads.avm.de (Postfix)
        id 499A27FEFB; Fri,  1 Oct 2021 13:28:31 +0200 (CEST)
Date:   Fri, 1 Oct 2021 13:28:31 +0200
Subject: Re: [PATCH 10/10] [for next only] kconfig: generate
 include/generated/rustc_cfg
References: <20211001053253.1223316-1-masahiroy@kernel.org>
 <20211001053253.1223316-10-masahiroy@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211001053253.1223316-10-masahiroy@kernel.org>
Message-Id: <20211001112831.499A27FEFB@deb-nschier.ads.avm.de>
X-TNEFEvaluated: 1
Sensitivity: 
To:     "Masahiro Yamada" <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
From:   n.schier@avm.de
X-Mailer: Lotus Domino Web Server Release 11.0.1FP3 March 31, 2021
X-MIMETrack: Itemize by SMTP Server on ANIS1/AVM(Release 11.0.1FP3|March 31, 2021) at
 01.10.2021 13:28:31,
        Serialize by http on ANIS1/AVM(Release 11.0.1FP3|March 31, 2021) at
 01.10.2021 13:29:42,
        Serialize complete at 01.10.2021 13:29:42,
        Serialize by Router on ANIS1/AVM(Release 11.0.1FP3|March 31, 2021) at
 01.10.2021 13:29:42
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Notes-Item: linux-kbuild@vger.kernel.org; name=AltBlindCopyTo
X-purgate-ID: 149429::1633087783-0000056E-DE22831C/0/0
X-purgate-type: clean
X-purgate-size: 3050
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 01, 2021 at 02:32:53PM +0900, Masahiro Yamada wrote:
> This patch is not intended for the mainline.
> 
> I created this patch for Stephen Rothwell to resolve the merge
> conflicts more easily.
> 
> The Rust tree is touching scripts/kconfig/confdata.c to generate
> include/generated/rustc_cfg, which would cause complicated conflicts
> with changes from the kbuild tree.
> 
> I re-implemented it to produce the equaivalent rustc_cfg.
> 
> I also fixed the memory leak; the original code from the Rust tree
> did not free the malloc'ed pointer.
> 
> Stephen:
> When you resolve the conflicts in confdata.c, please take this one.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/confdata.c | 42 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 9ece2f3b61a6..4767f3810cf4 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -603,6 +603,9 @@ static const struct comment_style comment_style_c = {
>  
>  static void conf_write_heading(FILE *fp, const struct comment_style *cs)
>  {
> +	if (!cs) /* no heading for rustc_cfg? */
> +		return;
> +
>  	fprintf(fp, "%s\n", cs->comment_block_begin);
>  
>  	fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
> @@ -750,6 +753,39 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
>  	free(escaped);
>  }
>  
> +/* rustc configuration */
> +static void print_symbol_for_rustc_cfg(FILE *fp, struct symbol *sym)
> +{
> +	const char *val;
> +	char *escaped;
> +
> +	if (sym->type == S_UNKNOWN)
> +		return;
> +
> +	val = sym_get_string_value(sym);
> +	escaped = escape_string_value(val);
> +
> +	if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE) {
> +		if (*val == 'n')
> +			return;

I'd expect a "free(escaped);" here.

> +
> +		/*
> +		 * To have similar functionality to the C macro `IS_ENABLED()`
> +		 * we provide an empty `--cfg CONFIG_X` here in both `y`
> +		 * and `m` cases.
> +		 *
> +		 * Then, the common `fprintf()` below will also give us
> +		 * a `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can
> +		 * be used as the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
> +		 */
> +		fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
> +	}
> +
> +	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, escaped);
> +
> +	free(escaped);
> +}
> +
>  /*
>   * Write out a minimal config.
>   * All values that has default values are skipped as this is redundant.
> @@ -1129,6 +1165,12 @@ int conf_write_autoconf(int overwrite)
>  	if (ret)
>  		return ret;
>  
> +	ret = __conf_write_autoconf("include/generated/rustc_cfg",
> +				    print_symbol_for_rustc_cfg,
> +				    NULL);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Create include/config/auto.conf. This must be the last step because
>  	 * Kbuild has a dependency on auto.conf and this marks the successful
> -- 
> 2.30.2
> 
