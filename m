Return-Path: <linux-kbuild+bounces-1098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96686DAB4
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Mar 2024 05:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4234D1F22477
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Mar 2024 04:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E378482DF;
	Fri,  1 Mar 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LnmTobwY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FA405DB
	for <linux-kbuild@vger.kernel.org>; Fri,  1 Mar 2024 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709267602; cv=none; b=Ywc38omP8FSg6Mns8W62WApItekWsWbx00QWTMJpLmYSEWFeW3xH9XXUy/fPawnWUXAgt8TMx5Xa+GSd8Gf4HBcTaOTww8UhlB0RVmdfnUeGZRvFStSLHTaukiogKCUlQy473/Pn/+PpyPwxBRsrio/mET4BdJFaPATNjTKUWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709267602; c=relaxed/simple;
	bh=gAvu8Q2GlIgl58hpzU0/1cTGUMv1AR+pwJtHUovAQyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX08K6rpCda/o0Ph4j1/QckOF3yKrowDoA5yWHejR3Sb/BfnppMSxl9+dxsg+CLpCAv0V9YqByJYMcLC4hq0Y0ZoQnTgQuk+ZgGymRugmlqmmfAMhljsGqIaxkw3ENvoYmW0fx8Op97eKqyjlPHR8ocrEIlPlV47Bbb8DDS213Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LnmTobwY; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3657c437835so5309245ab.2
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Feb 2024 20:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709267600; x=1709872400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aOVHnydOr3KEKADJ1BgtsHyKTmyIddRVFL8SRlzooEs=;
        b=LnmTobwY6Y9O6KisIc6S5OEt1fqcp8rNkpsKUmPxB6ttfMRZy3cIdp7YPC2mFWI//2
         92kz79aqtCdFnOWmTNFUaK9LyRh/YqMG7ETfAFKO7++5cupJuWdfwWwONt/2oSjIaG5g
         JXWKtVQNJPY619rEqcQ4S5rZemkn02j79cmSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709267600; x=1709872400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOVHnydOr3KEKADJ1BgtsHyKTmyIddRVFL8SRlzooEs=;
        b=qy1bB1H7KL8wGgdqwnXDDc8jWhR9JLlFFtvfKR+w94WYtsCN2Szt8dKMtvLqUNHQI8
         42M3Wd94qR/7X9YKxFCJSWTE/7hsolqQCi2xN203UzH0f622yvrazGKqm5Uc1eM7h1Ka
         7U3YYq65BHqQa+tKwVUR/LivCBKUXnOZnuF8uoZ7iCWHtvYnyZIfcBPNwaTbr6voNdWv
         jGpAZQyFHf6pfQXytw77kVFCT7bUGbhRdMDqdTsIkMz9YsuqLlDrltlBqn2idgjbl7kJ
         283QVW9C556Oy0L4NWyTrCjSFn8WdbrXlwBIpeyhHOxWnDNutsz5eydCGVGSopT5uw0x
         WPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaTbf2A7g2+iTrsyDSKS6dl5kCc+2qIcpWZiXejFH9fEC0d/2nu2codXIOsyw0uMhXKfq18T0IzfkUy7JsNgFzGTJ16lQ2rKmpWBN2
X-Gm-Message-State: AOJu0Yxtq2zamRAz7Oji4OhsumHppGab58HamYB5ISVykt3dpIfaMe7E
	hovKgcGuk9HCjg0vPpmRHStb0bC2eFrw1TD02/kjX/DazXAqQJ1/pDmQVv3F/w==
X-Google-Smtp-Source: AGHT+IEYIIoWI54Qs4qkUauAMYxQSE+Zv04Y0vTrjcoU2tuQ34M2jd3/owKz6yKYlM+FO4v0W3AX/w==
X-Received: by 2002:a05:6e02:1528:b0:365:3239:6e71 with SMTP id i8-20020a056e02152800b0036532396e71mr789246ilu.14.1709267600107;
        Thu, 29 Feb 2024 20:33:20 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:cf6e:4396:e942:479d])
        by smtp.gmail.com with ESMTPSA id ei4-20020a056a0080c400b006e57e220ceasm2075883pfb.6.2024.02.29.20.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 20:33:19 -0800 (PST)
Date: Fri, 1 Mar 2024 13:33:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <20240301043316.GO11972@google.com>
References: <20240222031801.GG11472@google.com>
 <20240222032559.496127-1-senozhatsky@chromium.org>
 <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>
 <20240222051621.GH11472@google.com>
 <20240228045652.GH11972@google.com>
 <CAK7LNAQ8OyNMeGzVoTRg-sHDZ4YK0EKY_eEWNepekaibO_ZKwg@mail.gmail.com>
 <20240229021010.GM11972@google.com>
 <CAK7LNASujf8m4PpMyoCC1cTN_YGeG1HVaOR+3pZx5=3OJp=85A@mail.gmail.com>
 <20240229034739.GN11972@google.com>
 <CAK7LNAS-mOxY884pLEMwWaX+wgzXdc6+=vqN=wfHBekuKL5ryA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS-mOxY884pLEMwWaX+wgzXdc6+=vqN=wfHBekuKL5ryA@mail.gmail.com>

On (24/03/01 00:35), Masahiro Yamada wrote:
> > >   "I am interested only in these. I do not care about the rest,
> >
> > It's "I *do NOT know* what the rest do".  I cannot document something
> > that I have no knowledge of, can I?  So as a reasonable start I added
> > only those that I'm familiar with (and I have explicitly stated that
> > in previous emails), and I disagree with the "bad attitude" label.
> 
> 
> You were aware of:
> 
>  - several env variables are listed in the document
>  - your patch would introduce a new "inconsistency"
>  - somebody else would need to make efforts to solve it

OK.

> > So the rational for that was that people run "make help" and find
> > out about new build targets, for instance, but there is no way for
> > people to find out about new Kconfig features (and yes, we are talking
> > "new features" here) that are controlled by env variables.  We need
> > to do something about it, don't you agree?
> 
> Disagree.
> 
> I maintain the entire Kconfig, not like you only caring about
> a particular feature.
> 
> If you add only two in help, I have no idea about
> what it will look like in the end.
> I am not convinced that it will be in good shape.
> So, it is reasonable for me to reject it.

Yes, OK.  I wasn't talking about this patch in particular at that
point, I was more curious whether you agreed that we need to document
in some way those vars in `make help` or not.  If you see value in
documenting them then I can sit down and try to come up with v3 that
will (in one way or another) give a simple "help" description for
each of Kconfig's vars.

