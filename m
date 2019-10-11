Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3AF6D4468
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfJKPc5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 11:32:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:55808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfJKPc5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 11:32:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54A9F206A1;
        Fri, 11 Oct 2019 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570807975;
        bh=a5aI9kGd8914ij1xkvqBnSj8mL4+xJaBSyyLL2y1qdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IIxhbo/m1o0kKegJEDiscNOcWjdlAh2zAfP4a0otj9vJI80QjghL+p9Bv/ovVriia
         OFJlqvxutMFm+Q1cLz5l07hohok5rYNdIgPaOToeKJPgWiyzJJ+qKL2xOds8QaJcvQ
         YfgcfHSXtPRAbnrrruxkjyH6y5zHCtDV4iNbB+X8=
Date:   Fri, 11 Oct 2019 17:32:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH 1/4] modpost: delegate updating namespaces to separate
 function
Message-ID: <20191011153253.GB1283883@kroah.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-2-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010151443.7399-2-maennich@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

Do we care about checkpatch issues in tools?

If so, you need a blank line before the comment :)

Anyway, not a big deal

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
