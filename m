Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51EEFD42BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 16:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbfJKOYd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 10:24:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbfJKOYd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 10:24:33 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97B4F206A1;
        Fri, 11 Oct 2019 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570803872;
        bh=QAb4bxoTz2iQy8IO0iLYwBX2ij2Bqz40OXibaGp0LAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uiM7sMCFSjxUZ8NgAbCBCUdtgurhfH0Ka5EmsYcs/zeD7OGnInylw6oUN60nffJ1n
         0FqG46kIjiBOagecYOUMvejBlvompnZuw6xAu4X+92OWzdCnyhWPNa29+nFj5+MbeD
         2AaDOlzJArudhaSe7jQZKduYIke8HXwRBQrp4ET8=
Date:   Fri, 11 Oct 2019 15:24:27 +0100
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
Subject: Re: [PATCH 1/4] modpost: delegate updating namespaces to separate
 function
Message-ID: <20191011142426.vwfhw4dtyy4nfzkv@willie-the-truck>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-2-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010151443.7399-2-maennich@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 10, 2019 at 04:14:40PM +0100, Matthias Maennich wrote:
> Let the function 'sym_update_namespace' take care of updating the
> namespace for a symbol. While this currently only replaces one single
> location where namespaces are updated, in a following patch, this
> function will get more call sites.
> 
> The function signature is intentionally close to sym_update_crc and
> taking the name by char* seems like unnecessary work as the symbol has
> to be looked up again. In a later patch of this series, this concern
> will be addressed.
> 
> This function ensures that symbol::namespace is either NULL or has a
> valid non-empty value. Previously, the empty string was considered 'no
> namespace' as well and this lead to confusion.
> 
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---
>  scripts/mod/modpost.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 4d2cdb4d71e3..9f5dcdff4d2f 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -362,6 +362,22 @@ static char *sym_extract_namespace(const char **symname)
>  	return namespace;
>  }
>  
> +static void sym_update_namespace(const char *symname, const char *namespace)
> +{
> +       struct symbol *s = find_symbol(symname);
> +       /* That symbol should have been created earlier and thus this is
> +        * actually an assertion. */
> +       if (!s) {
> +               merror("Could not update namespace(%s) for symbol %s\n",
> +                      namespace, symname);
> +               return;
> +       }
> +
> +       free(s->namespace);
> +       s->namespace =
> +	       namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
> +}

You made me look up C operator precedence again, but it's fine so:

Acked-by: Will Deacon <will@kernel.org>

Will
