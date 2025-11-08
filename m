Return-Path: <linux-kbuild+bounces-9458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FCC429F1
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 10:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B85A41883CBF
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 09:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5680D25524C;
	Sat,  8 Nov 2025 09:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOuRN77A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74601D61B7
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762592793; cv=none; b=jQdxO/qVuPt/jgCMgx1976Rl5ub9+82rnP1mDn2PBlS1BiP9xUJxpV5kvuxWlAhvF6MAmkNvda05wvRJN2S22Ndn4LoHOKW2MbYIjcS49T9cD4SCML4NOgNt6UCXFRLyGh7iVGOK6Pzn15dQnCgmKi/SsYXH8a3e8GwAhii3A9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762592793; c=relaxed/simple;
	bh=5e8JsJPkRnjnvxJLk5/07pwvaKu5ka9GvEOU3uc20xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzhy6PeIImi2P0wP4ybIHhRf9WPMw4gLPhzuu+0kzhD51dgZyEwlz5o3bTTkzU5IXcVdwX/8MVAAKKJVGtLES6AGP+qqNz7FLIeBSvyqDOnFh8a9cU5i3rX8UnIFO1e+TZhx6i9D4TEeOa7IimsywJd4E1nKVp7LmWHnuUb3HM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOuRN77A; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-4330e3080bfso5235705ab.2
        for <linux-kbuild@vger.kernel.org>; Sat, 08 Nov 2025 01:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762592791; x=1763197591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5e8JsJPkRnjnvxJLk5/07pwvaKu5ka9GvEOU3uc20xI=;
        b=MOuRN77ALP3vkpIGiEI8BYOkA8e116P3xzbmphGYAclPMscZkAAs8bml2zETj+yQWA
         +qZs6CEStvuRQWZWFdin13ve4jUoGN4jqILmtqyZN9sH6+BcdlFAefwoQCCDoIRM20II
         EXVAYEH6lg3RWAxA0Ip4F6O2RtgJFz2OzZqnH4as7QrM7aTFYI5y29nFzECWj6W1Pzkf
         u41qXXVZe318kqhMOKZGs4DVZOUEbdmcP2wHUEwFQ643ura5F26L5jwmeEC5Mz7ZP9Ps
         BO6fMpVTCDqIEOqpDDr+ROB3TQHE7dj2A0Gd1igsjsqEgWr+U3IYJuxc4gqzd+iAxJgd
         VqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762592791; x=1763197591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e8JsJPkRnjnvxJLk5/07pwvaKu5ka9GvEOU3uc20xI=;
        b=KU+AV4YcVADho9WSzXIu5OuHN+Ima6Rr1oC+ADc5XypO1/j/hUZB9nkpqX6DSrkCOT
         y3IqX4kyYdazzv797iDckkWmT3ea/bNXjziYtyX+KrO2UiYVAfUEjQI2WYoFhv8/31ai
         03Qq8nzDyPJigsbRk3zqkVQ9z8/A1WGBsXORl7OSjLolDIso4axQKC2hB7UscczXhYop
         PSwhgJ5Dva1fL6QtgVsS62sGC8Fg+aqg4VOKd2HriT1IQPvMkTOqJuHLtVu+qnQyWE6X
         yp9vb80XfPCCMubzEs58dP/1MIs10x7U0KCsTaHJD7kHTVvGvtHxQn2pG5nwalsV9IfI
         ycvA==
X-Forwarded-Encrypted: i=1; AJvYcCXGr6fY3uVqaQX2ECUNqtjOfB2hXqH3fn+Bc9UjoBPIl1DaTRQR+XPYAjY15QCxiX8jm1PHBKlYmNfmcyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTHFKsHn1Pts20lRVAS/PxzWVK4L0Wz3TYzevqLkmSTwM9KCb
	qkzzVFCIVWqnB8syVDGwKiwqdqjM+KgnsILh8I+TKcDbozMruVd4iObAf7AhbK5MEQeBYEdRW2O
	TTY3lFLw3fljtgUhg1WJy6IvGxS4vH78=
X-Gm-Gg: ASbGncuJ83BhMUkIjaP9HjSQQOFRUA8KjSherDi6lv9D8VYKDDk6u/pVFqMsWPOqeNs
	WX8bj9YXNS6uIEWoP97+2oSjNQvBpEDFBnQPoO1MyYkhYRjn+HdBAO/N0spf+1a2GcLleCjUpSO
	83Zdc8LNq5wYTVDJTVeO2bSiYOQFuRueQU61Knv2qM3e/OryoJmMeTh8ly8EBSr/Z0X3i9Qj3w/
	Q7bAo7Z/6P9NfXKy9loRHYc+ePMldAUVqbD4lncfbxFGGtLGq7vwmsE/YWuPHAue4JZp1Ujtjdr
	lZvW3B6BocI7JytSNQPEO4JWwWYv
X-Google-Smtp-Source: AGHT+IGja1wjt5XLwCuQKBiJ++JM60DADavzjqt2nrtNRbHFr8AZSVSL3xnG8tTvwMdnenutWkIfTjAH31OO4EHeBxw=
X-Received: by 2002:a05:6e02:2383:b0:433:3664:b19b with SMTP id
 e9e14a558f8ab-43367e46460mr32976015ab.15.1762592790848; Sat, 08 Nov 2025
 01:06:30 -0800 (PST)
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
 <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com> <CAB95QAS__YYYBLc3KFjBUg_QqC3AOB0y6kvhSqZFR9fx7BDKvg@mail.gmail.com>
In-Reply-To: <CAB95QAS__YYYBLc3KFjBUg_QqC3AOB0y6kvhSqZFR9fx7BDKvg@mail.gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 8 Nov 2025 10:06:20 +0100
X-Gm-Features: AWmQ_bkRNHFJNtYSzgQ7yhp3JFrMg-7yCHs86SlmqgR8aqtR-dYbtIubCKtnEXw
Message-ID: <CAB95QAQyzYTrnGrkrcwXJ7Za37v7VsvwsmUezb1Z4VsF_RdLMQ@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I've got no response from the rEFInd author yet, but another user
reported (https://bugzilla.kernel.org/show_bug.cgi?id=220731) a very
similar problem with GRUB and ZSTD compression.

Cheers,
Eugene

