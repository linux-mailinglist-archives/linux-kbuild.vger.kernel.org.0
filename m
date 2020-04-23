Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE3D1B669D
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2020 00:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDWWCn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 18:02:43 -0400
Received: from ex13-edg-ou-002.vmware.com ([208.91.0.190]:28198 "EHLO
        EX13-EDG-OU-002.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbgDWWCn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 18:02:43 -0400
X-Greylist: delayed 908 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Apr 2020 18:02:43 EDT
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 23 Apr 2020 14:47:30 -0700
Received: from localhost (unknown [10.129.220.242])
        by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 8485040598;
        Thu, 23 Apr 2020 14:47:34 -0700 (PDT)
Date:   Thu, 23 Apr 2020 14:47:34 -0700
From:   Matt Helsley <mhelsley@vmware.com>
To:     Sami Tolvanen <samitolvanen@google.com>
CC:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] recordmcount: support >64k sections
Message-ID: <20200423214734.GB9040@rlwimi.vmware.com>
Mail-Followup-To: Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200422232417.72162-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200422232417.72162-1-samitolvanen@google.com>
Received-SPF: None (EX13-EDG-OU-002.vmware.com: mhelsley@vmware.com does not
 designate permitted sender hosts)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 22, 2020 at 04:24:17PM -0700, Sami Tolvanen wrote:
> When compiling a kernel with Clang and LTO, we need to run
> recordmcount on vmlinux.o with a large number of sections, which
> currently fails as the program doesn't understand extended
> section indexes. This change adds support for processing binaries
> with >64k sections.

In addition to Clang + LTO I wonder if use of -ffunction-sections
these days is more likely to push us over SHN_LORESERVE even on
individual .o files. If so then this may also be necessary to prepare
for other patches being proposed such as (off the top of my head)
some KASLR changes being discussed.

> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/recordmcount.h | 75 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index 74eab03e31d4..b48163864cca 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -29,6 +29,9 @@
>  #undef has_rel_mcount
>  #undef tot_relsize
>  #undef get_mcountsym
> +#undef get_shnum
> +#undef get_shstrndx
> +#undef get_symindex
>  #undef get_sym_str_and_relp
>  #undef do_func
>  #undef Elf_Addr
> @@ -58,6 +61,9 @@
>  # define __has_rel_mcount	__has64_rel_mcount
>  # define has_rel_mcount		has64_rel_mcount
>  # define tot_relsize		tot64_relsize
> +# define get_shnum		get_shnum64
> +# define get_shstrndx		get_shstrndx64
> +# define get_symindex		get_symindex64
>  # define get_sym_str_and_relp	get_sym_str_and_relp_64
>  # define do_func		do64
>  # define get_mcountsym		get_mcountsym_64
> @@ -91,6 +97,9 @@
>  # define __has_rel_mcount	__has32_rel_mcount
>  # define has_rel_mcount		has32_rel_mcount
>  # define tot_relsize		tot32_relsize
> +# define get_shnum		get_shnum32
> +# define get_shstrndx		get_shstrndx32
> +# define get_symindex		get_symindex32
>  # define get_sym_str_and_relp	get_sym_str_and_relp_32
>  # define do_func		do32
>  # define get_mcountsym		get_mcountsym_32
> @@ -173,6 +182,38 @@ static int MIPS_is_fake_mcount(Elf_Rel const *rp)
>  	return is_fake;
>  }
>  

I like these extra helpers. When we convert to objtool it will be easier
to see how they change or get removed entirely in favor of objtool data
structures or libelf accessors.

> +static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
> +				 Elf32_Word const *symtab_shndx)
> +{
> +	unsigned long offset;
> +	int index;
> +
> +	if (sym->st_shndx != SHN_XINDEX)
> +		return w2(sym->st_shndx);
> +
> +	offset = (unsigned long)sym - (unsigned long)symtab;
> +	index = offset / sizeof(*sym);
> +
> +	return w(symtab_shndx[index]);
> +}
> +
> +static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)

I noticed this returns an unsigned int ...

