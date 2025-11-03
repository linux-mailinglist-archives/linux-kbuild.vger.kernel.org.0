Return-Path: <linux-kbuild+bounces-9389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21CC2E265
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 22:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DAD3BA1BF
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 21:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F89A2D0606;
	Mon,  3 Nov 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9S/miqC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC72D0283
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762205308; cv=none; b=rB1Ol2lrs/QtkNpGvxSH8dHbH4mdNE5q9BLlyJ1nWxW1eoSn1fCbAha+CqNaV/QXh9er8fMBsFYat0iN7NbcEAFsGIlkAbaCE+QW2wPCw8gOm+Jd6SiYMlP1K1hMr/7mzUlr+kAXkCJ/vHM+7lsctlcWPGMBWV/WBiy1XRkOfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762205308; c=relaxed/simple;
	bh=x+s7NqOlBSD+6LTbIljgLw3kIbjrsuj6AUvEJihYyZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AszO4888zIsBsrrdTAic/m9XCAkHhnAxa1NrQw6PuCw6yCy/j4ifDrC4OwSlX4cmH3FGpZcyCC6lhjJNl+pLe8K6VOzvAGn13BwuKKqWNGmQSg88iVp5sFr6waid+YzWMAzY/uvt0Djg7zGF7D0j3U2PbJ3dFrFCyOSEOKClN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9S/miqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B15C116D0
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762205308;
	bh=x+s7NqOlBSD+6LTbIljgLw3kIbjrsuj6AUvEJihYyZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9S/miqCoNPGKCfZ6h3bOQqcb+8OePezM2HSGZNsLbss+c8dVmOyeOm6FzFUASERk
	 FDehykKsB7VEarc7agIeqpXHEXc4fZxSpP8g1B9qEwK2/ZSNKWn4rGSZzo39rLYbD/
	 y4f90aDvTqOY0HyNk236QpKQ1i0nGPntDowvvybn04qCGvk4LLuFvpkP1qhw1cKeIU
	 jSnRHkDYqeWQ/mh3HgRCH8r+zrKQ8mY88Hb6su/6kqls1hWnlCQOaJgMd4XwA3pgUV
	 VFSfgSxQTFOBi2sHnNN3JgIiWzeYDynyYBl4YyQMwPlcxzCAITmWKXZ1Y82XUjxzuT
	 HxhQCGDV2wQDQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-376466f1280so62030971fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 13:28:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsicnonDmb44CR/291+5fZr+7dMC4IDyS6k6sDD4LHg5sZWsECC8SFlqLySucX0L1PW3nmmIwsmzOGTRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZT9Qo90ijcFK9OB5ldtBJO20ivJf7WbRyzFnMvtxzYg+bJ+Bg
	2VlI/EhG88hwzDn7owYRCd5H6yws0VYcyZi0OLM0VZnfKc/JXRAluVZVaApQliGfmweMY1UbS8r
	+fcF2tljAZVJ8rogDKFWxhVod9jvorWA=
X-Google-Smtp-Source: AGHT+IGuHjVWYBSC48Khcwso6dkYnUdLSXLRJ93ObNH4eJ3vQHOB+Qa+7Akzu96ic9RvATC37meErLjCvp099ZL0tME=
X-Received: by 2002:a2e:80d7:0:b0:37a:c4d:8215 with SMTP id
 38308e7fff4ca-37a18d90652mr36490291fa.12.1762205306381; Mon, 03 Nov 2025
 13:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162> <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162> <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162> <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
 <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com>
In-Reply-To: <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Nov 2025 22:28:15 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
X-Gm-Features: AWmQ_bm-n3HwXzivyVXoLYd2aGYOVqqJZ7Y22VzHLa8sytU1FCReOfKDMoQeLaU
Message-ID: <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 22:22, Eugene Shalygin <eugene.shalygin@gmail.com> wrote:
>
> Hi Ard and Nathan,
>
> On Mon, 3 Nov 2025 at 16:00, Ard Biesheuvel <ardb@kernel.org> wrote:
> > Eugene, can you try whether the image can be loaded by the EFI shell
> > directly? You may have to rename the file and give it a .efi
> > extension, but otherwise, you should be able to boot it using
>
> Did that with the kernel file and it loaded up until the non syncing
> VFS error, but I suppose that is enough to state that the firmware can
> boot the kernel image which rEFInd is unable to, and I should look for
> answers with rEFInd author?
>

Indeed. Not saying there isn't anything to fix on the kernel side, but
narrowing it down needs to be done on the side of the loader, it
seems.

