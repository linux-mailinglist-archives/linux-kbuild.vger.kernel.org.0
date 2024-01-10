Return-Path: <linux-kbuild+bounces-509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1D829B0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jan 2024 14:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3C11C2644D
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jan 2024 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDC7487A9;
	Wed, 10 Jan 2024 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e71sjScO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031B487AC
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jan 2024 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so4876293a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jan 2024 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704892516; x=1705497316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K17fFBJpR1/Y1vdZDJP422VcROIDsHIcrNjjivdS1A=;
        b=e71sjScO8RPwLTyihOY1+0hD566166UF0mq1g3Ok9wXFRz+fxtCSHtCgit9v9tBudd
         Hfn/k3kRSAcljLsvcYluQxgXhoY0yH3jANR9llXa1btYKcbrXkjBIIdpoLn3ZyLa5tch
         6oSN/PH17d0GE6jOJn98MZQq3H/xvhbepzwwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704892516; x=1705497316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K17fFBJpR1/Y1vdZDJP422VcROIDsHIcrNjjivdS1A=;
        b=eRqVJQ962qrkr6bnYR04sLPeBMflBH1X5Z70nb2f7MfAIHSqrMY2snm1DbiErejBBb
         mQKFj31oFmKUKfmTeYUTcqTqTks0h6UJ8Hbu+JFHEWM2yxeNOir1AiESLGQM+sGD2pPj
         nXLyp9SJkdTMJH36CYp+WP+T3HuvX0d9QxdcI+ctUG6r5q1k6v/wyn9Y1E38jmhxzBwl
         TzJv+/+Hfm3CwLAVotGc00t2Y/hx0TnRqxn5Ttpm2JbO5byxFVh7VM9KTW3Apx+857qQ
         TCZ2OuPw9pRSV7xJXeisiioBEdAGCj8SPWtANVZKthxwLsq1gUWzmT+YiijiT4PlnQz0
         DQjA==
X-Gm-Message-State: AOJu0YyzuCoaHK6JlkBnMtjMRJV9Kp7/S+lWLloBE2VNFeLnDDvWcF8w
	Xgu0LTeEJXgUkU6w8WC8OgsGD8GvEri/ooUosqYKt+usyDHm
X-Google-Smtp-Source: AGHT+IE/iD20eN/jQ8qmCW5cMTwaIxYpQTz9KfDPNDTmdCjyfhC8fDTXy9OgTFBFyA6Ds9hoacPoyQ==
X-Received: by 2002:a17:906:129b:b0:a22:eb96:6d3b with SMTP id k27-20020a170906129b00b00a22eb966d3bmr423141ejb.124.1704892516390;
        Wed, 10 Jan 2024 05:15:16 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906138c00b00a27e4d34455sm2072702ejc.183.2024.01.10.05.15.16
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 05:15:16 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3367a304091so3803762f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jan 2024 05:15:16 -0800 (PST)
X-Received: by 2002:a5d:444d:0:b0:337:555c:6b7d with SMTP id
 x13-20020a5d444d000000b00337555c6b7dmr378407wrr.173.1704892515835; Wed, 10
 Jan 2024 05:15:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228070941.3611649-1-tfiga@chromium.org> <CAK7LNASbgXSZNiwhMf8jm7511eyDm8oCqY=MzWhgWwNuVLk5Vw@mail.gmail.com>
In-Reply-To: <CAK7LNASbgXSZNiwhMf8jm7511eyDm8oCqY=MzWhgWwNuVLk5Vw@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jan 2024 22:14:55 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CRtgMUN8xZ_4BOv04KzCvXtrKHhWGQhhqgENyMCVWbKw@mail.gmail.com>
Message-ID: <CAAFQd5CRtgMUN8xZ_4BOv04KzCvXtrKHhWGQhhqgENyMCVWbKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add a build target for checking current config
 for issues
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 1:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Dec 28, 2023 at 4:09=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >
> > The new target is called 'checkconfig' and currently is basically an
> > alias for `listnewconfig` with KCONFIG_WARN_UNKNOWN_SYMBOLS set to true=
.
> > It can be used to validate if the current config is directly compatible
> > with the current kernel version or needs some manual adjustment.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>
>
> I rejected a new target in the past.
>
> https://lore.kernel.org/all/20230817012007.131868-1-senozhatsky@chromium.=
org/T/#m55c37e3091158f8cb008d9e0b5c6bf3f5ead225a
>

That was specifically for the unrecognized symbols warning. What I'm
proposing is a universal target that would include any possible
diagnostics.

>
>
> Instead, you can run
>
>   KCONFIG_WARN_UNKNOWN_SYMBOLS=3D1 make listnewconfig
>
> or
>
>   make W=3Dc listnewconfig
>
>

I can do so, because my team member implemented it and told me and
other team members about it. But how would someone who hasn't heard
about it be aware of the existence of this useful feature?

Best regards,
Tomasz

