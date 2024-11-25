Return-Path: <linux-kbuild+bounces-4853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C69D896E
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 16:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAEBD16885F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 15:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECBC1B4124;
	Mon, 25 Nov 2024 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCQPbVr7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03501AF0B5
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548897; cv=none; b=mFyF08jKAmNc1A/IhxD0iDYVXk3W7K1tub+BV8okBBazFKYvzgB8eKB+mn+GU68qU3/WSmIy6WvQ2CCWN5BqrReMuf6geofKqMyChoqku8/oCYTIe1tcM3Eo5YsPWfzhUc70dMkDNBd00raSQzpEukjJOSL1iX/wAlB0Et0gKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548897; c=relaxed/simple;
	bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B71MX8/6m4HYYFs+7DkzbsaJdNhHliOMyl+miYVolE7+2/b46E3LNUKg3eHlGKXcOtmnswH7A/hrhFK8m6NbXda2sMS628JxPWDLXFTGCDaM7tiKKm0TABnUUjziQMZrWTsF/jeWz5tvUWAs4Z5OcWSnCtm8To2v5oaEHJMMzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCQPbVr7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso12785a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732548894; x=1733153694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=JCQPbVr7wnofDau/L49eky1TxDcaQzWk4/fmNrAn47ts2yPZ7AHYovhP1cmdp7ar1G
         TVycJ+46WnLlHgtt61tvuvUs/YqVszj7JKYQOAI233EXVZCtQV8DLT/1rCocUcWWXPMN
         vyRmKGpRpXyXXQt0Gx/6p1zptJO8UAdetj53gxzEzLZqgfAyx7xlVJlCblanL0uf6xQa
         8oYIMtGX4wId93qwALyi9dnGDy0J9b3udeO59b0ASLqo9Lk03BhmhVD1KhRwak1OusxW
         cYZS4iT6xkG1KROp1sIXKcThABf8+/rpy6Vh73Kh/HohjKAAztsSLA4VI95RnOZzPhgY
         pUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732548894; x=1733153694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEFJdZSwH2wd+21uchAY2/iTR59ZVMr1M18odRCoI1Q=;
        b=efbHWKbYDWJx9PdKQpHnWcxTl+OzgpcseoIUBsffmGS2fA4vnfZO4d8M+s7smqw1RY
         rM3CyseCJsBkvI7gp1fZhwrdKtpNxtrZTFRXLxWiDWu3g+e0tp1sFeYrh/s4DzS8vsnf
         fygaXNFOWyxO2z3Hm/pgs2W6I4M+Kzt2JRRtwRD3nm8eBkFKysdeQiaNbjlhYLJN3XCU
         AGD9sWjIico1gB9L0keo4rtzDA/uectL2Vgvi+kfM4IM57WhFBHeFta32IiP6VceFz26
         MzsKPUqKCxqF1iDKBzetm748Au8oVd6n1K3V7XPJG6lzDGXXep2C5VSH2qjq/pbS6q3Y
         e3XA==
X-Forwarded-Encrypted: i=1; AJvYcCVgJTRZZ+aabkcNGLQrvuTRh6dEpian3L1DPC8FN3SH3iqrWKViP7EAHYE6g8JbMd7Jmyd09OL6MzXOBgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZ8K1T2Sa++ZRl3quW6LedGPRHAjlVLU8l8N9Etr+tFoTjQ4V
	h+348V+6c+ZhlWtTEozIWksKpfP8NgsOTAcsbaXSNsr22yDSGydnSbvAPy6DRUGvl6RF5rVsKm2
	25tBU8lTF2OLUD5sbLb1uzX3bm3QZLmxJioTf
X-Gm-Gg: ASbGncuQmfeACielCpLcPlONZ6D5acJkX7Fz50EYawFrg2ZhiuWok0WlxtZE7aH12lz
	0ytYMP61raWslUJZ2uFV8JW5SvJJomySR
X-Google-Smtp-Source: AGHT+IE62Erf6kbiue7Q5RpwnMVj1FvBBMrksPcQ0CAHn5mGwDMlww3cSZdxQ5Drpgle+KMsT0aQiif1LekyY7uoXNo=
X-Received: by 2002:aa7:c504:0:b0:5d0:3dcc:16bb with SMTP id
 4fb4d7f45d1cf-5d03dcc1934mr98711a12.4.1732548893632; Mon, 25 Nov 2024
 07:34:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com> <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
In-Reply-To: <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 17:34:17 +0200
Message-ID: <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote=
:
> >
> > As my Acked-by was removed, I'm sorry to say that there is no point
> > for me to provide feedback since it is unwanted.
> >
> > I hope it lands soon, but I also hope the people here who decided that
> > a person's efforts aren't worth recording because they don't
> > personally know them should reflect on this too. It's a good way to
> > keep people from coming into the community for the long term.
>
> Hopefully this reply helps -- apologies to anyone if I am overstepping.
>
> On one side, it is true that Acked-by is typically used by people that
> is responsible for the code one way or another, because the tag is
> meant for them to acknowledge they are OK with the change going in,
> and so I can see the argument that restricting it for that purpose
> only may help avoid confusion later on reading the log.
>
> On the other hand, someone being willing to put their name on a patch
> is very valuable, whoever they are, and whatever the tag name is.
> Moreover, it is also true that, Acked-by may be used here in a "as a
> key user downstream, this looks reasonable and satisfies our needs"
> sense.
>
> Finally, sometimes new tags are invented on the fly because there is
> no good fit, too.
>
> Either way, I don't think anyone wanted to disregard your efforts or
> to be rude to you in particular, but rather wanted to keep tags usage
> aligned to how they view them or how they use them in their subsystem.
> The Tested-by was still wanted, so I doubt their goal was to remove
> you from the log or to make you feel unwelcomed.

Thank you for putting this more eloquently than I could, Miguel. Neal,
I do appreciate your feedback, and I'm sorry if I didn't make it clear
enough in my previous emails. I would very much welcome your
Tested-by, or another suitable tag that's acceptable to both you and
Masahiro.

Sami

