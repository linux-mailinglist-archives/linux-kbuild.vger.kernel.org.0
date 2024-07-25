Return-Path: <linux-kbuild+bounces-2664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6693C8B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 379E81C20DEB
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19C34F881;
	Thu, 25 Jul 2024 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM/6waBR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834D37171;
	Thu, 25 Jul 2024 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721935808; cv=none; b=skdIBLJ/9Bus94IqPb/e4DveD7VGSdJAqyo7O94GrrFbU/8n8JqMQYuolW2AKzXO8A10SRBIeDStYveTDnCSX2zOobEo90mNATYt7tzR7Osogkj9mOb/eHXdmv+oBrHlgjtgJrRk41/MuMpbg3AZR7SW6ezA1JCBV8afBXiqiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721935808; c=relaxed/simple;
	bh=wBR7X5SD+NjV/BoiuyJHK71kuGND3MqmJueA2bXSWJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI9cvLdh2g+it2Bb3RBKDA0ouPlCF7GJxcT1thmV7V4dVWNi9wYQoxMYuL5HJ1cXiWah5IGgUpRUykUhgnQLH6fvS4uzx1MYeAzInPnbQ8QiBhCu7SLgs8xH81x5Ff4X02N8JBEc6OBKBBMpKW29V2ab3CGB27qbbJ+7RjSAC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM/6waBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4602AC32786;
	Thu, 25 Jul 2024 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721935808;
	bh=wBR7X5SD+NjV/BoiuyJHK71kuGND3MqmJueA2bXSWJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LM/6waBRXJFFYQR9OtGcHQ9bjNw0+wIFXV4bHnBHZin7DnJpmo0Ec/aN7l/koS6mx
	 1N2Fk/Bx3VNASr+K7iiYbUul5p16jaxTu7NUvGdudXU9edE0LAL5i4+2PHdFngwY3Q
	 wc7c2jTeClkaE8/qE4iV+yqp3xs+U4ya2hIPkAcw2a2Sf1dAW+SvC5J66oAlJ5R16r
	 rHGNaFbi7X6pl5f1y8xUw8quo/U/3iCzfd/dT8mpgBqRiSUEdujlPNd3bFOz6OLP0A
	 q4MLE0eXQphPj51a8yDFWM1wuL5x2NcVMAZpkVjadfS2G8GVesokHyFX2O5+AAS6LF
	 AQjAD0RPda5FA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efd530a4eso792930e87.0;
        Thu, 25 Jul 2024 12:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWO4o1m4zsW/mIK7+ecmR3FEPK3Yygx92qZBzoTFk3eITYxH1OGwrIYcXgMkAgqcTsY0Yv9FTu7mDRVzVjKT+GC4chm5eMOiIASAhge
X-Gm-Message-State: AOJu0YxCdzs8DVtcM57DsJ6Fu3IdDJeiPYiophmrQ7gO0I2D8oCIhEa3
	a2SBGyrurUxx6ZLVzbx6OhrSEH1gKdtg23G32ghbrSVet00uxacecC6dLcH1nZqxlQGNAcaf7Fq
	k9sADKRBNXpwyMwbH/QXVxbUmxRQ=
X-Google-Smtp-Source: AGHT+IHb0Nu2NB/wPTo+uxUjeYwAW2YoIdb9yj6xe8Al4X3rYb5AInTzbTZGyVFTL8d/SSFILMumgiofcd49MA4JSdc=
X-Received: by 2002:ac2:5bc3:0:b0:52e:97dd:327b with SMTP id
 2adb3069b0e04-52fd609821amr1985725e87.23.1721935806950; Thu, 25 Jul 2024
 12:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
 <CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com>
In-Reply-To: <CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 26 Jul 2024 04:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi5S0u3DD6fhtm8KTT-Cmd5xyaYsOsM+FmT69mOcdfwQ@mail.gmail.com>
Message-ID: <CAK7LNARi5S0u3DD6fhtm8KTT-Cmd5xyaYsOsM+FmT69mOcdfwQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,


On Wed, Jul 24, 2024 at 6:49=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 23 Jul 2024 at 12:44, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > You will get a merge conflict in scripts/Makefile.lib
>
> So the merge conflict certainly wasn't too bad, but I really don't
> love the complex  fdtoverlay command duplication.
>
> Strangely enough, there's a simplification for the DT_CHECK_CMD case
> (used only once), but not for this creation case (now duplicate).
>
> I didn't do it as part of the merge, but may I suggest adding something l=
ike
>
>   DT_CREATE_CMD =3D $(objtree)/scripts/dtc/fdtoverlay -i $(filter %.dtb
> %.dtbo, $^) -o
>
> and then using
>
>    $(DT_CREATE_CMD) $@
>
> to pair up with the existing "$(DT_CHECK_CMD) $@" logic?
>
> Or something along those lines?



I deduplicated the code in a slightly different way.


https://lore.kernel.org/lkml/20240725192317.258132-1-masahiroy@kernel.org/T=
/#u


Anyway, this is not an urgent issue. I will include it in my next pull requ=
est.



>
> (And no, I didn't check whether maybe the argument order for the
> 'fdtoverlay' script might matter, or something like that - I don't
> think it does, but I did *not* test the above suggestion or really try
> to think about it deeply, just mostly a reaction against the command
> duplication particularly when there is now a comment about the
> subtlety of the arguments)
>
>              Linus


--
Best Regards
Masahiro Yamada

