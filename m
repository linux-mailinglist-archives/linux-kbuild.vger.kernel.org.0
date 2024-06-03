Return-Path: <linux-kbuild+bounces-1984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C18E2F9F
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 23:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 124A0B235B5
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 21:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9DD80031;
	Mon,  3 Jun 2024 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vHCBqKTA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA54F1EE;
	Mon,  3 Jun 2024 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450215; cv=none; b=VxVMWAFk+uQnKrb7AJ39iWxKJCbNWg5f7QwG3OF2DkvUyrXyd7dB78ncGvU2CBPKILhRL3Jwb9oAYrl8bCVeRZizALbWK0fnMcS2aHano847WZkMMDGgyDmCmQxVIB6YRVKBYGWS2D8+ikHXBMmQMMAqomt7/m4yS9YISmZ/fXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450215; c=relaxed/simple;
	bh=x+PY2+ekSSRWKPMhWSep1QpgDeF1C+GK06p8Hqoiqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upt9Rhea8YvxtmSVAVWGxg7VCYr3cdVHgaW14PzrXSVXZR/K4VnnwyRdgFTMpMFsKszmKqB9BKp5BuFAuyzNV+p6p96nMZQld/Cd9xArvIuHj7LR0VVVBAcdKkGe/7MPLHUD/nNVlHiLWGXjT4lO57nipvDISL5f1Y4OH+dd25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vHCBqKTA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0tMr/IjcicAgcE4qukmRutDbwjqPU9tdzdTY92kBc2E=; b=vHCBqKTAuZOlkkVF+PKQEMwK44
	e1kmPmV3x4S07kSpXLFu3Ghuq4JDBewe4yb4vBxEy/p7yIWuT5lT95SE3YIq+cbBH2fmTKUYwXpd0
	ZPUBcE/zircojWxbtYLjl3IQLmO3DropajD5G/8C/01Zkp4rsTO0rU2vmr5byH8lsptzxasFsCtIG
	74GhtVscXTqao0/gpCWWYKl8JO2OYgtMhijfW9rRkbtF8FHNSdvwGyfmcCWA23Jxrlw6BjsX2VZB/
	+m3rh6X9GxS8/MdjVkiJwUyzJixQpod7IDJtVijOqjN1Q/bWgKQ7TOa0iuY6A+TUPwFm/Ij2OXUnA
	v3oD6Uyg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEFFs-00000000Otw-3zcn;
	Mon, 03 Jun 2024 21:30:13 +0000
Message-ID: <96132fe8-a0ba-4bd7-8019-816f02afc426@infradead.org>
Date: Mon, 3 Jun 2024 14:30:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] kconfig: remove wrong expr_trans_bool()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20240603161904.1663388-1-masahiroy@kernel.org>
 <20240603161904.1663388-3-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240603161904.1663388-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/24 9:19 AM, Masahiro Yamada wrote:
> expr_trans_bool() performs an incorrect transformation.
> 
> [Test Code]
> 
>     config MODULES
>             def_bool y
>             modules
> 
>     config A
>             def_bool y
>             select C if B != n
> 
>     config B
>             def_tristate m
> 
>     config C
>             tristate
> 
> [Result]
> 
>     CONFIG_MODULES=y
>     CONFIG_A=y
>     CONFIG_B=m
>     CONFIG_C=m
> 
> This result is incorrect because CONFIG_C=y is expected.
> 
> Documentation/kbuild/kconfig-language.rst clearly explains the function
> of the '!=' operator:
> 
>   (3) If the values of both symbols are equal, it returns 'n',
>       otherwise 'y'.
> 
> Therefore, the statement:
> 
>     select C if A != n
> 
> should be equivalent to:
> 
>     select C if y
> 
> Hence, the symbol C should be selected by 'y' instead of 'm'.
> 
> The comment block of expr_trans_bool() correctly explains its intention:
> 
>   * bool FOO!=n => FOO
>     ^^^^
> 
> If FOO is bool, FOO!=n can be simplified into FOO. This is correct.
> 
> However, the actual code performs this transformation when FOO is
> tristate.
> 
>     if (e->left.sym->type == S_TRISTATE) {
>                              ^^^^^^^^^^
> 
> While, it can be fixed to S_BOOLEAN, there is no point in doing so

  While it can

> because expr_tranform() already transforms FOO!=n to FOO when FOO is
> bool. (see the "case E_UNEQUAL" part)
> 
> expr_trans_bool() is wrong and unnecessary.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  scripts/kconfig/expr.c | 29 -----------------------------
>  scripts/kconfig/expr.h |  1 -
>  scripts/kconfig/menu.c |  2 --
>  3 files changed, 32 deletions(-)
> 
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 4d95fce5f9a7..fcc190b67b6f 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -396,35 +396,6 @@ static struct expr *expr_eliminate_yn(struct expr *e)
>  	return e;
>  }
>  
> -/*
> - * bool FOO!=n => FOO
> - */
> -struct expr *expr_trans_bool(struct expr *e)
> -{
> -	if (!e)
> -		return NULL;
> -	switch (e->type) {
> -	case E_AND:
> -	case E_OR:
> -	case E_NOT:
> -		e->left.expr = expr_trans_bool(e->left.expr);
> -		e->right.expr = expr_trans_bool(e->right.expr);
> -		break;
> -	case E_UNEQUAL:
> -		// FOO!=n -> FOO
> -		if (e->left.sym->type == S_TRISTATE) {
> -			if (e->right.sym == &symbol_no) {
> -				e->type = E_SYMBOL;
> -				e->right.sym = NULL;
> -			}
> -		}
> -		break;
> -	default:
> -		;
> -	}
> -	return e;
> -}
> -
>  /*
>   * e1 || e2 -> ?
>   */
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index fa50fc45622e..7c0c242318bc 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -284,7 +284,6 @@ void expr_free(struct expr *e);
>  void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
>  int expr_eq(struct expr *e1, struct expr *e2);
>  tristate expr_calc_value(struct expr *e);
> -struct expr *expr_trans_bool(struct expr *e);
>  struct expr *expr_eliminate_dups(struct expr *e);
>  struct expr *expr_transform(struct expr *e);
>  int expr_contains_symbol(struct expr *dep, struct symbol *sym);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 53151c5a6028..eef9b63cdf11 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -398,8 +398,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
>  				dep = expr_transform(dep);
>  				dep = expr_alloc_and(expr_copy(basedep), dep);
>  				dep = expr_eliminate_dups(dep);
> -				if (menu->sym && menu->sym->type != S_TRISTATE)
> -					dep = expr_trans_bool(dep);
>  				prop->visible.expr = dep;
>  
>  				/*

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

