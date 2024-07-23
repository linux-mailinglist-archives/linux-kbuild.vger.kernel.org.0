Return-Path: <linux-kbuild+bounces-2635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E693A8D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 23:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8798B21F70
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 21:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BE21459FC;
	Tue, 23 Jul 2024 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F2WGeDs/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281413DDBA
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jul 2024 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721771367; cv=none; b=KQwQi1i8jfis53WqSMHOzBXRB0JLDUJArQRZ8dcaDO5qctNqE6r75/m6LPQHCwQmajirJdGQ6eKb8Ki5vmiW0jV3B1IAf+PG0nc1QrJ0P8RqAfE3/X4Pbpa2iSONWrDTjdHFWtbmSxTSjtg8GMO5N+MtuPL1Mw13Htx1VSYyb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721771367; c=relaxed/simple;
	bh=tuer9m0mKhQDkVcfZ8kLcPt66+D93aJTgEJaTNWyVuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXjzjnTXa+YkWWN3efxDKFG/R7OeYjv6HIQr3vJsvofAfhnt98Yz+y20TSNr8wOxkwHOrHU/uYEGL6bvbqSLFiEJi21i5SHq4wwiwcbXqgX5iNUhoeYN8n0ENTYM64I8kw3waJmUA28OFZtcUjKntT77LtnyMvZy21SxSG46jGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F2WGeDs/; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eee083c044so67523471fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jul 2024 14:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721771363; x=1722376163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bjAE1c0pKk54yZBK3el2XKNqcN4ZjHoabxTHGF/u9Pk=;
        b=F2WGeDs//7crFtOYkm6rtPlFK+Ox1hSav2SxNq7eIjzMopCxRsqgVgNkQb41Zzi+Yw
         xgLxFy1Hzte2Y3gbrVW8ArbKPMI2j1YIO4SO9Fvs44eTq15pDgNVeF2VDK1eDTmVC3BG
         qVjYfAm61qWdjHNC5W9IJZGGTcTLLhrANye7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721771363; x=1722376163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjAE1c0pKk54yZBK3el2XKNqcN4ZjHoabxTHGF/u9Pk=;
        b=Dnyk9y30LmAAlON5WxVVAOa+VIjOiIbIv8hdZu1qnRd6+q3Dmn+PdDEmA1C7uBQvL6
         DqOXakful6RF2yMbqiZ0JFGxR/WtXko25+C8kTmo2amB+ZkE6k4icXUDki/Hu/vnSJV3
         Ib7bQCnOy/3Y5m7NkU0KO3DUii/84IJrGnuvuZBFmPIiU0h2hlhjyoZnFsPcIHHyhmoN
         RAL327UZ+LwSBZgxPZEtpuDplUOQomitJbkD4XBeV/cmUP4eBNst2TORv8kL0QGXu60W
         HUKWY4tOnJ4wkgU4y4qo0VCVFo3ws7AGMRLAPWGPS4khsbWxAvshrFWl3z+6JBVhrBQ9
         i/NA==
X-Gm-Message-State: AOJu0YwWumbmGkquXxEVm4aqZamrQVTnV+nt1ZR3e93afm0M1Cs9U+97
	6C17jjXMqBFlUokXxtW0V08TlfleEaIH5IAIx0F0NZM05Yi2aKxLUx8GyMAI8iCUXBKv1exf+HI
	yJ0QYMg==
X-Google-Smtp-Source: AGHT+IEtu4Z34yxl8JayzDNubq4dj157G+mbLmNAchZ3AhNheGWfU2lOvwE9scBEa+qjHRfZOZLIdg==
X-Received: by 2002:a2e:9015:0:b0:2ef:1c0f:d490 with SMTP id 38308e7fff4ca-2ef1c0fd4f7mr68781641fa.39.1721771363334;
        Tue, 23 Jul 2024 14:49:23 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a7f5349cc5sm3424585a12.13.2024.07.23.14.49.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 14:49:22 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so4940624a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jul 2024 14:49:22 -0700 (PDT)
X-Received: by 2002:a50:c050:0:b0:57c:9d54:67db with SMTP id
 4fb4d7f45d1cf-5a3eee849b2mr8538235a12.9.1721771362225; Tue, 23 Jul 2024
 14:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
In-Reply-To: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jul 2024 14:49:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com>
Message-ID: <CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.11-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 12:44, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> You will get a merge conflict in scripts/Makefile.lib

So the merge conflict certainly wasn't too bad, but I really don't
love the complex  fdtoverlay command duplication.

Strangely enough, there's a simplification for the DT_CHECK_CMD case
(used only once), but not for this creation case (now duplicate).

I didn't do it as part of the merge, but may I suggest adding something like

  DT_CREATE_CMD = $(objtree)/scripts/dtc/fdtoverlay -i $(filter %.dtb
%.dtbo, $^) -o

and then using

   $(DT_CREATE_CMD) $@

to pair up with the existing "$(DT_CHECK_CMD) $@" logic?

Or something along those lines?

(And no, I didn't check whether maybe the argument order for the
'fdtoverlay' script might matter, or something like that - I don't
think it does, but I did *not* test the above suggestion or really try
to think about it deeply, just mostly a reaction against the command
duplication particularly when there is now a comment about the
subtlety of the arguments)

             Linus

