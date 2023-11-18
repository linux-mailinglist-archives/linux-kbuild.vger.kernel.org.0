Return-Path: <linux-kbuild+bounces-63-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C337F0242
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 20:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B806281000
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 19:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A286A101D0;
	Sat, 18 Nov 2023 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D/6lOCgc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4836BD54
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 11:06:56 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so7138a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700334414; x=1700939214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX7PzfZyMqtOcztCqDIQ3igdby7s7mhmSg6YX3x3/1g=;
        b=D/6lOCgclHoafAv4Ib1OWRASBH+1hHgWnIm24ezKy1CDBZ6VERpvetTvRuFCclseck
         8mUraasbOPY7iiwFI3aBdooh938PU679bFKQh41yJ/eJC0ly/gc/g+Qxx+yig37veTeW
         aLpGiuCaUCg6Uyt7zHXm3fzUJQMiZ01nPJ68yQCtFaym2IIghOJPRvdfRUoEIAB05fC3
         Q2or77LfUIahJsduBeby8riEYu/fGuQKnlrc80bkVuhu/B13Sccngul8RWfz/KPtObGC
         pB4DjGuSuykSALJmhBoQ2lvIgwzQAVLfmgRUskvq87GnTL7ObZn75g57Tk4u82Hpjl47
         XOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700334414; x=1700939214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX7PzfZyMqtOcztCqDIQ3igdby7s7mhmSg6YX3x3/1g=;
        b=gPaYBZ0b+y9eIeHD/lwZ0k+v5uLsV7dVorD4rGFQPQtjGbwfgqMRwAiZ5zeVXXhuJf
         mqG0wfz8hO8vyMYt9C7zR7J1dwCts1NPjVxzzOt3K5PBsSw3EgClTxYTcAMgRq5P1PlN
         0OTzrZOEdkLXDWo7E2en52inr1bjBYCCByP0fw6GXLMOdQTIDdrO2U1n8RgI19efdxN0
         Sw1KYfaNNerrLfnLyI4Xqz0zeINj01WWdnesiXFIPbyM8rbv71pudOsS+VlHPrrd57ub
         wKfUc7qB64uiOdg7tGVYjjgl6bqPz07TcfuM6mCM0+7IShmbMscqtVPWe7RrRWRrrX/j
         E4tA==
X-Gm-Message-State: AOJu0Yw4XCO3Fl5FkER4szx/RrNHRY4cA8Lf7fiPFwIUTtB0qU/C9AM7
	ma3OQQQuzXMBVYzwh763a2+AyrD9v5CATAzpPwDN
X-Google-Smtp-Source: AGHT+IE+ySdOFa6ErrSdvsWW7KQSBH8g/N1u2mWL8+Nn6TPxiB77nMMZ3Dtk7AmGRGZyP5s5Us2Nmlsmyr4xdkN5Q94=
X-Received: by 2002:a05:6402:514f:b0:545:94c:862e with SMTP id
 n15-20020a056402514f00b00545094c862emr109260edd.2.1700334414224; Sat, 18 Nov
 2023 11:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <8243E862-CFC1-4658-B07E-9FB87E34E12B@kernel.org>
In-Reply-To: <8243E862-CFC1-4658-B07E-9FB87E34E12B@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Sat, 18 Nov 2023 11:06:37 -0800
Message-ID: <CAGG=3QUishWF-bApJM5ppGPaZJNaHQjSxSB=NFRYpkmC59THbw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: Kees Cook <kees@kernel.org>
Cc: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 2:53=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On November 17, 2023 11:24:02 AM PST, ndesaulniers@google.com wrote:
> >I'll be taking a step back from kernel work
>
> NAK ;)
>
I was going to do that too. :-)

> >to focus on my growing
> >family and helping Google figure out its libc story.
>
> These are both big challenges, worthy of your attention. :)
>
> >For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
> >reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed =
this
> >via private email; thanks for the work done Tom, ++beers_owed).
>
> Thanks Tom, and glad to have Bill and Justin stepping up!
>
> >Wake me when you need me.
>
> As the prophecy has foretold!
>
> >Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> We'll just report all issues as LTS kernel bugs and use the MAINTAINERS e=
ntries from there. ;) We'll miss you, but you won't be far!
>
> Good hunting,
>
> -Kees
>
> --
> Kees Cook

