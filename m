Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D70B175E45
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 16:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgCBPdZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 10:33:25 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:58160 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgCBPdZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 10:33:25 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 9AD8B4A02C;
        Mon,  2 Mar 2020 10:33:20 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=Vi38EUq+JMULt2NQV1KsMhxFf0c=; b=JTM4ho
        os8ys/hV1sCL4G+Rc0Kx8QmWTzZKV01P7hyQFPMcCZzgyfOoz+0GnReg+V+JGMhD
        xPKugKuXrgZidT1V5tVApzmfPyEbkzemOHBYwKhNyb8lsHKC2vL9+JBlQVNw9CAV
        jPT2BbnzV7AiuY5kakQ+k4Ddqb4H/emu8tkZs=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 90CA54A02B;
        Mon,  2 Mar 2020 10:33:20 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=NmmE9aIpcRhBlAZU4EmzZNvY9119maGX22PMnYUwqTw=; b=MNMkKznIiwC0ytqiHqYHsAQUKLqosFYQDpcp8dbeWE6xxPoOAuGznv177QxWCdRt7Q6GnFoG3Jv9P3G6pjKKI9LHaopAAeyDbPNHdd+CsFuIdkdm4NF/M58JScx3cD+T+1SSTZzBTyxYarWeEZIb/UA3/W0SWLXKvT9I5ff/S50=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 06E674A02A;
        Mon,  2 Mar 2020 10:33:20 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 33EC02DA0227;
        Mon,  2 Mar 2020 10:33:19 -0500 (EST)
Date:   Mon, 2 Mar 2020 10:33:19 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: make 'imply' obey the direct dependency
In-Reply-To: <20200302062340.21453-2-masahiroy@kernel.org>
Message-ID: <nycvar.YSQ.7.76.2003021032000.1559@knanqh.ubzr>
References: <20200302062340.21453-1-masahiroy@kernel.org> <20200302062340.21453-2-masahiroy@kernel.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 251BF298-5C9B-11EA-B9D9-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2 Mar 2020, Masahiro Yamada wrote:

> The 'imply' statement may create unmet direct dependency when the
> implied symbol depends on m.
> 
> [Test Code]
> 
>   config FOO
>           tristate "foo"
>           imply BAZ
> 
>   config BAZ
>           tristate "baz"
>           depends on BAR
> 
>   config BAR
>           def_tristate m
> 
>   config MODULES
>           def_bool y
>           option modules
> 
> If you set FOO=y, BAZ is also promoted to y, which results in the
> following .config file:
> 
>   CONFIG_FOO=y
>   CONFIG_BAZ=y
>   CONFIG_BAR=m
>   CONFIG_MODULES=y
> 
> This does not meet the dependency 'BAZ depends on BAR'.
> 
> Unlike 'select', what is worse, Kconfig never shows the
> 'WARNING: unmet direct dependencies detected for ...' for this case.
> 
> Because 'imply' is considered to be weaker than 'depends on', Kconfig
> should take the direct dependency into account.
> 
> For clarification, describe this case in kconfig-language.rst too.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

> ---
> 
>  Documentation/kbuild/kconfig-language.rst | 7 +++++--
>  scripts/kconfig/symbol.c                  | 4 +++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index d4d988aea679..68719e78ff85 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -159,11 +159,11 @@ applicable everywhere (see syntax).
>    Given the following example::
>  
>      config FOO
> -	tristate
> +	tristate "foo"
>  	imply BAZ
>  
>      config BAZ
> -	tristate
> +	tristate "baz"
>  	depends on BAR
>  
>    The following values are possible:
> @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
>  	n		y		n		N/m/y
>  	m		y		m		M/y/n
>  	y		y		y		Y/m/n
> +	n		m		n		N/m
> +	m		m		m		M/n
> +	y		m		n		M/n
>  	y		n		*		N
>  	===		===		=============	==============
>  
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index b101ef3c377a..3dc81397d003 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -221,7 +221,7 @@ static void sym_calc_visibility(struct symbol *sym)
>  		sym_set_changed(sym);
>  	}
>  	tri = no;
> -	if (sym->implied.expr && sym->dir_dep.tri != no)
> +	if (sym->implied.expr)
>  		tri = expr_calc_value(sym->implied.expr);
>  	if (tri == mod && sym_get_type(sym) == S_BOOLEAN)
>  		tri = yes;
> @@ -394,6 +394,8 @@ void sym_calc_value(struct symbol *sym)
>  				if (sym->implied.tri != no) {
>  					sym->flags |= SYMBOL_WRITE;
>  					newval.tri = EXPR_OR(newval.tri, sym->implied.tri);
> +					newval.tri = EXPR_AND(newval.tri,
> +							      sym->dir_dep.tri);
>  				}
>  			}
>  		calc_newval:
> -- 
> 2.17.1
> 
> 
