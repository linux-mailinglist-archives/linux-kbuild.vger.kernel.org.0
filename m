Return-Path: <linux-kbuild+bounces-5434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3DA09983
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 19:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189E0188D3F4
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A98213E8C;
	Fri, 10 Jan 2025 18:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NmHd2g7Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060A1487CD
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736533996; cv=none; b=NTXZZ809xBkb1kjoQ54drGnrx5u9jCruXn5K4uQHG17X/T5fkySPr78ROFTnOgQXPB5/3okmQaGnXQA49M+qg0BbmNKNusrMvHkeolBr6rF93gYjUGHblnlG1WbjazDDhu8tYDSRh08fxmpVh/LksZDz2CJeQYlxiqQnBCaISLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736533996; c=relaxed/simple;
	bh=Il81pbgAr7mWoe+tp2T+p6Hy+y2w5km0wZwJlJHjhmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjWAeQG5g6l1GRA0lT64NYkvj/LzGw4yLupDsy5rRhOTItKZmnKj6YUO4yJq837f6v9/m0Rg2d8iVv8Dk5WTf4sCGsMA8d4sHGBEx1auC4l3AdJmULlO0RWZr5bhxv6UrXrku2stLbJeoVQ9ws66poWysoaqnx3aZj6PPyQwIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NmHd2g7Z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso3243020a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 10:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736533993; x=1737138793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztn+xx6/hhaGVps14838so7FLIOxsLeLWEES5e/LNFA=;
        b=NmHd2g7Z2ssMjd+pB0+++S39VkPspr6Jar1uIBSn0hnx8wexvE3T7oKdm9Vbt1i0Cb
         9cM8KXhGb2xQMog1Q2C+0UNcmnTmUvI3XiNWid88WJTfiLZKGBY5Iv7Guyx9hzn+lEKJ
         77nKGHyMnGrwkcJg9zgk5Z1cB0Lj4yo2zuwIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736533993; x=1737138793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztn+xx6/hhaGVps14838so7FLIOxsLeLWEES5e/LNFA=;
        b=LZG2LSFtKAclhrdHkRMfn6XNLTLqYWJ9KgSStcik0bwk+cmm5MuRX9wUHATAn9fYRF
         MVw2HrwfVCvbS9uhYUBeZJDPMzIY4rzE2M8hlsDdYwV7Y8Tn7np4nxQilf5mlXXSJrOV
         Ai1pFgwmu+KaYTwfLp6CLnZRfPeXeOIl1TrQAZ4ApSMtiuydbmNG5rTDn/xQrKMnWpD3
         D2qmvrJJfv2pKSqEn7TPAM34sSffk7NEbyf1JCyGZ8EBH8YXLMtA432cSlqGe8lAVL2S
         CBmQEhBdNwQSJiAG/yI2TcDT6w1U/37WwtNAC0IbGh6YF4MWq4z5Mu7HSRrJfMpuGjWE
         VKzA==
X-Forwarded-Encrypted: i=1; AJvYcCXKEt7hPglmD5wMzhuRpgURNtmi44rcoTubXsEa2MyaWE4b466rZYOMq7zuQ69/OJyR30oE+6rZtheV7y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6bRxcX03CxpaC8JUt9Y4kw0Fz8V3PzK6KXottPTyoXcMTwhIB
	IOvsnR2lXjGt4BmNfVm36c2vnO0OO5XAdiwB3N9XJZIsHbvImkFVfPhXWbkfljxGQP29ujjd06m
	ueN0=
X-Gm-Gg: ASbGncuocFNpdJTiyKHq6NUIA8D4DGejWK1ztkktijOEmVX+XX31WrtS5TJ5MwY0djE
	mCbVlWOxzBtPV9F4bm8svSbAA17NEjfoV0pRJ9k+PFkztHusMPoX4R90xYOuAupmP3uarapA3v6
	Z4CvfhVFKoIOiLZ/KiXRcpzewUdMS5kTIDJhJaSICeec8tLEqXViPPTVgBq+Fmmyqt7bRUxIygC
	hQlqqa/n5CUBxhLAUKg00ZF51clSg5J+UhdGFkif96+Z9UNUHs62ZMImVLldbyLh/m71USwO4yJ
	aatZFwB2AZq0jp2amKJ3gEc9EVAqxps=
X-Google-Smtp-Source: AGHT+IFwbASIZ6gy1PykIZ1Xrx4QLYFDf5pqAQUcGwHpdQhle+pOT+Lw7tmWQxWaI9g2pfTxbu21OQ==
X-Received: by 2002:a05:6402:3493:b0:5d0:bcdd:ffa7 with SMTP id 4fb4d7f45d1cf-5d972dfbbe3mr11562922a12.3.1736533992705;
        Fri, 10 Jan 2025 10:33:12 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c29fsm1857624a12.9.2025.01.10.10.33.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 10:33:11 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so383175166b.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jan 2025 10:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXidl7unLrykH4WoKdtjwybtOBZfTlE6SRwVDntYBtlPtttM425udPGm+Q5wZhSfQjxQTknDF/GLWfb1hI=@vger.kernel.org
X-Received: by 2002:a17:907:7f90:b0:aaf:300b:d1f7 with SMTP id
 a640c23a62f3a-ab2ab709c82mr859127166b.13.1736533990540; Fri, 10 Jan 2025
 10:33:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
In-Reply-To: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jan 2025 10:32:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
X-Gm-Features: AbW1kvbigeb3lg5NVlMToaCtct6NB4aRMHwzUjQ-ItkeRzFo2HtXHrJ7EE1mr54
Message-ID: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 10:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I suppose this is a consequence of 8962b6b475bddc ("kbuild: print
> short log in addition to the whole command with V=1") which introduced
> an $(if ) where the else branch is simply ':' and so it always
> succeeds.

Hmm. Odd. I don't see why that part of the commit exists, and you're
right, that seems like a bad idea.

And removing that odd $(if..) and making it just do

   cmd = @set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1))

doesn't seem to have any obvious negative effects.

I'm probably missing some obvious reason why that $(if..) was added,
it's been that way for two years now.

           Linus

