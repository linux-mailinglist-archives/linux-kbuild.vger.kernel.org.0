Return-Path: <linux-kbuild+bounces-11761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHQBDILNr2nWcAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11761-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 08:51:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E926246A59
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 08:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77946304D1DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 07:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CE8364923;
	Tue, 10 Mar 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXO9MaUz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BA363C4C
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129064; cv=none; b=UlCPgxYSIOE+SPYcfcyaL+ncq3bZyYmyZfm/uCcVixG707WXuoGkjvEZBYjWaH1Akg1pJ13F7tHzL8MFEbcFityKQZLI5p5xe8u18HmKKnhGqN2zO9gvhM404fvtnGqcDcWL9VrQWY6gSkoJpkMM5qPioP6E8Sg+Znm664E3Jd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129064; c=relaxed/simple;
	bh=71wvaGeTES5Wz8n2xDwOO3cq7GaeyIzQYOKs3oKK4as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8a3mIA2FLIQ3br/bsqjVBf4r8r5xOuL1+2uFSvBTZWeM2OVTcultj7/7hVNn14sgfyRPZUM3BMZ/DS8DwZTtsbRfgcbbhXhrubQEU6i5J0O27NX8i/3L12GnwNSg2nz8a370DKGJFtaAPbPK9f+p1mqRRbnmxFiOigLbu0+Ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXO9MaUz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a142464316so3479368e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773129060; x=1773733860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnz3PCpJQ2w/9VMb2f/lqQClCVYil90P6vL7y20LWw8=;
        b=sXO9MaUz77SCoSnJaqlfUC9lyBCBEIAZqJPeAW5SpW95Yo14xUuG7i3nMYufjRH8aE
         6Tl6ot4Rd8JD+21tJ9/U5VNenx35YhZHdahAY8tqodOEeQkcFuiBeP8WLvW0M2MKNAK/
         N2ZAphpjDQQAXIH7CG/XI8daoxBeJVy5ohSDD457xeKXqPtwo/SfnaqC72s6GVAUvoom
         TcCptRZn9Fxg2nxBf118qH4+Bm9r5QTDOItZByVEKjJhpXfqgg9coRAdxo9oOw2zJotb
         xIB63NZFyyuMqDLslsxOlKXVbJKfih8gIbmzsAoLbeGLFAyOvUbcioSz0a9xiHL44dNH
         Hv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129060; x=1773733860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnz3PCpJQ2w/9VMb2f/lqQClCVYil90P6vL7y20LWw8=;
        b=KJ7uWAcnWgA3e0DBjNZ5QvG30fQzO4jEergX84IYZNtji4E+jC08tdgmQIv25opfj6
         C62FHjXlcBpiQhtiMWQ9IDz1BI6X5jNQTgxN1abiFvxEYkWzkNYd9TQh7FPZ9JfiYcLX
         ImOoamVknjPu/EPmbzPONzqVjd/wPL7eFU4jmGndhznhI7yJfim5bdWhx7DY4h1Slrhd
         ZCyrTAObARTZgXgisCFtck7sTcvpEd8+0XW1Nvfdyolay/V077UZjUcegmSu2mRgH/YP
         gqIBtEbaXNs7l1HRsqmlD9r9lZ+FaamyHj14K5D1UmGZOnevrM73Ii6VLybo6QJLDe+J
         MHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+qvhDEqQkSOFAHZ7lchse1eRgMbJN+7f22pAmQOiA4/fyyEc8F9S841vVGvZzne2YZ+dEGRvJzbcozkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsv6kcI+8o54UIdTbSSMZ5YTXGPFhW4UQjD6f0uK7S4A8Dktd
	OApucSLBPlx3FbSCZuCkGGBYKuwUtH+FMxJyAduR04WWWsv+yx9mJQwmS1x+dlICxfKZ1lK8Ycp
	q6BaJUzc=
X-Gm-Gg: ATEYQzwrb4pgCBEnYxB5XclPHbxtc01a35WFWAc8ptMJmDhOcAPa0A9QthN/NYCy+KJ
	suO55qqPp/tvTAtEcdjENCroxkPWxq3FnjbOjDUOstBy5NfxG/X0nPMiMjdksIMmF1uYQeeuL1g
	KlNfbm79ek18q9l+vhUHsvNKMiWclrVQ4N6B5P10HP/YdLBAeSjrMaP9DXWXrU55y8tJ09P4/uB
	Xtd9VkzldH761AVkA0YEZ5VZsMxJBS61Eoac/xCIzeJch/DF7z2/argI8nXsl+QuX4P/OWyr3pv
	/6sg5hIQXGcFEgvBB9Y1jaHkIWaRnY5U6ikQX3H46DTXEPXFd9MQeO2IhboCkpIXXcKkwiIHE15
	qISfVtLQCssHkTuSe9Oyax0RM9MWoGwGN6S6LTt9APsmjYRmmddwGZgayDjyfxk6/FZJl5tnwmn
	5b/cAcsBoafAVyorZ84Xn6LfO0NqKRh7xRriLJVix9n2GEoQSO3Lyz4cmI
