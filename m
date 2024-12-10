Return-Path: <linux-kbuild+bounces-5056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6B9EADC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E744D1884732
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D3E78F40;
	Tue, 10 Dec 2024 10:15:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCDE23DEAC;
	Tue, 10 Dec 2024 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825744; cv=none; b=T31K+0nXwjLm3H4uG6j0jgAiK9ATm/If02DMG9voIGKVuxeEzsMGXjwg0ykPysYrsA7yQE6jq5HVot364Ea3zv3xoArWLYHWiKpgE67sLOvpAsmMlbvrPtY8EEzEDDTpgnoaPGEOruruDTMZ4FJOrG8Im0cxo5fBHam3wSpvWeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825744; c=relaxed/simple;
	bh=D4ZOBExquZ7c/tCXnjuhBALSErPwKsv5Me/SpRxzelk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQXEFHeSOYp3PYe3LTrn4KNc0sQvEq9ZPXZIUJLj50dec/WbptK1TxyGVrsiJVzIdvVdo+5tbP7LsQ9WiqIXw5h0efizC9gKmvOc+gGvHdL50SENwy/uRxP7NEM/GRv1MwZrXo9tYuJXnL7M/tiqKA4yLjnZR2DMY+hcw5Pg0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe99e5229so712704137.3;
        Tue, 10 Dec 2024 02:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733825741; x=1734430541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB6f4Rz8jPEzmCNgtIOwVu4unaWtfDXhGq42cgDlyPg=;
        b=sS/ZR9kNZ0RJLhF/+aTQyCYxlFoy0eyMlHnUc6SXkAe2MyU1c/ihOzqxfdeHV4TL2T
         YorhUKx8E5ep5wfkNG0dgW8clIrNFEZHRc2V/pKKFNFGWkK04QmtVNM9OlE6Q4Ejf2gf
         SGKSkhAvKhtmkEife9q9Dq/GMPVjVlIhYPLxtZaktYedE1L8SFJXDomGKWuH8c+kT13B
         gO29D8oKa7DSMtH10qR08ZADE/A5/h+RzsLjdnNejfpfKrPTNE+4t+M74gsh1Orhd886
         bKkE6Lp7Pk35GAzE5oipVQRt4HxdnmLJKtovJZB95iuWpoRkCMxaRSVcPN0mcAglZtho
         K8CA==
X-Forwarded-Encrypted: i=1; AJvYcCVprbaGBCrO247Xgie0HWb+IgRrlgzz3PHiJAnvgbCpQ1t+wY5B/cSgP7UO5bmNeyfvF3uX9jjzMMVZWJ4=@vger.kernel.org, AJvYcCWvL6v6CBsfhRe6pbv/0RiEBNodcTvQaGj75FSBm8K83QAyO8Jqb6Qk39oNJIq7m/kt3N5VEWbeL42/jDjx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+QB0Ci4L59pl+3q2LqXOd7u2a18e7UsCninqtUVGvGu9Wjjp
	gJgOocFSNpCpO7tYg+0huOUoI4ohEsqhs2PrMbJ2Wd3Nriub09QIdr652VcN
X-Gm-Gg: ASbGncu97+6oIlPypm8JMEqHd8hIOtWQkvRMBnwr6SROqXTDxUu7smeSjwx01Z77MuC
	fQh8YzizFoZbVYfW4xeLy5zmHrqGh41vSos+PV7QiYdLDStYcRPBF664iiJUAHCeEJAapCDZ7c/
	Z0bOW3gsfAVQVtf4zDyEoiy/x7ieh8ghJVQ+jJDaY5IePSVFlgWddk7P6s+iv+McY8qjM2xGUlj
	BzDXO3ua/fCAZs8WkWLbmMMGG4uxmwR1qfyuUB1pgz151yTlQC/Kv5vfk88pI9C3v2UX2xpjBe4
	q8dEeGl7HKrTuPRH
X-Google-Smtp-Source: AGHT+IHvitPy3g+CcCGJcLKIZ/SgJVojVdpZPal37hNdz4sPko6Q5a0iJGX9TfJMF1MsF9r6l6OdNg==
X-Received: by 2002:a05:6102:1612:b0:4af:ef85:dae4 with SMTP id ada2fe7eead31-4afef85dbe6mr7411438137.5.1733825740874;
        Tue, 10 Dec 2024 02:15:40 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2bcf37eesm1328094241.26.2024.12.10.02.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 02:15:40 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff78a39e1so538959137.1;
        Tue, 10 Dec 2024 02:15:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9mshy5+F7kI31UV2HKV8uffK4/Nrf3YBsnq9GNdflWr3NlqCIXE+JhOzagIDoQsDg/pKyjAVIbtXbLkk=@vger.kernel.org, AJvYcCXTQsn4W9wXhn5KWgP6Yva6W2SBiAT2Nu0S3fqTYVdGdEOlrq6LwAup/i4iHfenp7UE1GndtPF0lBWLPhKA@vger.kernel.org
X-Received: by 2002:a05:6102:508e:b0:4b1:1295:43da with SMTP id
 ada2fe7eead31-4b1129548d2mr4737360137.4.1733825740382; Tue, 10 Dec 2024
 02:15:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
 <CAK7LNAR8dy-=EcsZFb-tjXSk2sK7sHrV0WSSV4E8dzRh5Veceg@mail.gmail.com>
In-Reply-To: <CAK7LNAR8dy-=EcsZFb-tjXSk2sK7sHrV0WSSV4E8dzRh5Veceg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 11:15:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWi-dGwdxydnmgNfDbM-uOP21zDAQz5-cZJiFEz4PhJnA@mail.gmail.com>
Message-ID: <CAMuHMdWi-dGwdxydnmgNfDbM-uOP21zDAQz5-cZJiFEz4PhJnA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Drop architecture argument from headers_check.pl
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yamada-san,

On Tue, Dec 10, 2024 at 11:14=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> On Tue, Dec 10, 2024 at 5:52=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Since commit 7ff0fd4a9e20cf73 ("kbuild: drop support for
>
> This is not a fixed commit hash because Andrew Morton
> does not use 'git request-pull'
>
> I will squash this to the original patch.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

