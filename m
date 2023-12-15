Return-Path: <linux-kbuild+bounces-380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BD814FBE
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Dec 2023 19:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1774E1F253D5
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Dec 2023 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802C52D78A;
	Fri, 15 Dec 2023 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ug6N6HnF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E453FE5F
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Dec 2023 18:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702665019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vzJClyUOrZwfVwzrZ2j7ZURZhN9VcUajU+PzpFU1cc=;
	b=Ug6N6HnFDigTMjg+VaZTqId608Ys/nWY5n4KZ002RaRvhw87U6WsN0o2RBysqje5fRAiCm
	kcgSdkCY4gbXl2usffUqcNKYPDBasexVbc6YVi2hrlZWJr9NplcR1LrCOmns5sYgK0gAzU
	PCkgNSP0GNeHYgf8suBd/TYbbIa8Ur4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-OIbPOVc7NuuVo0Bqbrdhsg-1; Fri, 15 Dec 2023 13:30:18 -0500
X-MC-Unique: OIbPOVc7NuuVo0Bqbrdhsg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425d3ed72f5so13727181cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Dec 2023 10:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702665018; x=1703269818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vzJClyUOrZwfVwzrZ2j7ZURZhN9VcUajU+PzpFU1cc=;
        b=LwsDhdBW1n6D3bbLpHf4sZpqeSHmovlA8gxnHS22VUJeO51t6AEcuVQhdwD+Dyu3Uq
         GcKd6GY51VDW+9fhPbY85WZeT+zvyMae3TMxOzvggnqjhjzuzq7pblgtroyy9OL/xy/c
         vh7q1N4PUMRobEQBnSBdQYiujiohj9uYlXul6iEpWWGq9gFGE5AP2l4xG1mqY/v262Ss
         Uwss0BLJcLxVkZCg0TgC/7iSQ0E+DFJgLtF8tjYK4ylW5M4bduw66dT5x2fUKskxWHWe
         kBCFMFbuSCdDJ5v/x7qKdPuhH6LOyCLrl63SbjL6IKb78Dif4X8NsTp200sheEO/LMGq
         5aOw==
X-Gm-Message-State: AOJu0Yy1pODsqZbxhA34r+umJsXdybtVTa7x/5jBMTW4m2emCr6upqhC
	yryvaXNrHhj87UBMjLlnlNUafVbsu6BCAHvO8ZEp6mGdkzgWnLqVjcVmOZU6iX/vOaZugT7Ama0
	fln2pRbsDU9aiaaahsTPz7uI/ZbxmPhShkM43QYph
X-Received: by 2002:a05:622a:11cb:b0:425:4043:18a0 with SMTP id n11-20020a05622a11cb00b00425404318a0mr20736514qtk.83.1702665017906;
        Fri, 15 Dec 2023 10:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrj2n1I8uoO76meJmcaIBwseRw+4NTtYxDITKyt6vMIi5TpjWNgJ2b+7aDrKuonTvWR4rB+CbF6VJGd+VPbDQ=
X-Received: by 2002:a05:622a:11cb:b0:425:4043:18a0 with SMTP id
 n11-20020a05622a11cb00b00425404318a0mr20736499qtk.83.1702665017666; Fri, 15
 Dec 2023 10:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208181802.88528-3-leobras@redhat.com> <ZXgMa57Ere6FJCJB@infradead.org>
 <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com>
 <ZXhbUmxzH6nWAzaw@infradead.org> <ZXiT1zyADQVXOEqw@LeoBras> <CAK7LNARhah+P+wESAYxVUzRkD81EacR_J+muDcP7HLZpCRkd8g@mail.gmail.com>
In-Reply-To: <CAK7LNARhah+P+wESAYxVUzRkD81EacR_J+muDcP7HLZpCRkd8g@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 15 Dec 2023 15:30:06 -0300
Message-ID: <CAJ6HWG5OdU4MUKYTr=wuw-RkXbSNUow0SRi3wKu9aHDoKr8R8g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 2:03=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Dec 13, 2023 at 2:10=E2=80=AFAM Leonardo Bras <leobras@redhat.com=
> wrote:
> >
> > On Tue, Dec 12, 2023 at 05:08:34AM -0800, Christoph Hellwig wrote:
> > > On Tue, Dec 12, 2023 at 05:09:21PM +0900, Masahiro Yamada wrote:
> > > > Unlike .gitignore, this feature is opt-in rather than enforced.
> > > >
> > > > To use this, you need to run
> > > >
> > > > 'git config diff.orderFile scripts/git.orderFile'
> > > >
> > > > or
> > > >
> > > > 'git diff -C scripts/git.orderFile'
> > >
> > > Oh, ok.  That greatly reduces my concern.
> >
> > Yes, it's an opt-in, so no user should be directly impacted.
>
>
> Applied to linux-kbuild.
> Thanks.

Thank you!



>
>
>
>
>
>
> > >
> > > >
> > > > Indeed, the file order is subjective, leaving
> > > > us a question "do we need it in upstream"?
> >
> > The main idea is patch generation.
> > This file's order is supposed to be the best order for reading a raw pa=
tch
> > and understanding the code changes.
> >
> > > >
> > > > At least, it is harmless for people who have no interest.
> > >
> > > .. but this is still a good question.  I'm not really sure there is
> > > much of a need for it, but as long as it doesn't harm everyone else
> > > I'm at least neutral on it.
> >
> > diff.orderfile was introduced in git to help order the git diff, and th=
us
> > the patch generation, in a way that it's easier to understand what the
> > commit / patch intends on doing.
> >
> > Take this example introducing a feature foo, you should see:
> > - Documentation on foo, if introduced
> > - How is foo enabled in build system, if needed
> > - The types / stucts / fields introduced by foo, if any
> > - The interface for using foo, if any
> > - The actual foo implementation.
> >
> > Of course the actual order is open to discussion, and I encourage every=
one
> > to suggest any other items or order.
> >
> > Thanks!
> > Leo
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>


