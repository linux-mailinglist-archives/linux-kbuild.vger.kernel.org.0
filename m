Return-Path: <linux-kbuild+bounces-7455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF2AD565F
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 15:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0E1188E6F1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 13:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231E6283CB3;
	Wed, 11 Jun 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fiwihM3u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A628751C
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Jun 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646799; cv=none; b=PYr8uHtERxcgnhEb57H4qR+lnGzg31uux5jhfCDv4O1dmRX9Grv7eVrgOgWVgiAw2LYD0l3uUv8VBOjq24lw03AMz0KNV0uRpdvaWhccnrfzB4DcgCkoR99goQwAEVtGmtEZPNqxMDPpUnvwtk8UT8drEh1XlZUQUy5NRhNpj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646799; c=relaxed/simple;
	bh=v8Z/vKA0fxPPt/ujeHNmMfqYDx1WX1fjLOE4jps7+CI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uiWpOjhnUs+4WVtdcd5E9DZeEoEybynQBl+ONbhcg/SyUJgjIMrwHQci1qjjf8VCZr3ltsTV1XUIxzisMmEf0T6Xn9nBDzUfquq3q8xfbkcJn7q2Ok3X0x2GgimFVj7jrzhTsa2c9OJ5NThR4lxwW0wuwkTHpRvFlJUdO1qmj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fiwihM3u; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742c03c0272so8510220b3a.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jun 2025 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749646797; x=1750251597; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXazK2HF4my4XG6ZGbxQCBlCRkeomngapDYtTTmub8k=;
        b=fiwihM3uGTW67XYCxkIv9Q1b6BRCGkfNbz4pz+Eyzp9gAmDHiWYYmFW1sB210rYqS/
         zWkbbQYQ1xteNBKtA1yAw0wOKZUOwna4TMDmPBkHoWqIdnPhU302SyDA+RVtlPlqDdep
         0UrcqSRkSQZSOXamnvLW4LbtW/VHhKFyAdEC4VVG9aKlCrrZoICseSLALKUECbPOll0T
         yVSkow7gPUe/856ORcCZ10tZ26nhAGox3+uqImooMEN/+5nl1f0jV1Tsb7d2oaJqy7Br
         2/nlpAjnvwRv8NlseRc8/LufjoyDM1nnkYzjS1/JEe2RPgX+5w0xp3ndA9LW89QvqHto
         IcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646797; x=1750251597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXazK2HF4my4XG6ZGbxQCBlCRkeomngapDYtTTmub8k=;
        b=uVC14Ba6E4b4pbaG2jB9hD1xVNh9+vlaeuY08dTt44uoKl3SsSg/e9rXn8xiHPdnM1
         gdhiQBpuSIe9iYKo06ycBMmls2mPAPsF11dtvXs7+hTxX9dbhTCAg2hU6CvVXDjGpwuf
         y7SmIibSz92lRHQwS7GSiGILgmA9eBmwfOHDtfiJyu5vXWoV47YmmiQ29fW0pZXP03A9
         gBXnZ/j80ozg5alvSxWvady3TvtBFvY60u23b+E4V3QyvRleCYjjGhoNppQVYqlf/EFq
         CY2LotoL/RR+2JIMbz1uAQr8fFpIex4Gv02D6BZqZrwslfwTfSej7kbS9ubNTy47vIoN
         wkFw==
X-Forwarded-Encrypted: i=1; AJvYcCUKNk0+poNy1DPHyW3X089RcIKFU2H61XCn84k2z4ndfckriGe3OaPsrNjRJ7QB69J4d3bsQstBfwzWXq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXoH6NuWZ9LJlCN5B3DUbhGt7aW/YFq8UXsYf6E6V8wHvUFKA
	X60DNRZARG4ERRDD/1nLg5U4ZqNBpDj04r+uYGXosFAvnBR9Tubg7bUk8SVEWn99+vPnC74kipO
	3t8A1SA==
X-Google-Smtp-Source: AGHT+IGJGSZ0FZaEs1WgpfcXAg046+B/RRdBjPKeuzwanqEb7D0UocarpzZb1ktPvq8lAj6zdIrLL6sExms=
X-Received: from pfbna34.prod.google.com ([2002:a05:6a00:3e22:b0:741:8e1a:2d09])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6da3:b0:216:20de:52d9
 with SMTP id adf61e73a8af0-21f86645fd0mr4834462637.14.1749646797017; Wed, 11
 Jun 2025 05:59:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 05:59:54 -0700
In-Reply-To: <20250611075533.8102A57-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
Message-ID: <aEl9yiUdQLetv_T_@google.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
From: Sean Christopherson <seanjc@google.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 11, 2025, Heiko Carstens wrote:
> On Sun, Jun 08, 2025 at 01:41:18AM +0900, Masahiro Yamada wrote:
> > Kbuild updates for v6.16
> > 
> >  - Add support for the EXPORT_SYMBOL_GPL_FOR_MODULES() macro, which exports a
> >    symbol only to specified modules
> > 
> >  - Improve ABI handling in gendwarfksyms
> > 
> >  - Forcibly link lib-y objects to vmlinux even if CONFIG_MODULES=n
> > 
> >  - Add checkers for redundant or missing <linux/export.h> inclusion
> 
> As you write in commit a934a57a42f6 ("scripts/misc-check: check missing
> #include <linux/export.h> when W=1") this adds now 4000+ extra warnings
> for W=1 builds, which makes such builds more or less useless for me.
> 
> Also the commit only describes what you want to achieve, but not why.
> I can only guess that you want to reduce header dependencies(?).
> 
> Don't get me wrong, I can address all of this trivial churn for s390, however
> enforcing so many extra warnings to everyone with W=1 builds doesn't look like
> the right approach to me.

+1.  This seems like a recipe for an endless game of whack-a-mole.

