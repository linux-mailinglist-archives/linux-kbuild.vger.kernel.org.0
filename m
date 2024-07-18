Return-Path: <linux-kbuild+bounces-2592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F13935109
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 19:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A07E1F2146A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 17:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2624A143C46;
	Thu, 18 Jul 2024 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OtcYOsD7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153C12FB13
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2024 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721322238; cv=none; b=ML13rWHw5qgBCUoAaW5Rzd7eErcDIXFziPP4TTKjTcnkvPvqoDkSIM71cN2dao7jwT8/2PpgdIfK9uZh/aBH8iI33R2hty1l9dAKy74KijdMPCP89HPnI1SiyENeS4Xbl0nE5uA/4sJ+jTgbOhlMK2VZge4o4pCQWUcx397lCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721322238; c=relaxed/simple;
	bh=eMxvtXjmBofXpgHzdVBZoD12gU0IqrUEaQAh4h0MU28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlNlsjNhGBbAt/GTN3jeEkX8dfwwOlhM/e9FfUfEqVU89ioMDpp66riL20fn62pz/oMPzR7OZjrd22q1ajXn6NIEw7CrjdJM3+1h6wkIJwV2WUpwHYHxHmoXgDndgk+YZ6aKPpv/Bl6Ib7vVVeMuoAH5khfCFMjF+MF2YaR7rf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OtcYOsD7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso120502566b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2024 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721322234; x=1721927034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mSur0PwJ6RbW9RkHokWDBMKMWW1APUjGaX6bxJxcylw=;
        b=OtcYOsD7YhRjsbmOxCPXznNTVfJeQ+lqoGS4KDMDYzyZG1nvRkvNJyP+K9m8KWqdWZ
         UkbQhAFBqb3LLRzS815OM5yukhGs529hpB/UrvrV7c4FACK7yTRAef81XBHlQgai3/84
         2quqLZtK0PekBQsd4QbLONMa+GlQj9K7AW1cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721322234; x=1721927034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSur0PwJ6RbW9RkHokWDBMKMWW1APUjGaX6bxJxcylw=;
        b=ZpoYQ1hXwzfuF0A4opkVLFL68cO8PRS644fN6Eg56GYPyhU8wtcnS2kn47PSy+6K2V
         XO8AQIayFqT33WtCW7pCJnXWI+9qJsgSMpljNh/8bX3muCNWlsQinb20HEwQyeZjKGam
         GnL2ly7+R68gouHAgKxT2cVY85CyXNhdysDmerT9mcBeNNYGyL1sSVIPHzQBterhHUBB
         MVTx6TwpfG4FZemiIN6PjKFLWN4taymFNK30lDRyxYtxy4fuO9tix0PoqXAahgtxW1On
         LNmClHQq0+ZGTEtfkE2ETJZinV900s28c9pQU1Z0PUxZ0zF2DPBqvwDz41IoZ0bjJurm
         LTww==
X-Forwarded-Encrypted: i=1; AJvYcCUzjNB28PvSSTPczi2fvt3E9UkzV7+N6MAym6FFy8r/Cl7XgS3r3U0EDbDftnKXUv+kD1bZhAKlgpfjE+IdARHjk35iFfyjKpJEEDqg
X-Gm-Message-State: AOJu0YxO1Wr81PvvtLSQIBKL6uwCjWtYiqrrVpL91rf5b06jhfNSgz8v
	Hz9GmbYYN8JUafXUamc+2TIqFhGM1dsCSukxkGCdcYo54YH6wnsRncW8WKfRJXrxFc8o8jx1DLn
	YIE3LMQ==
X-Google-Smtp-Source: AGHT+IGnSmR+tZ/9pIP1Mw2iGwfpvW39SuuEsRYEyKkHVoKIdRVkBj+i1CA9+dQdLMFrDhDTRFmwpA==
X-Received: by 2002:a17:906:254e:b0:a75:2387:7801 with SMTP id a640c23a62f3a-a7a01341908mr357218366b.61.1721322234616;
        Thu, 18 Jul 2024 10:03:54 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff707sm587656366b.146.2024.07.18.10.03.53
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 10:03:53 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so56151a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2024 10:03:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpGSQrnwfKac2jJZ60sWYr7i/gBQRZf7akvnbDnX341sXg2k20EHK5syYFO7aFe9THmYCtRUHgXiThqJyC9Nh+wNbp9U/3wBAUtbVP
X-Received: by 2002:a05:6402:35c8:b0:57d:2c9:6494 with SMTP id
 4fb4d7f45d1cf-5a05b9da300mr4830368a12.10.1721322233393; Thu, 18 Jul 2024
 10:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717162421.1402773-1-masahiroy@kernel.org>
In-Reply-To: <20240717162421.1402773-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Jul 2024 10:03:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipzh7eC2uSiVgDK4_1Gz250S_TNwTyc-9B+UNi9z+rKg@mail.gmail.com>
Message-ID: <CAHk-=wipzh7eC2uSiVgDK4_1Gz250S_TNwTyc-9B+UNi9z+rKg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix rebuild of generic syscall headers
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 09:24, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit fbb5c0606fa4 ("kbuild: add syscall table generation to
> scripts/Makefile.asm-headers") started to generate syscall headers
> for architectures using generic syscalls.
>
> However, these headers are always rebuilt using GNU Make 4.4.1 or newer.

Thanks, applied directly to make the rest of my merge window go more
smoothly when doing my arm64 build testing,

           Linus

