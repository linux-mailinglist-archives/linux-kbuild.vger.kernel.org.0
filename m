Return-Path: <linux-kbuild+bounces-5942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC76A4B39B
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 17:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAE23A54F3
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 16:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175671EB185;
	Sun,  2 Mar 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riP7D61Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D111E5B6D;
	Sun,  2 Mar 2025 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740934643; cv=none; b=rn+ME5rGqQXw3v7qabu9jSHOU8B/jM6G2Wz7ZziGRSfhwsm1gOmUUsmhhLO+DE9rIVg2E6CDa6QC3rUQrwyWO4XIuN3f6LmK/szxV4M69Gpc7LRSbi3VCTX7KRYU4KChzXkC4qEUjZsBFodvi1CyhgaYnLKOTnIkL5uxu+TFi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740934643; c=relaxed/simple;
	bh=m4UU+vOHH3pCS9OMSG1qa6ss50Dla6hu8P46A/yqsH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWUd6tvNXM7r7Hbreu87KuecK9VmbQjQtOlhEPU5vVg9y2IWPbijVpZfr6/FbZItEvaP74Tvc7J69QtBTWHplFmyE63I4mjIKYsRrjogNuWQIzNmrUc9Ns+s57Qj3E+7ssQpmGph/gxe6LsAXhITLUapo5WilJ4g+fTkqGw8Wyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riP7D61Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67BFC4AF0B;
	Sun,  2 Mar 2025 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740934642;
	bh=m4UU+vOHH3pCS9OMSG1qa6ss50Dla6hu8P46A/yqsH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=riP7D61ZKf9qYvIpR0geQi4YKKRWA3CQQCDU30qByX7m9ciF6ixDp1SWIH247cAqS
	 ZfBdJla7g3S3VD6w2RaJnEwVNSkEF5xiHLlg+HNkySXxB4SiH+4BoOJQaBQa+WY1ey
	 i/khTF6/yF3ymSXk+d5fndAwZpjCJXPH5JtQqJEbVqGbVhbk7ojQbvU0pj7yqHSzeo
	 UDQmn7wfqsUB/vUNQ37JsBU8yxHy87yhJz1J3eJtrrfVYq2YGOzYEHTVaQZiv/0Pvq
	 2+KOh/dmqVtXZw+YHqquwXUdi1287wXbBeLKoyNZILVSSdaySj/u0Z1zvMn/EnWlWv
	 jw0knN8QtiGnw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549662705ffso397909e87.0;
        Sun, 02 Mar 2025 08:57:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULPiliCxAbr2Ww94ye9wh4D9YF2FKwDxzfDilxwbe0CFMUEjkGXlOeDGhJdcxjToNzLufdHG1Ap16Yqng=@vger.kernel.org, AJvYcCV5/v9RdAti+G4Q2p/TsilC6oVssQH8pbJwLdHm17JW9rYpIgrtMcsrAVRHQhgilRe1YwNHzTfThi0L4XT+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0d+RPWH8JrZpFgIpQZyK/L7MguASBOqmICT8SjLLD1ifNCnv0
	rttK9EfkC67ATWlzEirPdpUmjMLZjZ0kDZsCIal2oEghLs7CzhgMYI8+qSlspiXTMam7TJu3knK
	zEiW5u5AjKp7wM8uLoAoeCb+gdQU=
X-Google-Smtp-Source: AGHT+IGNkZunlBnjQACzPWOsb6gYGyvO8PmRqOIYIQir1vwZJv7wdLPmbsd4+0osqIb+2GJb+U2Y4U8AYYRbzwUOmy8=
X-Received: by 2002:a05:6512:31ce:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-5494c38c1ecmr4239522e87.50.1740934641459; Sun, 02 Mar 2025
 08:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
 <Z6oeplCypN825pyR@bombadil.infradead.org> <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
 <ac98e417-1587-4806-9576-7661acc6bf6e@ruhr-uni-bochum.de>
In-Reply-To: <ac98e417-1587-4806-9576-7661acc6bf6e@ruhr-uni-bochum.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 01:56:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4ezUbKj1N95tN2xaiGXWABp3ABkwK+NePWc87XgcEDw@mail.gmail.com>
X-Gm-Features: AQ5f1JpXeWjPAQvivHFzti8mhMtVvNG5xG8JuUT1ekbPpjZGGvY6K82c1GnzNdo
Message-ID: <CAK7LNAT4ezUbKj1N95tN2xaiGXWABp3ABkwK+NePWc87XgcEDw@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
To: Jude Gyimah <Jude.Gyimah@ruhr-uni-bochum.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Ole Schuerks <ole0811sch@gmail.com>, 
	linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 12:03=E2=80=AFPM Jude Gyimah
<Jude.Gyimah@ruhr-uni-bochum.de> wrote:
>
> Quick follow-up.
>
> On our end, our SAT-solver implementations can be easily adapted to accom=
modate your future
> toolchain selection refactorings.

OK, we will see.

>
> Also, could you share with us the timelines for your refactorings so we c=
an plan and deliver the
> adjusted SAT-solver patches.

There is no timeline in upstream development.





> Best Regards,
> Jude Gyimah
>
> On 2/11/25 01:46, Masahiro Yamada wrote:
>
> On Tue, Feb 11, 2025 at 12:43=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.=
org> wrote:
>
> On Mon, Feb 10, 2025 at 02:00:52PM +0900, Masahiro Yamada wrote:
>
> Thanks for this, but I have no plans to merge the SAT solver.
>
> The reason is that my future plan is to move toolchain selection
> to the Kconfig stage instead of specifying it statically from the command=
 line.
>
> That makes sense.
>
> This approach was suggested by Linus [1], and to achieve that,
> the shell evaluation must be dynamically re-evaluated [2].
>
> Sure.
>
> The SAT solver would likely conflict with this plan. At least due to the
> significant amount of additional code, which would be an obstacle.
>
> I can't see how the toolchain selection, if set on Kconfig can't be
> leveraged later to enable / disable the SAT solver, however I can
> see the amount of code shuffling incurred to be an extra hurdle to
> address and a preference to leave that for later.
>
> In other words, I susepct it is still possible to evaluate to
> add support for the SAT solver post toolchain kconfig integration.
>
> Thoughts?
>
> It depends on how the dynamic shell evaluation is implemented.
> This is not limited to bool/tristate, but SAT solver only works for
> those two types.
>
>
>
>


--=20
Best Regards
Masahiro Yamada