X-Received: by 2002:a05:6512:12d0:b0:5a1:1914:2bac with SMTP id 2adb3069b0e04-5a13ccf7f2cmr4359767e87.25.1773129059912;
        Tue, 10 Mar 2026 00:50:59 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cd7fsm2617542e87.19.2026.03.10.00.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:50:59 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:50:49 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <aa_NWVOiHyN7CVvg@nuoska>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
 <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
 <20260309170904.GA2779008@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309170904.GA2779008@ax162>
X-Rspamd-Queue-Id: 9E926246A59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11761-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email]
X-Rspamd-Action: no action

Hi,

On Mon, Mar 09, 2026 at 10:09:04AM -0700, Nathan Chancellor wrote:
> On Mon, Mar 09, 2026 at 05:38:58PM +0100, Andreas Larsson wrote:
> > On 2026-01-22 11:57, Mikko Rapeli wrote:
> > > From: Anders Roxell <anders.roxell@linaro.org>
> > > 
> > > merge_config.sh shell/sed/grep loop scales poorly and is slow.
> > > With Yocto genericarm64 kernel and around 190 config fragments
> > > the script takes more than 20 minutes to run on a fast build machine.
> > > Re-implementation with awk does the same job in 10 seconds.
> > > Using awk since it is likely available in the build environments
> > > and using perl, python etc would introduce more complex runtime
> > > dependencies. awk is good enough and lot better than shell/sed/grep.
> > > 
> > > Output stays the same but changed execution time means that
> > > parallel job output may be ordered differently.
> > > 
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
> > >  1 file changed, 128 insertions(+), 40 deletions(-)
> > 
> > Hi,
> > 
> > Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
> > shell/sed/grep to awk") breaks merge_config.sh for me:
> > 
> > ---------->%----------
> > $ make tiny.config
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/confdata.o
> >   HOSTCC  scripts/kconfig/expr.o
> >   LEX     scripts/kconfig/lexer.lex.c
> >   YACC    scripts/kconfig/parser.tab.[ch]
> >   HOSTCC  scripts/kconfig/lexer.lex.o
> >   HOSTCC  scripts/kconfig/menu.o
> >   HOSTCC  scripts/kconfig/parser.tab.o
> >   HOSTCC  scripts/kconfig/preprocess.o
> >   HOSTCC  scripts/kconfig/symbol.o
> >   HOSTCC  scripts/kconfig/util.o
> >   HOSTLD  scripts/kconfig/conf
> > The base file '.config' does not exist. Creating one...
> > Using .config as base
> > Merging ./kernel/configs/tiny.config
> > awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
> > mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
> > make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
> > make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> > ---------->%----------
> > 
> > with this underlying call to merge_config.sh, an empty .config and where
> > my awk is GNU Awk 5.1.0:
> > 
> > ---------->%----------
> > $ make tiny.config V=1
> > make --no-print-directory -C <kernel-source-top-dir> \
> > -f <kernel-source-top-dir>/Makefile tiny.config
> > make -f ./scripts/Makefile.build obj=scripts/basic
> > make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
> > # cmd_merge_fragments tiny.config
> >   ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
> > ...
> > 
> > $ awk --version
> > GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
> > ---------->%----------
> > 
> > At 5fa9b82cbcfc~ things works as expected.

Hmm, all these steps work for me with GNU awk 5.1.0 so something else
is different here. On line 267 awk is given input file args
"$ORIG_MERGE_FILE" "$TMP_FILE" "$TMP_FILE.new" and it fails to
create the output file "$TMP_FILE.new" with >> and plain print statement.

> Hmmm, not sure how I have not seen this error myself since I test
> tiny.config but I can reproduce with a clean output directory. Something
> like this seems like a simple fix but the only instances of ARGV[3] in
> the awk script that I can see use '>>', which should create the file if
> it does not exist. Mikko, any ideas?
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..070ecae87a1c 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -123,6 +123,7 @@ fi
>  MERGE_LIST=$*
>  
>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +touch "$TMP_FILE.new"
>  
>  echo "Using $INITFILE as base"

This could help but I fail to understand why this would be needed. Why is awk
not able to create this file on line 256?

awk manual says:

https://www.gnu.org/software/gawk/manual/html_node/Redirection.html

    print items >> output-file

    This redirection prints the items into the preexisting output file named
    output-file. The difference between this and the single-‘>’ redirection
    is that the old contents (if any) of output-file are not erased. Instead,
    the awk output is appended to the file. If output-file does not exist,
    then it is created.

And in all my testing this works. Which distro is this? Is something else like
file system setup in some way unusual?

Cheers,

-Mikko

