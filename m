Return-Path: <linux-kbuild+bounces-1088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9086BF91
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 04:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44020B245E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 03:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2931F95F;
	Thu, 29 Feb 2024 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3bnpHmm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0B364D9
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Feb 2024 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709178465; cv=none; b=IUy2TvN255RftsZVh7wBc6tXPqAvxxSwMtc81IaXmpD7spEds2IrO4N7jRBx9PCCNzF1EOWawB2VyTPjhGThORBb4dsGGgiAhRL8ATJwnr3UZATMG40RwYvdG42Oudf9P+kmKySHDm3S6zXFyJF2dlOoz/6NQI5wggvXXV6Al64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709178465; c=relaxed/simple;
	bh=GeGiTVG63Aoz4SuA2gUxS4O52MOgjsfemlEYups5F9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ3SfQk0NwdQmQwf4Zw25F04nV7soEXknIeZecEs9KbAf61JwzbiP/pp2zS3Cj4T+0b29+uZ/5efV2OZIQe7qcOqh5NEtV1StF0dBtuHO0hvksNbDIttxBJN9hKq9m5qWDJUaFt8yVyTm1rrJ6hrdIpDo8zYUTxQQRauRDdG6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3bnpHmm; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5a0e9baaab4so58637eaf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 19:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709178463; x=1709783263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7r1KhyQxvJ518JFfEHwtdSkxnn70HF9z0iJ/tgTjB7w=;
        b=a3bnpHmmnnEf75E200YYqq4nvV14Dt18zpOee8Bp7Q4+BpRAx28jpJdTQM3n4MF36e
         AYsCeQfQedV1utrmMjAB/eqeps5xW6lVGNYcuvobu397Y1bR7kI80x8nPMIIP9RHgJAi
         lprRktWJmAwoZ8uJMYyl2hjKCWRCyB6OtjYJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709178463; x=1709783263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r1KhyQxvJ518JFfEHwtdSkxnn70HF9z0iJ/tgTjB7w=;
        b=PbchD9tujATBWsiz4xG5ST8r+mt9JkA70d9+XBrnEnfD2Li75NqIDV3K94Rlpz92rs
         7ZOTMR/tkvWXQd0D+YyAVP1YseaIB6CaZ2L3brY9chKNn8sXLn5SmwMlkxHilpD1XdCj
         0yJMg08l3cd/kzMOwO3rko5mLQt+vxwwNObcKg7xb6NuLORtYX1iBSNUPgfo5QdKX272
         WKAnEBTgD+kONbQgjVumYGOyxVmkxk+nhxF122oSKiTTVJ+rXOWnmbjtujuvb4khsVb3
         pb6aeyRk4fA58uYk5kM1z2iIPa1C9HSjG7a4Ifa0G6aIBNC3FdIDKYctnMUynN9x7A97
         +9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVvHYaeRJNaKJePx7Fzxp6UC5B9wqJCJtpW4wMEE/tTjsmqmRX6igpZbJGflUbJgBXSSeMfP9yyoIral0amBVW6ux6+bq8HXlbl3rU2
X-Gm-Message-State: AOJu0Yxw9u6Ff4wH9AzPjsF+Y4a2s9riCSooHZdk5n7Zh4lYLl557jZZ
	FsXe90cvLzi0I77nS0IJInlNeCRnrER3RaSBsgIF2RFpzuQPuw6yyPVSHulaIg==
X-Google-Smtp-Source: AGHT+IFddUjlecz3WLhXM9ZpqsGfIvTj+QwrXJ5rjtaXOnpIQb5UTTGVYVU5lvRDOFupaqGBEm4e/g==
X-Received: by 2002:a05:6358:6588:b0:17b:c9cc:f60b with SMTP id x8-20020a056358658800b0017bc9ccf60bmr1865490rwh.28.1709178462803;
        Wed, 28 Feb 2024 19:47:42 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:50c1:1ad2:3268:cacd])
        by smtp.gmail.com with ESMTPSA id m1-20020a635801000000b005dc120fa3b2sm200148pgb.18.2024.02.28.19.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 19:47:42 -0800 (PST)
Date: Thu, 29 Feb 2024 12:47:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <20240229034739.GN11972@google.com>
References: <20240222031801.GG11472@google.com>
 <20240222032559.496127-1-senozhatsky@chromium.org>
 <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>
 <20240222051621.GH11472@google.com>
 <20240228045652.GH11972@google.com>
 <CAK7LNAQ8OyNMeGzVoTRg-sHDZ4YK0EKY_eEWNepekaibO_ZKwg@mail.gmail.com>
 <20240229021010.GM11972@google.com>
 <CAK7LNASujf8m4PpMyoCC1cTN_YGeG1HVaOR+3pZx5=3OJp=85A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASujf8m4PpMyoCC1cTN_YGeG1HVaOR+3pZx5=3OJp=85A@mail.gmail.com>

On (24/02/29 12:36), Masahiro Yamada wrote:
> > On (24/02/29 11:03), Masahiro Yamada wrote:
> > > > > > > +++ b/scripts/kconfig/Makefile
[..]
> > > > > > > +       @echo  ''
> > > > > > > +       @echo  'Configuration environment variables:'
> > > > > > > +       @echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
> > > > > > > +       @echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfig warn about all unrecognized config symbols'
> > > > > > >
> > > > > > >  # ===========================================================================
> > > > > > >  # object files used by all kconfig flavours
> > > > > > > --
> > > > > > > 2.44.0.rc0.258.g7320e95886-goog
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Why only two, while Kconfig supports more env variables?
> > > > >
> > > > > Right.  I wanted to add only those that we use (and familiar with) for
> > > > > starters.  I'm not familiar with things like KCONFIG_PROBABILITY, for
> > > > > instance, and not sure how to document it (its Documentation/kbuild/kconfig.rst
> > > > > description is pretty lengthy).
> > > >
> > > > Masahiro, any opinion?
> > >
> > >
> > > I do not need this patch.
> >
> > Do you agree that putting kconfig env knobs into help makes sense
> > in general?  Especially those add valuable sanity checks.
>
> I cannot accept the attitude:

This is entirely wrong interpretation.

>   "I am interested only in these. I do not care about the rest,

It's "I *do NOT know* what the rest do".  I cannot document something
that I have no knowledge of, can I?  So as a reasonable start I added
only those that I'm familiar with (and I have explicitly stated that
in previous emails), and I disagree with the "bad attitude" label.

> This should be all or nothing.
>
> I do not think all the env variables can be summarized
> to fit in help.

So the rational for that was that people run "make help" and find
out about new build targets, for instance, but there is no way for
people to find out about new Kconfig features (and yes, we are talking
"new features" here) that are controlled by env variables.  We need
to do something about it, don't you agree?