> +{
> +	if (shdr0 && !ehdr->e_shnum)
> +		return w(shdr0->sh_size);
> +
> +	return w2(ehdr->e_shnum);
> +}
> +
> +static int get_shstrndx(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
> +{
> +	if (ehdr->e_shstrndx != SHN_XINDEX)
> +		return w2(ehdr->e_shstrndx);
> +
> +	return w(shdr0->sh_link);
> +}
> +
> +
>  /* Append the new shstrtab, Elf_Shdr[], __mcount_loc and its relocations. */
>  static int append_func(Elf_Ehdr *const ehdr,
>  			Elf_Shdr *const shstr,
> @@ -188,10 +229,12 @@ static int append_func(Elf_Ehdr *const ehdr,
>  	char const *mc_name = (sizeof(Elf_Rela) == rel_entsize)
>  		? ".rela__mcount_loc"
>  		:  ".rel__mcount_loc";
> -	unsigned const old_shnum = w2(ehdr->e_shnum);
>  	uint_t const old_shoff = _w(ehdr->e_shoff);
>  	uint_t const old_shstr_sh_size   = _w(shstr->sh_size);
>  	uint_t const old_shstr_sh_offset = _w(shstr->sh_offset);
> +	Elf_Shdr *const shdr0 = (Elf_Shdr *)(old_shoff + (void *)ehdr);
> +	unsigned const old_shnum = get_shnum(ehdr, shdr0);

While this is not explicitly called out as an unsigned int. Perhaps we
could just make this and new_shnum explicit unsigned ints and then...

> +	unsigned const new_shnum = 2 + old_shnum; /* {.rel,}__mcount_loc */
>  	uint_t t = 1 + strlen(mc_name) + _w(shstr->sh_size);
>  	uint_t new_e_shoff;
>  
> @@ -201,6 +244,12 @@ static int append_func(Elf_Ehdr *const ehdr,
>  	t += (_align & -t);  /* word-byte align */
>  	new_e_shoff = t;
>  
> +	if (!ehdr->e_shnum || new_shnum >= SHN_LORESERVE) {
> +		ehdr->e_shnum = 0;
> +		shdr0->sh_size = w(new_shnum);
> +	} else
> +		ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));

If we make the unsigned int change proposed above can we reuse new_shnum
here like so:
		ehdr->e_shnum = w2(new_shnum);

So this if/else is doing the inverse of get_shnum(). I think the code
could be cleaned up a little and prepare for moving to objtool by
putting it in a helper function.

> +
>  	/* body for new shstrtab */
>  	if (ulseek(sb.st_size, SEEK_SET) < 0)
>  		return -1;
> @@ -255,7 +304,6 @@ static int append_func(Elf_Ehdr *const ehdr,
>  		return -1;
>  
>  	ehdr->e_shoff = _w(new_e_shoff);
> -	ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));  /* {.rel,}__mcount_loc */
>  	if (ulseek(0, SEEK_SET) < 0)
>  		return -1;
>  	if (uwrite(ehdr, sizeof(*ehdr)) < 0)
> @@ -434,6 +482,8 @@ static int find_secsym_ndx(unsigned const txtndx,
>  				uint_t *const recvalp,
>  				unsigned int *sym_index,
>  				Elf_Shdr const *const symhdr,
> +				Elf32_Word const *symtab,
> +				Elf32_Word const *symtab_shndx,
>  				Elf_Ehdr const *const ehdr)
>  {
>  	Elf_Sym const *const sym0 = (Elf_Sym const *)(_w(symhdr->sh_offset)
> @@ -445,7 +495,7 @@ static int find_secsym_ndx(unsigned const txtndx,
>  	for (symp = sym0, t = nsym; t; --t, ++symp) {
>  		unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
>  
> -		if (txtndx == w2(symp->st_shndx)
> +		if (txtndx == get_symindex(symp, symtab, symtab_shndx)
>  			/* avoid STB_WEAK */
>  		    && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
>  			/* function symbols on ARM have quirks, avoid them */
> @@ -516,21 +566,23 @@ static unsigned tot_relsize(Elf_Shdr const *const shdr0,
>  	return totrelsz;
>  }
>  
> -
>  /* Overall supervision for Elf32 ET_REL file. */
>  static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
>  		   unsigned const reltype)
>  {
>  	Elf_Shdr *const shdr0 = (Elf_Shdr *)(_w(ehdr->e_shoff)
>  		+ (void *)ehdr);
> -	unsigned const nhdr = w2(ehdr->e_shnum);
> -	Elf_Shdr *const shstr = &shdr0[w2(ehdr->e_shstrndx)];
> +	unsigned const nhdr = get_shnum(ehdr, shdr0);
> +	Elf_Shdr *const shstr = &shdr0[get_shstrndx(ehdr, shdr0)];
>  	char const *const shstrtab = (char const *)(_w(shstr->sh_offset)
>  		+ (void *)ehdr);
>  
>  	Elf_Shdr const *relhdr;
>  	unsigned k;
>  
> +	Elf32_Word *symtab = NULL;
> +	Elf32_Word *symtab_shndx = NULL;
> +
>  	/* Upper bound on space: assume all relevant relocs are for mcount. */
>  	unsigned       totrelsz;
>  
> @@ -561,6 +613,16 @@ static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
>  		return -1;
>  	}
>  
> +	for (relhdr = shdr0, k = nhdr; k; --k, ++relhdr) {
> +		if (relhdr->sh_type == SHT_SYMTAB)
> +			symtab = (void *)ehdr + relhdr->sh_offset;
> +		else if (relhdr->sh_type == SHT_SYMTAB_SHNDX)
> +			symtab_shndx = (void *)ehdr + relhdr->sh_offset;
> +
> +		if (symtab && symtab_shndx)
> +			break;
> +	}

Could you break this out into a helper function? find_symtab() maybe? Again, I think
that helper would go away with conversion to objtool.

(and even if we don't convert to objtool I think the helpers will make
the code easier to read)

Cheers,
    -Matt Helsley 
