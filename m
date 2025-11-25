Return-Path: <linux-kbuild+bounces-9836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28865C852BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 14:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C780234FAEE
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ABC31A814;
	Tue, 25 Nov 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukM1tess"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF373101C9
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764077165; cv=none; b=ZKjdljuJdYrkW1bZMbOIIz2eKqXpHW2JazHoaDWlS9YIXSZkD6oLkqObBcT4Bg4iB+q12RhZlEWp7HeoKHwl2BWA87TLZ7Xzh7YqGQ4E/Bc2+ajE1Fcl8X/43nIYTR8ae/YevxhDEK+sm5Ygn5mPbBJwRgA51GEZ3Br5eU+/yxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764077165; c=relaxed/simple;
	bh=M0m7i3HqAAFepUal17tcRxZTSUzCfk3WUiGlWvRtVu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNkyqR0qHikgtgKqYinV3Jqw4vluIu6i09qQn65YDZUDe/Qn+eCV9Wm42T7s77jhBdwv+Q414bEzqZjBfmjrw8qA8pVj5L60mugeThoUrzey8+HfghHIdDChBeyZaNJGfS0aR1a/JcJXK6x9q3CEPUJVupwY3THD8gCRcFRjI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukM1tess; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19853C4CEF1
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764077165;
	bh=M0m7i3HqAAFepUal17tcRxZTSUzCfk3WUiGlWvRtVu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ukM1tesseJW6LDDUZuOAxmmNWd9a91Zo1MH6l4eY2Bv57ugxN9hAiGrOBjc2BDIiF
	 4rTeEfyjlOQikQddQgiN16NSy63gRRJDFYK6onYTSo68vjn3LJUyJ8/fez6Sp/w5u9
	 7FWWwKMUGi1lh+567MEsArq+yM0lGHJEG+l9qF47qmrc37rdE62rZzQvJ3bJeOzioj
	 C8+aNsoqGj348tUZfqq5+LIpA/KKBRSi0y+KJ7YK1lLFLtHX5G67/2xskDw546IwT1
	 KpR4Cf3aJuNVgodqxzqHIE8+/i7WiuQcbiDPnrvapNwd62mXUB0yNN5fJIbFIqsspI
	 htf5G66ipH+9g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso9736285a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 05:26:05 -0800 (PST)
X-Gm-Message-State: AOJu0YwDlbH5DsVdRiiZKkO5aDC3sPspDtC3LgKmLQ8H06PpcT8UIY+f
	AOOXyuaMYN6BQQDqIpIXSE/sjo3faqdJ73z/bLUCuLnbRugUh7yC7lcc8m01DltO0Wg+/UFMZSI
	nDr6uO2t47ibFmvTbIaE8t1a/nE7UCg==
X-Google-Smtp-Source: AGHT+IHoVO7mxKyEwTrUaY9TBwwXV/4RR+MmEXpxRRyiQkfAr1nwBXv4VAlqPGXgUsA9/vrCAzZ6A4YW5PqgmiVAitE=
X-Received: by 2002:a05:6402:4405:b0:643:129f:9d8e with SMTP id
 4fb4d7f45d1cf-64555b9aafamr13080758a12.8.1764077163658; Tue, 25 Nov 2025
 05:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
 <20251124130747.GA3957523-robh@kernel.org> <aSWKdgypKqt1Mq_J@L-PF2SHBMP>
In-Reply-To: <aSWKdgypKqt1Mq_J@L-PF2SHBMP>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Nov 2025 07:25:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-M_CBVjXXCFrW8UKoDgSV2N8ctc2Ao6E4VZpfCj6chQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkcQFb9pmHx3xoYsnJAJHkTUbiNSWUKhXxMBBvxqa5SvicB6Jb0VtZJuBA
Message-ID: <CAL_JsqK-M_CBVjXXCFrW8UKoDgSV2N8ctc2Ao6E4VZpfCj6chQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 4:52=E2=80=AFAM Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com> wrote:
>
> On Mon, Nov 24, 2025 at 07:07:47AM -0600, Rob Herring wrote:
> > On Thu, Nov 20, 2025 at 03:06:43PM +0100, Thomas De Schampheleire wrote=
:
> [...]
> > > In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusio=
n of
> > > scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS=
. The
> > > value of 'targets', however, is only final later in the code.
> > >
> > > Move the conditional include of scripts/Makefile.dtbs down to where t=
he
> > > value of 'targets' is final.
> >
> > This breaks 'make dtbs' (and just 'make' for arm64).
>
> I see the 'make dtbs' failure, I will investigate.
>
> I don't yet see a problem with 'make ARCH=3Darm64 CROSS_COMPILE=3D[...]' =
after a
> standard 'defconfig'. Can you please clarify how it fails for you?

Did it build the dtbs? "dtbs" is an implicit target for "all", so I'm
assuming that wouldn't work either.

Rob

