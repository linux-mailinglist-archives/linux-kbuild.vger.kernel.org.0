Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5763D175E3B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 16:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgCBPby (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 10:31:54 -0500
Received: from pb-smtp2.pobox.com ([64.147.108.71]:62715 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgCBPby (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 10:31:54 -0500
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 2251A5E9EC;
        Mon,  2 Mar 2020 10:31:52 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=+w0TjN0sgfinY77qlaN2DDq+4MI=; b=cb0gkl
        sR9djEG5wDD+oYCv2F3RvKhPPaRBTl/O6Ggvc1WGCUxCwBCXQf4pwa5G7sGePs0J
        CXZlkE/Iui3yN8WVlMVJM+oNm0cSfMabp029SBfGlCzMUMaHz8kGLAkeT9ifkoNt
        sgSvdg6x8LLdue7BMqx+jhhIsuPQdiQlvV8Qc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 1911B5E9EB;
        Mon,  2 Mar 2020 10:31:52 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=WFfea9XXdTCiyqDrZWumH0aOM0ikm6o03o4Ib1MKO6s=; b=yCWE4Ce18rB4VWGl5FYMYYxA+GIP4zQNaSZyYucR4+/AEs6OmTN0GMXiiDy1K/XddT0lduzhElCaZiMbTQ6l21cVmm8dJytVjhbgxI/O3D2h1cajHQE4LBg/YPkwJuEJZ5lflyNXArr5v7aVZ6vA33/DTf2gI1mFCdL+C9C2zhs=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 804655E9EA;
        Mon,  2 Mar 2020 10:31:51 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 9FBC12DA0227;
        Mon,  2 Mar 2020 10:31:50 -0500 (EST)
Date:   Mon, 2 Mar 2020 10:31:50 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] kconfig: allow symbols implied by y to become m
In-Reply-To: <20200302062340.21453-1-masahiroy@kernel.org>
Message-ID: <nycvar.YSQ.7.76.2003021024370.1559@knanqh.ubzr>
References: <20200302062340.21453-1-masahiroy@kernel.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: F05AC3AE-5C9A-11EA-B458-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2 Mar 2020, Masahiro Yamada wrote:

> The 'imply' keyword restricts a symbol to y or n, excluding m
> when it is implied by y. This is the original behavior since
> commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword").
> 
> However, the author of the 'imply' keyword, Nicolas Pitre, stated
> that the 'imply' keyword should not impose any restrictions. [1]
> 
> I agree, and want to get rid of this tricky behavior.
> 
> [1]: https://lkml.org/lkml/2020/2/19/714
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

In addition to the IS_REACHABLE() note, it might be a good idea to 
suggest adding an "imply" reference to the dependency if the feature 
provided by BAZ is highli desirable, e.g.:

config FOO
	tristate
	imply BAR
	imply BAZ


> ---
> 
>  Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
>  scripts/kconfig/symbol.c                  |  5 +----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index d0111dd26410..d4d988aea679 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -173,7 +173,7 @@ applicable everywhere (see syntax).
>  	===		===		=============	==============
>  	n		y		n		N/m/y
>  	m		y		m		M/y/n
> -	y		y		y		Y/n
> +	y		y		y		Y/m/n
>  	y		n		*		N
>  	===		===		=============	==============
>  
> @@ -181,6 +181,16 @@ applicable everywhere (see syntax).
>    ability to hook into a secondary subsystem while allowing the user to
>    configure that subsystem out without also having to unset these drivers.
>  
> +  Note: If the combination of FOO=y and BAR=m causes a link error,
> +  you can guard the function call with IS_REACHABLE()::
> +
> +	foo_init()
> +	{
> +		if (IS_REACHABLE(CONFIG_BAZ))
> +			baz_register(&foo);
> +		...
> +	}
> +
>  - limiting menu display: "visible if" <expr>
>  
>    This attribute is only applicable to menu blocks, if the condition is
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 8d38b700b314..b101ef3c377a 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -401,8 +401,7 @@ void sym_calc_value(struct symbol *sym)
>  				sym_warn_unmet_dep(sym);
>  			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
>  		}
> -		if (newval.tri == mod &&
> -		    (sym_get_type(sym) == S_BOOLEAN || sym->implied.tri == yes))
> +		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
>  			newval.tri = yes;
>  		break;
>  	case S_STRING:
> @@ -484,8 +483,6 @@ bool sym_tristate_within_range(struct symbol *sym, tristate val)
>  		return false;
>  	if (sym->visible <= sym->rev_dep.tri)
>  		return false;
> -	if (sym->implied.tri == yes && val == mod)
> -		return false;
>  	if (sym_is_choice_value(sym) && sym->visible == yes)
>  		return val == yes;
>  	return val >= sym->rev_dep.tri && val <= sym->visible;
> -- 
> 2.17.1
> 
> 
