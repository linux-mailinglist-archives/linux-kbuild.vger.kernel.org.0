Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781A8FD89D
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 10:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfKOJT4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 04:19:56 -0500
Received: from merlin.infradead.org ([205.233.59.134]:58364 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJT4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 04:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CaVJL0m4rVC3kIgt7PaU/sZ/HckuS6iVscw9ZZiEBBw=; b=KJsystCX+eKUhlSxbNUCd/mmx
        HMGb8vM5Z2ldYimeZVR2muQrcWpB98iMQ3W8DOuva+pWvm3DyHlxsfgcDGnuWf6YNF1WCAOIRZxhA
        QZRk3E6WFHZdIeGs0Z3ehNZe6wobo5EqeWNsI2uL4aj3n6V3ftzYbN6ZmV/WeKTW4hkxTse6htBsA
        VwBaHuSgw6tdp2CfOdqTzRq9eYjJ4KPbRyV46kGhGPqU3m1z1E6PCa8/Mfls2Gfcr6MFW5d1QFO0g
        3L9E5+FY/ccD0Vh7yYkvNiCjOeeB8puQmXkkovj8vpqdW3PLzy4KVi2kL7e7aqhlz+SGTq4ZGdXvt
        Bi8iVWMkg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iVXlc-0005KW-EY; Fri, 15 Nov 2019 09:19:48 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3C4A2303D9F;
        Fri, 15 Nov 2019 10:18:37 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4929429E4EBB1; Fri, 15 Nov 2019 10:19:45 +0100 (CET)
Date:   Fri, 15 Nov 2019 10:19:45 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort
 concurrently
Message-ID: <20191115091945.GT4114@hirez.programming.kicks-ass.net>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:

> @@ -141,21 +306,44 @@ static int do_sort(Elf_Ehdr *ehdr,
>  		if (r(&s->sh_type) == SHT_SYMTAB_SHNDX)
>  			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
>  						      _r(&s->sh_offset));
> -	}
>  
> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
> +		/* locate the ORC unwind tables */
> +		if (!strcmp(secstrings + idx, ".orc_unwind_ip")) {
> +			orctable.orc_ip_size = s->sh_size;
> +			g_orc_ip_table = (int *)((void *)ehdr +
> +						   s->sh_offset);
> +		}
> +		if (!strcmp(secstrings + idx, ".orc_unwind")) {
> +			orctable.orc_size = s->sh_size;
> +			g_orc_table = (struct orc_entry *)((void *)ehdr +
> +							     s->sh_offset);
> +		}
> +#endif
> +	} /* for loop */
> +
> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)

Maybe something like:

	if (g_orc_table && g_orc_ip_table) {
		 if (pthread_create(...))
		...
	} else if (g_orc_table || g_orc_up_table) {
		fprintf(stderr, "incomplete ORC tables...\n");
	}

> +	/* create thread to sort ORC unwind tables concurrently */
> +	if (pthread_create(&orc_sort_thread, NULL, sort_orctable, &orctable)) {
> +		fprintf(stderr,
> +			"pthread_create orc_sort_thread failed '%s': %s\n",
> +			strerror(errno), fname);
> +		goto out;
> +	}
> +#endif
>  	if (!extab_sec) {
>  		fprintf(stderr,	"no __ex_table in file: %s\n", fname);
> -		return -1;
> +		goto out;
>  	}
>  
>  	if (!symtab_sec) {
>  		fprintf(stderr,	"no .symtab in file: %s\n", fname);
> -		return -1;
> +		goto out;
>  	}
>  
>  	if (!strtab_sec) {
>  		fprintf(stderr,	"no .strtab in file: %s\n", fname);
> -		return -1;
> +		goto out;
>  	}
>  
>  	extab_image = (void *)ehdr + _r(&extab_sec->sh_offset);
> @@ -192,7 +380,7 @@ static int do_sort(Elf_Ehdr *ehdr,
>  		fprintf(stderr,
>  			"no main_extable_sort_needed symbol in file: %s\n",
>  			fname);
> -		return -1;
> +		goto out;
>  	}
>  
>  	sort_needed_sec = &shdr[get_secindex(r2(&sym->st_shndx),
> @@ -205,6 +393,20 @@ static int do_sort(Elf_Ehdr *ehdr,
>  
>  	/* extable has been sorted, clear the flag */
>  	w(0, sort_needed_loc);
> +	rc = 0;
>  
> -	return 0;
> +out:
> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
> +	{ /* to avoid gcc warning about declaration */
> +	void *retval = NULL;

and then here:

	if (orc_sort_thread) {
		void *retval = NULL;
		pthread_join(...);
		...
	}

> +
> +	/* wait for ORC tables sort done */
> +	pthread_join(orc_sort_thread, &retval);
> +	if (retval) {
> +		fprintf(stderr, "%s in file: %s\n", (char *)retval, fname);
> +		rc = -1;
> +	}
> +	}
> +#endif
> +	return rc;
>  }
