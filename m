Return-Path: <linux-kbuild+bounces-409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353681C339
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Dec 2023 03:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52F61F25413
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Dec 2023 02:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D598B17F4;
	Fri, 22 Dec 2023 02:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+GDyjG4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBF17C7
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Dec 2023 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d9f069e9b0so945159a34.3
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Dec 2023 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703213825; x=1703818625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyYQXXmJLXOsMg7EENStsDeW8R8z4sDrOY72vy4TXgg=;
        b=R+GDyjG4A7D4m6E9rhzemMY/vE4CPIWaSvReOKH4WyDnADfKaSiw/AintVr5v/ni8h
         QPdxn46q7SdZ10hKrKeBd0z1i4V1uNagk8b5IEhk6z5BaExjvrWLZNCRb7yd4VG5Kq8o
         QU+JJamB1O5LIFuZo1sLSun19/+cbwpzuB04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703213825; x=1703818625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyYQXXmJLXOsMg7EENStsDeW8R8z4sDrOY72vy4TXgg=;
        b=g9abGiUHLGdWUeSYOhqDBGvaXim65ryjPIUMQD6wOUe5tRJp/YLU5ks8RWyATBpB0A
         sD3MDHxrPdniyHt3id1S3WUMlDX2239mB55QGg7W+94mDYrYnbaimaFdYhIkKMS6MIns
         vpN2W01ZSl4ngFpLaGvbuRAWBESX4S8cUzGrco2iF9z9et9yHSXo/kcr8rnprIe6SYh/
         B0Ed6afRy23UVf+MQJGwSykAkyvwV/HrvbAXpNIKGoYKwGroBLISUV2erarWpU6jPETa
         FWjUX44REszXiLfT7EWQG5PPWrhUd0kKF0HxY1wrBCs6cnvzGmbiGQhSsSFSeJCCUAhV
         PlPw==
X-Gm-Message-State: AOJu0YysUZg4cLVVokzWXFYYuC6yCHqKr1qEQqfZgSDU9rbJdYpGUuhJ
	AsI9Vbyv/5ll6yyA+Bo8/CfcRXleX666
X-Google-Smtp-Source: AGHT+IE5p5XNuBxOgw9WK9fWjWOb5HyvusuUTcI01VJgBQPvuvwvxH49UCZrkL85my6xe2GyA9t+iw==
X-Received: by 2002:a9d:63c2:0:b0:6d9:e9b8:75e0 with SMTP id e2-20020a9d63c2000000b006d9e9b875e0mr780059otl.38.1703213825590;
        Thu, 21 Dec 2023 18:57:05 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:1a3e:bfb4:1ddb:52df])
        by smtp.gmail.com with ESMTPSA id a2-20020a63d402000000b005c661a432d7sm2187679pgh.75.2023.12.21.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 18:57:05 -0800 (PST)
Date: Fri, 22 Dec 2023 11:57:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Patrick Georgi <pgeorgi@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stefan Reinauer <reinauer@google.com>
Subject: Re: [PATCH] kconfig: WERROR unmet symbol dependency
Message-ID: <20231222025701.GA3568309@google.com>
References: <20231122034753.1446513-1-senozhatsky@chromium.org>
 <20231128053443.GA6525@google.com>
 <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>
 <20231129041307.GB6525@google.com>
 <CAK7LNAS8q9eDerwVRbPbqd+AKjNVkEKLOW+NAKaD4duP-gViqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS8q9eDerwVRbPbqd+AKjNVkEKLOW+NAKaD4duP-gViqw@mail.gmail.com>

On (23/12/01 00:42), Masahiro Yamada wrote:
> On Wed, Nov 29, 2023 at 1:13 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (23/11/28 23:19), Masahiro Yamada wrote:
> >
> > [..]
> >
> > > KCONFIG_WERROR is meant to turn all warnings
> > > to errors.
> > > I do not see getenv("KCONFIG_WERROR")
> > > sprinkled everywhere in Kconfig.
> > > One more thing, you cannot directly exit(1)
> > > from sym_calc_value().
> >
> > We do exit(1) for KCONFIG_WARN_UNKNOWN_SYMBOLS in conf_read().
> >
> > I can introduce two new helpers that will tell if confdata.c and symbol.c
> > triggered any warnings and if KCONFIG_WERROR is set. And then different
> > code paths can call them and handle exit gracefully, depending on the
> > context (ncurses, menu, etc.).
> >
> > Something like this
> 
> 
> I do not want to patch warnings one by one.
> 
> 
> I will take some time to think about it.

Gentle ping on this.

We are not concerned with every possible warning at the moment, however,
we do want the critical ones from CI and (semi)automated continuous uprev
PoV to be covered by WERROR. We do experience real life problems with
"missing direct dependency" not being a terminal condition under WERROR.

