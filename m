Return-Path: <linux-kbuild+bounces-10136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304FCC77DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 13:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50CBB3011ED5
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 12:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0574633CE92;
	Wed, 17 Dec 2025 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vJYXtseJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA033ADB0
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973256; cv=none; b=RfAJOloklQCAbrM2HJKKvFM+Wab+x+a2bMQ9jYLRE4lmDonCJwfEiposyBzFiTEqoYOHuEdKmEZRxh1uYE1QOKwspDMglWyX9C2PoYZFkAwuqpjoYvpNP2hT1Pebs3mgOL7xf0PeNLL6mTzNoBwYKo2DaXkjK+SgQxXtdDys0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973256; c=relaxed/simple;
	bh=/C6iDMsuWNWtsJtSWm9jX3BlZbp1MyNdoyA8DbURccA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjzTbKeXdUbpIkb5dDXDDfd00T8mtU4Gl7hwy5sLToA92uHS/FIfh2fp5pLwq8WunKhopFhe8g7EK6QyXGJTb17LigMGxcpFFqm4EK6n15BGON36YHeVLVIPuMCSTHcgTJoOPuph3CmK2lXPDFEg7tf4greSNmBwyzxo5npzMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vJYXtseJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b99da107cso55703891fa.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765973253; x=1766578053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrw8NMfVMXd0m/EneTwTC6u2QNSsWvAtixDYuRgOU1U=;
        b=vJYXtseJBwp1OttzqseFznMFKKjprok/yhsfA+eMCX2gtmEBYHNrBgj+BvkgBB93FF
         z3g1WHYdpqGpvRjqr+g+iyiuH9uoMV+m8nSNVa9BO8PuaU1eLbcrMp0IYoy1mIrVrrjE
         sQYP6Y1dusPlejCmk0x9ek750x2ZzhdP08/CnY4jHQeE89l4/NPluYBCfKx/LNDwbsOi
         QR9KvLnnUbHr11Eumo/KgDpHhYKPJP3jcWxVOOkeu5nGGIDpAxGiDv949XcdNMOdnh/o
         ov4XOv1X8FzodvTOH42gGOZNjtBIW/KpEfWWRrpGEWdvtXidEoEBcXAGCMwVkExmVG0n
         i+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973253; x=1766578053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrw8NMfVMXd0m/EneTwTC6u2QNSsWvAtixDYuRgOU1U=;
        b=xVm5fkXVeL+ofc6hLNVb9bpFVF9iDS1fXtGuaESz1zJk0gCofNHuqimN8pNF63rU9/
         7txicUCeoAM4tu+peVuzzOOujEWt8hQjmarfQxBu2Hz121fu7/LjhIrJkAcPwpq1clzu
         JDfwO17aaD2/VayEOq2Au35B82aCbrKl5y+qMBHwwCXHcLKEDsyLv4ufSC7qlNCXuFu9
         x3REx4KGUZ8kK2QTy/+mFeaDIYZBNDCroPX2AJU8PytEy9zjKHXbO9wVIPlyVCjUddL6
         a8EkK0EOrLwsTxicKsEuRFoANjloaLV8sQhPXLb5pwhF6aslmgm3zXV+Uyn86tIgKXuS
         Zn9A==
X-Forwarded-Encrypted: i=1; AJvYcCXNdoWyXFxu9ghAuTR6GGVvR+J/jJgXgYYCyFpNfAfpIjsNb4OUWoL4wPLrY89rA5MgsNr1hBqcECYOeeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Dxw/qK2G08l6Pkcyp5+xy606K8AjGpUzAtwnTTM9AU9ecO/8
	7lG20nZv4N3J44LObPWRvMi4YwQVa2bGl/uIHAaGG87BnXuqPfvXgDUw3aPJgN4KrHwkqqHOlGl
	FKWQ9TbEq/XKiQHHOFfDL4JNLI7QOqUE5iGB9zwaL
X-Gm-Gg: AY/fxX7vfV0xNVgjGrT4zDWDCt4eN2tYdPY1Rb6CExZf2j3IY7KUXl1H109B9alROom
	gjl4RncBjoFR8P5vUGTRhBojSiK2GU/yJxWi/SalV/dhT48NplHeZfbpIMT/v+J7rvAFf6EQik4
	7xsSwviE2yU2gCDjChEdoOalV5IzceeJuLekIQJ0J4iaXoyFNNqNPPbzdIysuKRcJQ92oVKLOcg
	Xcp0srkvSRZUmtyYl7Kb10054SvWDvcBehvknLnVGhpsaQHnD0fgo/nRGKJpeRw7x5+FtHzqZSu
	TFtY2iMDDwacYqMoItE77CFHcQ==
X-Google-Smtp-Source: AGHT+IHcyxmaEqxPNTJeFQ9rSqg0coCBpBqDqCydEpvzt4sHNnvAPo/qVF0Id6c4Dd3wZTP5wMeiZy1QcCDxZMQn9X0=
X-Received: by 2002:a2e:b8c4:0:b0:37f:b5c8:7cc0 with SMTP id
 38308e7fff4ca-37fd08c7ae4mr69014591fa.33.1765973252871; Wed, 17 Dec 2025
 04:07:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger> <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162> <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
 <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com> <20251217104517.GA3546346@ax162>
In-Reply-To: <20251217104517.GA3546346@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 13:07:21 +0100
X-Gm-Features: AQt7F2oK8riDkyvsDFvxguXHuYCyEQFEXq9uXi1ebq2AiLQokciAat8X6OdSJ2U
Message-ID: <CACT4Y+ZCvNu+-_FT=FMA6icB6x+2_E5-zo--PDnwR5X7tQ7O7w@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 11:45, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 11:16:37AM +0100, Dmitry Vyukov wrote:
> > Yikes! I am trying to workaround this, but this is PITA.
> > Entries are not in order, + there are now multiple entries for the
> > same source file (yes, files include themselves). This is plain
> > broken, and hard to workaround. Even if I find the entry that is
> > correct, I can't really tell about it to a clang tool since it accepts
> > just the source file name, and there are multiple entries for the same
> > file name.
> >
> > Does anybody see a reasonable way to undo what this commit is doing?
>
> Does
>
>   $ git revert 9362d34acf91a706c543d919ade3e651b9bd2d6f
>
> not work for you? It is a clean revert for me.

I am not typing commands in the console, I work on an automated system
that does not have a notion of "also do these custom changes to the
source tree at this particular point in the process".

> > Thinking about this: I think included source files should be treated
> > as include files by anything, rather than added to the database. They
> > _are_ include files, and systems should handle include files already.
>
> The commit message of 9362d34acf91 mentions that clangd does not work
> properly with the files that are included in kernel/sched/build_policy.c
> (such as kernel/sched/ext.c) because there are no entries for them in
> compile_commmands.json (so it does not know how to build them),

The same stands for e.g. include/linux/sched.h.
kernel/sched/ext.c is just not a source file, it is a header file effectively.

> which is
> what 9362d34acf91 was trying to fix. I don't use clangd or
> compile_commands.json, so I can't say if there is a way for the tool
> itself to fix this. Again, unless Pat can come up with some way to work
> around this (which I do not personally see at this point), I think we
> would be better off just reverting 9362d34acf91 outright and calling the
> situation of including .c files within other .c files broken for
> compile_commands.json and returning to the status quo from 6.18 and
> earlier.
>
> Cheers,
> Nathan

