Return-Path: <linux-kbuild+bounces-11704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEuQGly/rmlEIgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11704-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:38:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE0238F63
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 672883013FDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802B37C925;
	Mon,  9 Mar 2026 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwvEuJY3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED1392C2C
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773059155; cv=none; b=UzwYFC72Z1aWN7YR+qWFHwuvC4yvpWUdQbWfkqHCtViQIkBt87btga28C27m1SvpinIa3Oe8nHpUKOgworpZ6ClnFZmF4PuBz8wZMYPQ9tPwN/TlWDFiGa4FFoS5krascTrYi0BzNT6IJWJcVeS+LGZpox8llY2LArl5y1LVQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773059155; c=relaxed/simple;
	bh=6VRwsyl3Wr7HoMwgyKSwwdQmAd0Z7q3hJWeBII1gI4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp18ZV3oGUnVywoNNJw0yZRUym+b+/DBpNF2yJ9JV5I+uEu7WqvzOo6LG8V18YEDCQE9PSkRRtVCDeO2XP2pPLTOcbrByHVohgfQIS54NPvFTVm4bn0sUNbBTnVJyF6k1xkKaVquWRmROYZZLiPELGZZTt723U3sc1mT4QuUoZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwvEuJY3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so5832807e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773059152; x=1773663952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XB7SJJQI7cMx7V/S0Xyl43Jm72C76ZafI2O8rO+Kds0=;
        b=HwvEuJY3Df57IuvaOVaO5UFax2OcPCn3+T+aav3/2/lf18hpHY/mYmHkj00c1iitmT
         sr5VbLoyGGgogS+Rh3wQXRY1+SUrY7kEuIpmpWSsuLGunSVBEkhlGX3Ls5rITfKzcS+D
         vazS0FjxUytr4eiHK6gQ9geFdhkdBBKEoTLAEeoWAWS0RHhW7aoulIXoKIxBt4h7aJdi
         mNYnuIlgrAXJiMhkoevwv5hhgKm7N14vIuXdZ86X/3zMX+7jLGfnzf3XCzbgGUKTwW8n
         DRbGKR2I3eMH+gGRVXoajXDzaAEBWnp6osEfzYVtBTr74d7YwQWlBhwKGZUSk5h9UC6D
         anoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059152; x=1773663952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XB7SJJQI7cMx7V/S0Xyl43Jm72C76ZafI2O8rO+Kds0=;
        b=ZuSC/heIwH64yBeRZ8gSLfjPrKmzZyAxkk8eOK506xXWMV8lQkDcxObg63DzVSPgLj
         8RqmzNXee3syS43+fcVXUhUzaCeqkkYiBG3wFnYz3XmiHCHOphb8rA4KMRze/HeagwRn
         RFEo0aRoKj9EX2IBWPD6YZLsUTSmflgMVqnvJcllDdqQ0MwPKOw5+5qsJzOX+4bp5/r4
         eSCqO+ssHfXtbu+P8ClQsXRn3kqFE0rzPb2jiFzMuQD/6Fyb5SroHrZwpKUgAw34vPZF
         lGF1VaN+YEQIHZjtJUlGhfVOJprzybKTW+9ggwALIVUJiyZLeS/+jzkWu6eZFjRJizDO
         oCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHRDcmrfd8YuJ7iHcEUxS6kIcgwK2kbGScbbC0v8mCqGba1kL6KtJZdrqk+MvptTCOJEs5g9C6SgzCXu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3w9vqdCuko2EAPadx5PQ9Q8/zlqk7tBmFN0qUOZyQuFA8Jh9E
	dUEXEkoWPNp+HV/WsLIgVo4qYx/smYCLGkcw2AkGZxCj6C4md+N5Lp9Vi3Q8ZSgBgeU=
X-Gm-Gg: ATEYQzx+DeWpFL3c/JiJMfsFHSLKvQNlhqi0J/A9doTZAgzRJiABk6XShauyR+qioLn
	7+QXMGSyVnlPxEZLERPu0ZhpUssKHyEsguSasgs8BD2noLQ7DhZfw+mxy2y/6wdlK+l7/qepTGv
	OUTRRy+N5Nxo5TowwWFuon235NYDBe4Cu/zhUkfOlhp/jO/kAleGE4wnpOOG0rdjO/+Q19JAVxY
	DtvAvdfgSUNtbs3xxZHK/cm1GZtHRJoxpYc8UPk5UhDMaQM1/FZ5dPu7FS0Z382Lul+nQk7Csk4
	aJ/RBCMzBhcoVBjn3RTIu3oqARRM4CR/Mplqq/QVdZ5jkBT+FUQlYUVeVgZhRYzan4G00qZClpJ
	h+dLx3lDlmufENjtExXI8d8lnab3eU3VP9+xaCVhBX9sAxlt4sZZpEOPgkrhguaRvomCLUFzZYt
	fWaJ3MX5E6rBmSgiT4RK9+5QsumUNUNlyasKGFUdI8cmry8QK/UwnTQzGn
X-Received: by 2002:ac2:51c3:0:b0:5a1:3a0f:f2e3 with SMTP id 2adb3069b0e04-5a13ccdd60bmr3277256e87.23.1773059151877;
        Mon, 09 Mar 2026 05:25:51 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d033f96sm2108488e87.34.2026.03.09.05.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:25:51 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:25:49 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: fix unexpected
 operator warning
Message-ID: <aa68TbTEH1CHr3V0@nuoska>
References: <20260309121505.40454-1-o451686892@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309121505.40454-1-o451686892@gmail.com>
X-Rspamd-Queue-Id: 6DCE0238F63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11704-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email]
X-Rspamd-Action: no action

Hi,

On Mon, Mar 09, 2026 at 08:15:05PM +0800, Weizhao Ouyang wrote:
> Fix a warning for:
> 
> $ ./scripts/kconfig/merge_config.sh .config extra.config
> Using .config as base
> Merging extra.config
> ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> The shellcheck report is also attached:
> 
> if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
>                ^-- SC3014 (warning): In POSIX sh, == in place of = is undefined.
>                                                         ^-- SC3014 (warning): In POSIX sh, == in place of = is undefined.
> 
> Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>

Thanks!

Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>

> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..073c6bec5245 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -381,7 +381,7 @@ END {
>  	STRICT_MODE_VIOLATED=true
>  fi
>  
> -if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
> +if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
>  	echo "Requested and effective config differ"
>  	exit 1
>  fi
> -- 
> 2.48.1
> 

