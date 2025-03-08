Return-Path: <linux-kbuild+bounces-6022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E7A57F65
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 23:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEC3F3A4C9B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 22:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FA11E5205;
	Sat,  8 Mar 2025 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcpoglwU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9181DE3AB;
	Sat,  8 Mar 2025 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741473772; cv=none; b=mdENVI8h7XOUE8ppdsPl8popmweDqJYF2V6lZwwk4FxKDxWwiYCJ4eSVislWTtzQlgcJvW7J+WUE9YRRajgv9rFOQA+wOrm9G15J/lNC0sohebYenw715vLFYiEeK1r24iFtbvGkTknhq8Akn6mrN8yZqbPm3dMOmB79uPzjtvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741473772; c=relaxed/simple;
	bh=K1kOokh8SNPeyFgCYbH+M2YEKW5UEDX4zuEHKMpNMRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QS9nFnMgcohU9UmTJGp8RGKBx1yfbKco2QtOVmXGJboBkb97yfbvjN1YZ1EI9LkjZ58dk5AfcQiIuNhcOzudjIraQhdZ3ymik+vifLc9soEBahJNgFEAyCrH23+H68YrG8tiqQQ+15nCJP3MJxlXzzPHdnEx7p6MygTb22on8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcpoglwU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95526C4CEE0;
	Sat,  8 Mar 2025 22:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741473771;
	bh=K1kOokh8SNPeyFgCYbH+M2YEKW5UEDX4zuEHKMpNMRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YcpoglwU5hoQiKYn58NQTyZ6mWeH1jUlwS3gJLkru7mka6JLQklQnUMlIzeXvQAGe
	 Ed5PU4hxZqmgmtFZHObQgd5H99QK3KuCsGaX7f0Av/h40z2K5CCi1Wx6WDKqnhTrZO
	 ml7CJynQsDcV05iOMrAtGS8R4cfmuoDLbDRTmQoCYP24QiuOsYyWwxc9yWIZmw+HGY
	 +I+DOZJrotql0TrRxmuvY6JszSirzqIIO5iyalQCTuJKA8pK0ohlHrxEwYqz3Hh1nJ
	 6yidGAxlgjNE4T76EZew1AlfpHXKswsEG0OOu38U/sEgeNBWWxqKgDiy2ki18P4aaZ
	 nV/mWLNgz9YGA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2988173e87.3;
        Sat, 08 Mar 2025 14:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzajl+aCMpJq76OEYzGXxJly5DI3/rl87STbkBDMd2Q2OohokcOZj0oYBJIOygz3AHakh2MuJ1eLQtuxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX2c27V0ZBqFMECBKnWZZCToPqfWPucphV8mGShNFC+d0mDbhJ
	C1PaN3asQWsaVYUWZ/RLJX6s76kbST1pemyS9Mukt1h3IjEkn8ppSRTIkl9XAz3fol/Vjz545xU
	4HM7nwncFZXNrFD8M+Sczby5pnGk=
X-Google-Smtp-Source: AGHT+IFTSndMozBb53xjzolq0wPJB84p+WHBr3kJnsQef2jLyDINFNKx891d0kc0upGsNQ5dhrocpMeX2pkwQRUgVWs=
X-Received: by 2002:a05:6512:12c3:b0:549:4df0:76 with SMTP id
 2adb3069b0e04-54990e2bfa4mr2708024e87.4.1741473769934; Sat, 08 Mar 2025
 14:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
 <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com> <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
In-Reply-To: <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 8 Mar 2025 23:42:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>
X-Gm-Features: AQ5f1JoGMoOCrYC2A_aKY5GIOyqLMRk-0npKPlhUEmMgbJg10Ael5xd7u_fZOpM
Message-ID: <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Mar 2025 at 17:17, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
...
> I do not think it is broken.
> As I mentioned above, I regard vmlinux.relocs as a byproduct
> of the atomic build rule of vmlinux. This works.
>

There is no make rule for vmlinux.relocs, and so

- if it gets deleted, it cannot be rebuilt and even though the build
does not break, the relocation data is missing from the compressed
image, and this could potentially break the kaslr startup code,
- it vmlinux.relocs is older than vmlinux for some reason, make will
not notice and silently reuse the outdated version,
- when creating vmlinux.relocs from vmlinux and an error occurs,
vmlinux is deleted, making it difficult to diagnose the problem.

I think this is badly broken, but if you think this is all working as
it should, I am not going to debate this further, and you can consider
the patch series withdrawn.

