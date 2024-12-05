Return-Path: <linux-kbuild+bounces-5005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CDD9E4CD4
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 04:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08765166311
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 03:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFF7190674;
	Thu,  5 Dec 2024 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlFHdIIR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D5A170A13;
	Thu,  5 Dec 2024 03:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370408; cv=none; b=iLhCwEGavfAAW/yoZggkYKFriL9HIXYPKXvfgO5xlMl7dDgzVZYW9zD/3jSTKBlAkf/FiO7VoPhN25fua2FjQa3gewFbZFGpGf37gX7GTVtRxUasfBWrQWwqlPLTyKoJJnoYWbG0CzE8ZsOoMImARFqk8885Zy3ZoKd5FXQK8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370408; c=relaxed/simple;
	bh=Z6WX58jels7q59APEeah0oca/ZdVmls3VoLNao891D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVgdnR4vrlLuLDpU4dJshtpqe0WHqVIFdw7nM8Bu6chIWBfOijWFoPSsSVV6fJnJfawP45ZJGlRQY7wqzsxptZZecyOKpDzdgVhnR4YH6aKx7znCGiv6HnWhcuoJgyPISpa5pmRjLs4Sl9a1JD2z7nmqKxKJD7xv6WM60+mU8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlFHdIIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BC3C4AF0C;
	Thu,  5 Dec 2024 03:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733370407;
	bh=Z6WX58jels7q59APEeah0oca/ZdVmls3VoLNao891D0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qlFHdIIRzQb+jtYkEcUyiwqE+12mw30Ix4vySspB2dtYhhbpurke/UAXaiaglfhTj
	 ZDoClI+hHBJmGtTcd/WaiiOowg6cpMsK4OvvaX24u1dqn83KqFw4GLcqXHoS/fVk4l
	 GyeRszCxgVIa8X2aGedbDaE6MPq2xHIs8WjXAll9FCyYSYbicrF93TA7vuXMAAIgRl
	 ZoanCS3WD36BAguHyx3268UW0Lirtt61MDONBgXPMzKKZk6/xEGweZCEyXGyBbS5nw
	 ZvKJYT1cbqg1jE8cD0/TyG9Y2ZARtBhBvemHMdpRpyxqn2UHFpcAG5Iky1YeAjuatV
	 xoTKacGWaQzng==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd668c5easo543045e87.1;
        Wed, 04 Dec 2024 19:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMz1zLM9BkqXWvqdv2MtiPJBAfFUi+pQN35nENT0jmEbK4VNyc/raXD+I/mNcPLDM6pAb+0+JYHeK5k+E3@vger.kernel.org, AJvYcCVy70gFwNYFOtQxGIIQ+Jqtykru3j9OwwVTg1QHmK3EuhKiM3cswQ/ATGYxYnBGS5z2TgmOEUMwQ5XKZKk=@vger.kernel.org, AJvYcCWYmLRqSrjfDU6eU81/Nf5wTBCdF5tmc5WpqQMuSAAI/F8H1+sSYt2t11Gnhf8wuY4GpojR7/RZ3qVNdHT4nrc=@vger.kernel.org, AJvYcCXEg8yRb8tpjipxaWaID1N5BhJLSD6sfTJ3STD0XugMkAdN0aNI6+iBe2fgdXBulpS9w25aqUz7oFqWHi4CSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwi43eidrFLE32m6NNNIEUA7iOvtndcigglPFyIap7WhYbog9r
	1h72WjrgE+GgU56xh/j3r6N5eFqyW3mscpzJAZvg312HlJ9GWsZ6ZNeZWkvtAgGb6Z+dWp0cfVQ
	Wa4e8rbUrx/Nm/Et60oRgGZgJhNc=
X-Google-Smtp-Source: AGHT+IGVqKlQS/Jjmg92XuFwkx6CeBX8rw0Lk7GUAGzo4vhqXPxIIS8mzsUDLukXITQG8Ui1TlwCO0GZK7KXvezW744=
X-Received: by 2002:a05:6512:3195:b0:53e:1c3e:65e with SMTP id
 2adb3069b0e04-53e219159b7mr412818e87.21.1733370406229; Wed, 04 Dec 2024
 19:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com> <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
 <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com> <Z0YS1hVWuozpN4Ln@bombadil.infradead.org>
In-Reply-To: <Z0YS1hVWuozpN4Ln@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Dec 2024 12:46:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
Message-ID: <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 3:26=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Tue, Nov 26, 2024 at 12:50:48PM +0900, Masahiro Yamada wrote:
> > On Tue, Nov 26, 2024 at 8:30=E2=80=AFAM Luis Chamberlain <mcgrof@kernel=
.org> wrote:
> > >
> > > On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> > > > Add a basic DWARF parser, which uses libdw to traverse the debuggin=
g
> > > > information in an object file and looks for functions and variables=
.
> > > > In follow-up patches, this will be expanded to produce symbol versi=
ons
> > > > for CONFIG_MODVERSIONS from DWARF.
> > > >
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > ---
> > > >  kernel/module/Kconfig                 |   8 ++
> > > >  scripts/Makefile                      |   1 +
> > > >  scripts/gendwarfksyms/.gitignore      |   2 +
> > >
> > > This doesn't add scripts/gendwarfksyms to MAINTAINERS
> > > but then again   scripts/genksyms/ is not there either
> > > but it does got to Masahiro.
> >
> > scripts/genksyms/ is a very old tool with no maintainer.
> >
> > It defaults to the maintainer of the scripts/ directory (i.e. me)
> >
> > > Masahiro, should we just add both to KERNEL BUILD and add
> > > Sami as a Reviewer to help with gendwarfksyms?
> >
> > I think it is better to have a separate entry for
> >
> > F:  scripts/gendwarfksyms/
> >
> > with Sami as the maintainer.
>
> OK do you want this and the extended modversions to go through your tree
> or modules tree?
>
>   Luis


I guess I can pick up them.

I was just thinking about a possibility to
make this (and the other one) less worse.


--=20
Best Regards
Masahiro Yamada

