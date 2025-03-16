Return-Path: <linux-kbuild+bounces-6185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA5A63344
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 03:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720783AA290
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 02:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD818F5E;
	Sun, 16 Mar 2025 02:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRvdq1S2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1B2F36;
	Sun, 16 Mar 2025 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742090553; cv=none; b=sSSZ/uGDagjBrNNvkjk6U6CkorPubXJjbcrR3MQSpwUd3AbNW952HVXlLLCmdIMvwoTB6mrf2Aj+6IgCE2G8GVEOntO0Mtx1Q0r8qVvbtfUZefDyiEurDeagDpl4LL/nw2cmnaacwOGkZ0b2rzkpFcU9+NYxQasdPbCNpGvI8U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742090553; c=relaxed/simple;
	bh=q2+3SCMJCwI2M1bRoe5n7pRUT/fFnYCaKJ/n6sInKFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZT976UIhjG2f0qQaSkqBK67W74GSGAabQlzZYPZAIr6P8Q97HZdVdAtIs5oXcoID/iO2WK9Mp+F7bLIFr66wndMddZVocaK9wt3Yg5nyh+J5sU3hBRJbICl9EgaDinQkIOTYy1/CPUmd0Ias2Q3zkFdWTaX+wmSUIHC+RF2gJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRvdq1S2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892FFC4CEED;
	Sun, 16 Mar 2025 02:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742090552;
	bh=q2+3SCMJCwI2M1bRoe5n7pRUT/fFnYCaKJ/n6sInKFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jRvdq1S2sl826By9jTEmXcobWq8K845d6k86+W2Km3MILeiJ/tGNlqljeIcGjbSqj
	 vQt/WGl9JkZ7LsmMMwqf+MjvXOGFki9v4MeZEZLiFsWjiohizdG9EzOjL3JwGfDaVQ
	 X4KSL0EEGIKO+matWKIhc/snUt7cSFwqVyKunz7PWb0ctIdOsFP57X0Vdi93bqJb7Y
	 lNOhEhccambNeWAlmJ2yR3sI55KkJDZcADOehG2wgLKCt6dtaqCP5nNaLFAzNvPPSx
	 aGyLYCtHERzB2nMcQ+BMuNilFhDZI991VbKIYX2hewPWoYmT8F2zpiT1tw18QOt9PY
	 PsQM8nFJk8ZKg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549b116321aso3756448e87.3;
        Sat, 15 Mar 2025 19:02:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWoBN35R/pnZxKQsM5LoTnoJ4Kv7n/g9IAtKhJ73OgyBgmhv75pHyMyIZfiLb6gJKyBhgP/I0ZRqDXpq9z@vger.kernel.org, AJvYcCWsgT+j63lZ4pKWBq8o0FJ1cbrbDIMaAw+zXcDnTE+2J7FMXMUg/iqEwhRXf4OX1i3ujg9MbG8lHvYp8TmH@vger.kernel.org, AJvYcCX1haUYfiqNymmnE8Ipxz4e5mNIImyHar13HVRqTnqPqF6E0Id18663ROjEMDD+CqDEgUcdQz9fMIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuWz1YZT721V6Xp8hX1NEaoCuJg1LeFi6HSzpDZ2dtjmlzhId
	C8ShEN53HY/mG8dtgdHObXWrgQKmloyIhTuh4zCiuUyc9jz7ewBWDSAV18+eZeqVilHsiDubF1J
	XswjY7WFOxEJAGGzMo4g2cJwpTFI=
X-Google-Smtp-Source: AGHT+IEYccJ1r1lwbzQ0w1tmc4PDiPrWCr8ei32uWhEEgvbYEVP+FBQCRp+slVB26L9Dx+vhPfaxqfAo/CFJYWEZ9J4=
X-Received: by 2002:a05:6512:ba8:b0:545:109b:a9c7 with SMTP id
 2adb3069b0e04-549c3924ec3mr2590231e87.35.1742090551212; Sat, 15 Mar 2025
 19:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
 <20250313-kbuild-prefix-map-v1-4-38cea8448c5f@weissschuh.net>
 <CAK7LNATuGr39YSsr0e6pB6wD7shyZVL12GMuE3HaWfXFXuRd4w@mail.gmail.com> <Z9XwL8v3-nIneMox@gmail.com>
In-Reply-To: <Z9XwL8v3-nIneMox@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Mar 2025 11:01:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQn0-GAAvT1=rDm8WCY5OS4psquJc8irTEJZavVQrMb+w@mail.gmail.com>
X-Gm-Features: AQ5f1JqJtg753FEHEmPmDod7tCf33YyYeZ-N2q5d8ddZSvhTY0x05UPaUR_hquE
Message-ID: <CAK7LNAQn0-GAAvT1=rDm8WCY5OS4psquJc8irTEJZavVQrMb+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/boot/compressed: Switch to -ffile-prefix-map
To: Ingo Molnar <mingo@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 6:25=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > Hi X86 maintainers,
> >
> > Is it OK to pick up this to kbuild tree?
> > Ack is appreciated.
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> Thank you for picking up these!
>
>         Ingo

Thanks, I will add your Ack to v2 and apply it.

--=20
Best Regards
Masahiro Yamada

