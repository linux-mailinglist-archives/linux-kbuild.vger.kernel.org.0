Return-Path: <linux-kbuild+bounces-4849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC89D88A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 16:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33DCDB2DCD1
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 14:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF101B0F30;
	Mon, 25 Nov 2024 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKSxC4Tb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA32746C;
	Mon, 25 Nov 2024 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545698; cv=none; b=jVrRTiEZbpQVrJ682wODD7k7URxnhBUzF/d7fyM9bUkVxHEh0Srefs8YsWpArcRs+67WnkQ9BEgMG1fiPlUOpoMab+5qTvZ7UxHx7OAm+VqQwDHdd3RwXi0djD4K/WBx+cAmhoibuHsIiKhSdfLrkIgOW3fot+Fqgw2qEixRjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545698; c=relaxed/simple;
	bh=hKchmO2WDRxCHT7Jx9boQ3vWleTZKJaMpXI2cFPNwo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzcOWPxiCSxsrz9ncuFqLUZB0Iz6Fg2RLjkkPWGIbKbzLX8CzqaVFiR8hae1b8+CQ7Cgs030hAUjlXM0rtCn+0cgyN0nVaJEmz5inquq1YpPScNayYAuNO//oaQZQ+4mDH2OKC9rH0I7B76ZlYDFc2bx5JSMQVjON4N5U9xH4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKSxC4Tb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2edbe217f00so272492a91.3;
        Mon, 25 Nov 2024 06:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732545696; x=1733150496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyNHGDdr/bbhmu+9pKCigFAMTb5SHnCy56oapFhW6XY=;
        b=FKSxC4Tbc6BB6OoQ8TwlUpq2a+R3slcoOke9vBpC/T7sXSRBK67L0XbtVj2eKwMMgr
         pqNwvtljkbjw3SoLVybEDp2z9+sGMduI3VgpYsRj98rECD9J8ZG5iNftUOvOLMC4+MTh
         FyVb1SyP2+9R+8SAIg2Fn1IaCMfYc5LfINK94p5dT7ui1Mc3Pj+jwjPtVAxwN9vGEJex
         CndfBoLrwPxD/R1m6PaOk1+0FKmMd5kzdLElH33/NI8yezN+vSS8pndZcrpzS5qeb3rK
         Ui9+h/nOJ9MXaQ8GPiEjS89atZvvQOVfH9EHN0GpbND8Z7cD0XUXg58c+f+bQu+HDG+O
         BW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545696; x=1733150496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyNHGDdr/bbhmu+9pKCigFAMTb5SHnCy56oapFhW6XY=;
        b=sdEbyI0NyH616bw4cRwEvY6oNNZI/rFL2Eh/neQNTWZdnhxvDnVrfjCJPPGyOA7tCa
         hSVAG4vNntjAuIpe5mjw1hK5onePyMzWyALl8JojrpZKxYXMIiYQ5pgx2vDFzlaVI189
         A2O9onn4/1gRUI5zc2sARY/NdImOVfz0JT1e/YdQVhu3BZD5s7E097GUXeFk2sn7xn8e
         C7AJ3OtZfyrC8CCuIxIUSuaSGPjbtd98fyiBJ2PfE+jO7wzNU7WN23I7hqDz0DvsnejI
         XoWARAzohJwHO7IXcIz/d4ipTyxi8T6TuixOTqZ0TdUcH4K1L+IuGzFVw2/gH7Zw+L4j
         Ctzw==
X-Forwarded-Encrypted: i=1; AJvYcCVKpWw0bO51X9xhUwjChzVK73l6LCppms3PXr68oQ5GTjtQiavEXtDmdLUIQ6VsgwbzS6uAIJnBfb5p+iWZlQ==@vger.kernel.org, AJvYcCVc+9pFcENIQOxsl8R68aoJOwr2uqg4ZW35bWfn6Mfu8UTYqM8ixdM/fS99ylSBOeLK0AxWJTKA4y/5CVw=@vger.kernel.org, AJvYcCVnU1E3PNblv+DXPXL2/GYarODw9BeouVz9waJML8wTFq2Kq+scSA4UXx8ljjeI8W/Jf4GNpR3jSwZ2QTXSFpE=@vger.kernel.org, AJvYcCWbPhEP7k80Qv+noEh+sC6pI73Iz/d9MkxIIyuH7GZgvizgDM/Rz3E3HQmRg2go9DtoIFx7QTrdbAy6JDNn@vger.kernel.org
X-Gm-Message-State: AOJu0YwFg0DLvXcpGrhnfO1UmQsS1eGzVLOu9Fu6h1Z6kZUz7FVMqBHs
	bxgBXhmnRS0+gsNZCfN0NC2Bl4sSP7bUbTmcjMuiIKAAqIyRJQsJXaOo1v+43RzO1rIM6SOl/0X
	NM9ifNCCjT8xXWkQoFGKC75m/cDY=
X-Gm-Gg: ASbGnctYGSFClRCOCyE0kQf5T05FY15NtP4xbi9yyq691UewIV4oVkQFyvWf/0bmgt/
	UvPJGu1ARp5AozfM3q8oGKzISdWO7oJo=
X-Google-Smtp-Source: AGHT+IGUUfMqZ7Ksdh9fDCHJKZhC4rrxnKvWE7KOas6EI0MDojhpBH438SIr7nU6YUTcwPqa7tAeUT4MYakkcrTwWBw=
X-Received: by 2002:a17:90b:1d07:b0:2eb:12ee:cf0b with SMTP id
 98e67ed59e1d1-2ede7d8e536mr173275a91.1.1732545696207; Mon, 25 Nov 2024
 06:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
In-Reply-To: <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 15:41:24 +0100
Message-ID: <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Neal Gompa <neal@gompa.dev>
Cc: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> As my Acked-by was removed, I'm sorry to say that there is no point
> for me to provide feedback since it is unwanted.
>
> I hope it lands soon, but I also hope the people here who decided that
> a person's efforts aren't worth recording because they don't
> personally know them should reflect on this too. It's a good way to
> keep people from coming into the community for the long term.

Hopefully this reply helps -- apologies to anyone if I am overstepping.

On one side, it is true that Acked-by is typically used by people that
is responsible for the code one way or another, because the tag is
meant for them to acknowledge they are OK with the change going in,
and so I can see the argument that restricting it for that purpose
only may help avoid confusion later on reading the log.

On the other hand, someone being willing to put their name on a patch
is very valuable, whoever they are, and whatever the tag name is.
Moreover, it is also true that, Acked-by may be used here in a "as a
key user downstream, this looks reasonable and satisfies our needs"
sense.

Finally, sometimes new tags are invented on the fly because there is
no good fit, too.

Either way, I don't think anyone wanted to disregard your efforts or
to be rude to you in particular, but rather wanted to keep tags usage
aligned to how they view them or how they use them in their subsystem.
The Tested-by was still wanted, so I doubt their goal was to remove
you from the log or to make you feel unwelcomed.

Two solutions here that could be OK for both sides:

  - Would you be OK with another tag name? For instance,
"Acked-by-User:" or similar? That may help the maintainer keep the
Acked-bys the way they prefer, yet record your own Acked-by in a
separate category.

  - Another idea that the maintainer may accept is an Acked-by with a
"# suffix" comment that clarifies the meaning in this particular case,
e.g.:

      Acked-by: Neal Gompa <neal@gompa.dev> # As primary consumer
(Fedora Asahi kernel maintainer).

Cheers,
Miguel

