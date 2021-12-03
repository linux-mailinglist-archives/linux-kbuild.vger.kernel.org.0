Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DA94673D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Dec 2021 10:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351412AbhLCJWs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Dec 2021 04:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351316AbhLCJWr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Dec 2021 04:22:47 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D83C06173E;
        Fri,  3 Dec 2021 01:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hLPFdIqBYpspMlwIAo7jkm6f1I6lI75Wr7yBFCGECog=; b=dlLwOKJiwBv02wti0blm0rr6CF
        L0ZFM5qwxblWVSbBC4msE5YdoO7xva5p6Y5N2vU5zvUdcVoI2DpVvtcfMxt6umFaszPUHVkDp4dkP
        XgiJIDS0lrEhp2DyOihYCETjTJ8kljja5mnwowi2BygcSEQsjHXElKyy6LH6P+e/HH9Gum0cT+HoN
        OUgAOy70n7gACzwta1Qq20rT2ta/8KpCkXJ7l0iAwexXzet1HMdY3Vs6IMUUjm5z87vHjZbz9yqot
        4W1kTFE5WO5MDqLcwUxIY7ZbiFANYg33gG1eF6MZZ4ns1Oxaa+q0KS6r0cf9OOCgNptZKgiEOIKpp
        iblFSLWA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mt4iP-007yPM-Ua; Fri, 03 Dec 2021 09:18:50 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A78433002C5;
        Fri,  3 Dec 2021 10:18:47 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8F62D2B35A5A4; Fri,  3 Dec 2021 10:18:47 +0100 (CET)
Date:   Fri, 3 Dec 2021 10:18:47 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     linux-hardening@vger.kernel.org, x86@kernel.org,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v8 03/14] x86: Add support for function granular KASLR
Message-ID: <Yang97SFfwuqTNzK@hirez.programming.kicks-ass.net>
References: <20211202223214.72888-1-alexandr.lobakin@intel.com>
 <20211202223214.72888-4-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202223214.72888-4-alexandr.lobakin@intel.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 02, 2021 at 11:32:03PM +0100, Alexander Lobakin wrote:
> From: Kristen Carlson Accardi <kristen@linux.intel.com>
> 
> This commit contains the changes required to re-layout the kernel text
> sections generated by -ffunction-sections shortly after decompression.
> Documentation of the feature is also added.
> 
> After decompression, the decompressed image's elf headers are parsed.
> In order to manually update certain data structures that are built with
> relative offsets during the kernel build process, certain symbols are
> not stripped by objdump and their location is retained in the elf symbol
> tables. These addresses are saved.
> 
> If the image was built with -ffunction-sections, there will be ELF section
> headers present which contain information about the address range of each
> section. Anything that is not broken out into function sections (i.e. is
> consolidated into .text) is left in it's original location, but any other
> executable section which begins with ".text." is located and shuffled
> randomly within the remaining text segment address range.
> 
> After the sections have been copied to their new locations, but before
> relocations have been applied, the kallsyms tables must be updated to
> reflect the new symbol locations. Because it is expected that these tables
> will be sorted by address, the kallsyms tables will need to be sorted
> after the update.
> 
> When applying relocations, the address of the relocation needs to be
> adjusted by the offset from the original location of the section that was
> randomized to it's new location. In addition, if a value at that relocation
> was a location in the text segment that was randomized, it's value will be
> adjusted to a new location.
> 
> After relocations have been applied, the exception table must be updated
> with new symbol locations, and then re-sorted by the new address. The
> orc table will have been updated as part of applying relocations, but since
> it is expected to be sorted by address, it will need to be resorted.


> +static long addr_kallsyms_names;
> +static long addr_kallsyms_offsets;
> +static long addr_kallsyms_num_syms;
> +static long addr_kallsyms_relative_base;
> +static long addr_kallsyms_markers;
> +static long addr___start___ex_table;
> +static long addr___stop___ex_table;
> +static long addr___altinstr_replacement;
> +static long addr___altinstr_replacement_end;
> +static long addr__stext;
> +static long addr__etext;
> +static long addr__sinittext;
> +static long addr__einittext;
> +static long addr___start_orc_unwind_ip;
> +static long addr___stop_orc_unwind_ip;
> +static long addr___start_orc_unwind;

> +void post_relocations_cleanup(unsigned long map)
> +{
> +	if (!nofgkaslr) {
> +		update_ex_table(map);
> +		sort_ex_table(map);
> +		update_orc_table(map);
> +		sort_orc_table(map);
> +	}
> +
> +	/*
> +	 * maybe one day free will do something. So, we "free" this memory
> +	 * in either case
> +	 */
> +	free(sections);
> +	free(sechdrs);
> +}
> +
> +void pre_relocations_cleanup(unsigned long map)
> +{
> +	if (nofgkaslr)
> +		return;
> +
> +	sort_kallsyms(map);
> +}

> diff --git a/arch/x86/boot/compressed/vmlinux.symbols b/arch/x86/boot/compressed/vmlinux.symbols
> new file mode 100644
> index 000000000000..da41f3ee153c
> --- /dev/null
> +++ b/arch/x86/boot/compressed/vmlinux.symbols
> @@ -0,0 +1,19 @@
> +kallsyms_offsets
> +kallsyms_addresses
> +kallsyms_num_syms
> +kallsyms_relative_base
> +kallsyms_names
> +kallsyms_token_table
> +kallsyms_token_index
> +kallsyms_markers
> +__start___ex_table
> +__stop___ex_table
> +__altinstr_replacement
> +__altinstr_replacement_end
> +_sinittext
> +_einittext
> +_stext
> +_etext
> +__start_orc_unwind_ip
> +__stop_orc_unwind_ip
> +__start_orc_unwind

So please don't make it hard to add sections; the above has far too much
duplication. For example you can trivially generate the addr_ symbol and
the .symbol file from a common include file and a bit of macro wrappery,
ideally that macro wrappery would also specify the sort location and
function such that you can also generate those pre_ and post_ functions.

And this is only for sections that need to be sorted right? There's
currently a patch in flight to also pre-sort the ftrace table.

All unsorted or runtime sorted sections are fine since they're fixed up
by the relocations?

Is it at all feasible to share the comparison functions between the
various sorters?
