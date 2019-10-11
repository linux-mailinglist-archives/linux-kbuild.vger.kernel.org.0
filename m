Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF9E2D42C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 16:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbfJKOYo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 10:24:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbfJKOYn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 10:24:43 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00D43206A1;
        Fri, 11 Oct 2019 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570803882;
        bh=ZUjomhQ6sr8aTI+2J7CgZ4YadulwLDa1WqH77eJw5CM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rIcm0KF1DXaoMgDbMO17rnP4TatPDFYrnZClqmhhbKjvnNJP7hGhvqPvXG+CEKo23
         vB+CD7PLjJRp6nSXqwd7ZgLW28c8AU2bAlbT49CRBVWru5sVXQMhmbOpus4CAJxd+k
         fPLdsKgoJWNVuVXhiuuLSm4SJk5Ib83Bh9DPJtAM=
Date:   Fri, 11 Oct 2019 15:24:38 +0100
From:   Will Deacon <will@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/4] modpost: make updating the symbol namespace explict
Message-ID: <20191011142437.ypdp7fni4jk43dnv@willie-the-truck>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-3-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010151443.7399-3-maennich@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 10, 2019 at 04:14:41PM +0100, Matthias Maennich wrote:
> Setting the symbol namespace of a symbol within sym_add_exported feels
> displaced and lead to issues in the current implementation of symbol
> namespaces. This patch makes updating the namespace an explicit call to
> decouple it from adding a symbol to the export list.
> 
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---
>  scripts/mod/modpost.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 9f5dcdff4d2f..46137b730447 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -382,8 +382,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>   * Add an exported symbol - it may have already been added without a
>   * CRC, in this case just update the CRC
>   **/
> -static struct symbol *sym_add_exported(const char *name, const char *namespace,
> -				       struct module *mod, enum export export)
> +static struct symbol *sym_add_exported(const char *name, struct module *mod,
> +				       enum export export)
>  {
>  	struct symbol *s = find_symbol(name);
>  
> @@ -399,7 +399,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>  			s->module = mod;
>  		}
>  	}
> -	sym_update_namespace(name, namespace);
>  	s->preloaded = 0;
>  	s->vmlinux   = is_vmlinux(mod->name);
>  	s->kernel    = 0;
> @@ -761,7 +760,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>  		if (strstarts(symname, "__ksymtab_")) {
>  			name = symname + strlen("__ksymtab_");
>  			namespace = sym_extract_namespace(&name);
> -			sym_add_exported(name, namespace, mod, export);
> +			sym_add_exported(name, mod, export);
> +			sym_update_namespace(name, namespace);
>  			free(namespace);
>  		}
>  		if (strcmp(symname, "init_module") == 0)
> @@ -2469,12 +2469,12 @@ static void read_dump(const char *fname, unsigned int kernel)
>  			mod = new_module(modname);
>  			mod->skip = 1;
>  		}
> -		s = sym_add_exported(symname, namespace, mod,
> -				     export_no(export));
> +		s = sym_add_exported(symname, mod, export_no(export));
>  		s->kernel    = kernel;
>  		s->preloaded = 1;
>  		s->is_static = 0;
>  		sym_update_crc(symname, mod, crc, export_no(export));
> +		sym_update_namespace(symname, namespace);

This changes the order wrt setting the namespace and sym_update_crc(), but
that doesn't seem to matter, so:

Acked-by: Will Deacon <will@kernel.org>

Will
