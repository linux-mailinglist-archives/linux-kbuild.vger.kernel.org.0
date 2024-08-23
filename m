Return-Path: <linux-kbuild+bounces-3185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8D95D5F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 21:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0261C21B2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CFD191499;
	Fri, 23 Aug 2024 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQjFtDUY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A5113A265
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724440663; cv=none; b=d0r31DlHuopQkXMYGj5urboSc33Pq4k84h77NWlZnsyK2vIsZEvbgFRXDDE/xaYBOdEy0viwZfaO8SjDL1fDRATktPEouvanZ2q2fNB8CdIB6HikJfnq8fW/kCunc9MSXmjV/vp0wEok1F/0gayOT5ywl1UlFYdOJWEusB87+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724440663; c=relaxed/simple;
	bh=JIaW/apNWCzAmV/n0G/RjvJeXSQThNu/IWRYC/nMlBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjdmlFf4csEf31jOU6EoLhwqu3PbGnoZVLoPDY608+wWPstKn9slhTsyY8LmDFg8LGaCT9uZLmy+dZb+5PsgwWNEtQ6qhKMvFI+WIIZYXZoBjLbUGvd2P7MpzyrON75XX3weh5bP/4z5Q9PTx1CA7IbcZdQA9vL1LW8FZDTSDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQjFtDUY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4518d9fa2f4so52491cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Aug 2024 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724440661; x=1725045461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK1Wvsdu8rfQ7lMKZWs3qCjFTpM3O30wRJ41e4mXEQM=;
        b=nQjFtDUYePQmYnE9EQJwWAQiHgusjrHR7wzqtda3MIHccSeQSWS/pM/mAuvbwrSEon
         kQk5hJQNheGOF9eavi8D0shnYnrqKUTWe54HFLyjzo0A7R8WWFT6HOcec0hqJ5hTI8Te
         +aZnp8HOB6SPgQotqWrW6Vyn2E/mTCWnqdktR+bkTYysQV5LSlAZtdg01Od20tSEOuEG
         WkvL2LbZ2yPT55q+MpFC/FgcnML37II0zSjgiX2bJGeS7G5oek4cmUKxb4Lw0wrhjNOm
         L0OaDHq64eYS7NuFHAnd07dzM9ONAdvli4LYP/QaEDHm3+TPRxCBd/5uWckpRX99lsr+
         ejUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724440661; x=1725045461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HK1Wvsdu8rfQ7lMKZWs3qCjFTpM3O30wRJ41e4mXEQM=;
        b=abygt7uur/UymMSXNszEdg2yrWwDr6yZ+3BsgxakscprRO76+cp+P1yA4G9saY9Ozi
         CRy6OU9gDonN4riqDe18jLfcGXFvwcwxX93oKKMHicQP+6JZyPaDlOjFTA5K9sR0Aicj
         WaBRT/b6KaGXj1XGD44KSBXk14oIX6cRARX7HBp2hVXXeBlCZd+54u27l2ZgEcGXcKqY
         vUE7p4j/PHwTVtcktfaU6KoPC/dWKgprpg+/gV0ZwaAzfLA7mGA4sTSM1Q6IU/ezcisc
         G+GRIQSMoxdbWRuZMYU41XQFtLWnY1701THZd2clUEyZ0ccPQ0IAyPM55JkoOuXyPdPd
         Abxg==
X-Forwarded-Encrypted: i=1; AJvYcCV8nL1Q+oa7aivwQqW2QPYQUTr3biie/kDPL8Cv4WZLmQWLgamngxvfv6HRyXWLN2SuMA211VFXWPl2s6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPUvGdRQvawzpF4svV2hS9D8ckYaNtn+mhnZbf9Wiih2mMpTf
	N6+e/vPu890KSNSG8ojBiwO/gH+CdaaURiBnuzTCF+SKIgbyVs9iCxveniYno1McFTC1wRsLj5U
	1POic2vWrhVN/4E7yZCbr6n8ndo30qieANNWJ
X-Google-Smtp-Source: AGHT+IF5LomZc7hzqJKmq6FHV/NPspoQklrwD6w75B8q4/YSMNHk+tcBlzWN1zsXKbub6U63GbI50CTIDeaWmmKUtbY=
X-Received: by 2002:a05:622a:30a:b0:44f:ea7a:2119 with SMTP id
 d75a77b69052e-456420b7fa6mr478581cf.18.1724440660708; Fri, 23 Aug 2024
 12:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-37-samitolvanen@google.com>
 <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
 <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
 <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me> <2024082229-elevation-emporium-8118@gregkh>
 <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me> <2024082257-refrain-subsector-b6c4@gregkh>
 <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me> <2024082356-stowing-endowment-555b@gregkh>
In-Reply-To: <2024082356-stowing-endowment-555b@gregkh>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 23 Aug 2024 19:17:01 +0000
Message-ID: <CABCJKud--imREq8E6uuk4XwatLsKC7ikmyoLKJStqr3Azz0Hdw@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 22, 2024 at 12:00:15PM +0000, Benno Lossin wrote:
> > > Here's one example in the android tree where 4 64bit fields are reser=
ved
> > > for future abi changes:
> > >     https://android.googlesource.com/kernel/common/+/refs/heads/andro=
id12-5.10/include/linux/fs.h#421
> > >
> > > And here's a different place where a field is being used with many
> > > remaining for future use:
> > >     https://android.googlesource.com/kernel/common/+/refs/heads/andro=
id12-5.10/include/linux/sched.h#1379
> > >
> > > And also, we want/need lots of other space reservation at times, look=
 at
> > > how "Others" can get access to reserved areas in structures that need=
 to
> > > be done in an abi-safe way:
> > >     https://android.googlesource.com/kernel/common/+/refs/heads/andro=
id12-5.10/include/linux/sched.h#1375
> >
> > Let me correct myself, it's only possible to replace one `KAbiReserved`
> > by one new field. You can have as many fields of type `KAbiReserved` as
> > you want. The thing that you can't do is replace a single `KAbiReserved=
`
> > field by multiple (well you can, but then you have to change the sites
> > that use it).
>
> That's odd/foolish, why would that be the case?  Isn't that exactly what
> a union is for?  How are you going to know ahead of time what size types
> to save space for?

I believe Benno is referring to the lack of anonymous structures in
Rust. While you can replace a reserved field with a struct that
contains multiple smaller fields, you can't access the fields
transparently from the parent struct like you can in C:

    struct s { struct { u32 a; u32 b; }; };
    struct s s;
    s.a =3D 0;
    ...

It looks like nightly Rust does have some level of support for unnamed
fields in unions, but the implementation is not yet complete:

https://play.rust-lang.org/?version=3Dnightly&mode=3Ddebug&edition=3D2021&g=
ist=3D4f268d308fe6aa7a47566c7080c6e604

Benno, Matt, are you familiar with this feature?

Sami

