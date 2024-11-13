Return-Path: <linux-kbuild+bounces-4664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18B9C7244
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 15:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C18283AB5
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A987081F;
	Wed, 13 Nov 2024 14:05:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB8111AD;
	Wed, 13 Nov 2024 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506733; cv=none; b=e5z5WzQX/bMom7LflIQ7AWF7ZRz0t91Wiun5+jY/4hvWBfHNL7qL8edc7WuTF0RQwDVpI/VDtkTaZEIWqfHfM/LEF3pmTx9oY3w6sE0mSyjT41SofFAQ7+eyc/p1jPAVMONrCM8LJuQHJxcZBmpzjHO4j8CJ/Vmpx0aFSDu7Xus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506733; c=relaxed/simple;
	bh=Dwk+Mvw8oy2pzMvGconGALpUIJPJ0NRNk9ltXBNzyBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alysnGX1TJ9CdC3QbiAQSMB9qemij7lPxPccAT+5xaCbdd2rtDKk0LJuwGCAfJP5WZf8HKOqCP3FTWlZAu1GglX2ySzeGJu9PwZUZYye8Vslc2ie80ooxdGC9w0cCFkDMpWfJZ4XMc6SavGcvI0AV5bEK8RvxlTIldapCfsJwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so8797287a12.0;
        Wed, 13 Nov 2024 06:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506729; x=1732111529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UoOpmCzIkTmid4vVTvx8gmwHFbkz8avA1Uo6ylZh+s=;
        b=IhoI+fOn1QPBddlvqUdYC4o6k+j+ClV02WbkLd6dc9cs8MSdoAEQWC1XSFGLZynZp8
         luPx0/25IPjngYomheGGBoFLH6pIAnOerjVCZnb3YvZed4mBHBYCdWXt4EuWjmeIpRci
         2P73s4m5KsvC9CuLaEjnqGCjWbhkfz0TOF7/ATT0psQ46HhyJwDMva7HENBZgHmPE6at
         ggXI9ExGXK3rbP4OD0as24zLVjjNNk73lE2vE0BuUDqTc78WW2XZFPl964mLG66vJVzy
         cqYqjoAB2jQPsd3B/I5TLkxByRGz+wQxUGVi/K6wxM9wRA1ZzM2oBdPHDBrJlIADQ69d
         Y59A==
X-Forwarded-Encrypted: i=1; AJvYcCVeMFX8sAAaOWSew7IuWz2RnF9WWcIdKprpljT7lyWDemyUvdnfpjZi6MgJhsTfPK2YAkpC9SjZZIngbYJarFA=@vger.kernel.org, AJvYcCWzCpVujRpFgPQM+IEjiYs9VMTVcx94QFeTedI5BnwrirPRbqmP55QeZADnk1gu4tnZPwhmYCXDTIsN4m0qaQ==@vger.kernel.org, AJvYcCXIv68aKFu1KAq+fDyjsivWRgOLgbx/VzOKIO9RLGEmh6jy+wnSBn+om4fNTGl7m247Cvh19//8KSZNiWs=@vger.kernel.org, AJvYcCXRSbpe/zFi0uAqbnb4xpvl3IkQtNbV3qULULRTkJ8TtD7b8Bjo1MrKZISaGpoo+Y88Nrsx2MFLoBfiFzbd@vger.kernel.org
X-Gm-Message-State: AOJu0YxIU0j3ghEdTNwhIz2QsKJ9e060R/AO8RGhaCJL1tnmW9ngsI7X
	D3BGczpGtRRDUczupiHXSnRzvaLQz7txyMMXp/CXWn2YYE5TuBGaEPTqLShc1Vs=
X-Google-Smtp-Source: AGHT+IEdJ3/FggsGznhvLtDR0CZYGaWLecHY86x3Alz75Z7AIrEvKCvY15pNcP5MPZW3WAEYNjaidA==
X-Received: by 2002:a05:6402:13c8:b0:5cf:4183:6127 with SMTP id 4fb4d7f45d1cf-5cf41838077mr7822050a12.2.1731506728887;
        Wed, 13 Nov 2024 06:05:28 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d763sm7201711a12.7.2024.11.13.06.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 06:05:27 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9ec86a67feso1206764966b.1;
        Wed, 13 Nov 2024 06:05:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAYLRjkiRinVIuFhMTn6pTz28XFOLTy1yIrtFeCyFNAcIMK/1m+c5HaIWF3crj7G93L92ZdiXtTYy6qOV3Xmw=@vger.kernel.org, AJvYcCUBxQh9uro9oAH36HO64SRt9Wqt15wXAWH3Dt0EQ4AODUhIwqlXkax2ma8iMmOtq0hypOdS8DpIbJ5wjb2C@vger.kernel.org, AJvYcCWDof/NuyRjbgmgF/b6waoKDftY4n2DnuV4mrskeCuhkNMdwAKhaDJbIqLlXOkIQhwthybilLAvPIiJwGp9VA==@vger.kernel.org, AJvYcCXmIsIO6s9tNJPoNAGWu/UGa9LY/S/Q9lHzmdP4P1FODNauWZmUQ3f7ny0+pQ932pym/Vy59WPAgmcDr0w=@vger.kernel.org
X-Received: by 2002:a17:906:c14d:b0:a99:f67c:2314 with SMTP id
 a640c23a62f3a-a9eeff44998mr1843487666b.35.1731506727364; Wed, 13 Nov 2024
 06:05:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
In-Reply-To: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 13 Nov 2024 09:04:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>
Message-ID: <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 11:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Neal Gompa <neal@gompa.dev>
>
> Does this Ack add any value?
>
> Acked-by is meaningful only when it is given by someone who
> maintains the relevant area or has established a reputation.
>
> $ git grep "Neal Gompa"
> $ git shortlog -n -s | grep "Neal Gompa"
>      2 Neal Gompa
>
> His Ack feels more like "I like it" rather than a qualified endorsement.
>

I am going to be one of the primary consumers of this code as the
Fedora Asahi kernel maintainer and have been driving Rust enablement
in the Fedora Linux kernel (and eventually the RHEL kernel). I have
tested and looked over the patches from that lens.

While I might not be well-known here, I am known by the Rust for
Linux folks, as well as the filesystem folks (since those are the main
places I tend to frequent). I am also a member of the Asahi Linux team.

I've been engaging with the Linux kernel community directly in some
fashion for nearly a decade. Unfortunately, most of that isn't in the
form of commits directly to the Linux kernel, though.




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

