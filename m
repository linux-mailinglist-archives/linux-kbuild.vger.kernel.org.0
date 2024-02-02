Return-Path: <linux-kbuild+bounces-760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFB84651F
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 01:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8088F2896B1
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 00:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C83163B2;
	Fri,  2 Feb 2024 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rv70nKob"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0F610E
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Feb 2024 00:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706834610; cv=none; b=sW1BV4VCDiSpbua8DK+mwvYrwk+MHzYC0iJwaUWgVN5qfU+KPn3ITtaRRxm7aZPoHDQyVVi6oRcFnsiTmqMyrbAbIS+4LAEHjV7rqY+tYRlkHu7z+n9z6hz8Cxy6WSmBeuWCdlAQHRBi5mTJehyIU69Q0RsH2Jrx1zhzAxrgQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706834610; c=relaxed/simple;
	bh=Oynm7sfNLrQLM0SoccN9kTL6l+3C1N0AOI3Ym9MXl1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+jaQVpLLCpcUgorlqsuc2nHhE5wfIoXtaa5dCcK2mKFu3Jp7cwoMFQDtDH2D4fLwa+vdTulueoRULQhVdXOZu6BJyrpXitrbakSJUK3F9wgYlQNiYPwFGcDTcaT5U9aqrj35HTe6dhuJ13C8FuMCBNiHjgJ85TVUnpwMKcLhb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rv70nKob; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a30e445602cso575132066b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Feb 2024 16:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706834606; x=1707439406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lRP9qwe+sUPjtBWfJ3OqdoHfDLUo/SRZ2WJ6sssDb3g=;
        b=Rv70nKob561Z1DFt6ZDF+pM+f2Ri9JlWWOzAzJPGuzdabeKpZRPcgObBqrqXURLyV/
         epvzEWzEH7WassrGNZDfEa8XSv0Vq6gHqEF8kjizTREXSQvqqoSd5HOmUTsjnDm+JogX
         6DpaFeEeKx/3+8g2FT0i9RHUewfp4VkgiQ4s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706834606; x=1707439406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRP9qwe+sUPjtBWfJ3OqdoHfDLUo/SRZ2WJ6sssDb3g=;
        b=w1imT7dBplnpV3NEAk73+CWHiEwfcuZiXuALlmLfwtR03Tw6f4XtqK8SbQXx/BhThK
         F/Yj1adggYtuohx+39WIyt98pSjVhtAh1vY/ce1giVIPCEJtpQ76YWeAyjUDV6bHIaFu
         WqIX7cP+KhQhaDo6wq3+fzuPqjfzwOGiBtMUAVQzQoEldMZsTPx/rHBh/O2MDSA3a8pK
         lZBKfg1sVDzJPec10EQg95jsz2qG06AtqovhgfS87rv3sfAFHQgN5haGyIYNMJUV4Fy3
         dFOwFrf0uyGZZIUQhSqsugOpC26u6cWoMOZ2niiNFsO8XIDfK/v6M8qFYUR1N2MRG635
         jolg==
X-Gm-Message-State: AOJu0YxCtoG4n0lCm1p2M7eMdkEnXbBKwxVDaT9seMd1w+i1fpn7iJuG
	tSPfljSo5Tv069GKeztfd9J6xNN8iGTkjPm9JhwiGDNA5IikfvxRheP1bPflPkFx8kDpyl3ggyh
	6cFE4Cg==
X-Google-Smtp-Source: AGHT+IHeQIznj0wr6/YDpfZBpffHNn7RB3TWJJHgvPtK1CWwLYceXZMj4r5OdvpANvfrS+Uq4ZvoAA==
X-Received: by 2002:a17:906:d7b2:b0:a36:6444:7815 with SMTP id pk18-20020a170906d7b200b00a3664447815mr452832ejb.17.1706834605992;
        Thu, 01 Feb 2024 16:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWLWak9igRVGLGwTNI4WMV4UFENerFm/+ZiIXD085eayY4Dw6MbmvglMdh/7KmkT170bmpGpFvskf41Lb0jfbo80n2XjKJOZ/vVneb4
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id ti8-20020a170907c20800b00a3611f17180sm310252ejc.55.2024.02.01.16.43.25
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 16:43:25 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55fbbfbc0f5so2036659a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Feb 2024 16:43:25 -0800 (PST)
X-Received: by 2002:aa7:c690:0:b0:55f:a38:a4f5 with SMTP id
 n16-20020aa7c690000000b0055f0a38a4f5mr530483edq.11.1706834605114; Thu, 01 Feb
 2024 16:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASGqfMkTuzP28qydpYCC0ct3cAgMpbPpmgHuQHZbtLhbA@mail.gmail.com>
 <CAHk-=whJKZNZWsa-VNDKafS_VfY4a5dAjG-r8BZgWk_a-xSepw@mail.gmail.com> <CAK7LNARzZ07TX2obHSpCgsC=FPTbLx5J+kPBFUECT+N7V42i5g@mail.gmail.com>
In-Reply-To: <CAK7LNARzZ07TX2obHSpCgsC=FPTbLx5J+kPBFUECT+N7V42i5g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Feb 2024 16:43:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg+3J8L4C7dcsZZNPEr3CJ49wKtJC0taVDBwGo9ZGot+Q@mail.gmail.com>
Message-ID: <CAHk-=wg+3J8L4C7dcsZZNPEr3CJ49wKtJC0taVDBwGo9ZGot+Q@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.8-rc3
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 15:57, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Is this your expectation?

Commit 82175d1f9430 touched *only* the nested 'if' indentations.

Your attached changed other indentations too, which I am not sure
makes any sense.

But honestly, that whole make rule wrt whitespace makes no sense to
begin with, and I don't know why the conditional statement is so
special to begin with, and why GNU make would then suddenly start
messing with an insane rule with bad historical reasons.

End result: all of this just reinforces how bad the Make rules for
whitespace is, but I would suggest doing the *minimal* changes to make
it work.

Which commit 82175d1f9430 did, but your attached patch then does not.

IOW, if the whole crazy makefile whitespace change was only about
conditionals, let's keep all the stupid whitespace fixups as purely
about conditionals too.

             Linus

