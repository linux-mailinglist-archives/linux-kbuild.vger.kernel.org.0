Return-Path: <linux-kbuild+bounces-8676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B800B3E18B
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 13:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98091188E02A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CEA30C375;
	Mon,  1 Sep 2025 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aiSlf2eT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C62257848
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Sep 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756726188; cv=none; b=GB/8CPRtZUKgYznJvKNcd+/AldaWnblg8/1PbzwbD7UpXSYLrJH4p7zU5XUB85bevpNJZeRhTr1mPjabIDBf4FuE/2r0QkIgzpwkNuhY6xU8ypsWySHNRJKNfaKVdTnC7lrhKXPawMqXFRJhdD3KgtldFpxXs6tpBZztnQZ1ekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756726188; c=relaxed/simple;
	bh=hwu2Kbbf5ntjzdSbAs6MMa0FLXiSeyDsJHXXkCApxlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nK/yiD/HTaGf2K22RvvZSxFk9tYDTqB/qWJXg2h02ALlvg5JH18gCFTrV8akOTU2qZqnzPECdF5dZ0RQkLtYfDLoYaUsVhCQ8DVKSJB8/UUWHX+4z4ykaH/V/1jirTh5a1Gyg9c1DSfGSPLv5f6/tdik6p1qbYSh6zSzXlaG87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aiSlf2eT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b883aa405so11290395e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Sep 2025 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756726185; x=1757330985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lek17aB1MdxVzJYdNsx3fQ/dyCaMBNbVMi2QTvU5Diw=;
        b=aiSlf2eTEgYxLNQ3tWttvwPXhWiRd6GAD4c9viwUDXEXULthDcrC1sSChUiS23xa2X
         mImWt11/M/3hO1m97mW2jBEOVz7KSc7RZFg7UFtSZGLEY5SYbUbsv4yggT2fMhQBj5U0
         NbifMKc0sfNDp2D8J3des2mrpMDAnCgviHAwJqcms0CRT5mdIWstUWnXE+cT5Xkx0VO6
         odo6hjBgXiht4wVIUanz+6YBQg/qKAe3sQfEMo97yluhGqrljJM7vShdJMM2MnPMTbqh
         Fvw1fLhMdMmtFZpFn3pqbBcFrlGsEXVwZb+uvcLkGRN62xfzPr9S6G53G6DfR8mP00lS
         x5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726185; x=1757330985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lek17aB1MdxVzJYdNsx3fQ/dyCaMBNbVMi2QTvU5Diw=;
        b=vMbj6VfQcsFVZnSFgty4eSzeRH5eaPZutAXw05MTlaAQttYhQ34guMX2djtH1Oy2un
         1rkZ0vOxj832HJ06R/e3rTl8+CUd09BQmDnyy4/B0AESUgtLIzlDv5IMuBUX4gX+1+Vs
         XUrJ0SMIjcTQ+SUsxNXjZg2VOo2ThO+jZQoc6oSBYJAyNeIG0HSYtlYtjcutySE0ws6Y
         bzNvrVS7lzLx5S1lBjdzw1w805Lo1BM5a+Fa0TgCLjzvcaONs3PJDjDY8QqTM6osSf0W
         2YK+IisOGG0y7NnA7yYpWFv4WwUcmy8ZTxxQLaWZqRJ5oRte3VZFSBqaxxL/VAfAxz9S
         /KFg==
X-Forwarded-Encrypted: i=1; AJvYcCX090svM/JThA51X6NYxxFRVRSnziCr/bWu6hwLUQonh6ILpLgCg3kzQFVzsAQWrHvDwSuZL54IPRm+Lp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcFW5UgEGeeeORaysua3wXoDYQBu3mtvrCePjT8BtkCF61KEb
	44mZ3L2WIPlJJjq40mPs/NUUWgIBnULbY42KCAXA1eNw3Pv9ByVy9Jdd7GatsHVGzEwQ09SRzYH
	LwnlmMoY7BV1RvA==
X-Google-Smtp-Source: AGHT+IF4u4k+AvvaTYncGek0o5I+2pA6zNg1judsWL0THNmQ7yIx18EN0m9On1TLUujNdBUHvq3Ytm4oIUWuoA==
X-Received: from wmbes21.prod.google.com ([2002:a05:600c:8115:b0:458:bb2b:d73e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b85533712mr68266195e9.10.1756726184881;
 Mon, 01 Sep 2025 04:29:44 -0700 (PDT)
Date: Mon, 01 Sep 2025 11:29:44 +0000
In-Reply-To: <aLNQFmgS2IcDbPmd@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250827-master-v1-1-19f9f367219c@google.com> <20250829233824.GB1983886@ax162>
 <aLNQFmgS2IcDbPmd@levanger>
X-Mailer: aerc 0.20.1
Message-ID: <DCHFGJXCAPAZ.3JG065Y5DZVLZ@google.com>
Subject: Re: [PATCH] .gitignore: ignore temporary files from 'bear'
From: Brendan Jackman <jackmanb@google.com>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	<linux-kernel@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, 
	<llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat Aug 30, 2025 at 7:25 PM UTC, Nicolas Schier wrote:
> On Fri, Aug 29, 2025 at 04:38:24PM -0700, Nathan Chancellor wrote:
>> Hi Brendan,
>> 
>> On Wed, Aug 27, 2025 at 08:59:43AM +0000, Brendan Jackman wrote:
>> > Bear [0] is a tool for generating compile_commands.json. For Kbuild,
>> > Bear is not useful, since Kbuild already generates the necessary info
>> > and that can be converted to compile_commands.json by
>> > gen_compile_commads.py.
>> > 
>> > However, for code in tools/, it's handy. For example, this command
>> > updates compile_commands.json so that clangd code navigation will also
>> > work for the VMA unit tests:
>> > 
>> > 	bear --append -- make -C tools/testing/vma -j
>> > 
>> > Bear generates some temporary files. These are usually deleted again
>> > but having them show up ephemerally confuses tools that trigger
>> > recompilation on source code changes. Ignore them in Git so that these
>> > tools can tell they aren't source code.
>> > 
>> > [0]: https://github.com/rizsotto/Bear
>> > 
>> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
>> 
>> We can likely take this via the Kbuild tree. I do wonder if this would
>> be better in a tools/.gitignore file since bear is really only of use
>> there but I am not sure it matters much.
>
> yeah, please consider using tools/.gitignore.  

I don't believe that works here, because AFAIK clangd assumes a single
compile_commands.json, so while we could git-ignore
tools/compile_commands.json that wouldn't really serve the usecase I
have here with 'bear --append'.

> Please have a look at
> this thread about ignoring files from "external" tools:
>
> https://lore.kernel.org/lkml/CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com/

Hm, I would read the spirit of that thread as not being about things
from 'external tools', rather Linus' objection seems to be that the
_lifetime_ of the mbox files is unrelated to the kernel build. Well, to
be honest the only coherent principle I can get from it is "don't break
Linus' workflow". Which... yeah, is still a pretty valid concern.

> If using tools/.gitignore is not possible, I think the best way for
> ignoring files that are not natively related to kernel build tools is to 
> update the local ~/.config/git/ignore, as suggested in
>
> https://lore.kernel.org/lkml/CAK7LNAQas0cK7pgi72tYC3yU=ZkQxnr41YYW1mXd-sWiHtG+UA@mail.gmail.com/

Given this alternative, and given the fact that I'm ignoring a very
generic suffix in *.tmp (if it was just *.events.json I'd say the
practical risk has gotta be close to nil), I think we could just drop
this unless anyone else pops up with evidence that 'bear' is important
to lots of people or something.

Cheers,
Brendan

