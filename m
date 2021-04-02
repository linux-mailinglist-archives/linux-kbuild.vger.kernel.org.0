Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F7E35309F
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Apr 2021 23:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhDBVP5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Apr 2021 17:15:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhDBVP5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Apr 2021 17:15:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12E8A6100A;
        Fri,  2 Apr 2021 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617398155;
        bh=zLi9mtNYolLmhhAHTS2CLfzp02pP7xXTkVBgBaHzZFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qNJt4GM8yLtie5OTK4ES2HAaUMuECiLit4aRsxLVHVii2q51vNhh5RYMPAQQGI3/E
         jwlLHy+qmU/vVKqtkOUcqbOHrZyKxmR/EgRYEg79hS0pynoHnnxCtD+xemJAyPWILQ
         ELh87g7oXTzntEARr8JMAyQB6LyFHp8XtvP/lsPrRF3oTk/frUxYj7GOqccwuYTsWs
         /qDCMIoT3XwiGsl3ytQp8EtNoA4BYGXRo7Flg3vz4YuvnnymtHyL5Z7bS0fjKtgDSi
         AY9WAcosD+3bkESIlfWIa3tl2kHYIQEDTj1DwH3rRSpZuCOJlAdZf1t3pZ62JuNfK8
         gu23yJVtuqBTg==
Date:   Fri, 2 Apr 2021 14:15:52 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 3/3] kbuild: fix false-positive modpost warning when all
 symbols are trimmed
Message-ID: <20210402211552.dzcxxs5scz7ddxtt@Ryzen-9-3900X.localdomain>
References: <20210325185412.2352951-1-masahiroy@kernel.org>
 <20210325185412.2352951-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325185412.2352951-3-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 26, 2021 at 03:54:11AM +0900, Masahiro Yamada wrote:
> Nathan reports that the mips defconfig emits the following warning:
> 
>   WARNING: modpost: Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.
> 
> This false-positive happens under the following combination:
> 
>  - CONFIG_TRIM_UNUSED_KSYMS=y
>  - CONFIG_MODULES=y
>  - No CONFIG option is set to 'm'
> 
> Commit a0590473c5e6 ("nfs: fix PNFS_FLEXFILE_LAYOUT Kconfig default")
> turned the last 'm' into 'y' for the mips defconfig, and uncovered
> this issue.
> 
> In this case, the module feature itself is enabled, but we have no
> module. As a result, CONFIG_TRIM_UNUSED_KSYMS drops all the instances
> of EXPORT_SYMBOL. Then, modpost wrongly assumes vmlinux is missing
> because vmlinux.symvers is empty. (Or, you can create a module that
> does not use any symbol of vmlinux).
> 
> The current behavior is to entirely suppress the unresolved symbol
> warnings when vmlinux is missing just because there are too many.
> I found the origin of this code in the historical git tree. [1]
> 
> If this is a matter of noisiness, I think modpost can display the
> first 10 warnings, and the number of suppressed warnings at the end.
> 
> You will get a bit noisier logs when you run 'make modules' without
> vmlinux, but such warnings are better to show because you never know
> the resulting modules are actually loadable or not.
> 
> This commit changes as follows:
> 
>  - If any of input *.symver files is missing, pass -w option to let
>    the module build keep going with warnings instead of errors.
> 
>  - If there are too many (10+) unresolved symbol warnings, show only
>    the first 10, and also the number of suppressed warnings.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=1cc0e0529569bf6a94f6d49770aa6d4b599d2c46
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thank you for the patch, I do not see that warning anymore.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/Makefile.modpost |  7 +++++--
>  scripts/mod/modpost.c    | 25 ++++++++++++-------------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index b3e08fb1fd56..c383ba33d837 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -98,9 +98,11 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
>  
>  endif
>  
> +existing-input-symdump := $(wildcard $(input-symdump))
> +
>  # modpost options for modules (both in-kernel and external)
>  MODPOST += \
> -	$(addprefix -i ,$(wildcard $(input-symdump))) \
> +	$(addprefix -i ,$(existing-input-symdump)) \
>  	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS)) \
>  	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
>  
> @@ -114,6 +116,7 @@ VPATH :=
>  $(input-symdump):
>  	@echo >&2 'WARNING: Symbol version dump "$@" is missing.'
>  	@echo >&2 '         Modules may not have dependencies or modversions.'
> +	@echo >&2 '         You may get many unresolved symbol warnings.'
>  
>  ifdef CONFIG_LTO_CLANG
>  # With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to run
> @@ -134,7 +137,7 @@ endif
>  modules := $(sort $(shell cat $(MODORDER)))
>  
>  # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
> -ifneq ($(KBUILD_MODPOST_WARN),)
> +ifneq ($(KBUILD_MODPOST_WARN)$(filter-out $(existing-input-symdump), $(input-symdump)),)
>  MODPOST += -w
>  endif
>  
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 10c3fba26f03..7c6bec78fa34 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -23,8 +23,6 @@
>  
>  /* Are we using CONFIG_MODVERSIONS? */
>  static int modversions = 0;
> -/* Warn about undefined symbols? (do so if we have vmlinux) */
> -static int have_vmlinux = 0;
>  /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
>  static int all_versions = 0;
>  /* If we are modposting external module set to 1 */
> @@ -41,6 +39,13 @@ static int allow_missing_ns_imports;
>  
>  static bool error_occurred;
>  
> +/*
> + * Cut off the warnings when there are too many. This typically occurs when
> + * vmlinux is missing. ('make modules' without building vmlinux.)
> + */
> +#define MAX_UNRESOLVED_REPORTS	10
> +static unsigned int nr_unresolved;
> +
>  enum export {
>  	export_plain,
>  	export_gpl,
> @@ -177,9 +182,6 @@ static struct module *new_module(const char *modname)
>  	mod->next = modules;
>  	modules = mod;
>  
> -	if (mod->is_vmlinux)
> -		have_vmlinux = 1;
> -
>  	return mod;
>  }
>  
> @@ -2141,7 +2143,7 @@ static void check_exports(struct module *mod)
>  		const char *basename;
>  		exp = find_symbol(s->name);
>  		if (!exp || exp->module == mod) {
> -			if (have_vmlinux && !s->weak)
> +			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
>  				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
>  					    "\"%s\" [%s.ko] undefined!\n",
>  					    s->name, mod->name);
> @@ -2545,13 +2547,6 @@ int main(int argc, char **argv)
>  	if (files_source)
>  		read_symbols_from_files(files_source);
>  
> -	/*
> -	 * When there's no vmlinux, don't print warnings about
> -	 * unresolved symbols (since there'll be too many ;)
> -	 */
> -	if (!have_vmlinux)
> -		warn("Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.\n");
> -
>  	for (mod = modules; mod; mod = mod->next) {
>  		char fname[PATH_MAX];
>  
> @@ -2595,6 +2590,10 @@ int main(int argc, char **argv)
>  		}
>  	}
>  
> +	if (nr_unresolved > MAX_UNRESOLVED_REPORTS)
> +		warn("suppressed %u unresolved symbol warnings because there were too many)\n",
> +		     nr_unresolved - MAX_UNRESOLVED_REPORTS);
> +
>  	free(buf.p);
>  
>  	return error_occurred ? 1 : 0;
> -- 
> 2.27.0
> 
