Return-Path: <linux-kbuild+bounces-610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D383579C
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jan 2024 20:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFAC11C20A7C
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jan 2024 19:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD77D3839A;
	Sun, 21 Jan 2024 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NLCl1p14"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B807381D6
	for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2024 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705866905; cv=none; b=tHEhyU6ESQkNmc05US2s/2rs5tGel61Cxj/MJXCF2E8XoIWFcYlXcajLEcwun/V2rDZsuxagXwGrsmCYjUMDZ5DGPFUXK3eIwTZZOwKb3MelojjgrsHrgcFH883mp4Qdvk/jR/rZPXw4uKw5izIcgKObivLHzQqHR0bCUpgDgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705866905; c=relaxed/simple;
	bh=GQoIOMmGlZGhERzqT+E6aQH5Sj5SbWki1fytWD9sPGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVUYWi07TZ3L55NwVVzia8CBNO1u3oZsxS4qd6BhkRCpP7aRT8r7k248zC3/eQWQ3mPCIHSm31ZKZDhsEvvUYBz2bH2+rCPabe0d3FbdGAOjZVNa4kt8H+BOwPibV2lsENYqDWWGe7MAQYA1YnbYMBWcTj40iEfdkIC4Wi4ywiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NLCl1p14; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50f1c524010so1936987e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2024 11:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1705866902; x=1706471702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PhjJVX3QcOh8OZyy81TIER7JHK4cm7N4BYEGM0PaABA=;
        b=NLCl1p14Y4P3Lb7FdRy7fHEB/SgXPXxftFv1J90itxs0TRmi9fyxGOaC3/2fCc3Hzr
         YbuO62gEsI/8f6/PtZ8xpvZy7PD8coqcykc/qJJwqv0VDIk6McKuaySI2CnR3mkSfVd7
         ozaGSogZGn43MMaAqIgD22WCqSqbGXCFpHN/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705866902; x=1706471702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhjJVX3QcOh8OZyy81TIER7JHK4cm7N4BYEGM0PaABA=;
        b=jrebBW+TXZ5asp8EoMOIrb85LhcQSIENboyE7lRQpjAsr0uMp/lS8N4ki54bRtajH6
         TVfA2T/nMjKvvXukP+KQjpUJz2Kk9uvLFGLvA6LryRvBQyc3li8fzrs4zMP71w8xxEjX
         TeMBTrNR4Zt0M+32ZA8bF26AGVOQbjzMAM/gfFAaCgipNSzuKL3Ye/EkqZCLBRaOYpYt
         3wmlMIV8SU7nP1ITCeRJgyvbRghEzq1kRk3SEL2ROMo+1o0plyiT/Dh4+rtn4IIfihwV
         X5O6lsLjMXlf3VV3CmwDpf5GPqNQMOsTalchTqi8VxPhZ0B5MZ+CvWfIA0RepccnLzPW
         NGzw==
X-Gm-Message-State: AOJu0Yzkk9t3BkYnrJfRSOQfQo0DWPal59+hlz9amixEuQy93PB5jVn6
	tqIkLw50Benp26ir+PFHcLDm00d9u3yaoKKNc/o9P5GXwhQbYjNZTlzdJHb8G/JETPVXcFGxvvG
	c0x+QGg==
X-Google-Smtp-Source: AGHT+IF6iLjeqCUOkdGVjZo8aAoHTEwZbdIXvpRcsDbl4aD5vaCioMTV0iMHVR0KYv4pYWBCL6O5fg==
X-Received: by 2002:ac2:4e0a:0:b0:50f:f989:2c42 with SMTP id e10-20020ac24e0a000000b0050ff9892c42mr116678lfr.176.1705866901720;
        Sun, 21 Jan 2024 11:55:01 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id z27-20020a195e5b000000b0050eccd5beafsm1777547lfi.125.2024.01.21.11.55.01
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 11:55:01 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso26547401fa.1
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2024 11:55:01 -0800 (PST)
X-Received: by 2002:a2e:bc09:0:b0:2cd:a774:2714 with SMTP id
 b9-20020a2ebc09000000b002cda7742714mr655928ljf.152.1705866900796; Sun, 21 Jan
 2024 11:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Jan 2024 11:54:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgUmXuxtbThqBNREhihRJxrDjuOZRUe8DiwJgPOc7d4zw@mail.gmail.com>
Message-ID: <CAHk-=wgUmXuxtbThqBNREhihRJxrDjuOZRUe8DiwJgPOc7d4zw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[ Going through my "this is still pending" list ]

On Wed, 10 Jan 2024 at 02:24, Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> I don't know what the minimum requirement is for SHA3 to work, so I have
> chosen a minimum of version 29 for the purposes of this patch.

I see that there is some noise about hopefully just getting depmod fixed.

But if we take this approach and just say "don't allow SHA3 signing
with a broken depmod", I'd personally be happier with something that
isn't version-dependent, but is bug-dependent.

IOW, instead of doing "depmod --version" and parsing that,
particularly since apparently the exact version isn't clear, would it
be possible to just actually test for the bug itself?

Or, honestly, maybe just extend the depmod wrapper script to write our
a more descriptive error report. We already have that whole

        echo "Warning: 'make modules_install' requires $DEPMOD. Please
install it." >&2

thing, so we already have run-time error handling (although I note
that it does "exit 0" instead of something saner) rather than some
Kconfig-time case.

                Linus

