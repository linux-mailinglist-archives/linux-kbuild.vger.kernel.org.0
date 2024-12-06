Return-Path: <linux-kbuild+bounces-5024-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48149E7825
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 19:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E0B188640A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 18:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BED1D5149;
	Fri,  6 Dec 2024 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CqdVkASk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC66170A11
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Dec 2024 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733510127; cv=none; b=pWpEwkCKMxsDGHcnpm8iR3Uha7AK6KdyVdAoW49Wz9O5Otp9geDRndLaHzmzaZcE/O7OOZ4DF2Np5LFyEGVF6es6bHlWFc4YGCKsUHtU6SiInXy+eXWheEUnhA4iE4/ubIx0Q2hNLP5CHyE72cJn1aaYjpmFTj7iQ/KU2Vpy/TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733510127; c=relaxed/simple;
	bh=wzpjYdhqWb1rGgA+p5a6q4wu+gZ7ZC4urvHFxZ38tDo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BrL7P2FLxX85VZ78WQ7ztgVNYQQfEqNz0yzxqmoWHzPlOZcUe8QbBboGk0rmgyF8jUmHJMDePkscwjGbSmf4MWFNWBDHUjeBBVzExKGEHodY3YoKZyFv0mMDX7CqBwW/aDeLJGbjRQHJmOBr1ZIN8+91s/kYEPoQZr33TvnEkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CqdVkASk; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725164ccd4dso1928838b3a.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Dec 2024 10:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733510125; x=1734114925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=99Zz5f/H6ibQkY7huXSHXBRThasJh30JvvRH9U9jCs0=;
        b=CqdVkASkmOb06BW9Ad3QEvKaOi5tAuDLJK74Uw5CPluxIBtA2nH6zasMNwudVybZ5i
         pS+LT7Ck4RJFnm3XVOol1yvw2T8T7NZa8CIaatdg2/6bLMSk4OHP/sbJ8XorLJNnfu0l
         eBO7sbcsme3ALJeM5SMY+bbiDi2OyX0gN+Ic5nl1CFnFF8cyQCM7Rhoeq/DoOvhnMIx/
         EKzC9bFBX5c/Dxp7GyQq9f+dInS8Y6JbzDs0PFRY158eKH6M1KX7VJEbHSIreVZXF+5x
         XqOOIqr0CGN5IznAaA4kzXxo4/iKwuCPxKoeLLYZFBozGKLJqT9hGQSkH1e12AtxHTDH
         jS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733510125; x=1734114925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99Zz5f/H6ibQkY7huXSHXBRThasJh30JvvRH9U9jCs0=;
        b=HiK05ykT2ck/cxeKdYwVaUofqpqpZm34kdap2DHqhvq1oWRF/lKKc+yOFN2oXloCL1
         DTmckNO/M/XJTHxH42ejUH3c/MOtO73vrY/r/Iesu6z8F6P+w1N2otnIawkVMe22xLFu
         ePfqSN2Gp0coCWpZPKyX5P3BvWM2VnWQoYiqMlOhX729PhXvMArnRZw/2++S+qGs6dBT
         t9nBv16ATHE2HwAumXBzY1b5V/9aHOyEFA/7Tzva5h9mgNW9FHuuNgNBJbZZFexl5N9o
         0hZBnxetVkv/pvjNP5XPHe5btHgvoMmgLCMKaDSHwg6VGHQKIPaIpPR6o23J+1+amPR0
         jtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt5qbUJniZJ2yqb49j9+kmizDCCLAMu9gEZXeipAzbigbAseEhcG6hhDGM2Zn1zB2QgRXZPNugWvubOT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwChQpeqgEu/QUmvjBXCaZwijoujxibbSRp5WnSCblpJYq2G3rY
	3Qe+3DI9SH0Tf2SHpruSJ1+yK8lZ8Frq93g/WRQe/idoexCzno45BAOHTtDtt2Yd4icmDUpOPo+
	ONw==
X-Google-Smtp-Source: AGHT+IE6ZCrRnsbz0XhrD+ntrvvwA8rId9km4rjw1Dc0QnWn1aOrxqVe/kOoLQs4Rde2UPM/VMVd0rEyCrk=
X-Received: from plblv14.prod.google.com ([2002:a17:903:2a8e:b0:20c:5d5a:9d64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1247:b0:215:7b06:90ca
 with SMTP id d9443c01a7336-21614d4535amr52993735ad.17.1733510125237; Fri, 06
 Dec 2024 10:35:25 -0800 (PST)
Date: Fri, 6 Dec 2024 10:35:23 -0800
In-Reply-To: <20241202150810.606849101@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.606849101@infradead.org>
Message-ID: <Z1ND6-lK_Yh5PVpU@google.com>
Subject: Re: [PATCH -v2 6/7] module: Account for the build time module name mangling
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Dec 02, 2024, Peter Zijlstra wrote:
> Sean noted that scripts/Makefile.lib:name-fix-token rule will mangle
> the module name with s/-/_/g.
> 
> Since this happens late in the build, only the kernel needs to bother
> with this, the modpost tool still sees the original name.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---

Tested-by: Sean Christopherson <seanjc@google.com>

