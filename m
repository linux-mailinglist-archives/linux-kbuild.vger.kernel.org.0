Return-Path: <linux-kbuild+bounces-10151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79864CCA939
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 08:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 549003023784
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 07:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A137B21B185;
	Thu, 18 Dec 2025 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uu/4j9k7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8C1E32D3
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041443; cv=none; b=hRo4r9b7ZatZziDgPmjQBE2sb6ZDkYmxGz6YUlKZNOOpccTO3jAu47M5kOUKj+haZLFqgpv/wuvn9/n4mmkZBAfz0zQvkioLQLR7kAHElEsOQchb4Jwv3IN0MbLkR/KYLgzQMsbcAEP+CRJUrw6uR7d7v0yxUMmsC/qiJVbNMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041443; c=relaxed/simple;
	bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvsG5NFAGJ+KCxAD3gSX02nQiIBs4lhoQLotBhFGwIbXlIWRyFYa2ueCj9yFNuOQO1BXKBc2WTLB7AammWwa6E3UcVrNLzkITus6MHOl0TFL6nnC5Dd0e0ferTaatmAA/V812NZGiF1u35LqsPU28RX9GO/OOSGkKjquZwcXogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uu/4j9k7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a3340391cso1957551fa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766041440; x=1766646240; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
        b=Uu/4j9k7Vf1dlPsfv2K+6VLxrbX4etShNtYvm1i9DZQR4MHPHF7+8ph6SgITvqf92d
         lMn+e75eJrRV9E/bnLYHEMxxv2Vhnvp7X6HPXvOvIM1cfsAAwGAxdh3bRjavCWm20f+2
         CC2fCLm9r+bmlffXrolJdOvC1HCaYKjriG817nYYVB6W64phZY0pBiVTqIPsgmp9+0nJ
         Zr0+0Svj1X2A6dukZvh7kn9p4qR1J7MTWhZpdPKmQ+yvJAlj2HR0omjinVhtp438U3Ix
         uM4q8SL3iZ/CvbfwVnKtwjLRnGpPi0b/Siu1FJcnBOL3/ejqkrOfMkmv9VFp+6So4mNh
         LH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041440; x=1766646240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
        b=jShcib+WZGYgBNbvF+kfS/O8VwUh9byzAm0D9jbOP4F11bLA3aw5U+i7WFTfFWdtGb
         +G9A8Nkvz7NbyGbVCTti5c/AyWlqNhATsrIjs4XJS+Wfq5wU0f7ZQhJJGIgucaiOwJIo
         WLJH/u5iFDNhv31DzDUlV+87tkiVmTJDbM1BBNhEkf9dtqA3GumTpgHUm+eJ3XwD3jCf
         QO11KTGQ12LpRYOMfjs13p6+Vej5nkk5XuiEq6naW1OLId+qljrmfmte2dBBrYRSeuZA
         tuXOnLCVtTaLpL9yBvBAAEMVE5UMlUlmMwSX32yjXR8N6qLrAzWc6wVR0ZFvbYWYLclE
         2p6A==
X-Forwarded-Encrypted: i=1; AJvYcCW1kpjSwrHV8A/Qlh+SQAJ71MjdAEIQaZD5F3HRSlhaSVRbPVXbu4/pbisSFsgwADwYhIgnBar+FZOFcGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZU+k9Nlor0x6tligSaCSyB97eMZYwxv56eaHXNmY+36NzO+k
	nklHN8uH3w0zs5pq9d+TtC8psumbLpEAbbXl1hc1uVJ/T41RCriaKuViK4zNDpzYzXvst+87uzl
	wgrtS2Bdr64jkv+Kav0BA/XcpJpS2wJOVhck4IRy5
X-Gm-Gg: AY/fxX7KGCWty06EnM5YB2LmPN+QjL4hB8wxrdDyWHjnEPbpvIM/yNRZr+8TghXOoRa
	W8rtwGlu/1XE6dUygn8MmQ0JFhGAR3uImg5LU1WTY+6jqm+JLlfn3md8Z6Ukb7G+DTxAOivJqbo
	GAcz3hwdXwLg/UW8w0r+ItxHVFitVUsZe62nnNiG54EGI2/X5UQZsTJUP3jaYAFNmW5ai55zFbi
	G0QShroT8LowxWtKw3VSEPxM4nCXMUG64gtdwAdBc/We7VFhKf5e0VDhHV/KfRYErN6kinCLkld
	QAPfyNNJML3wq8cwxKlmkrnf5E2Q
X-Google-Smtp-Source: AGHT+IGa6ehysAt1ztbTbddQktMKfUrCu3vaE0KFaPi7hrb5bZr+Y8vH8de83qrbg/8SFAqqSQSjSGQ4/4o9cSJ/80I=
X-Received: by 2002:a05:651c:e17:b0:37a:2e32:3200 with SMTP id
 38308e7fff4ca-37fd08a242amr68378951fa.33.1766041439731; Wed, 17 Dec 2025
 23:03:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
 <20251218001336.GA2451437@ax162>
In-Reply-To: <20251218001336.GA2451437@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Dec 2025 08:03:47 +0100
X-Gm-Features: AQt7F2qsoLJMYrCrAExz1xhd2YRJehR5Pg82DcCwzCkvH_0u7lE9uhe7avhFjOQ
Message-ID: <CACT4Y+Z5Mtax6BMtpY6Zj9Zd_1XjphfkMDp_3Wrzo94Pw9=VhA@mail.gmail.com>
Subject: Re: [PATCH] Revert "scripts/clang-tools: Handle included .c files in gen_compile_commands"
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 01:13, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 08:13:43PM +0100, Nicolas Schier wrote:
> > This reverts commit 9362d34acf91a706c543d919ade3e651b9bd2d6f.
> >
> > Dmitry Vyukov reported that commit 9362d34acf91 ("scripts/clang-tools:
> > Handle included .c files in gen_compile_commands") generates false
> > entries in some cases for C files that are included in other C files but
> > not meant for standalone compilation.
> >
> > For properly forking clangd, including .c files is discouraged.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Closes: https://lore.kernel.org/r/CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com
> > Signed-off-by: Nicolas Schier <nsc@kernel.org>
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

Thanks!

