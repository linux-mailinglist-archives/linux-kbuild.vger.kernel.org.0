Return-Path: <linux-kbuild+bounces-9346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F9C27ACE
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 10:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4108E4E068B
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 09:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834842C028A;
	Sat,  1 Nov 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqewDYZh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697C24A047
	for <linux-kbuild@vger.kernel.org>; Sat,  1 Nov 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761989336; cv=none; b=nl002VLK16rz8DOMudCo6NHUDldKzKd+OsfiycPuiRO04hxaq6Y1KYvuiTOArWMLl5/6iQIzUMPtrJDYL3oAU8OgxOt6WXJsavnQN1leF1lBot7O3aKnq/ELIt/yENmmRmD6om8YwBvgZj16PwpKw2dSo/noD8ZIzp6+k/xfZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761989336; c=relaxed/simple;
	bh=XVW/5/gggZTWUpkWK6wUOBNnYp1qwGX654Z6WrBEvYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0JIgIIcqWyaidGOnIQD3svWWnEarzupQuB4J5kob4IdhF+WO6QtgmHCmTWoyhTBTayRVjTmpcyWASGsvfDp5FudS8jFHs0nkg8beyK5AY7GIwaerlvkb55yF849/PYeRaAcyBHmjCuk2HtAIxRKgiqh0mOl/F+fzJVV/qebgu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqewDYZh; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430b6a0eaeaso29789955ab.1
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Nov 2025 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761989334; x=1762594134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NmGetmPUb9VA8HYMaI3fVUAPUtPbcKl+pkTJw1ZTWWI=;
        b=TqewDYZhlZLDQDEQATchlMjWEsFHZ11JRl1xnDfpTz9Qs82uOsKNaw0aPmecDGwXQf
         vmUCApxeBOqFgcKPdyv18D+NEEKvH82Pc5xDmaB1wcFh7HM/+KD6CbUZqIxphzizmk3U
         goCbo5MXp+Uz2EW3upPq4ywnBR7v+R6l59DBcQBF18jY31jH5mzLxrF/qkuewiOMLbp2
         JdVDlc4Zxg6+y4/JTxvsgwb81C23S+nbuTo61IOsQhtQi9iNr1qXUU/GwOTxE0pHmdN4
         En8ylh4JTASLG1lszucpcsPq40BmStBOd93ubuMQgvqc6hZNMWO8MKtyElML9RxyOQgU
         w58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761989334; x=1762594134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmGetmPUb9VA8HYMaI3fVUAPUtPbcKl+pkTJw1ZTWWI=;
        b=AL2EBsJJ7moj7P2vT0kliv8GlFvwhHNRZe4pKM/qsLD/b6MdjWCs73Dk2yvaTkHdyX
         xvzv0WpRbXvQYdXj3P87GJgIoRslbslTfJjT4M4gGqwK9+whv/WcHcKS2iNFyxQR+ibV
         cn0WO8JcNHwW+DMEHsE+6KPI5CfOllVhwI6fR1NLdIwnDLcpEnjOnCBdfaBjwYCUFEjK
         udPBh7XxUOCppoO9VgWMEvVt5o6BFUwBxOqLnEM/Cwwf75u2G/hHQRQww1AzDkBnO10l
         lmP+OsCch3PPFltrhFw/yDOdFul7PFB0R13ZjMJJBuViovgbeiSPnTfuDkCMJWIgjnQ8
         kkGw==
X-Forwarded-Encrypted: i=1; AJvYcCXHYmuY3h0o0UiXnOz9sCZdDyLbRoYZDyGSYRwi1Ntf40YCfjebf8YnoHiFtw/wGd56QcTL3V6pXrOoEbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWvjc9OiZwm7gkWSvlkIjlnUzEWt1XhAmY+97cNHmpKPDaXD94
	RQBgiBXHOOUDts+LcTGpQ5MxiNENMF9a+24oNHYbIM3BDIpUvjU21Gccgbc8nZhbKv38YnALppt
	wVVWxARZOaA0TmKUuNuKhiAReQIFNBtc=
X-Gm-Gg: ASbGnctfjvGeoCkBB0ICGPnWXVLTCB8fGB0MTtLvtDdNWLzwtNGzi28VCtt+DGzBwQE
	rbUzJFlfIjVauCAjxh1iwcqIT1thQlgsXKceGs+nmMQfAhu6BR7+nRYwaLYfauTyI7Thofw7UFE
	gapd/qfrbmnmjIqTrnrOJM16GqNzfqWlVMuuQtxi8+kUrQNSBU3OESEV/BH2r5WVyE2SjoC9wbE
	eP7Cnexx6LTU677TQUk1vqYwOP8mpQ0o2Jl2kwThqEE/S8aH+GFL3YafNrHN4/jnizlC4kNBB2G
	ykHs6T04PK6nhays0G6CkhxC10Wv
X-Google-Smtp-Source: AGHT+IGzWoWs7bzpcoZ73HRHlX2Do8BiND8Y7jERfA95QnyRrw9tcAQNLJ2up8NwJSI9AcaaT1m5NeHxplvD/8RvJ3U=
X-Received: by 2002:a05:6e02:2485:b0:42e:7a5d:d7d6 with SMTP id
 e9e14a558f8ab-4330d122f9amr94908495ab.2.1761989333843; Sat, 01 Nov 2025
 02:28:53 -0700 (PDT)
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
 <20251031220732.GA2254630@ax162>
In-Reply-To: <20251031220732.GA2254630@ax162>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 1 Nov 2025 10:28:43 +0100
X-Gm-Features: AWmQ_bk3M0-Q4CZRFjEjAPuRZ8eL0rrEH2dcJIRWhP3CJcJlRJGn_U-BOuCK-xM
Message-ID: <CAB95QAS6q7T3C2hT1XPFm9-Smao0T=oidJWvRA20NJeSnSEfLg@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Fri, 31 Oct 2025 at 23:07, Nathan Chancellor <nathan@kernel.org> wrote:
> Unfortunately, nothing appears to be out of the ordinary there... Only
> .modinfo gets removed from the vmlinux.unstripped to vmlinux stage.

I've made one more experiment: kernel 6.17.5, built on a machine which
shows no problem, using the .config file  from the machine where it
does not boot, produces binaries that boot at the machine with the
problem. These two machines are nearly identical in terms of installed
software packages and their versions.

Now, can I conclude that it is the toolchain which is faulty on two
machines? And in which way?

Cheers,
Eugene

