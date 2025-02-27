Return-Path: <linux-kbuild+bounces-5931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BECAAA48368
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 16:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034E51895EAA
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839426B974;
	Thu, 27 Feb 2025 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD99Z1eP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB726A1B1
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2025 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670999; cv=none; b=ODIRePXNaSR4jLj69stT46RTBBSERnDNwFDzflsXGxZwxlS/s1yOgi2ln5CoKoakYZBWOaCdMPwvcjAGhadYbhz22JZJoU+yrm5wTnrOGoreLwu3BwWALuetvfpz2gTxsZB70hKiKE5mhgw1AUz8mvziyFgtXiROZO9J7mOLbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670999; c=relaxed/simple;
	bh=cQz0fQ6tJw2LG2hKDbQxMSqYlQ17S76w+Il/A2088qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgZQhqs9ZTbDeAm7+ybPTBHMRLbn3XweS2uRf+ybkveh+nA5AkCW2K0ikIDhP+k/pJzHTHtXhrfj72IG1Nyp3D3khemp8qWLqRn0b5uCQ5mk0C7JxL1rQqNLSPlV2ayicvW5rsUK3Sj2kKo34wQJFVb3yIEnoMOs+jLDf7ZPRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD99Z1eP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22333fdc85aso2450805ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2025 07:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740670996; x=1741275796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+qB48w1qXctW3jgNvgQk4QJMkMVJnPs84F9QAaO4Qc=;
        b=aD99Z1ePt8eSVWA7EUL9MKIklnBd++LuKE2ON7w9vxXTsFZxuQ3T7Ql+Uja6YSxGS1
         BZTLQsAN2fi/kFZr3X/NVHjmiHpDaAV0P7L0mzug7IKbyNjWUiMVvAyCe4yQiNDIDtdQ
         0Gg+eTrWatVWIowTr7UK9hIwuTeondqkZcrTxnv9U0aUjKSyW06o18Bx5GoNRvIuO2Jf
         wIfFDMLxBLxfKsV3WMw2yqAr9gZizYm+tp+3oo9yrL9RmnYuy4AGyz4GXg0oRpMp7tkb
         OqSJRsYJvRwUbU4Z7dBCybfC+lNWTSJ34u9AYAN6l+OomjYWyxxvQNe0lAPtOPop3kVD
         s80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670996; x=1741275796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+qB48w1qXctW3jgNvgQk4QJMkMVJnPs84F9QAaO4Qc=;
        b=JtS0txGAGWkrF8Qg8fYeGBL9HcD9VZv7jwOKcgNQsW5tlTgookEOnV6bD+1UdDC236
         HILsvyPOmeg+2D3Zvfiixo9sQdzbRd9kG39okEYfx2jbk+DLfhp6Q2xst8V0K6IePiBI
         i+jkHtJe1nzAopcfdMl16W+F/AxAGZ+rJey8eCIT2dEjMT7uip1w+FEJE8PnVcaYtwbq
         3TH0KnRjkn6+TuoKJ22JSo0BcPPgcqTwQgXsTT+NmJjatxA4GnmK/yeDni51J3IkluRA
         m+Mt7GQs7iAzPxaefr0+wJ/agrhobpvU+ToX3CksenJLKKd3YsINaS6rFC+0kdH5kA5G
         CUyg==
X-Gm-Message-State: AOJu0YwIOYqWPT76QMaW9LHrgDmynFy577tlIWvtDnYTbpN5bWcy7+PR
	gIeDWZ3AEaOZ3EGTwzQn4Wtiyxy0KF7Hmufv5fAXrBS3UUXxQOgBPvH0g070fjs/ZwzvEarC9sF
	q/2hcf44wIudg4psJZ0sWdFWCZc2FvLKkC/Q=
X-Gm-Gg: ASbGncsfzMhk+cmNLsBssdfLqfhRoSjROsVaKM4zWGQhoHz4GwzBSUO3clYC9EYz1Lm
	0w01DrnJVhfPHj4h++u7mJaYmXXjPzr5Kwk7+aQxMZxcaVKIhlx7J/5vCRz74k+GwNQP0TGULbz
	d/1TzytMg=
X-Google-Smtp-Source: AGHT+IG8m8rm4qooIquSA+kUnZWTUCaELdfDqIU9fW7zfrCQttQQzH9emBmrRDJ9Hi4fbS7ZSlYQiJ056bQXLSO4tEc=
X-Received: by 2002:a17:902:dac5:b0:20c:da9a:d5b9 with SMTP id
 d9443c01a7336-2219ff56a1bmr161805565ad.5.1740670996444; Thu, 27 Feb 2025
 07:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227122320.153393-1-satoru.takeuchi@gmail.com>
In-Reply-To: <20250227122320.153393-1-satoru.takeuchi@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Feb 2025 16:43:02 +0100
X-Gm-Features: AQ5f1Jp4L4nMk-dS-balm4nqyxYt2FPiBqsbKpsDGRHqgG6EoeIjRJQJlkx3HhU
Message-ID: <CANiq72kWQXr-pcFMyu19-1VKuNHvma_AS8G1MLvK7Nz6Xc7QVQ@mail.gmail.com>
Subject: Re: [PATCH] docs: Kconfig: fix defconfig description
To: Satoru Takeuchi <satoru.takeuchi@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:26=E2=80=AFPM Satoru Takeuchi
<satoru.takeuchi@gmail.com> wrote:
>
> The commit 2a86f6612164 remved arch/$ARCH/defconfig.

Nit: typo "removed".

In general, commit references should use the commit ...... ("......")
formatting, e.g.

    2a86f6612164 ("kbuild: use KBUILD_DEFCONFIG as the fallback for
DEFCONFIG_LIST")

In addition, if it is a fix for a previous commit, this typically
would be a "Fixes:" tag:

    Fixes: 2a86f6612164 ("kbuild: use KBUILD_DEFCONFIG as the fallback
for DEFCONFIG_LIST")

Details about these two notes can be found in:

    https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges

Thanks for the patch!

Cheers,
Miguel

