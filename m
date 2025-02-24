Return-Path: <linux-kbuild+bounces-5889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37175A42F10
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 22:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAEA63B1619
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 21:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E847A1DD9AC;
	Mon, 24 Feb 2025 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgvAuKsP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06271DC9AA;
	Mon, 24 Feb 2025 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740432523; cv=none; b=LWrCJlkljMLSO0GEU2aEWFdzZ2C/xmcXlim8ap4JKgfWc/ul6fLw7MRTZLyaNClSEvfLL49bWWPy+e3Fj0Nlr1IBuSNltjkCyYX4f6bcUwwlKTgM5hlzUFyw2ZA+/yiAzObPhFCg44YhBb3IOZebFO9c85ANPp1r2clkgi5Z2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740432523; c=relaxed/simple;
	bh=owWVXqXxTEWPy3Mnl7VxASxHSFRKtfqJPhx2DlEodn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mp8FCIQN3uknwAI8dC1sbHIQklXRVFig+3OnCwxSlTpPUPBvOKqkvvl7xa2pGN6ipasdPZWk3jG4y+gVuKX1B8wRKUTJ4QT7XM9kfeKxGBj/QlbvQ5H26ZtS81ScwaAMA0jkRSpSeSrfK4uZTGNRxynDVLE8ByQ8iO7v27S8Yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgvAuKsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFBBC4CEE9;
	Mon, 24 Feb 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740432523;
	bh=owWVXqXxTEWPy3Mnl7VxASxHSFRKtfqJPhx2DlEodn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FgvAuKsPcfpnHMkP58tN1Xutpg7/OPz8kwJXvD+UMr2uhmjmpMRH3ZhKp3LCGez1w
	 ZtR+n8MMiWJTS+zj7L65XII0xqXTxdqlGGpicACMxxvh/iYqwJ/WSRXS/V8uVj01zw
	 ZsTWoE6IGL+zZtBIrs30wdNw4eAqEyjzY6fD9kkP0/yfy0Ggs24g/kaC3Oc2falImK
	 D9vu+hy9LQd0K4bTO8Hpjk9WLyixuDrbItzRcYGubvEDpEOQD2TY7UxLqo1hQAfy6t
	 DKPb9pG9NgxsOBQ1IRgDAlpOvJm17nDGsdAiuIwGfBmkb4itZGjIqMIz1JGwzvDC0J
	 ukOQu0QT2Mmlw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso5921246e87.3;
        Mon, 24 Feb 2025 13:28:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa2557QCQb6RIm7dHWp+TTRA6Sz12kcNZ8g65TOIIxbDeiyHJ5nGdIagkZFtYNLJZ3xUEUzJ93wRPhSgZm@vger.kernel.org, AJvYcCVextvIm8lvvC53JM8dNnMPIMXqzyHD8WB+H1ggm3wgZ9+E5V0rwrQF27a02yT9z6gPjNIZbS//Fp321sE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbfddko3w6KQoJVNIAfKthWKsZaukeecX/gmuhhZ5a2MmOHDDT
	Arl0ByKvxu69te3TYaPXe1T74HoNAkJD0qWNM04Tf+Idw6jESgKH7YI+GPtpO3bCnd6eukSnOpR
	ISLeQCfNW2PYxxm0JXjEsRu6pHZQ=
X-Google-Smtp-Source: AGHT+IH4uuJWuzIIkkZjCVcrJTp8tEVgRA2Px36H+gSe3Wkn5aoqRd/7i9WPl8IygELhnLrWY37JD5Cq2gw48RSL4UE=
X-Received: by 2002:a05:6512:238a:b0:545:ea9:1a1e with SMTP id
 2adb3069b0e04-54838ef5c21mr5647552e87.26.1740432521583; Mon, 24 Feb 2025
 13:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <Z7y_i-ySL68BfkgQ@gmail.com>
In-Reply-To: <Z7y_i-ySL68BfkgQ@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 Feb 2025 22:28:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFe=-tAp7cGGO-meO-NWO93XNhxW8MBNhRE-gC8myh0-w@mail.gmail.com>
X-Gm-Features: AWEUYZnzhrjfmOEa4NYvryZ8pp3MRH8SRURweAydDOmGkKfGreCMo-dnx_kT2YU
Message-ID: <CAMj1kXFe=-tAp7cGGO-meO-NWO93XNhxW8MBNhRE-gC8myh0-w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 19:51, Ingo Molnar <mingo@kernel.org> wrote:
>
...
> >
> > So refactor the vmlinux shell scripts and build rules so that
> > architectures that rely on --emit-relocs to construct vmlinux with
> > static relocations preserved will get a separate vmlinux.unstripped file
> > carrying those relocations. This removes the need for an imperative
> > postlink step, given that any rules that depend on the unstripped
> > vmlinux can now simply depend on vmlinux.unstripped, rather than inject
> > a build step into Makefile.postlink
>
> Nice! Does this also result in any measurable speedup of the build, or
> are the steps still similar?
>

The steps are essentially the same, only described in a slightly
better way (and with an additional artifact so the used disk space
goes up slightly too)

