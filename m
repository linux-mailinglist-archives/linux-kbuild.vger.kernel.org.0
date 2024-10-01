Return-Path: <linux-kbuild+bounces-3844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085198B20A
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 04:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E283D2827C5
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 02:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8082263A;
	Tue,  1 Oct 2024 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvoZZmFO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872B29AF;
	Tue,  1 Oct 2024 02:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727749122; cv=none; b=QT3vyoGsBbqdKwQQMEZm6Y1Y+21Da8fEyhIwPNtMH8A4+TJ1D2D57P4isR4dV+5sJ90Lu1rhf0VWuJtNJOQ/LDoB1LZLFo2K2SUXtA+wc+M8tvdkJ28Wmws4UFMRMnh+DX+/1sFOJPDUwWDBRylv26Zi1HQNj31A8oMaqWVBQEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727749122; c=relaxed/simple;
	bh=KOaQyMG5fYSdjd4lDguia+QYC24mecDLvJWr1M4adII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L93kJ52e3XohN2EKMyR58Q4pcuLOOpknpdRVnmcve4FjkVytahqbIlRCn/g4gi/k4OGv2oSxUl/JX1bGWQMR+k4ZtRNKqS1JtrvYxA212v5mSXcQ4/CAdHvKe/Xdeko6LtqTawsZGT3LhJli/dpt3n+aDLLD86PhS85mKBY5xTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvoZZmFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF42C4AF09;
	Tue,  1 Oct 2024 02:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727749122;
	bh=KOaQyMG5fYSdjd4lDguia+QYC24mecDLvJWr1M4adII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BvoZZmFOAt0Bo7NfNxzCeS4fPwJN0o2wZ4IRhDBEYGalAZ5nLHs6xDSVjRANdyHEn
	 07cNJ+uE8TbHREIcNRASfC9vyjRoKaXpZeFPhMjihhLHsFiLnByfrmmSwQmdqqi1Kb
	 iiOlp32AnqRlh5YRvXCcAg03YpjBRyQKfMVpXUFvELYmCBVK9AprgOB4EnvPKOQiTh
	 mdkY4CwnNZAp6rNc2ZabMXPghYEfIDT6owRhEjPoXAW4UxTz1ubFItw6TRhYdeX1Bt
	 MKp23f2p+lYMivSmp63jsorM/exsqbTYQM4Dg15oeyRMwGwPeJvt/k8aPYFvXsDRxH
	 LDzaeHkX0J+Bw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398df2c871so2575985e87.1;
        Mon, 30 Sep 2024 19:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDgI1QuCOODP667OAGw8vv5iM1NihUndRM1IMnmPZdDAZzvHI8a3oQLyctlzsXRVr1PeldInmN0RisbepRq5A=@vger.kernel.org, AJvYcCWj7mng//1rqUQrRbcooz3IgxoA/C7QBhOjbP52ZSb5J4gxmUEA1r06Ex11Na5ubNyMS5HttDjpdG7Yzdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/04JLkPotWk0uPvF7fw6E53C2lVZpYXvjWs5UB9VevHCK/NKr
	8IC6qxBJY01zXCWbtV+ejV/VjubdMVCP1E7yJH5FyWYxHfhfy7quWDYuSI3G+l6IHknatcZ8w/k
	zlubvj0cTZdDWdxteLaQVuUIjAeQ=
X-Google-Smtp-Source: AGHT+IHKUMRfJMcCkuzQ3rM1zymbJ6TaiRKZSh06SYICjQsVsDpmcrazQLIZG+Ait4Gjb+oLNTWbjFs0hmot0DM/hQ8=
X-Received: by 2002:a05:6512:1113:b0:536:55ae:7458 with SMTP id
 2adb3069b0e04-5389fc6c0bdmr7696475e87.40.1727749120988; Mon, 30 Sep 2024
 19:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-9-masahiroy@kernel.org>
 <CANiq72nPAn1HWwHBL9qFw=V-BY1F3ckgmkb7c23vfKuH-oB9Qg@mail.gmail.com>
In-Reply-To: <CANiq72nPAn1HWwHBL9qFw=V-BY1F3ckgmkb7c23vfKuH-oB9Qg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Oct 2024 11:18:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQCbJNnTtWtLPYz=5Y-5Tk9UaoU4EVDp_dayzhekT055A@mail.gmail.com>
Message-ID: <CAK7LNAQCbJNnTtWtLPYz=5Y-5Tk9UaoU4EVDp_dayzhekT055A@mail.gmail.com>
Subject: Re: [PATCH 08/23] kbuild: simplify find command for rustfmt
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 3:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 17, 2024 at 4:17=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > The correct use of the -prune option can be seen in the 'make clean'
> > rule.
>
> Yeah, this `-prune` should not have been like that -- sorry about that.
>
> The comment above this recipe should be updated.
>
> I am not sure I understand the part of the commit message about the
> rust/test change. Do you mean that we should use `srctree` in case
> there is a stale one in the source tree from a previous
> non-completely-clean in-source-tree build?

Correct.


> I think the original
> intention was to skip the objtree one if it were a subdir of srctree
> (and that is why the use of absolute paths).


OK, understood.

If you insist on the current logic, I will keep it as-is,
but I need to replace $(abs_objtree) with $(CURDIR)
because $(abs_objtree) will be removed by this series.




> Although I think we can simplify further by just removing the logic
> about `rust/test`, since we don't generate `*.rs` files there anyway
> at the moment.


OK, then we can remove -prune entirely.









--
Best Regards
Masahiro Yamada

